
kCCBPropTypePosition = ccb.kCCBPropTypePosition
kCCBPropTypeSize = ccb.kCCBPropTypeSize
kCCBPropTypePoint = ccb.kCCBPropTypePoint
kCCBPropTypePointLock = ccb.kCCBPropTypePointLock
kCCBPropTypeScaleLock = ccb.kCCBPropTypeScaleLock
kCCBPropTypeDegrees = ccb.kCCBPropTypeDegrees
kCCBPropTypeInteger = ccb.kCCBPropTypeInteger
kCCBPropTypeFloat = ccb.kCCBPropTypeFloat
kCCBPropTypeFloatVar = ccb.kCCBPropTypeFloatVar
kCCBPropTypeCheck = ccb.kCCBPropTypeCheck
kCCBPropTypeSpriteFrame = ccb.kCCBPropTypeSpriteFrame
kCCBPropTypeTexture = ccb.kCCBPropTypeTexture
kCCBPropTypeByte = ccb.kCCBPropTypeByte
kCCBPropTypeColor3 = ccb.kCCBPropTypeColor3
kCCBPropTypeColor4FVar = ccb.kCCBPropTypeColor4FVar
kCCBPropTypeFlip = ccb.kCCBPropTypeFlip
kCCBPropTypeBlendmode = ccb.kCCBPropTypeBlendmode
kCCBPropTypeFntFile = ccb.kCCBPropTypeFntFile
kCCBPropTypeText = ccb.kCCBPropTypeText
kCCBPropTypeFontTTF = ccb.kCCBPropTypeFontTTF
kCCBPropTypeIntegerLabeled = ccb.kCCBPropTypeIntegerLabeled
kCCBPropTypeBlock = ccb.kCCBPropTypeBlock
kCCBPropTypeAnimation = ccb.kCCBPropTypeAnimation
kCCBPropTypeCCBFile = ccb.kCCBPropTypeCCBFile
kCCBPropTypeString = ccb.kCCBPropTypeString
kCCBPropTypeBlockCCControl = ccb.kCCBPropTypeBlockCCControl
kCCBPropTypeFloatScale = ccb.kCCBPropTypeFloatScale
kCCBPropTypeFloatXY = ccb.kCCBPropTypeFloatXY

kCCBFloat0 = ccb.kCCBFloat0
kCCBFloat1 = ccb.kCCBFloat1
kCCBFloatMinus1 = ccb.kCCBFloatMinus1
kCCBFloat05 = ccb.kCCBFloat05
kCCBFloatInteger = ccb.kCCBFloatInteger
kCCBFloatFull = ccb.kCCBFloatFull
kCCBPlatformAll = ccb.kCCBPlatformAll
kCCBPlatformIOS = ccb.kCCBPlatformIOS
kCCBPlatformMac = ccb.kCCBPlatformMac
kCCBTargetTypeNone = ccb.kCCBTargetTypeNone
kCCBTargetTypeDocumentRoot = ccb.kCCBTargetTypeDocumentRoot
kCCBTargetTypeOwner = ccb.kCCBTargetTypeOwner
kCCBKeyframeEasingInstant = ccb.kCCBKeyframeEasingInstant
kCCBKeyframeEasingLinear = ccb.kCCBKeyframeEasingLinear
kCCBKeyframeEasingCubicIn = ccb.kCCBKeyframeEasingCubicIn
kCCBKeyframeEasingCubicOut = ccb.kCCBKeyframeEasingCubicOut
kCCBKeyframeEasingCubicInOut = ccb.kCCBKeyframeEasingCubicInOut
kCCBKeyframeEasingElasticIn = ccb.kCCBKeyframeEasingElasticIn
kCCBKeyframeEasingElasticOut = ccb.kCCBKeyframeEasingElasticOut
kCCBKeyframeEasingElasticInOut = ccb.kCCBKeyframeEasingElasticInOut
kCCBKeyframeEasingBounceIn = ccb.kCCBKeyframeEasingBounceIn
kCCBKeyframeEasingBounceOut = ccb.kCCBKeyframeEasingBounceOut
kCCBKeyframeEasingBounceInOut = ccb.kCCBKeyframeEasingBounceInOut
kCCBKeyframeEasingBackIn = ccb.kCCBKeyframeEasingBackIn
kCCBKeyframeEasingBackOut = ccb.kCCBKeyframeEasingBackOut
kCCBKeyframeEasingBackInOut = ccb.kCCBKeyframeEasingBackInOut
kCCBPositionTypeRelativeBottomLeft = ccb.kCCBPositionTypeRelativeBottomLeft
kCCBPositionTypeRelativeTopLeft = ccb.kCCBPositionTypeRelativeTopLeft
kCCBPositionTypeRelativeTopRight = ccb.kCCBPositionTypeRelativeTopRight
kCCBPositionTypeRelativeBottomRight = ccb.kCCBPositionTypeRelativeBottomRight
kCCBPositionTypePercent = ccb.kCCBPositionTypePercent
kCCBPositionTypeMultiplyResolution = ccb.kCCBPositionTypeMultiplyResolution
kCCBSizeTypeAbsolute = ccb.kCCBSizeTypeAbsolute
kCCBSizeTypePercent = ccb.kCCBSizeTypePercent
kCCBSizeTypeRelativeContainer = ccb.kCCBSizeTypeRelativeContainer
kCCBSizeTypeHorizontalPercent = ccb.kCCBSizeTypeHorizontalPercent
kCCBSizeTypeVerticalPercent = ccb.kCCBSizeTypeVerticalPercent
kCCBSizeTypeMultiplyResolution = ccb.kCCBSizeTypeMultiplyResolution
kCCBScaleTypeAbsolute = ccb.kCCBScaleTypeAbsolute
kCCBScaleTypeMultiplyResolution = ccb.kCCBScaleTypeMultiplyResolution


cdef extern from "cc_ext.h":
    ctypedef int assign_func
    cppclass CCBOwner(CCPyFunc):
        ccb.SEL_CCControlHandler get_CCControlHandler()
        void initAssign(assign_func func)

    
cdef bool _assign(void* data, int t, cocoa.CCObject* var1, 
            const char* var2, void* var3):
    cdef CCBuilderOwner obj = <CCBuilderOwner>data
    return obj._assign(t, var1, var2, var3)



cdef class CCBuilderOwner(CallBack):
    cdef inline CCBOwner* owner(self):
        return <CCBOwner*>self._co

    # def __cinit__(self, obj=None):
    #     co = new CCBOwner()
    #     self.init(obj)

    # def __dealloc__(self):
    #     self._co.release()

    def _new_call_back(self):
        return <int>new CCBOwner()

    cdef bool _assign(self, int t, cocoa.CCObject* var1, 
            const char* var2, void* var3):
        cdef str o2 = var2
        cdef CCObject o1 = CCObject()
        cdef CCNode o3_1
        cdef CCBValue o3_2
        o1._co = var1
        if t == 0:#CB_ASSIGN_MEMBER
            o3_1 = CCNode()
            o3_1._co = <cocoa.CCObject*>var3
            o3 = o3_1
        elif t == 1:
            o3_2 = CCBValue()
            o3_2._co = <cocoa.CCObject*>var3
            o3 = o3_2


        try:
            if self.obj is not None:
                return self.obj(o1, o2, o3)
            else:
                return self.assign(o1, o2, o3)
        except:
            traceback.print_exc()
            return False




cdef class CCBSequenceProperty(CCObject):
    cdef inline ccb.CCBSequenceProperty* prop(self):
        return <ccb.CCBSequenceProperty*> self._co

    def init(self):
        return self.prop().init()
    
    def getName(self):
        return self.prop().getName()

    def setName(self, pName):
        self.prop().setName(pName)
    
    def getType(self):
        return self.prop().getType()
    def setType(self, nType):
        self.prop().setType(nType)
    
    def getKeyframes(self):
        cdef CCArray o = CCArray()
        o._co = <cocoa.CCObject*>self.prop().getKeyframes()
        return o


cdef class CCBValue(CCObject):
    cdef inline ccb.CCBValue* value(self):
        return <ccb.CCBValue*> self._co

    @classmethod
    def create(cls, v):
        cdef int i
        cdef bool b
        cdef float f
        cdef unsigned char by
        cdef char* ps
        cdef CCArray a

        cdef CCBValue o = cls()
        t = type(v)
        if t == int:
            i = v
            if i < 256:
                by = v
                o._co = <cocoa.CCObject*>ccb.CCBValue_create(by)
            else:
                o._co = <cocoa.CCObject*>ccb.CCBValue_create(i)
        elif t == float:
            f = v
            o._co = <cocoa.CCObject*>ccb.CCBValue_create(f)
        elif t == str:
            ps = v
            o._co = <cocoa.CCObject*>ccb.CCBValue_create(ps)
        elif t == CCArray:
            a = v
            o._co = <cocoa.CCObject*>ccb.CCBValue_create(a.array())
        elif t in [list, tuple]:
            a = CCArray(t)
            o._co = <cocoa.CCObject*>ccb.CCBValue_create(a.array())
        elif v in [True, False]:
            b = v
            o._co = <cocoa.CCObject*>ccb.CCBValue_create(b)
        return o

    def getIntValue(self):
        return self.value().getIntValue()

    def getFloatValue(self):
        return self.value().getFloatValue()

    def getBoolValue(self):
        return self.value().getBoolValue()
    def getByteValue(self):
        return self.value().getByteValue()

    def getStringValue(self):
        return self.value().getStringValue()

    def getArrayValue(self):
        cdef CCArray o = CCArray()
        o._co = <cocoa.CCObject*>self.value().getArrayValue()
        return o
    
    def getType(self):
        return self.value().getType()



cdef class CCBKeyframe(CCObject):
    cdef inline ccb.CCBKeyframe* frame(self):
        return <ccb.CCBKeyframe*>self._co

    def new(self):
        self._co = <cocoa.CCObject*>new ccb.CCBKeyframe()
    # ~CCBKeyframe()
    
    def getValue(self, cls=CCObject):
        cdef CCObject o = cls()
        o._co = <cocoa.CCObject*>self.frame().getValue()

    def setValue(self, CCObject pValue): # retain
        self.frame().setValue(pValue._co)
    
    def getTime(self):
        return self.frame().getTime()
    def setTime(self, fTime):
        self.frame().setTime(fTime)
    
    def getEasingType(self):
        return self.frame().getEasingType()
    def setEasingType(self, nEasingType):
        self.frame().setEasingType(nEasingType)
    
    def getEasingOpt(self):
        return self.frame().getEasingOpt()
    def setEasingOpt(self, fEasingOpt):
        self.frame().setEasingOpt(fEasingOpt)


cdef class CCBFile(CCNode):
    cdef inline ccb.CCBFile* file(self):
        return <ccb.CCBFile*>self._co

    @classmethod
    def create(cls):
        cdef CCBFile o = cls()
        o._co = <cocoa.CCObject*>ccb.CCBFile_create()
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new ccb.CCBFile()
    
    def getCCBFileNode(self, cls=CCNode):
        cdef CCNode o = cls()
        o._co = <cocoa.CCObject*>self.file().getCCBFileNode()
        return o

    def setCCBFileNode(self, CCNode pNode): # retain
        self.file().setCCBFileNode(pNode.node())




cdef class CCBSequence(CCObject):
    cdef inline ccb.CCBSequence* seq(self):
        return <ccb.CCBSequence*>self._co

    def new(self):
        self._co = <cocoa.CCObject*>new ccb.CCBSequence()
    # ~CCBSequence()

    def getDuration(self):
        return self.seq().getDuration()

    def setDuration(self, fDuration):
        self.seq().setDuration(fDuration)
    
    def getCallbackChannel(self):
        cdef CCBSequenceProperty o = CCBSequenceProperty()
        o._co = <cocoa.CCObject*>self.seq().getCallbackChannel()
        return o

    def setCallbackChannel(self, CCBSequenceProperty callbackChannel):
        self.seq().setCallbackChannel(callbackChannel.prop())

    def getSoundChannel(self):
        cdef CCBSequenceProperty o = CCBSequenceProperty()
        o._co = self.seq().getSoundChannel()
        return o
    def setSoundChannel(self, CCBSequenceProperty soundChannel):
        self.seq().setSoundChannel(soundChannel.prop())
    
    def getName(self):
        return self.seq().getName()
    def setName(self, pName):
        self.seq().setName(pName)
    
    def getSequenceId(self):
        return self.seq().getSequenceId()
    def setSequenceId(self, nSequenceId):
        self.seq().setSequenceId(nSequenceId)
    
    def getChainedSequenceId(self):
        return self.seq().getChainedSequenceId()
    def setChainedSequenceId(self, nChainedSequenceId):
        self.seq().setChainedSequenceId(nChainedSequenceId)


cdef class CCData(CCObject):
    cdef inline ccb.CCData* data(self):
        return <ccb.CCData*>self._co

    def new(self, s):
        cdef unsigned char * p = s
        self._co = <cocoa.CCObject*>new ccb.CCData(p, len(s))

    def new_by_data(self, CCData pData):
        self._co = <cocoa.CCObject*>new ccb.CCData(pData.data())

    # ~CCData()
    def getBytes(self):
        return self.data().getBytes()
    def getSize(self):
        return self.data().getSize()


cdef class CCBReader(CCObject):
    cdef inline ccb.CCBReader* reader(self):
        return <ccb.CCBReader*>self._co


    @classmethod
    def getResolutionScale(cls):
        return ccb.CCBReader_getResolutionScale()

    @classmethod
    def setResolutionScale(cls, scale):
        ccb.CCBReader_setResolutionScale(scale)

    # /* Utility methods. */
    @classmethod
    def lastPathComponent(cls, pString):
        return ccb.CCBReader_lastPathComponent(pString)

    @classmethod
    def deletePathExtension(cls, pString):
        return ccb.CCBReader_deletePathExtension(pString)

    @classmethod
    def toLowerCase(cls, pCCString):
        return ccb.CCBReader_toLowerCase(pCCString)

    @classmethod
    def endsWith(cls, pString, pEnding):
        return ccb.CCBReader_endsWith(pString, pEnding)

    # bool jsControlled
    def new(self, CCNodeLoaderLibrary pCCNodeLoaderLibrary=None, 
            # CCBMemberVariableAssigner pCCBMemberVariableAssigner=None,
            # CCBSelectorResolver pCCBSelectorResolver=None,
            # CCNodeLoaderListener pCCNodeLoaderListener=None
            ):
        if pCCNodeLoaderLibrary is None:
            self._co = <cocoa.CCObject*>new ccb.CCBReader()
            return
        self._co = <cocoa.CCObject*>new ccb.CCBReader(pCCNodeLoaderLibrary.lib())

    def new_by_reader(self, CCBReader pCCBReader):
        self._co = <cocoa.CCObject*>new ccb.CCBReader(pCCBReader.reader())

    # virtual ~CCBReader()
   
    def setCCBRootPath(self, pCCBRootPath):
        self.reader().setCCBRootPath(pCCBRootPath)

    def getCCBRootPath(self):
        return self.reader().getCCBRootPath()

    def readNodeGraphFromFile(self, pCCBFileName, CCBuilderOwner pOwner=None, 
            CCSize parentSize=None, cls=CCNode):
        cdef CCNode o = cls()
        if pOwner is None:
            o._co = <cocoa.CCObject*>self.reader().readNodeGraphFromFile(pCCBFileName)
        elif parentSize is None:
            o._co = <cocoa.CCObject*>self.reader().readNodeGraphFromFile(pCCBFileName,
                    pOwner.owner())
        else:
            o._co = <cocoa.CCObject*>self.reader().readNodeGraphFromFile(pCCBFileName,
                    pOwner.owner(), parentSize._co)

        return o
    
    def readNodeGraphFromData(self, CCData pData, CCBuilderOwner pOwner, 
            CCSize parentSize, cls=CCNode):
        cdef CCNode o = cls()
        o._co = <cocoa.CCObject*>self.reader().readNodeGraphFromData(pData.data(),
                pOwner.owner(), parentSize._co)
   
    def createSceneWithNodeGraphFromFile(self, pCCBFileName, 
            CCBuilderOwner pOwner, CCSize parentSize, cls=CCScene):
        cdef CCScene o = cls()
        if pOwner is None:
            o._co = <cocoa.CCObject*>self.reader().createSceneWithNodeGraphFromFile(
                    pCCBFileName)
        elif parentSize is None:
            o._co = <cocoa.CCObject*>self.reader().createSceneWithNodeGraphFromFile(
                    pCCBFileName, pOwner.owner())
        else:
            o._co = <cocoa.CCObject*>self.reader().createSceneWithNodeGraphFromFile(
                    pCCBFileName, pOwner.owner(), parentSize._co)
        return o

    # CCBMemberVariableAssigner* getCCBMemberVariableAssigner()
    # CCBSelectorResolver* getCCBSelectorResolver()
    
    def getAnimationManager(self):
        cdef CCBAnimationManager o = CCBAnimationManager()
        o._co = <cocoa.CCObject*>self.reader().getAnimationManager()
        return o

    def setAnimationManager(self, CCBAnimationManager pAnimationManager):
        self.reader().setAnimationManager(pAnimationManager.mgr())
    
    # # Used in CCNodeLoader::parseProperties()
    # set[string]* getAnimatedProperties()
    # set[string]& getLoadedSpriteSheet()
    def getOwner(self, cls=CCObject):
        cdef CCObject o = cls()
        o._co = <cocoa.CCObject*>self.reader().getOwner()
        return o


    def getAnimationManagers(self):
        cdef CCDictionary o = CCDictionary()
        o._co = <cocoa.CCObject*>self.reader().getAnimationManagers()
        return o

    def setAnimationManagers(self, CCDictionary x):  # weak reference
        self.reader().setAnimationManagers(x.dict())
    
    def addOwnerCallbackName(self, name):
        self.reader().addOwnerCallbackName(name)
    def addOwnerCallbackNode(self, CCNode node):
        self.reader().addOwnerCallbackNode(node.node())
    
    def addDocumentCallbackName(self, name):
        self.reader().addDocumentCallbackName(name)
    def addDocumentCallbackNode(self, CCNode node):
        self.reader().addDocumentCallbackNode(node.node())
    
    def readFileWithCleanUp(self, bCleanUp, CCDictionary am, cls=CCNode):
        cdef CCNode o = cls()
        o._co = <cocoa.CCObject*>self.reader().readFileWithCleanUp(bCleanUp, am.dict())
        return o




cdef class CCBAnimationManagerDelegate:
    cdef ccb.CCBAnimationManagerDelegate* _co
    # cdef inline ccb.CCBAnimationManagerDelegate delegate(self):
    #     return <ccb.CCBAnimationManagerDelegate*>self._co
    def completedAnimationSequenceNamed(self, name):
        pass

cdef class CCBAnimationManager(CCObject):
    cdef inline ccb.CCBAnimationManager* mgr(self):
        return <ccb.CCBAnimationManager*>self._co

    # bool jsControlled
    def new(self):
        self._co = <cocoa.CCObject*>new ccb.CCBAnimationManager()
    # #~CCBAnimationManager()

    # bool init()
    def getSequences(self):
        cdef CCArray o = CCArray()
        o._co = <cocoa.CCObject*> self.mgr().getSequences()
        return o

    def setSequences(self, CCArray seq):
        self.mgr().setSequences(seq.array())

    def getAutoPlaySequenceId(self):
        return self.mgr().getAutoPlaySequenceId()
    def setAutoPlaySequenceId(self, autoPlaySequenceId):
        self.mgr().setAutoPlaySequenceId(autoPlaySequenceId)
    
    def getRootNode(self, cls=CCNode):
        cdef CCNode o = cls()
        o._co = <cocoa.CCObject*>self.mgr().getRootNode()
        return o
    def setRootNode(self, CCNode pRootNode): # weak reference    
        self.mgr().setRootNode(pRootNode.node())

    def addDocumentCallbackNode(self, CCNode node):
        self.mgr().addDocumentCallbackNode(node.node())
    def addDocumentCallbackName(self, name):
        self.mgr().addDocumentCallbackName(name)
    def addDocumentOutletNode(self, CCNode node):
        self.mgr().addDocumentOutletNode(node.node())
    def addDocumentOutletName(self, name):
        self.mgr().addDocumentOutletName(name)

    def setDocumentControllerName(self, name):
        cdef string n = name
        self.mgr().setDocumentControllerName(n)
    
    def getDocumentControllerName(self):
        return self.mgr().getDocumentControllerName()

    # CCArray* getDocumentCallbackNames()
    # CCArray* getDocumentCallbackNodes()
    # CCArray* getDocumentOutletNames()
    # CCArray* getDocumentOutletNodes()
    def getLastCompletedSequenceName(self):
        return self.mgr().getLastCompletedSequenceName()
    
    # CCArray* getKeyframeCallbacks()
    
    def getRootContainerSize(self):
        cdef CCSize o = CCSize()
        o._co = self.mgr().getRootContainerSize()
        return o

    def setRootContainerSize(self, CCSize rootContainerSize):
        self.mgr().setRootContainerSize(rootContainerSize._co)
    
    def getDelegate(self):
        cdef CCBAnimationManagerDelegate o = CCBAnimationManagerDelegate()
        o._co = self.mgr().getDelegate()
        return o
    def setDelegate(self, CCBAnimationManagerDelegate pDelegate): # retain
        self.mgr().setDelegate(pDelegate._co)
    
    def getRunningSequenceName(self):
        return self.mgr().getRunningSequenceName()
    
    def getContainerSize(self, CCNode pNode):
        cdef CCSize o = CCSize()
        o._co = self.mgr().getContainerSize(pNode.node())
        return o
    
    def addNode(self, CCNode pNode, CCDictionary pSeq):
        self.mgr().addNode(pNode.node(), pSeq.dict())

    def setBaseValue(self, CCObject pValue, CCNode pNode, 
            pPropName):
        self.mgr().setBaseValue(pValue._co, pNode.node(), pPropName)

    def moveAnimationsFromNode(self, CCNode fromNode, CCNode toNode):
        self.mgr().moveAnimationsFromNode(fromNode.node(), toNode.node())

    def runAnimationsForSequenceNamedTweenDuration(self, pName, fTweenDuration):
        self.mgr().runAnimationsForSequenceNamedTweenDuration(pName, fTweenDuration)

    def runAnimationsForSequenceNamed(self, pName):
        self.mgr().runAnimationsForSequenceNamed(pName)

    def runAnimationsForSequenceIdTweenDuration(self, nSeqId, fTweenDuraiton):
        self.mgr().runAnimationsForSequenceIdTweenDuration(nSeqId, fTweenDuraiton)

    def setAnimationCompletedCallback(self, CallBack cb):
        self.mgr().setAnimationCompletedCallback(cb._co, cb.get_CallFunc())

    def debug(self):
        self.mgr().debug()
    
    def setCallFunc(self, CCCallFunc callFunc, callbackNamed):
        cdef string cname = callbackNamed
        self.mgr().setCallFunc(callFunc.func(), cname)

    def actionForCallbackChannel(self, CCBSequenceProperty channel, cls=CCObject):
        cdef CCObject o = cls()
        o._co = self.mgr().actionForCallbackChannel(channel.prop())
        return o

    def actionForSoundChannel(self, CCBSequenceProperty channel, cls=CCObject):
        cdef CCObject o = cls()
        o._co = self.mgr().actionForSoundChannel(channel.prop())
        return o

cdef class CCNodeLoaderLibrary(CCObject):
    cdef inline ccb.CCNodeLoaderLibrary* lib(self):
        return <ccb.CCNodeLoaderLibrary*>self._co

    @classmethod
    def library(cls):
        cdef CCNodeLoaderLibrary o = cls()
        o._co = <cocoa.CCObject*>ccb.CCNodeLoaderLibrary_library()
        return o

    @classmethod
    def sharedCCNodeLoaderLibrary(cls):
        cdef CCNodeLoaderLibrary o = cls()
        o._co = <cocoa.CCObject*>ccb.CCNodeLoaderLibrary_sharedCCNodeLoaderLibrary()
        return o

    @classmethod
    def purgeSharedCCNodeLoaderLibrary(cls):
        ccb.CCNodeLoaderLibrary_purgeSharedCCNodeLoaderLibrary()

    @classmethod
    def newDefaultCCNodeLoaderLibrary(cls):
        cdef CCNodeLoaderLibrary o = cls()
        o._co = <cocoa.CCObject*>ccb.CCNodeLoaderLibrary_newDefaultCCNodeLoaderLibrary()
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new ccb.CCNodeLoaderLibrary()
    # virtual ~CCNodeLoaderLibrary()

    def registerDefaultCCNodeLoaders(self):
        self.lib().registerDefaultCCNodeLoaders()

    # def registerCCNodeLoader(self, pClassName, CCNodeLoader pCCNodeLoader):
    #     self.lib().registerCCNodeLoader(pClassName, pCCNodeLoader.loader())
    #void registerCCNodeLoader(CCString * pClassName, CCNodeLoader * pCCNodeLoader)
    def unregisterCCNodeLoader(self, pClassName):
        self.lib().unregisterCCNodeLoader(pClassName)
    #void unregisterCCNodeLoader(CCString * pClassName)
    # CCNodeLoader * getCCNodeLoader(const char * pClassName)
    #CCNodeLoader * getCCNodeLoader(CCString * pClassName)
    def purge(self, pDelete):
        self.lib().purge(pDelete)




    



