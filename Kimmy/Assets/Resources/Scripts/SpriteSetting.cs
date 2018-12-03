using System;
using UnityEngine;

[CreateAssetMenu(fileName = "SpriteSettings", menuName = "Settings/SpriteSettings")]
public class SpriteSetting : ScriptableObject 
{
	
	[Header("Sprite Settings")]
	public SpriteSettings Sprite;
	
	[Header("Dialogue Settings")]
	public DialogueSettings Dialogue;
	
	[Header("Scene Transition Settings")]
	public SceneTransitionSettings Scene;


	[Serializable]
	public struct SpriteSettings
	{
		public GameObject Kimmy;
		public GameObject KimmyMark;
		public GameObject Dana;
		public GameObject DanaMark;
		public GameObject Mom;
		public GameObject MomMark;
		public GameObject KimmyMom;
		public GameObject KimmyMomMark;
		public GameObject Jimmy;
		public GameObject JimmyMark;
		public GameObject Donna;
		public GameObject DonnaMark;
		public GameObject Anthony;
		public GameObject AnthonyMark;
		public GameObject Amber;
		public GameObject AmberMark;
		public GameObject Dean;
		public GameObject DeanMark;
		public Vector3 InverseKimmy;
	}
	
	[Serializable]
	public struct DialogueSettings
	{
		public Vector2 Kimmy;
		public Vector2 KimmyInverse;
		public Vector2 Dana;
		public Vector2 Mom;
		public Vector2 KimmyMom;
		public Vector2 Jimmy;
		public Vector2 Donna;
		public Vector2 Anthony;
		public Vector2 Amber;
		public Vector2 Dean;

	}
	
	[Serializable]
	public struct SceneTransitionSettings
	{
		public GameObject TheNextMorning;
		public GameObject DowntownText;
		public GameObject DowntownPic;
		public GameObject KimmyHouse;
		public GameObject KHD1Pic;
		public GameObject KHD1Text;
	}
}

