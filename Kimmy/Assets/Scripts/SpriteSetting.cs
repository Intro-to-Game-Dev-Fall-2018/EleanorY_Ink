using System;
using UnityEngine;

[CreateAssetMenu(fileName = "SpriteSettings", menuName = "Settings/SpriteSettings")]
public class SpriteSetting : ScriptableObject 
{
	
	[Header("Sprite Settings")]
	public SpriteSettings Sprite;
	
	[Header("Sprite Settings")]
	public DialogueSettings Dialogue;


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
		
	}
}

