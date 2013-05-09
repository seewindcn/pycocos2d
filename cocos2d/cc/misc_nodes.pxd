# distutils: language = c++

from libcpp cimport bool
from touch cimport *
from cocoa cimport *
from platform cimport *
from script cimport *
from ccLayer cimport *
from label_nodes cimport *
from ccNode cimport *
from sprite cimport *

cdef extern from "cocos2d.h" namespace "cocos2d":
    cppclass CCClippingNode(CCNode):
        
        bool init()
        bool init(CCNode *pStencil)
        void onEnter()
        void onEnterTransitionDidFinish()
        void onExitTransitionDidStart()
        void onExit()
        void visit()
        
        CCNode* getStencil() const
        void setStencil(CCNode *pStencil)
        
        GLfloat getAlphaThreshold() const
        void setAlphaThreshold(GLfloat fAlphaThreshold)
        
        bool isInverted() const
        void setInverted(bool bInverted)
    CCClippingNode* CCClippingNode_create"cocos2d::CCClippingNode::create"()
    CCClippingNode* CCClippingNode_create"cocos2d::CCClippingNode::create"(CCNode *pStencil)


    cppclass CCMotionStreak(CCNode):
        CCMotionStreak()

        bool initWithFade(float fade, float minSeg, float stroke, ccColor3B color, const char* path)
        bool initWithFade1"initWithFade"(float fade, float minSeg, float stroke, ccColor3B color, CCTexture2D* texture)

        void tintWithColor(ccColor3B colors)

        void reset()

        void setPosition(const CCPoint& position)
        void draw()
        void update(float delta)

        CCTexture2D* getTexture()
        void setTexture(CCTexture2D *texture)
        void setBlendFunc(ccBlendFunc blendFunc)
        ccBlendFunc getBlendFunc()
        void setColor(const ccColor3B& color)
        const ccColor3B& getColor()
        GLubyte getOpacity()
        void setOpacity(GLubyte opacity)
        void setOpacityModifyRGB(bool bValue)
        bool isOpacityModifyRGB()

        inline bool isFastMode()
        inline void setFastMode(bool bFastMode)

        inline bool isStartingPositionInitialized()
        inline void setStartingPositionInitialized(bool bStartingPositionInitialized) 

    CCMotionStreak* CCMotionStreak_create"cocos2d::CCMotionStreak::create"(float fade, float minSeg, float stroke, ccColor3B color, const char* path)
    CCMotionStreak* CCMotionStreak_create1"cocos2d::CCMotionStreak::create"(float fade, float minSeg, float stroke, ccColor3B color, CCTexture2D* texture)


    ctypedef enum CCProgressTimerType:
        kCCProgressTimerTypeRadial
        kCCProgressTimerTypeBar


    cppclass CCProgressTimer(CCNode):
        CCProgressTimer()

        inline CCProgressTimerType getType()

        inline float getPercentage()

        inline CCSprite* getSprite()

        bool initWithSprite(CCSprite* sp)

        void setPercentage(float fPercentage)
        void setSprite(CCSprite *pSprite)
        void setType(CCProgressTimerType type)
        void setReverseProgress(bool reverse)

        void draw()
        void setAnchorPoint(CCPoint anchorPoint)

        void setColor(const ccColor3B& color)
        const ccColor3B& getColor()
        GLubyte getOpacity()
        void setOpacity(GLubyte opacity)
        void setOpacityModifyRGB(bool bValue)
        bool isOpacityModifyRGB()
        
        inline bool isReverseDirection()
        inline void setReverseDirection(bool value)

    ctypedef enum tCCImageFormat:
        kCCImageFormatJPEG
        kCCImageFormatPNG

    cppclass CCRenderTexture(CCNode):
        # CC_PROPERTY(CCSprite*, m_pSprite, Sprite)
        CCSprite* getSprite()
        void setSprite(CCSprite* var)

        CCRenderTexture()
        
        void visit()
        void draw()

        bool initWithWidthAndHeight(int w, int h, CCTexture2DPixelFormat eFormat)
        bool initWithWidthAndHeight(int w, int h, CCTexture2DPixelFormat eFormat, GLuint uDepthStencilFormat)
        void begin()
        void beginWithClear(float r, float g, float b, float a)
        void beginWithClear(float r, float g, float b, float a, float depthValue)
        void beginWithClear(float r, float g, float b, float a, float depthValue, int stencilValue)
        inline void endToLua()
        void end()
        void clear(float r, float g, float b, float a)
        void clearDepth(float depthValue)
        void clearStencil(int stencilValue)
        CCImage* newCCImage(bool flipImage)
        #CCImage* newCCImage(bool flipImage = true)

        bool saveToFile(const char *szFilePath)

        bool saveToFile(const char *name, tCCImageFormat format)
        
        void listenToBackground(CCObject *obj)
        
        void listenToForeground(CCObject *obj)
        
        unsigned int getClearFlags() const
        void setClearFlags(unsigned int uClearFlags)
        
        const ccColor4F& getClearColor() const
        void setClearColor(const ccColor4F &clearColor)
        
        float getClearDepth() const
        void setClearDepth(float fClearDepth)
        
        int getClearStencil() const
        void setClearStencil(float fClearStencil)
        
        bool isAutoDraw() const
        void setAutoDraw(bool bAutoDraw)

    CCRenderTexture * CCRenderTexture_create"cocos2d::CCRenderTexture::create"(int w ,int h, CCTexture2DPixelFormat eFormat, GLuint uDepthStencilFormat)
    CCRenderTexture * CCRenderTexture_create"cocos2d::CCRenderTexture::create"(int w, int h, CCTexture2DPixelFormat eFormat)
    CCRenderTexture * CCRenderTexture_create"cocos2d::CCRenderTexture::create"(int w, int h)








        