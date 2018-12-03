using UnityEngine;

namespace Resources.Scripts
{
	public class AudioController : MonoBehaviour {
  
		private void Awake ()
		{
			GameObject[] audioObj = GameObject.FindGameObjectsWithTag("Music");
			if (audioObj.Length > 1)
				Destroy(gameObject);
  
			DontDestroyOnLoad(gameObject);
  
		}
	}
}