# distutils: language = c++

from libcpp cimport bool
from libcpp.string cimport string
from libcpp.set cimport set

from include_h cimport *
from cocoa cimport *
from actions cimport *
from ccScene cimport *

cdef extern:
    enum:
        kCCBPropTypePosition = 0,
        kCCBPropTypeSize,
        kCCBPropTypePoint,
        kCCBPropTypePointLock,
        kCCBPropTypeScaleLock,
        kCCBPropTypeDegrees,
        kCCBPropTypeInteger,
        kCCBPropTypeFloat,
        kCCBPropTypeFloatVar,
        kCCBPropTypeCheck,
        kCCBPropTypeSpriteFrame,
        kCCBPropTypeTexture,
        kCCBPropTypeByte,
        kCCBPropTypeColor3,
        kCCBPropTypeColor4FVar,
        kCCBPropTypeFlip,
        kCCBPropTypeBlendmode,
        kCCBPropTypeFntFile,
        kCCBPropTypeText,
        kCCBPropTypeFontTTF,
        kCCBPropTypeIntegerLabeled,
        kCCBPropTypeBlock,
        kCCBPropTypeAnimation,
        kCCBPropTypeCCBFile,
        kCCBPropTypeString,
        kCCBPropTypeBlockCCControl,
        kCCBPropTypeFloatScale,
        kCCBPropTypeFloatXY

    enum:
        kCCBFloat0 = 0,
        kCCBFloat1,
        kCCBFloatMinus1,
        kCCBFloat05,
        kCCBFloatInteger,
        kCCBFloatFull

    enum:
        kCCBPlatformAll = 0,
        kCCBPlatformIOS,
        kCCBPlatformMac

    enum:
        kCCBTargetTypeNone = 0,
        kCCBTargetTypeDocumentRoot = 1,
        kCCBTargetTypeOwner = 2,

    enum:
        kCCBKeyframeEasingInstant,
        
        kCCBKeyframeEasingLinear,
        
        kCCBKeyframeEasingCubicIn,
        kCCBKeyframeEasingCubicOut,
        kCCBKeyframeEasingCubicInOut,
        
        kCCBKeyframeEasingElasticIn,
        kCCBKeyframeEasingElasticOut,
        kCCBKeyframeEasingElasticInOut,
        
        kCCBKeyframeEasingBounceIn,
        kCCBKeyframeEasingBounceOut,
        kCCBKeyframeEasingBounceInOut,
        
        kCCBKeyframeEasingBackIn,
        kCCBKeyframeEasingBackOut,
        kCCBKeyframeEasingBackInOut,

    enum:
        kCCBPositionTypeRelativeBottomLeft,
        kCCBPositionTypeRelativeTopLeft,
        kCCBPositionTypeRelativeTopRight,
        kCCBPositionTypeRelativeBottomRight,
        kCCBPositionTypePercent,
        kCCBPositionTypeMultiplyResolution,

    enum:
        kCCBSizeTypeAbsolute,
        kCCBSizeTypePercent,
        kCCBSizeTypeRelativeContainer,
        kCCBSizeTypeHorizontalPercent,
        kCCBSizeTypeVerticalPercent,
        kCCBSizeTypeMultiplyResolution,

    enum:
        kCCBScaleTypeAbsolute,
        kCCBScaleTypeMultiplyResolution


cdef extern from "cocos-ext.h" namespace "cocos2d::extension":
    cppclass CCBSequenceProperty(CCObject):
        CCBSequenceProperty()
        # ~CCBSequenceProperty()
        
        bool init()
        
        const char* getName()
        void setName(const char* pName)
        
        int getType()
        void setType(int nType)
        
        CCArray* getKeyframes()


    cppclass ccColor3BWapper(CCObject):
        const ccColor3B& getColor() const
    ccColor3BWapper* ccColor3BWapper_create"cocos2d::extension::ccColor3BWapper::create"(const ccColor3B& color)
        

    enum:
        kIntValue,
        kFloatValue,
        kBoolValue,
        kUnsignedCharValue,
        kStringValue,
        kArrayValue

    cppclass CCBValue(CCObject):
        int getIntValue()
        float getFloatValue()
        bool getBoolValue()
        unsigned char getByteValue()
        const char* getStringValue()
        CCArray *getArrayValue()
        
        int getType()
    CCBValue* CCBValue_create"cocos2d::extension::CCBValue::create"(int nValue)
    CCBValue* CCBValue_create"cocos2d::extension::CCBValue::create"(bool bValue)
    CCBValue* CCBValue_create"cocos2d::extension::CCBValue::create"(float fValue)
    CCBValue* CCBValue_create"cocos2d::extension::CCBValue::create"(unsigned char byte)
    CCBValue* CCBValue_create"cocos2d::extension::CCBValue::create"(const char* pStr)
    CCBValue* CCBValue_create"cocos2d::extension::CCBValue::create"(CCArray* pArr)


    cppclass CCBKeyframe(CCObject):
        CCBKeyframe()
        # ~CCBKeyframe()
        
        CCObject* getValue()
        void setValue(CCObject *pValue) # retain
        
        float getTime()
        void setTime(float fTime)
        
        int getEasingType()
        void setEasingType(int nEasingType)
        
        float getEasingOpt()
        void setEasingOpt(float fEasingOpt)






    cppclass CCBFile(CCNode):
        CCBFile()
        
        CCNode* getCCBFileNode()
        void setCCBFileNode(CCNode *pNode) # retain
    CCBFile* CCBFile_create"cocos2d::extension::CCBFile::create"()


    cppclass CCNodeLoaderListener:
        # virtual ~CCNodeLoaderListener() {}
        void onNodeLoaded(CCNode * pNode, CCNodeLoader * pNodeLoader)

    cppclass CCBMemberVariableAssigner:
        # virtual ~CCBMemberVariableAssigner() {}
        bool onAssignCCBMemberVariable(CCObject* pTarget, const char* pMemberVariableName, CCNode* pNode)
        bool onAssignCCBCustomProperty(CCObject* pTarget, const char* pMemberVariableName, CCBValue* pCCBValue)


    cppclass CCBSelectorResolver:
        # virtual ~CCBSelectorResolver() {}
        SEL_MenuHandler onResolveCCBCCMenuItemSelector(CCObject * pTarget, const char* pSelectorName)
        SEL_CallFuncN onResolveCCBCCCallFuncSelector(CCObject * pTarget, const char* pSelectorName)
        # SEL_CCControlHandler onResolveCCBCCControlSelector(CCObject * pTarget, const char* pSelectorName)


    cppclass CCBScriptOwnerProtocol:
        # virtual ~CCBScriptOwnerProtocol() {}
        CCBSelectorResolver * createNew()


    cppclass CCBSequence(CCObject):
        CCBSequence()
        # ~CCBSequence()
        float getDuration()
        void setDuration(float fDuration)
        
        CCBSequenceProperty* getCallbackChannel()
        void setCallbackChannel(CCBSequenceProperty* callbackChannel)

        CCBSequenceProperty* getSoundChannel()
        void setSoundChannel(CCBSequenceProperty* soundChannel)
        
        const char* getName()
        void setName(const char *pName)
        
        int getSequenceId()
        void setSequenceId(int nSequenceId)
        
        int getChainedSequenceId()
        void setChainedSequenceId(int nChainedSequenceId)


    cppclass CCData(CCObject):
        CCData(unsigned char *pBytes, const unsigned long nSize)
        CCData(CCData *pData)
        # ~CCData()
        unsigned char* getBytes()
        unsigned long getSize()


    # /* Forward declaration. */
    # cppclass CCNodeLoader
    # cppclass CCNodeLoaderListener
    # cppclass CCBMemberVariableAssigner
    # cppclass CCBSelectorResolver
    # cppclass CCBAnimationManager
    # cppclass CCData
    # cppclass CCBKeyframe
    # cppclass CCBSequence

    cppclass CCBReader(CCObject):
        # bool jsControlled
        CCBReader(CCNodeLoaderLibrary *pCCNodeLoaderLibrary, CCBMemberVariableAssigner *pCCBMemberVariableAssigner = NULL, CCBSelectorResolver *pCCBSelectorResolver = NULL, CCNodeLoaderListener *pCCNodeLoaderListener = NULL)
        CCBReader(CCBReader *pCCBReader)
        # virtual ~CCBReader()
        CCBReader()
       
        void setCCBRootPath(const char* pCCBRootPath)
        const string& getCCBRootPath() const

        CCNode* readNodeGraphFromFile(const char *pCCBFileName)
        CCNode* readNodeGraphFromFile(const char *pCCBFileName, CCObject *pOwner)
        CCNode* readNodeGraphFromFile(const char *pCCBFileName, CCObject *pOwner, const CCSize &parentSize)
        
        CCNode* readNodeGraphFromData(CCData *pData, CCObject *pOwner, const CCSize &parentSize)
       
        CCScene* createSceneWithNodeGraphFromFile(const char *pCCBFileName)
        CCScene* createSceneWithNodeGraphFromFile(const char *pCCBFileName, CCObject *pOwner)
        CCScene* createSceneWithNodeGraphFromFile(const char *pCCBFileName, CCObject *pOwner, const CCSize &parentSize)

        CCBMemberVariableAssigner* getCCBMemberVariableAssigner()
        CCBSelectorResolver* getCCBSelectorResolver()
        
        CCBAnimationManager* getAnimationManager()
        void setAnimationManager(CCBAnimationManager *pAnimationManager)
        
        # # Used in CCNodeLoader::parseProperties()
        set[string]* getAnimatedProperties()
        set[string]& getLoadedSpriteSheet()
        CCObject* getOwner()


        # /* Parse methods. */
        int readInt(bool pSigned)
        unsigned char readByte()
        bool readBool()
        string readUTF8()
        float readFloat()
        string readCachedString()
        bool isJSControlled()
                
        bool readCallbackKeyframesForSeq(CCBSequence* seq)
        bool readSoundKeyframesForSeq(CCBSequence* seq)


        CCArray* getOwnerCallbackNames()
        CCArray* getOwnerCallbackNodes()
        CCArray* getOwnerOutletNames()
        CCArray* getOwnerOutletNodes()
        CCArray* getNodesWithAnimationManagers()
        CCArray* getAnimationManagersForNodes()

        CCDictionary* getAnimationManagers()
        void setAnimationManagers(CCDictionary* x)  # weak reference
        
        void addOwnerCallbackName(string name)
        void addOwnerCallbackNode(CCNode *node)
        
        void addDocumentCallbackName(string name)
        void addDocumentCallbackNode(CCNode *node)
        
        
        CCNode* readFileWithCleanUp(bool bCleanUp, CCDictionary* am)

    float CCBReader_getResolutionScale"cocos2d::extension::CCBReader::getResolutionScale"()
    void CCBReader_setResolutionScale"cocos2d::extension::CCBReader::setResolutionScale"(float scale)
    # /* Utility methods. */
    string CCBReader_lastPathComponent"cocos2d::extension::CCBReader::lastPathComponent"(const char* pString)
    string CCBReader_deletePathExtension"cocos2d::extension::CCBReader::deletePathExtension"(const char* pString)
    string CCBReader_toLowerCase"cocos2d::extension::CCBReader::toLowerCase"(const char* pCCString)
    bool CCBReader_endsWith"cocos2d::extension::CCBReader::endsWith"(const char* pString, const char* pEnding)




    cppclass CCBAnimationManagerDelegate:
        void completedAnimationSequenceNamed(const char *name)

    cppclass CCBAnimationManager(CCObject):
        bool jsControlled
        CCBAnimationManager()
        # #~CCBAnimationManager()

        CCObject *mOwner
        
        bool init()
        CCArray* getSequences()
        void setSequences(CCArray* seq)

        int getAutoPlaySequenceId()
        void setAutoPlaySequenceId(int autoPlaySequenceId)
        
        CCNode* getRootNode()
        void setRootNode(CCNode* pRootNode) # weak reference    

        void addDocumentCallbackNode(CCNode *node)
        void addDocumentCallbackName(string name)
        void addDocumentOutletNode(CCNode *node)
        void addDocumentOutletName(string name)

        void setDocumentControllerName(const string &name)
        
        string getDocumentControllerName()
        CCArray* getDocumentCallbackNames()
        CCArray* getDocumentCallbackNodes()
        CCArray* getDocumentOutletNames()
        CCArray* getDocumentOutletNodes()
        string getLastCompletedSequenceName()
        
        CCArray* getKeyframeCallbacks()
        
        const CCSize& getRootContainerSize()
        void setRootContainerSize(const CCSize &rootContainerSize)
        
        CCBAnimationManagerDelegate* getDelegate()
        void setDelegate(CCBAnimationManagerDelegate* pDelegate) # retain
        
        const char* getRunningSequenceName()
        
        const CCSize& getContainerSize(CCNode* pNode)
        
        void addNode(CCNode *pNode, CCDictionary *pSeq)
        void setBaseValue(CCObject *pValue, CCNode *pNode, const char *pPropName)
        void moveAnimationsFromNode(CCNode* fromNode, CCNode* toNode)

        # /** @deprecated This interface will be deprecated sooner or later.*/
        # CC_DEPRECATED_ATTRIBUTE void runAnimations(const char *pName, float fTweenDuration)
        # /** @deprecated This interface will be deprecated sooner or later.*/
        # CC_DEPRECATED_ATTRIBUTE void runAnimations(const char *pName)
        # /** @deprecated This interface will be deprecated sooner or later.*/
        # CC_DEPRECATED_ATTRIBUTE void runAnimations(int nSeqId, float fTweenDuraiton)

        void runAnimationsForSequenceNamedTweenDuration(const char *pName, float fTweenDuration)
        void runAnimationsForSequenceNamed(const char *pName)
        void runAnimationsForSequenceIdTweenDuration(int nSeqId, float fTweenDuraiton)

        void setAnimationCompletedCallback(CCObject *target, SEL_CallFunc callbackFunc)

        void debug()
        
        void setCallFunc(CCCallFunc *callFunc, const string &callbackNamed)

        CCObject* actionForCallbackChannel(CCBSequenceProperty* channel)
        CCObject* actionForSoundChannel(CCBSequenceProperty* channel)
        

    cppclass CCBSetSpriteFrame(CCActionInstant):
        #~CCBSetSpriteFrame()
        
        # /** creates a Place action with a position */
        bool initWithSpriteFrame(CCSpriteFrame *pSpriteFrame)
        void update(float time)
        CCObject* copyWithZone(CCZone *pZone)
    CCBSetSpriteFrame* CCBSetSpriteFrame_create"cocos2d::extension::CCBSetSpriteFrame::create"(CCSpriteFrame *pSpriteFrame)



    cppclass CCBSoundEffect(CCActionInstant):
        #~CCBSoundEffect()
        
        bool initWithSoundFile(const string &file, float pitch, float pan, float gain)
        void update(float time)
        CCObject* copyWithZone(CCZone *pZone)

    CCBSoundEffect* CCBSoundEffect_actionWithSoundFile"cocos2d::extension::CCBSoundEffect::actionWithSoundFile"(const string &file, float pitch, float pan, float gain)


    cppclass CCBRotateTo(CCActionInterval):
        bool initWithDuration(float fDuration, float fAngle)
        void update(float time)
        CCObject* copyWithZone(CCZone *pZone)
        void startWithTarget(CCNode *pNode)
    CCBRotateTo* CCBRotateTo_create"cocos2d::extension::CCBRotateTo::create"(float fDuration, float fAngle)


    cppclass CCBRotateXTo(CCActionInterval):
        bool initWithDuration(float fDuration, float fAngle)
        void startWithTarget(CCNode *pNode)
        CCObject* copyWithZone(CCZone *pZone)
        void update(float time)
    CCBRotateXTo* CCBRotateXTo_create"cocos2d::extension::CCBRotateXTo::create"(float fDuration, float fAngle)


    cppclass CCBRotateYTo(CCActionInterval):
        bool initWithDuration(float fDuration, float fAngle)
        void startWithTarget(CCNode *pNode)
        CCObject* copyWithZone(CCZone *pZone)
        void update(float time)
    CCBRotateYTo* CCBRotateYTo_create"cocos2d::extension::CCBRotateYTo::create"(float fDuration, float fAngle)


    cppclass CCBEaseInstant(CCActionEase):
        void update(float dt)
    CCBEaseInstant* CCBEaseInstant_create"cocos2d::extension::CCBEaseInstant::create"(CCActionInterval *pAction)




    cppclass CCNodeLoader(CCObject):
        CCNodeLoader()
        # virtual ~CCNodeLoader()

        CCNode * loadCCNode(CCNode *, CCBReader * pCCBReader)
        void parseProperties(CCNode * pNode, CCNode * pParent, CCBReader * pCCBReader)
        CCDictionary* getCustomProperties()
    CCNodeLoader* CCNodeLoader_loader"cocos2d::extension::CCNodeLoader::loader"()
        

    cppclass CCBFileLoader(CCNodeLoader):
        # virtual ~CCBFileLoader() {}
        pass
    CCBFileLoader* CCBFileLoader_loader"cocos2d::extension::CCBFileLoader::loader"()


    cppclass CCLabelBMFontLoader(CCNodeLoader):
        # virtual ~CCLabelBMFontLoader() {};
        CCLabelBMFontLoader* CCLabelBMFontLoader_loader"cocos2d::extension::CCLabelBMFontLoader::loader"()


    cppclass CCLabelTTFLoader(CCNodeLoader):
        # virtual ~CCLabelTTFLoader() {};
        CCLabelTTFLoader* loader"cocos2d::extension::CCLabelTTFLoader::loader"()


    cppclass CCLayerLoader(CCNodeLoader):
        # virtual ~CCLayerLoader() {};
        CCLayerLoader* loader"cocos2d::extension::CCLayerLoader::loader"()


    cppclass CCLayerColorLoader(CCLayerLoader):
        # virtual ~CCLayerColorLoader() {};
        CCLayerColorLoader* loader"cocos2d::extension::CCLayerColorLoader::loader"()


    cppclass CCLayerGradientLoader(CCLayerLoader):
        # virtual ~CCLayerGradientLoader() {};
        CCLayerGradientLoader* loader"cocos2d::extension::CCLayerGradientLoader::loader"()


    cppclass CCMenuItemLoader(CCNodeLoader):
        pass
        # virtual ~CCMenuItemLoader() {};

    cppclass CCMenuItemImageLoader(CCMenuItemLoader):
        # virtual ~CCMenuItemImageLoader() {};
        CCMenuItemImageLoader* loader"cocos2d::extension::CCMenuItemImageLoader::loader"()



    cppclass CCParticleSystemQuadLoader(CCNodeLoader):
        # virtual ~CCParticleSystemQuadLoader() {};
        CCParticleSystemQuadLoader* loader"cocos2d::extension::CCParticleSystemQuadLoader::loader"()

    cppclass CCScale9SpriteLoader(CCNodeLoader):
        # virtual ~CCScale9SpriteLoader() {};
        CCScale9SpriteLoader* loader"cocos2d::extension::CCScale9SpriteLoader::loader"()

    cppclass CCScrollViewLoader(CCNodeLoader):
        # virtual ~CCScrollViewLoader() {};
        CCScrollViewLoader* loader"cocos2d::extension::CCScrollViewLoader::loader"()

    cppclass CCSpriteLoader(CCNodeLoader):
        # virtual ~CCSpriteLoader() {};
        CCSpriteLoader* loader"cocos2d::extension::CCSpriteLoader::loader"()



    cppclass CCNodeLoaderLibrary(CCObject):

        CCNodeLoaderLibrary()
        # virtual ~CCNodeLoaderLibrary()

        void registerDefaultCCNodeLoaders()
        void registerCCNodeLoader(const char * pClassName, CCNodeLoader * pCCNodeLoader)
        #void registerCCNodeLoader(CCString * pClassName, CCNodeLoader * pCCNodeLoader)
        void unregisterCCNodeLoader(const char * pClassName)
        #void unregisterCCNodeLoader(CCString * pClassName)
        CCNodeLoader * getCCNodeLoader(const char * pClassName)
        #CCNodeLoader * getCCNodeLoader(CCString * pClassName)
        void purge(bool pDelete)

    CCNodeLoaderLibrary* CCNodeLoaderLibrary_library"cocos2d::extension::CCNodeLoaderLibrary::library"()
    CCNodeLoaderLibrary * CCNodeLoaderLibrary_sharedCCNodeLoaderLibrary"cocos2d::extension::CCNodeLoaderLibrary::sharedCCNodeLoaderLibrary"()
    void CCNodeLoaderLibrary_purgeSharedCCNodeLoaderLibrary"cocos2d::extension::CCNodeLoaderLibrary::purgeSharedCCNodeLoaderLibrary"()
    CCNodeLoaderLibrary * CCNodeLoaderLibrary_newDefaultCCNodeLoaderLibrary"cocos2d::extension::CCNodeLoaderLibrary::newDefaultCCNodeLoaderLibrary"()


