#pragma once

#include <SoyUnity.h>

//	some global params
namespace Unity
{
	static Unity::sint	mEventId = 0xFEE45678;
	
	extern int			GetPluginEventId();
};


__export Unity::sint	PopHologram_GetPluginEventId();


__export void			PopHologram_DrawSomething(Unity::Float x,Unity::Float y,Unity::Float z,Unity::sint InstanceCount);
