#---------cocosDenshion.pxd-----------------
cdef class SimpleAudioEngine(TypeInfo):
    cdef inline cocosDenshion.SimpleAudioEngine* engine(self):
        return <cocosDenshion.SimpleAudioEngine*>self._co

    @classmethod
    def sharedEngine(cls):
        o = SimpleAudioEngine()
        o._co = <include_h.TypeInfo*>cocosDenshion.sharedEngine()
        return o

    @classmethod
    def end(cls):
        cocosDenshion.end()

    def new(self):
        self._co = <include_h.TypeInfo*>new cocosDenshion.SimpleAudioEngine()

    def preloadBackgroundMusic(self, pszFilePath):
        self.engine().preloadBackgroundMusic(pszFilePath)
    
    def playBackgroundMusic(self, pszFilePath, bLoop=None):
        if bLoop is None:
            self.engine().playBackgroundMusic(pszFilePath)
        else:
            self.engine().playBackgroundMusic(pszFilePath, bLoop)

    def stopBackgroundMusic(self, bReleaseData=None):
        if bReleaseData is None:
            self.engine().stopBackgroundMusic()
        else:
            self.engine().stopBackgroundMusic(bReleaseData)

    def pauseBackgroundMusic(self):
        self.engine().pauseBackgroundMusic()

    def resumeBackgroundMusic(self):
        self.engine().resumeBackgroundMusic()

    def rewindBackgroundMusic(self):
        self.engine().rewindBackgroundMusic()

    def willPlayBackgroundMusic(self):
        return self.engine().willPlayBackgroundMusic()

    def isBackgroundMusicPlaying(self):
        return self.engine().isBackgroundMusicPlaying()

    def getBackgroundMusicVolume(self):
        return self.engine().getBackgroundMusicVolume()

    def setBackgroundMusicVolume(self, volume):
        self.engine().setBackgroundMusicVolume(volume)

    def getEffectsVolume(self):
        return self.engine().getEffectsVolume()

    def setEffectsVolume(self, volume):
        self.engine().setEffectsVolume(volume)

    def playEffect(self, pszFilePath, bLoop=None):
        if bLoop is None:
            return self.engine().playEffect(pszFilePath)
        return self.engine().playEffect(pszFilePath, bLoop)

    def pauseEffect(self, nSoundId):
        self.engine().pauseEffect(nSoundId)

    def pauseAllEffects(self):
        self.engine().pauseAllEffects()

    def resumeEffect(self, nSoundId):
        self.engine().resumeEffect(nSoundId)

    def resumeAllEffects(self):
        self.engine().resumeAllEffects()

    def stopEffect(self, nSoundId):
        self.engine().stopEffect(nSoundId)

    def stopAllEffects(self):
        self.engine().stopAllEffects()

    def preloadEffect(self, pszFilePath):
        self.engine().preloadEffect(pszFilePath)

    def unloadEffect(self, pszFilePath):
        self.engine().unloadEffect(pszFilePath)
        
#---------cocosDenshion.pxd-----------------