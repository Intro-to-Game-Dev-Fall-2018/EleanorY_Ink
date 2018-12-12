using Ink.Runtime;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

namespace Resources.Scripts
{
	public class StoryController : MonoBehaviour
	{
		private bool _hasAmber;
		private bool _hasAnthony;
		private bool _hasDean;

		private Vector2 _textRectPivot;
		private bool _textRight;

		private bool _kimmyInverse;

		private bool _startTransition;
		private GameObject _transitionText;
		
		private float _timer;

		private bool _back;

		private AudioSource _sfx;
		[SerializeField] private AudioClip _choiceFx;

		[SerializeField] private TextAsset _inkJSONAsset;
		private Story _story;

		[SerializeField] private SpriteSetting _sprite;

		private bool _figure = false;


		[SerializeField] private GameObject _choiceLayout;
		[SerializeField] private GameObject _dialoguePanel;
		[SerializeField] private GameObject _canvas;

		// UI Prefabs
		[SerializeField] private TextMeshProUGUI _textPrefab;
		[SerializeField] private Button _buttonPrefab;

		private bool _haveChoice;
		private bool _needClick;


		private void Awake()
		{
			RemoveChildren();
			StartStory();
			Destroy(GameObject.FindWithTag("Char"));
			Destroy(GameObject.FindWithTag("Background"));
			Instantiate(_sprite.Scene.Home);
			_sfx = GetComponent<AudioSource>();
			_back = false;

		}

		// Creates a new Story object with the compiled story which we can then play!
		private void StartStory()
		{
			_story = new Story(_inkJSONAsset.text);
		}

		private void Update()
		{
			if (_story.canContinue && !_needClick)
			{
				var text = _story.Continue();
				text = text.Trim();
				CreateContentView(text);
				if (_story.currentTags.Contains("Go") && _story.currentTags.Contains("Wait"));
				{
					_needClick = true;
				}
				if (!_story.currentTags.Contains("Go") || !_story.currentTags.Contains("Wait"))
				{
					_needClick = !_story.currentTags.Contains("Go");
				}
			}

			if (_needClick && Input.GetMouseButtonDown(0))
			{
				_needClick = false;
				if (_story.currentChoices.Count > 0) return;
				if (_startTransition)
				{
					GameObject[] transitionText = GameObject.FindGameObjectsWithTag("Transition");
					foreach (var text in transitionText)
					{
						Destroy(text);
					}

					_startTransition = false;
				}

				RemoveChildren();
				_sfx.Play();
			}


			if (_haveChoice) return;
			if (_story.currentChoices.Count > 0)
			{
				if (_story.currentTags.Contains("DowntownFigure"))
				{
					ClearFigures();

					Destroy(GameObject.FindWithTag("Mark"));
					var jimmyFigure = Instantiate(_sprite.Figure.Jimmy);
					var jimmyChoice = _story.currentChoices[0];
					jimmyFigure.onClick.AddListener(delegate { OnClickChoiceButton(jimmyChoice); });
					jimmyFigure.transform.SetParent(_canvas.transform, false);
					
					var anthonyAmberFigure = Instantiate(_sprite.Figure.AnthonyAmber);
					var anthonyAmberChoice = _story.currentChoices[1];
					anthonyAmberFigure.onClick.AddListener(delegate { OnClickChoiceButton(anthonyAmberChoice); });
					anthonyAmberFigure.transform.SetParent(_canvas.transform, false);
					
					var button = CreateChoiceView(_story.currentChoices[2].text.Trim());
					button.onClick.AddListener(delegate { OnClickChoiceButton(_story.currentChoices[2]); });
					
				}
				else if (_story.currentTags.Contains("KimmyHouseFigure"))
				{
					ClearFigures();
					
					var donnaFigure = Instantiate(_sprite.Figure.Donna);
					var donnaChoice = _story.currentChoices[0];
					donnaFigure.onClick.AddListener(delegate { OnClickChoiceButton(donnaChoice); });
					donnaFigure.transform.SetParent(_canvas.transform, false);
					
					var shopFigure = Instantiate(_sprite.Figure.Shop);
					var shopChoice = _story.currentChoices[1];
					shopFigure.onClick.AddListener(delegate { OnClickChoiceButton(shopChoice); });
					shopFigure.transform.SetParent(_canvas.transform, false);
					
					var button = CreateChoiceView(_story.currentChoices[2].text.Trim());
					button.onClick.AddListener(delegate { OnClickChoiceButton(_story.currentChoices[2]); });

				}
				else if (!_figure)
				{
					
					foreach (var choice in _story.currentChoices)
					{
						var button = CreateChoiceView(choice.text.Trim());
						var choice1 = choice;

						button.onClick.AddListener(delegate { OnClickChoiceButton(choice1); });
					}
				}

				_haveChoice = true;
			}
			else if (_story.currentChoices.Count <= 0 && !_story.canContinue)
			{
				var choice = CreateChoiceView("End of story.\nRestart?");
				choice.onClick.AddListener(delegate { StartStory(); });
			}

			if (!_startTransition) return;
			RemoveChildren();
			ClearSprites();
		}

		// When we click the choice button, tell the story to choose that choice!
		private void OnClickChoiceButton(Choice choice)
		{
			_sfx.PlayOneShot(_choiceFx);
			_story.ChooseChoiceIndex(choice.index);
			RemoveChildren();
			_haveChoice = false;
			_needClick = false;
			GameObject[] figures = GameObject.FindGameObjectsWithTag("Figure");
			foreach (var figure in figures)
			{
				Destroy(figure);
			}
		}

		private void CreateContentView(string text)
		{
			if (_story.currentTags.Contains("Kimmy"))
			{
				Destroy(GameObject.FindWithTag("Mark"));
				if (!_kimmyInverse)
				{
					Instantiate(_sprite.Sprite.KimmyMark);
					_textRectPivot = _sprite.Dialogue.Kimmy;
					_textRight = false;
				}
				else
				{
					var kimmyMark = Instantiate(_sprite.Sprite.KimmyMark, _sprite.Sprite.InverseKimmy,
						Quaternion.identity);
					kimmyMark.transform.localScale = new Vector3(-1, 1, 1);
					_textRectPivot = _sprite.Dialogue.KimmyInverse;
					_textRight = true;
				}

			}

			if (_story.currentTags.Contains("Home"))
			{
				Instantiate(_sprite.Sprite.Dana);
				Instantiate(_sprite.Sprite.Kimmy);
				Instantiate(_sprite.Sprite.Mom);
			}

			if (_story.currentTags.Contains("KimmyHouse"))
			{
				Instantiate(_sprite.Sprite.Dana);
				Instantiate(_sprite.Sprite.Kimmy);
				Instantiate(_sprite.Sprite.Mom);
				Instantiate(_sprite.Sprite.KimmyMom);
			}


			if (_story.currentTags.Contains("WithKimmy"))
			{
				Instantiate(_sprite.Sprite.Dana);
				var kimmy = Instantiate(_sprite.Sprite.Kimmy, _sprite.Sprite.InverseKimmy, Quaternion.identity);
				kimmy.transform.localScale = new Vector3(-1, 1, 1);
			}

			if (_story.currentTags.Contains("WithAnthony"))
			{
				Instantiate(_sprite.Sprite.Dana);
				Instantiate(_sprite.Sprite.Kimmy);
				Instantiate(_sprite.Sprite.Anthony);
				Instantiate(_sprite.Sprite.Amber);
			}

			if (_story.currentTags.Contains("WithDonna"))
			{
				Instantiate(_sprite.Sprite.Dana);
				Instantiate(_sprite.Sprite.Kimmy);
				Instantiate(_sprite.Sprite.Donna);
			}

			if (_story.currentTags.Contains("WithJimmy"))
			{
				Instantiate(_sprite.Sprite.Dana);
				Instantiate(_sprite.Sprite.Kimmy);
				Instantiate(_sprite.Sprite.Jimmy);
			}

			if (_story.currentTags.Contains("Shop"))
			{
				Instantiate(_sprite.Sprite.Dana);
				Instantiate(_sprite.Sprite.Kimmy);
				Instantiate(_sprite.Sprite.Dean);
			}

			if (_story.currentTags.Contains("WithAnthony"))
			{
				Instantiate(_sprite.Sprite.Dana);
				Instantiate(_sprite.Sprite.Kimmy);
				Instantiate(_sprite.Sprite.Anthony);
				Instantiate(_sprite.Sprite.Amber);
			}

			//Speaking Mark	

			if (_story.currentTags.Contains("General"))
			{
				Destroy(GameObject.FindWithTag("Mark"));
				_textRectPivot = new Vector2(0.5f, 0.5f);
				_textRight = false;
			}

			if (_story.currentTags.Contains("Dana"))
			{
				Destroy(GameObject.FindWithTag("Mark"));
//				if (!_hasDana)
//				{
//					Instantiate(_sprite.Sprite.Dana);
//					_hasDana = true;
//				}
				Instantiate(_sprite.Sprite.DanaMark);
				_textRectPivot = _sprite.Dialogue.Dana;
				_textRight = false;
			}

			if (_story.currentTags.Contains("Mom"))
			{
				Destroy(GameObject.FindWithTag("Mark"));
//				if (!_hasMom)
//				{
//					Instantiate(_sprite.Sprite.Mom);
//					_hasMom = true;
//				}
				Instantiate(_sprite.Sprite.MomMark);
				_textRectPivot = _sprite.Dialogue.Mom;
				_textRight = true;
			}

			if (_story.currentTags.Contains("kimmyMom"))
			{
				Destroy(GameObject.FindWithTag("Mark"));
//				if (!_hasKimmyMom)
//				{
//					Instantiate(_sprite.Sprite.KimmyMom);
//					_hasKimmyMom = true;
//				}
				Instantiate(_sprite.Sprite.KimmyMomMark);
				_textRectPivot = _sprite.Dialogue.KimmyMom;
				_textRight = true;
			}

			if (_story.currentTags.Contains("Jimmy"))
			{
				Destroy(GameObject.FindWithTag("Mark"));
//				if (!_hasJimmy)
//				{
//					Instantiate(_sprite.Sprite.Jimmy);
//					_hasJimmy = true;
//				}
				Instantiate(_sprite.Sprite.JimmyMark);
				_textRectPivot = _sprite.Dialogue.Jimmy;
				_textRight = true;
			}


			if (_story.currentTags.Contains("Donna"))
			{
				Destroy(GameObject.FindWithTag("Mark"));
//				if (!_hasDonna)
//				{
//					Instantiate(_sprite.Sprite.Donna);
//					_hasDonna = true;
//				}
				Instantiate(_sprite.Sprite.DonnaMark);
				_textRectPivot = _sprite.Dialogue.Donna;
				_textRight = true;
			}

			if (_story.currentTags.Contains("Amber"))
			{
				Destroy(GameObject.FindWithTag("Mark"));
//				if (!_hasAmber)
//				{
//					Instantiate(_sprite.Sprite.Amber);
//					_hasAmber = true;
//				}
				Instantiate(_sprite.Sprite.AmberMark);
				_textRectPivot = _sprite.Dialogue.Amber;
				_textRight = true;
			}

			if (_story.currentTags.Contains("Anthony"))
			{
				Destroy(GameObject.FindWithTag("Mark"));
//				if (!_hasAnthony)
//				{
//					Instantiate(_sprite.Sprite.Anthony);
//					_hasAnthony = true;
//				}
				Instantiate(_sprite.Sprite.AnthonyMark);
				_textRectPivot = _sprite.Dialogue.Anthony;
				_textRight = true;
			}

			if (_story.currentTags.Contains("Dean"))
			{
				Destroy(GameObject.FindWithTag("Mark"));
//				if (!_hasDean)
//				{
//					Instantiate(_sprite.Sprite.Dean);
//					_hasDean = true;
//				}
				Instantiate(_sprite.Sprite.DeanMark);
				_textRectPivot = _sprite.Dialogue.Dean;
				_textRight = true;
			}

			SceneTransition();

			var storyText = Instantiate(_textPrefab);
			storyText.rectTransform.pivot = _textRectPivot;
			storyText.rectTransform.anchoredPosition = Vector2.zero;
			storyText.alignment = _textRight ? TextAlignmentOptions.BottomRight : TextAlignmentOptions.BottomLeft;
			storyText.text = text;
			storyText.transform.SetParent(_dialoguePanel.transform, false);

		}


		// Creates a button showing the choice text
		private Button CreateChoiceView(string text)
		{
			// Creates the button from a prefab
			Button choice = Instantiate(_buttonPrefab);
			choice.transform.SetParent(_choiceLayout.transform, false);

			// Gets the text from the button prefab
			TextMeshProUGUI choiceText = choice.GetComponentInChildren<TextMeshProUGUI>();
			choiceText.text = text;

			// Make the button expand to fit the text
			HorizontalLayoutGroup layoutGroup = choice.GetComponent<HorizontalLayoutGroup>();
			layoutGroup.childForceExpandHeight = false;

			return choice;

		}

		private void RemoveChildren()
		{
			var dialogueCount = _dialoguePanel.transform.childCount;
			if (dialogueCount <= 0) return;
			for (var i = dialogueCount - 1; i >= 0; --i)
			{
				Destroy(_dialoguePanel.transform.GetChild(i).gameObject);
			}

			var choiceCount = _choiceLayout.transform.childCount;
			if (choiceCount <= 0) return;
			for (var i = choiceCount - 1; i >= 0; --i)
			{
				Destroy(_choiceLayout.transform.GetChild(i).gameObject);
			}
		}

		private void ClearSprites()
		{
			var sprites = GameObject.FindGameObjectsWithTag("Char");
			foreach (var sprite in sprites)
			{
				Destroy(sprite.gameObject);
			}

			Destroy(GameObject.FindWithTag("Mark"));
		}

		private void SceneTransition()
		{
			if (_story.currentTags.Contains("KimmyHouseTransition"))
			{
				Destroy(GameObject.FindWithTag("Background"));
				_transitionText = Instantiate(_sprite.Scene.KimmyHouse);
				Instantiate(_sprite.Scene.KimmyHomePic);
				_kimmyInverse = false;
				_transitionText.transform.SetParent(_canvas.transform, false);
				_startTransition = true;
			}

			if (_story.currentTags.Contains("TheNextMorning"))
			{
				Destroy(GameObject.FindWithTag("Background"));
				_transitionText = Instantiate(_sprite.Scene.TheNextMorning);
				Instantiate(_sprite.Scene.KimmyHomePic);
				_kimmyInverse = true;
				_transitionText.transform.SetParent(_canvas.transform, false);
				_startTransition = true;
			}

			if (_story.currentTags.Contains("Downtown"))
			{
				Destroy(GameObject.FindWithTag("Background"));
				_transitionText = Instantiate(_sprite.Scene.DowntownText);
				Instantiate(_sprite.Scene.DowntownPic);
				_kimmyInverse = false;
				_transitionText.transform.SetParent(_canvas.transform, false);
				_startTransition = true;
			}

			if (_story.currentTags.Contains("KimmyHouseDay1"))
			{
				Destroy(GameObject.FindWithTag("Background"));
				_transitionText = Instantiate(_sprite.Scene.KHD1Text);
				Instantiate(_sprite.Scene.KHD1Pic);
				_kimmyInverse = false;
				_transitionText.transform.SetParent(_canvas.transform, false);
				_startTransition = true;
			}

			if (_story.currentTags.Contains("OneHourLater"))
			{
				_transitionText = Instantiate(_sprite.Scene.OneHourLater);
				_transitionText.transform.SetParent (_canvas.transform, false);
				_startTransition = true;
			}

			if (_story.currentTags.Contains("Shop"))
			{
				Destroy(GameObject.FindWithTag("Background"));
				Instantiate(_sprite.Scene.Shop);
				_back = true;
			}
			
			if (_story.currentTags.Contains("back") && _back)
			{
				Destroy(GameObject.FindWithTag("Background"));
				Instantiate(_sprite.Scene.KHD1Pic);
			}
		}


		private void ClearFigures()
		{
			GameObject[] figures = GameObject.FindGameObjectsWithTag("Figure");
			foreach (var figure in figures)
			{
				Destroy(figure);
			}
			GameObject[] characters = GameObject.FindGameObjectsWithTag("Char");
			foreach (var character in characters)
			{
				Destroy(character);
			}
			
			GameObject[] marks = GameObject.FindGameObjectsWithTag("Mark");
			foreach (var mark in marks)
			{
				Destroy(mark);
			}
		}
	}
}


