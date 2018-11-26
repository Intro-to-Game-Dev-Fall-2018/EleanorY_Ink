using System;
using UnityEngine;
using UnityEngine.UI;

[CreateAssetMenu(fileName = "SpriteSettings", menuName = "Settings/SpriteSettings")]
public class SpriteSetting : ScriptableObject 
{
	
	[Header("Sprite Settings")]
	public SpriteSettings Sprite;


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
	}
}

