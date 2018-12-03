using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class SceneTransition : MonoBehaviour
{

	private float _timer;

	[SerializeField] private float _sceneLength;
	
	// Use this for initialization
	void Start ()
	{
		_timer = 0.0f;
	}
	
	// Update is called once per frame
	void Update ()
	{
		_timer += Time.deltaTime;
		if (_timer < _sceneLength) return;
		SceneManager.LoadScene(1);
	}
}
