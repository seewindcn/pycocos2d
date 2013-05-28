# distutils: language = c++

from libcpp cimport bool
from touch cimport *
from cocoa cimport *
from ccNode cimport *
from platform cimport *
from script cimport *

cdef extern from "cocos2d.h" namespace "cocos2d":
    ctypedef enum ccTouchesMode:
        kCCTouchesAllAtOnce
        kCCTouchesOneByOne


    cppclass CCLayer(CCNode):
        CCLayer() nogil except +
        bool init()
        void onEnter()
        void onExit()
        void onEnterTransitionDidFinish()

        # default implements are used to call script callback if exist
        bool ccTouchBegan(CCTouch *pTouch, CCEvent *pEvent)
        void ccTouchMoved(CCTouch *pTouch, CCEvent *pEvent)
        void ccTouchEnded(CCTouch *pTouch, CCEvent *pEvent)
        void ccTouchCancelled(CCTouch *pTouch, CCEvent *pEvent)
    
        # default implements are used to call script callback if exist
        void ccTouchesBegan(CCSet *pTouches, CCEvent *pEvent)
        void ccTouchesMoved(CCSet *pTouches, CCEvent *pEvent)
        void ccTouchesEnded(CCSet *pTouches, CCEvent *pEvent)
        void ccTouchesCancelled(CCSet *pTouches, CCEvent *pEvent)
    
        void didAccelerate(CCAcceleration* pAccelerationValue)
        void registerScriptAccelerateHandler(int nHandler)
        void unregisterScriptAccelerateHandler()

#        """ If isTouchEnabled, this method is called onEnter. Override it to change the
#        way CCLayer receives touch events.
#        ( Default: CCTouchDispatcher::sharedDispatcher()->addStandardDelegate(this,0) )
#        Example:
#            void CCLayer::registerWithTouchDispatcher()
#        {
#        CCTouchDispatcher::sharedDispatcher()->addTargetedDelegate(this,INT_MIN+1,true)
#        }
#        @since v0.8.0
#        """
        void registerWithTouchDispatcher()

#        """ Register script touch events handler """
        ###void registerScriptTouchHandler(int nHandler, bool bIsMultiTouches = false, int nPriority = INT_MIN, bool bSwallowsTouches = false)
        void registerScriptTouchHandler(int nHandler, bool bIsMultiTouches, int nPriority, bool bSwallowsTouches)
#        """ Unregister script touch events handler """
        void unregisterScriptTouchHandler()

#        """ whether or not it will receive Touch events.
#        You can enable / disable touch events with this property.
#        Only the touches of this node will be affected. This "method" is not propagated to it's children.
#        @since v0.8.1
#        """
        bool isTouchEnabled()
        void setTouchEnabled(bool value)

        void setTouchMode(ccTouchesMode mode)
        int getTouchMode()

#        """ priority of the touch events. Default is 0 """
        void setTouchPriority(int priority)
        int getTouchPriority()

#        """ whether or not it will receive Accelerometer events
#        You can enable / disable accelerometer events with this property.
#        @since v0.8.1
#        """
        bool isAccelerometerEnabled()
        void setAccelerometerEnabled(bool value)
        void setAccelerometerInterval(double interval)

#        """ whether or not it will receive keypad events
#        You can enable / disable accelerometer events with this property.
#        it's new in cocos2d-x
#        """
        bool isKeypadEnabled()
        void setKeypadEnabled(bool value)

#        """ Register keypad events handler """
        void registerScriptKeypadHandler(int nHandler)
#        """ Unregister keypad events handler """
        void unregisterScriptKeypadHandler()

        void keyBackClicked()
        void keyMenuClicked()

        inline CCTouchScriptHandlerEntry* getScriptTouchHandlerEntry()
        inline CCScriptHandlerEntry* getScriptKeypadHandlerEntry()
        inline CCScriptHandlerEntry* getScriptAccelerateHandlerEntry()

    CCLayer *CCLayer_create"cocos2d::CCLayer::create"()



    cppclass CCLayerColor(CCLayer):
        CCLayerColor()
        # ~CCLayerColor()

        # void draw()
        # void setContentSize(const CCSize & var)

        bool initWithColor(const ccColor4B& color, GLfloat width, GLfloat height)
        bool initWithColor(const ccColor4B& color)

        void changeWidth(GLfloat w)
        void changeHeight(GLfloat h)
        void changeWidthAndHeight(GLfloat w ,GLfloat h)

        # /** Opacity: conforms to CCRGBAProtocol protocol */
        # CC_PROPERTY(GLubyte, m_cOpacity, Opacity)
        # /** Color: conforms to CCRGBAProtocol protocol */
        # CC_PROPERTY_PASS_BY_REF(ccColor3B, m_tColor, Color)
        # /** BlendFunction. Conforms to CCBlendProtocol protocol */
        # CC_PROPERTY(ccBlendFunc, m_tBlendFunc, BlendFunc)

        void setOpacityModifyRGB(bool bValue)
        bool isOpacityModifyRGB()

    CCLayerColor* CCLayerColor_create"cocos2d::CCLayerColor::create"()
    CCLayerColor * CCLayerColor_create"cocos2d::CCLayerColor::create"(const ccColor4B& color)
    CCLayerColor * CCLayerColor_create"cocos2d::CCLayerColor::create"(const ccColor4B& color, GLfloat width, GLfloat height)



    cppclass CCLayerGradient(CCLayerColor):
        bool init()
        bool initWithColor(const ccColor4B& start, const ccColor4B& end)
        bool initWithColor(const ccColor4B& start, const ccColor4B& end, const CCPoint& v)

        # CC_PROPERTY_PASS_BY_REF(ccColor3B, m_startColor, StartColor)
        # CC_PROPERTY_PASS_BY_REF(ccColor3B, m_endColor, EndColor)
        # CC_PROPERTY(GLubyte, m_cStartOpacity, StartOpacity)
        # CC_PROPERTY(GLubyte, m_cEndOpacity, EndOpacity)
        # CC_PROPERTY_PASS_BY_REF(CCPoint, m_AlongVector, Vector)
        void setCompressedInterpolation(bool bCompressedInterpolation)
        bool isCompressedInterpolation()

    CCLayerGradient* CCLayerGradient_node"cocos2d::CCLayerGradient::node"()
    CCLayerGradient* CCLayerGradient_create"cocos2d::CCLayerGradient::create"()
    CCLayerGradient* CCLayerGradient_create"cocos2d::CCLayerGradient::create"(const ccColor4B& start, const ccColor4B& end)
    CCLayerGradient* CCLayerGradient_create"cocos2d::CCLayerGradient::create"(const ccColor4B& start, const ccColor4B& end, const CCPoint& v)



    cppclass CCLayerMultiplex(CCLayer):
        CCLayerMultiplex()
        # ~CCLayerMultiplex()

        void addLayer(CCLayer* layer)

        bool initWithLayers(CCLayer* layer, va_list params)
        bool initWithArray(CCArray* arrayOfLayers)

        void switchTo(unsigned int n)
        void switchToAndReleaseMe(unsigned int n)
        
    CCLayerMultiplex* CCLayerMultiplex_node"cocos2d::CCLayerMultiplex::node"()
    CCLayerMultiplex* CCLayerMultiplex_create"cocos2d::CCLayerMultiplex::create"()
    CCLayerMultiplex * CCLayerMultiplex_create"cocos2d::CCLayerMultiplex::create"(CCLayer* layer, ... )
    CCLayerMultiplex * CCLayerMultiplex_createWithLayer"cocos2d::CCLayerMultiplex::createWithLayer"(CCLayer* layer)
    CCLayerMultiplex* CCLayerMultiplex_createWithArray"cocos2d::CCLayerMultiplex::createWithArray"(CCArray* arrayOfLayers)


