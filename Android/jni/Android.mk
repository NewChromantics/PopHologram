LOCAL_PATH := $(call my-dir)


# extra ../ as jni is always prepended
SRC := ../..


# gr: get this from env var
APP_MODULE := PopMovieTexture

# full speed arm instead of thumb
LOCAL_ARM_MODE  := arm

include cflags.mk


#--------------------------------------------------------
# Unity plugin
#--------------------------------------------------------
include $(CLEAR_VARS)

LOCAL_MODULE := PopMovieTexture

#LOCAL_C_INCLUDES += $(LOCAL_PATH)/$(OCULUS)
LOCAL_C_INCLUDES += $(SOY_PATH)/src

LOCAL_STATIC_LIBRARIES :=
#LOCAL_STATIC_LIBRARIES += android-ndk-profiler

LOCAL_LDLIBS	+= -lGLESv3			# OpenGL ES 3.0
LOCAL_LDLIBS	+= -lEGL			# GL platform interface
LOCAL_LDLIBS  	+= -llog			# logging
LOCAL_LDLIBS  	+= -landroid		# native windows
LOCAL_LDLIBS	+= -lz				# For minizip
LOCAL_LDLIBS	+= -lOpenSLES		# audio

# project files
# todo: generate from input from xcode
LOCAL_SRC_FILES  := \
$(SRC)/src/AndroidMovieDecoder.cpp \
$(SRC)/src/PopMovieDecoder.cpp \
$(SRC)/src/PopMovieTexture.cpp \
$(SRC)/src/PopUnity.cpp \
$(SRC)/src/TestMovieDecoder.cpp \
$(SRC)/src/TBlitter.cpp \
$(SRC)/src/TBlitterOpengl.cpp \
$(SRC)/src/TDecoderPlaylist.cpp \
$(SRC)/src/TStreamDecoder.cpp \
$(SRC)/src/TPerformanceGraph.cpp \
$(SRC)/src/SoyMpegts.cpp \


# soy lib files
LOCAL_SRC_FILES  += \
$(SOY_PATH)/src/SoyOpengl.cpp \
$(SOY_PATH)/src/SoyOpenglContext.cpp \
$(SOY_PATH)/src/SoyAssert.cpp \
$(SOY_PATH)/src/SoyTypes.cpp \
$(SOY_PATH)/src/SoyPixels.cpp \
$(SOY_PATH)/src/SoyPng.cpp \
$(SOY_PATH)/src/SoyDebug.cpp \
$(SOY_PATH)/src/SoyThread.cpp \
$(SOY_PATH)/src/SoyEvent.cpp \
$(SOY_PATH)/src/SoyString.cpp \
$(SOY_PATH)/src/memheap.cpp \
$(SOY_PATH)/src/SoyArray.cpp \
$(SOY_PATH)/src/SoyShader.cpp \
$(SOY_PATH)/src/SoySocket.cpp \
$(SOY_PATH)/src/SoyStream.cpp \
$(SOY_PATH)/src/SoyHttp.cpp \
$(SOY_PATH)/src/SoyRef.cpp \
$(SOY_PATH)/src/SoyProtocol.cpp \
$(SOY_PATH)/src/SoyMedia.cpp \
$(SOY_PATH)/src/SoyH264.cpp \
$(SOY_PATH)/src/SoySocketStream.cpp \
$(SOY_PATH)/src/SoyWave.cpp \
$(SOY_PATH)/src/SoyHttpConnection.cpp \
$(SOY_PATH)/src/SoyJava.cpp \
$(SOY_PATH)/src/SoyUnity.cpp \



include $(BUILD_SHARED_LIBRARY)




#$(call import-module,android-ndk-profiler)
