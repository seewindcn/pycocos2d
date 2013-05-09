# distutils: language = c++

from libcpp cimport bool
from cocoa cimport *

cdef extern from "cocos2d.h" namespace "cocos2d":
    cppclass CCTouch(CCObject):
        CCTouch()

        #""" returns the current touch location in OpenGL coordinates """
        CCPoint getLocation() const
        #""" returns the previous touch location in OpenGL coordinates """
        CCPoint getPreviousLocation() const
        #""" returns the delta of 2 current touches locations in screen coordinates """
        CCPoint getDelta() const
        #""" returns the current touch location in screen coordinates """
        CCPoint getLocationInView() const
        #""" returns the previous touch location in screen coordinates """
        CCPoint getPreviousLocationInView() const

        void setTouchInfo(int id, float x, float y)
        int getID() const

    cppclass CCEvent(CCObject):
        pass


    cppclass CCTouchDelegate(CCObject):
        CCTouchDelegate()

        bool ccTouchBegan(CCTouch *pTouch, CCEvent *pEvent)

        void ccTouchMoved(CCTouch *pTouch, CCEvent *pEvent)
        void ccTouchEnded(CCTouch *pTouch, CCEvent *pEvent)
        void ccTouchCancelled(CCTouch *pTouch, CCEvent *pEvent)

        void ccTouchesBegan(CCSet *pTouches, CCEvent *pEvent)
        void ccTouchesMoved(CCSet *pTouches, CCEvent *pEvent)
        void ccTouchesEnded(CCSet *pTouches, CCEvent *pEvent)
        void ccTouchesCancelled(CCSet *pTouches, CCEvent *pEvent)


    cppclass CCTouchHandler(CCObject):
        CCTouchDelegate* getDelegate()
        void setDelegate(CCTouchDelegate *pDelegate)

        int getPriority()
        void setPriority(int nPriority)

        int getEnabledSelectors()
        void setEnalbedSelectors(int nValue)

        bool initWithDelegate(CCTouchDelegate *pDelegate, int nPriority)

    CCTouchHandler* CCTouchHandler_handlerWithDelegate"cocos2d::CCTouchHandler::handlerWithDelegate"(CCTouchDelegate *pDelegate, int nPriority)

    cppclass CCStandardTouchHandler
    CCStandardTouchHandler* CCStandardTouchHandler_handlerWithDelegate"cocos2d::CCStandardTouchHandler::handlerWithDelegate"(CCTouchDelegate *pDelegate, int nPriority)

    cppclass CCTargetedTouchHandler(CCTouchHandler):
        bool isSwallowsTouches()
        void setSwallowsTouches(bool bSwallowsTouches)

        CCSet* getClaimedTouches()

        bool initWithDelegate(CCTouchDelegate *pDelegate, int nPriority, bool bSwallow)

    CCTargetedTouchHandler* CCTargetedTouchHandler_handlerWithDelegate"cocos2d::CCTargetedTouchHandler::handlerWithDelegate"(CCTouchDelegate *pDelegate, int nPriority, bool bSwallow)



    ctypedef enum ccTouchSelectorFlag:
        ccTouchSelectorBeganBit
        ccTouchSelectorMovedBit
        ccTouchSelectorEndedBit
        ccTouchSelectorCancelledBit
        ccTouchSelectorAllBits


    ctypedef enum:
        CCTOUCHBEGAN
        CCTOUCHMOVED
        CCTOUCHENDED
        CCTOUCHCANCELLED
        ccTouchMax

    ctypedef struct ccTouchHandlerHelperData:
        int m_type


    cppclass EGLTouchDelegate(CCTouchDelegate):
        pass

    cppclass CCTouchDispatcher(CCObject, EGLTouchDelegate):
        bool init()
        CCTouchDispatcher() 
        bool isDispatchEvents()
        void setDispatchEvents(bool bDispatchEvents)

        void addStandardDelegate(CCTouchDelegate *pDelegate, int nPriority)

        void addTargetedDelegate(CCTouchDelegate *pDelegate, int nPriority, bool bSwallowsTouches)

        void removeDelegate(CCTouchDelegate *pDelegate)

        void removeAllDelegates()

        void setPriority(int nPriority, CCTouchDelegate *pDelegate)

        void touches(CCSet *pTouches, CCEvent *pEvent, unsigned int uIndex)

        CCTouchHandler* findHandler(CCTouchDelegate *pDelegate)





