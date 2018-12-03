using TMPro;
using UnityEngine;
using UnityEngine.EventSystems;

namespace Resources.Scripts
{
	public class ButtonController : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler
	{

		private TextMeshProUGUI _choice;


		private void Awake()
		{
			_choice = GetComponentInChildren<TextMeshProUGUI>();
		}

		public void OnPointerEnter(PointerEventData pointerEventData)
		{
			_choice.faceColor = Color.white;
		}
	
	
		public void OnPointerExit(PointerEventData pointerEventData)
		{
			_choice.faceColor = Color.black;
		}
	}
}
