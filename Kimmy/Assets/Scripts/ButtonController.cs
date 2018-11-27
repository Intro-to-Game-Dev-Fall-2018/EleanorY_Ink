using TMPro;
using UnityEngine;
using UnityEngine.EventSystems;

public class ButtonController : MonoBehaviour
{

	private TextMeshProUGUI _choice;

	private void Start()
	{
		_choice = GetComponentInChildren<TextMeshProUGUI>();
		
	}

	public void OnPointerEnter(PointerEventData pointerEventData)
	{
		_choice.color = Color.white;
		Debug.Log("enter");
	}
	
	
	public void OnPointerExit(PointerEventData pointerEventData)
	{
		_choice.color = Color.black;
	}
}
