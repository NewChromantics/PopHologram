#include "PopUnity.h"


__export Unity::sint PopHologram_GetPluginEventId()
{
	return Unity::GetPluginEventId();
}

int Unity::GetPluginEventId()
{
	return mEventId;
}



class TDrawObject
{
public:
	vec3f	mPosition;
	size_t	mInstanceCount;
};



class TDrawJob : public PopWorker::TJob
{
public:
	TDrawJob(std::shared_ptr<TDrawObject>& pObject) :
		mObject			( pObject )
	{
	}
	
	virtual void		Run() override
	{
		//	draw
	}
	
	std::shared_ptr<TDrawObject>	mObject;
};



__export void PopHologram_DrawSomething(float x,float y,float z,Unity::sint InstanceCount)
{
	try
	{
		auto& Context = Unity::GetOpenglContext();
		std::shared_ptr<TDrawObject> Object( new TDrawObject );
		Object->mPosition = vec3f( x, y, z );
		Object->mInstanceCount = InstanceCount;
		std::shared_ptr<PopWorker::TJob> Job( new TDrawJob(Object) );
		Context.PushJob( Job );
	}
	catch(std::exception& e)
	{
		std::Debug << __func__ << " exception: " << e.what() << std::endl;
	}
}



