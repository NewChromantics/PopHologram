using UnityEngine;
using System.Collections;

public class DemoHologram : MonoBehaviour {

	[Range(1,1000)]
	public int			mInstanceCount = 1;
	
	// Update is called once per frame
	void Update () 
	{
		PopHologram.Draw (this.transform.position, mInstanceCount);
	
	}
}
