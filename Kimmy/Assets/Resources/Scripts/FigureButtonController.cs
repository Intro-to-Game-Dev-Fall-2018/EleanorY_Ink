using UnityEngine;

namespace Resources.Scripts
{

	public class FigureButtonController : MonoBehaviour
	{
		private void Update()
		{
			Debug.Log("Live");
			if ( Input.GetMouseButton (0))
			{ // << use GetMouseButton instead of GetMouseButtonDown
				Debug.Log("ButtonDown");
				RaycastHit hit;
				Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
				if (Physics.Raycast(ray, out hit, 100.0f))
				{
					Debug.Log("You selected the " + hit.transform.name);
//					hit.transform.position += Vector3.right * speed * time.deltaTime; // << declare public speed and set it in inspector
				}
			}
		}
	}
}
