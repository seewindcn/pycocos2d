# distutils: language = c++

from libcpp cimport bool
from libcpp.string cimport string
from libcpp.set cimport set
from include_h cimport *


cdef extern from "SimpleAudioEngine.h" namespace "CocosDenshion":
    cppclass SimpleAudioEngine(TypeInfo):
        SimpleAudioEngine()
        # ~SimpleAudioEngine()


        void preloadBackgroundMusic(const char* pszFilePath)
        
        void playBackgroundMusic(const char* pszFilePath, bool bLoop)
        void playBackgroundMusic(const char* pszFilePath) 

        void stopBackgroundMusic(bool bReleaseData)
        void stopBackgroundMusic()

        void pauseBackgroundMusic()

        void resumeBackgroundMusic()

        void rewindBackgroundMusic()

        bool willPlayBackgroundMusic()

        bool isBackgroundMusicPlaying()

        float getBackgroundMusicVolume()

        void setBackgroundMusicVolume(float volume)

        float getEffectsVolume()

        void setEffectsVolume(float volume)

        unsigned int playEffect(const char* pszFilePath, bool bLoop)
        unsigned int playEffect(const char* pszFilePath)

        void pauseEffect(unsigned int nSoundId)

        void pauseAllEffects()

        void resumeEffect(unsigned int nSoundId)

        void resumeAllEffects()

        void stopEffect(unsigned int nSoundId)

        void stopAllEffects()

        void preloadEffect(const char* pszFilePath)
        void unloadEffect(const char* pszFilePath)

    SimpleAudioEngine* sharedEngine"CocosDenshion::SimpleAudioEngine::sharedEngine"()
    void end"CocosDenshion::SimpleAudioEngine::end"()


