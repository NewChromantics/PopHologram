using UnityEngine;
using System.Collections;					// required for Coroutines
using System.Runtime.InteropServices;		// required for DllImport
using System;								// requred for IntPtr
using System.Text;





public class PopHologram
{
#if UNITY_STANDALONE_OSX || UNITY_EDITOR_OSX
	private const string PluginName = "PopHologramOsx";
#elif UNITY_ANDROID
	private const string PluginName = "PopHologram";
#elif UNITY_IOS
	//private const string PluginName = "PopHologramIos";
	private const string PluginName = "__Internal";
#elif UNITY_STANDALONE_WIN || UNITY_EDITOR_WIN
	private const string PluginName = "PopHologram";
#endif

	private static int				mPluginEventId = 0;
	
	[DllImport (PluginName)]
	private static extern int		PopHologram_GetPluginEventId();
	
	[DllImport (PluginName)]
	private static extern bool		FlushDebug([MarshalAs(UnmanagedType.FunctionPtr)]System.IntPtr FunctionPtr);

	[DllImport (PluginName)]
	private static extern void		PopHologram_DrawSomething(float x,float y,float z,int InstanceCount);


	static private void UpdateEvent()
	{
		//	gr: have to do this here, rather than variable init or we don't get exception errors
		if (mPluginEventId == 0)
			mPluginEventId = PopHologram_GetPluginEventId ();
	}

	static public void Draw(Vector3 Pos,int InstanceCount)
	{
		UpdateEvent ();
		Update ();
		PopHologram_DrawSomething( Pos.x, Pos.y, Pos.z, InstanceCount );
	}
	
	static public void Update()
	{
		GL.IssuePluginEvent (mPluginEventId);
	}
	
	static public string GetVersion()
	{
		return "";
	}

}

