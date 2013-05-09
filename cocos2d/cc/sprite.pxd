from libcpp cimport bool
from cocoa cimport *
from textures cimport *
from shaders cimport *
from CCNode cimport *

cdef extern from "cocos2d.h" namespace "cocos2d":
    cppclass CCSprite(CCNode):
        CCSprite()
        bool init()
        bool initWithTexture(CCTexture2D *pTexture)
        bool initWithTexture(CCTexture2D *pTexture, const CCRect& rect)
        bool initWithTexture(CCTexture2D *pTexture, const CCRect& rect, bool rotated)
        bool initWithSpriteFrame(CCSpriteFrame *pSpriteFrame)
        bool initWithSpriteFrameName(const char *pszSpriteFrameName)
        bool initWithFile(const char *pszFilename)
        bool initWithFile(const char *pszFilename, const CCRect& rect)
        inline GLubyte getOpacity()
        void setOpacity(GLubyte value)
        const ccColor3B& getColor()
        void setColor(const ccColor3B& value)
        void setOpacityModifyRGB(bool bValue)
        bool isOpacityModifyRGB()
        void setTexture(CCTexture2D *texture)
        CCTexture2D* getTexture()
        inline void setBlendFunc(ccBlendFunc blendFunc)
        inline ccBlendFunc getBlendFunc()
        CCSpriteBatchNode* getBatchNode()
        void setBatchNode(CCSpriteBatchNode *pobSpriteBatchNode)
        void setTextureRect(const CCRect& rect)
        void setTextureRect(const CCRect& rect, bool rotated, const CCSize& untrimmedSize)
        void setVertexRect(const CCRect& rect)
        void setDisplayFrame(CCSpriteFrame *pNewFrame)
        bool isFrameDisplayed(CCSpriteFrame *pFrame)
        CCSpriteFrame* displayFrame()
        void setDisplayFrameWithAnimationName(const char *animationName, int frameIndex)
        bool isFlipX()
        void setFlipX(bool bFlipX)
        bool isFlipY()
        void setFlipY(bool bFlipY)


    CCSprite* CCSprite_create "cocos2d::CCSprite::create"()
    CCSprite* CCSprite_create "cocos2d::CCSprite::create"(const char *pszFileName)
    CCSprite* CCSprite_create "cocos2d::CCSprite::create"(const char *pszFileName, const CCRect& rect)
    CCSprite* CCSprite_createWithTexture "cocos2d::CCSprite::createWithTexture"(CCTexture2D *pTexture)
    CCSprite* CCSprite_createWithTexture "cocos2d::CCSprite::createWithTexture"(CCTexture2D *pTexture, const CCRect& rect)
    CCSprite* CCSprite_createWithSpriteFrame "cocos2d::CCSprite::createWithSpriteFrame"(CCSpriteFrame *pSpriteFrame)
    CCSprite* CCSprite_createWithSpriteFrameName "cocos2d::CCSprite::createWithSpriteFrameName"(const char *pszSpriteFrameName)


    cppclass CCSpriteFrame(CCObject):
        inline const CCRect& getRectInPixels()
        void setRectInPixels(const CCRect& rectInPixels)

        inline bool isRotated()
        inline void setRotated(bool bRotated)

        #/** get rect of the frame */
        inline const CCRect& getRect()
        #/** set rect of the frame */
        void setRect(const CCRect& rect)

        #/** get offset of the frame */
        const CCPoint& getOffsetInPixels()
        #/** set offset of the frame */
        void setOffsetInPixels(const CCPoint& offsetInPixels)

        #/** get original size of the trimmed image */
        inline const CCSize& getOriginalSizeInPixels()
        #/** set original size of the trimmed image */
        inline void setOriginalSizeInPixels(const CCSize& sizeInPixels)

        #/** get original size of the trimmed image */
        inline const CCSize& getOriginalSize()
        #/** set original size of the trimmed image */
        inline void setOriginalSize(const CCSize& sizeInPixels)

        #/** get texture of the frame */
        CCTexture2D* getTexture()
        #/** set texture of the frame, the texture is retained */
        void setTexture(CCTexture2D* pobTexture)

        const CCPoint& getOffset()
        void setOffset(const CCPoint& offsets)

        bool initWithTexture(CCTexture2D* pobTexture, const CCRect& rect)
        bool initWithTextureFilename(const char* filename, const CCRect& rect)
        bool initWithTexture(CCTexture2D* pobTexture, const CCRect& rect, bool rotated, const CCPoint& offset, const CCSize& originalSize)
        bool initWithTextureFilename(const char* filename, const CCRect& rect, bool rotated, const CCPoint& offset, const CCSize& originalSize)

    CCSpriteFrame* CCSpriteFrame_create "cocos2d::CCSpriteFrame::create"(const char* filename, const CCRect& rect)
    CCSpriteFrame* CCSpriteFrame_create "cocos2d::CCSpriteFrame::create"(const char* filename, const CCRect& rect, bool rotated, const CCPoint& offset, const CCSize& originalSize)
    CCSpriteFrame* CCSpriteFrame_createWithTexture "cocos2d::CCSpriteFrame::createWithTexture"(CCTexture2D* pobTexture, const CCRect& rect)
    CCSpriteFrame* CCSpriteFrame_createWithTexture "cocos2d::CCSpriteFrame::createWithTexture"(CCTexture2D* pobTexture, const CCRect& rect, bool rotated, const CCPoint& offset, const CCSize& originalSize)


    cppclass CCSpriteFrameCache(CCObject):
        bool init()
        void addSpriteFramesWithFile(const char *pszPlist)

        void addSpriteFramesWithFile(const char* plist, const char* textureFileName)

        void addSpriteFramesWithFile1 "cocos2d::CCSpriteFrameCache::addSpriteFramesWithFile"(const char *pszPlist, CCTexture2D *pobTexture)

        void addSpriteFrame(CCSpriteFrame *pobFrame, const char *pszFrameName)

        void removeSpriteFrames()

        void removeUnusedSpriteFrames()

        void removeSpriteFrameByName(const char *pszName)

        void removeSpriteFramesFromFile(const char* plist)
        void removeSpriteFramesFromTexture(CCTexture2D* texture)
        CCSpriteFrame* spriteFrameByName(const char *pszName)


    CCSpriteFrameCache* CCSpriteFrameCache_sharedSpriteFrameCache "cocos2d::CCSpriteFrameCache::sharedSpriteFrameCache"()
    void CCSpriteFrameCache_purgeSharedSpriteFrameCache "cocos2d::CCSpriteFrameCache::purgeSharedSpriteFrameCache"()


    cppclass CCSpriteBatchNode(CCNode):
        inline CCTextureAtlas* getTextureAtlas()
        inline void setTextureAtlas(CCTextureAtlas* textureAtlas) 
        inline CCArray* getDescendants()

        bool initWithTexture(CCTexture2D *tex, unsigned int capacity)
        bool initWithFile(const char* fileImage, unsigned int capacity)
        bool init()

        void increaseAtlasCapacity()

        void removeChildAtIndex(unsigned int index, bool doCleanup)

        void insertChild(CCSprite *child, unsigned int index)
        void appendChild(CCSprite* sprite)
        void removeSpriteFromAtlas(CCSprite *sprite)

        unsigned int rebuildIndexInOrder(CCSprite *parent, unsigned int index)
        unsigned int highestAtlasIndexInChild(CCSprite *sprite)
        unsigned int lowestAtlasIndexInChild(CCSprite *sprite)
        unsigned int atlasIndexForChild(CCSprite *sprite, int z)
        void reorderBatch(bool reorder)

    CCSpriteBatchNode* CCSpriteBatchNode_createWithTexture "cocos2d::CCSpriteBatchNode::createWithTexture"(CCTexture2D* tex, unsigned int capacity)
    CCSpriteBatchNode* CCSpriteBatchNode_createWithTexture "cocos2d::CCSpriteBatchNode::createWithTexture"(CCTexture2D* tex)
    CCSpriteBatchNode* CCSpriteBatchNode_create "cocos2d::CCSpriteBatchNode::create"(const char* fileImage, unsigned int capacity)
    CCSpriteBatchNode* CCSpriteBatchNode_create "cocos2d::CCSpriteBatchNode::create"(const char* fileImage)


    cppclass CCAnimationFrame(CCObject):
        CCAnimationFrame()
        bool initWithSpriteFrame(CCSpriteFrame* spriteFrame, float delayUnits, CCDictionary* userInfo)
        
        # CC_SYNTHESIZE_RETAIN(CCSpriteFrame*, m_pSpriteFrame, SpriteFrame)
        CCSpriteFrame* getSpriteFrame()
        void setSpriteFrame(CCSpriteFrame* var)
        # CC_SYNTHESIZE(float, m_fDelayUnits, DelayUnits)
        float getDelayUnits()
        void setDelayUnits(float value)
        # CC_SYNTHESIZE_RETAIN(CCDictionary*, m_pUserInfo, UserInfo)
        CCDictionary* getUserInfo()
        void setUserInfo(CCDictionary* var)


    cppclass CCAnimation(CCObject):
        CCAnimation()

        void addSpriteFrame(CCSpriteFrame *pFrame)

        void addSpriteFrameWithFileName(const char *pszFileName)

        void addSpriteFrameWithTexture(CCTexture2D* pobTexture, const CCRect& rect)

        bool init()

        bool initWithSpriteFrames(CCArray *pFrames, float delay)

        bool initWithAnimationFrames(CCArray* arrayOfAnimationFrames, float delayPerUnit, unsigned int loops)

        CCObject* copyWithZone(CCZone* pZone)

        # CC_SYNTHESIZE_READONLY(float, m_fTotalDelayUnits, TotalDelayUnits)
        float getTotalDelayUnits()

        # CC_SYNTHESIZE(float, m_fDelayPerUnit, DelayPerUnit)
        float getDelayPerUnit()
        void setDelayPerUnit(float var)

        # CC_PROPERTY_READONLY(float, m_fDuration, Duration)
        float getDuration()

        # CC_SYNTHESIZE_RETAIN(CCArray*, m_pFrames, Frames)
        CCArray* getFrames()
        void setFrames(CCArray* var)

        # CC_SYNTHESIZE(bool, m_bRestoreOriginalFrame, RestoreOriginalFrame)
        bool getRestoreOriginalFrame()
        void setRestoreOriginalFrame(bool var)

        # CC_SYNTHESIZE(unsigned int, m_uLoops, Loops)
        unsigned int getLoops()
        void setLoops(unsigned int var)


    CCAnimation* CCAnimation_create "cocos2d::CCAnimation::create"()
    CCAnimation* CCAnimation_createWithSpriteFrames "cocos2d::CCAnimation::createWithSpriteFrames"(CCArray* arrayOfSpriteFrameNames, float delay)
    CCAnimation* CCAnimation_create "cocos2d::CCAnimation::create"(CCArray *arrayOfAnimationFrameNames, float delayPerUnit, unsigned int loops)
    CCAnimation* CCAnimation_create "cocos2d::CCAnimation::create"(CCArray *arrayOfAnimationFrameNames, float delayPerUnit)


    cppclass CCAnimationCache(CCObject):
        CCAnimationCache()

        void addAnimation(CCAnimation *animation, const char * name)

        void removeAnimationByName(const char* name)

        CCAnimation* animationByName(const char* name)

        void addAnimationsWithDictionary(CCDictionary* dictionary)

        void addAnimationsWithFile(const char* plist)

        bool init()

    CCAnimationCache* sharedAnimationCache "cocos2d::CCAnimationCache::sharedAnimationCache"()
    void purgeSharedAnimationCache "cocos2d::CCAnimationCache::purgeSharedAnimationCache"()













