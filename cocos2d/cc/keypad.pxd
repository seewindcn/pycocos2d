# distutils: language = c++

from libcpp cimport bool
from cocoa cimport *

cdef extern from "cocos2d.h" namespace "cocos2d":
    cppclass CCKeypadDelegate:
        void keyBackClicked()
        void keyMenuClicked()

    cppclass CCKeypadHandler(CCObject):
        CCKeypadDelegate* getDelegate()
        void setDelegate(CCKeypadDelegate *pDelegate)
        bool initWithDelegate(CCKeypadDelegate *pDelegate)

    CCKeypadHandler* CCKeypadHandler_handlerWithDelegate"cocos2d::CCKeypadHandler::handlerWithDelegate"(CCKeypadDelegate *pDelegate)


    ctypedef enum ccKeypadMSGType:
        kTypeBackClicked
        kTypeMenuClicked

    cppclass CCKeypadDispatcher(CCObject):
        CCKeypadDispatcher()

        void addDelegate(CCKeypadDelegate* pDelegate)

        void removeDelegate(CCKeypadDelegate* pDelegate)

        void forceAddDelegate(CCKeypadDelegate* pDelegate)

        void forceRemoveDelegate(CCKeypadDelegate* pDelegate)

        bool dispatchKeypadMSG(ccKeypadMSGType nMsgType)
