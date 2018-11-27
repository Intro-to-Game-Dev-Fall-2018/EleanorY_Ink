﻿using UnityEngine;
using UnityEngine.UI;
using Ink.Runtime;
using TMPro;

public class StoryController : MonoBehaviour
{
	private bool _hasKimmy;
	private bool _hasDana;
	private bool _hasDonna;
	private bool _hasMom;
	private bool _hasKimmyMom;
	private bool _hasJimmy;

	
	private Vector2 _textRectPivot;
	private bool _textRight; 

	private bool _KimmyInverse;
	
	[SerializeField]
	private TextAsset _inkJSONAsset;
	private Story _story;
	
	[SerializeField]
	private SpriteSetting _sprite;
	

	[SerializeField]
	private GameObject _choiceLayout;
	[SerializeField]
	private GameObject _dialoguePanel;

	// UI Prefabs
	[SerializeField]
	private TextMeshProUGUI _textPrefab;
	[SerializeField]
	private Button _buttonPrefab;

	private bool _haveChoice;
	private bool _needClick;


	private void Awake () {
		RemoveChildren();
		StartStory();
		Destroy(GameObject.FindWithTag("Char"));
	}

	// Creates a new Story object with the compiled story which we can then play!
	private void StartStory () {
		_story = new Story (_inkJSONAsset.text);
	}

	private void Update()
	{
		if (_story.canContinue && !_needClick)
		{
			var text = _story.Continue();
			text = text.Trim();
			CreateContentView(text);
			_needClick = true;
		}

		if (_needClick && (Input.GetKeyUp(KeyCode.Space) || Input.GetKeyUp(KeyCode.Return)))
		{
			_needClick = false;
			if (_story.currentChoices.Count > 0) return;
			RemoveChildren();
		}

		if (_haveChoice) return;
		if(_story.currentChoices.Count > 0)
		{
			foreach (var choice in _story.currentChoices)
			{
				var button = CreateChoiceView (choice.text.Trim ());
				var choice1 = choice;

				button.onClick.AddListener (delegate {
					OnClickChoiceButton (choice1);
				});
			}

			_haveChoice = true;
		}
		else if (_story.currentChoices.Count <= 0 && !_story.canContinue){
			var choice = CreateChoiceView("End of story.\nRestart?");
			choice.onClick.AddListener(delegate{
				StartStory();
			});
		}
	}

	// When we click the choice button, tell the story to choose that choice!
	private void OnClickChoiceButton (Choice choice) {
		_story.ChooseChoiceIndex (choice.index);
		RemoveChildren();
		_haveChoice = false;
		_needClick = false;
	}

	private void CreateContentView (string text)
	{
		if (_story.currentTags.Contains("Kimmy"))
		{
			Destroy(GameObject.FindWithTag("Mark"));
			if (!_KimmyInverse)
			{
				Instantiate(_sprite.Sprite.KimmyMark);
				if (!_hasKimmy)
				{
					Instantiate(_sprite.Sprite.Kimmy);
					_hasKimmy = true;
				}
				_textRectPivot = _sprite.Dialogue.Kimmy;
				_textRight = false;
			}
			else
			{
				var kimmyMark = Instantiate(_sprite.Sprite.KimmyMark, _sprite.Sprite.InverseKimmy, Quaternion.identity);
				kimmyMark.transform.localScale = new Vector3(-1, 1, 1);
				if (!_hasKimmy)
				{
					var kimmy = Instantiate(_sprite.Sprite.Kimmy, _sprite.Sprite.InverseKimmy, Quaternion.identity);
					kimmy.transform.localScale = new Vector3(-1, 1, 1);
					_hasKimmy = true;
				}
				_textRectPivot = _sprite.Dialogue.KimmyInverse;
				_textRight = true;
			}

		}

		if (_story.currentTags.Contains("Dana"))
		{
			Destroy(GameObject.FindWithTag("Mark"));
			if (!_hasDana)
			{
				Instantiate(_sprite.Sprite.Dana);
				_hasDana = true;
			}
			Instantiate(_sprite.Sprite.DanaMark);
			_textRectPivot = _sprite.Dialogue.Dana;
			_textRight = false;
		}
		
		if (_story.currentTags.Contains("Mom"))
		{
			Destroy(GameObject.FindWithTag("Mark"));
			if (!_hasMom)
			{
				Instantiate(_sprite.Sprite.Mom);
				_hasMom = true;
			}
			Instantiate(_sprite.Sprite.MomMark);
			_textRectPivot = _sprite.Dialogue.Mom;
			_textRight = true;
		}

		if (_story.currentTags.Contains("kimmyMom") )
		{
			Destroy(GameObject.FindWithTag("Mark"));
			if (!_hasKimmyMom)
			{
				Instantiate(_sprite.Sprite.KimmyMom);
				_hasKimmyMom = true;
			}
			Instantiate(_sprite.Sprite.KimmyMomMark);
			_textRectPivot = _sprite.Dialogue.KimmyMom;
			_textRight = true;
		}
		
		if (text.Contains("Kimmy's House"))
		{
			ClearSprites();
		}
		if (text.Contains("The Next Morning"))
		{
			ClearSprites();
			_KimmyInverse = true;
		}
		
		var storyText = Instantiate (_textPrefab);
		storyText.rectTransform.pivot = _textRectPivot;
		storyText.rectTransform.anchoredPosition = Vector2.zero;
		storyText.alignment = _textRight ? TextAlignmentOptions.Right : TextAlignmentOptions.Left;
		storyText.text = text;
		storyText.transform.SetParent (_dialoguePanel.transform, false);
	}

	// Creates a button showing the choice text
	private Button CreateChoiceView (string text) {
		// Creates the button from a prefab
		Button choice = Instantiate (_buttonPrefab);
		choice.transform.SetParent (_choiceLayout.transform, false);
		
		// Gets the text from the button prefab
		TextMeshProUGUI choiceText = choice.GetComponentInChildren<TextMeshProUGUI> ();
		choiceText.text = text;

		// Make the button expand to fit the text
		HorizontalLayoutGroup layoutGroup = choice.GetComponent <HorizontalLayoutGroup> ();
		layoutGroup.childForceExpandHeight = false;

		return choice;
		 
	}
	
	private void RemoveChildren () {
		var dialogueCount = _dialoguePanel.transform.childCount;
		if (dialogueCount <= 0) return;
		for (var i = dialogueCount - 1; i >= 0; --i) {
			Destroy (_dialoguePanel.transform.GetChild (i).gameObject);
		}
		var choiceCount = _choiceLayout.transform.childCount;
		if (choiceCount <= 0) return;
		for (var i = choiceCount - 1; i >= 0; --i) {
			Destroy (_choiceLayout.transform.GetChild (i).gameObject);
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
		_hasDana = false;
		_hasKimmy = false;
		_hasMom = false;
		_hasKimmyMom = false;
		_hasJimmy = false;
	}


}


