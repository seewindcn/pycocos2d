# distutils: language = c++

from libc.string cimport const_char
from libcpp cimport bool
from libcpp.string cimport string
from libcpp.set cimport set as cset
from cc cimport (\
    shaders,
    include_h,
    touch,
    keypad,
    cocoa,
    textures,
    platform,
    actions,
    sprite,
    ccNode,
    ccCamera,
    ccScene, ccLayer, transition,
    ccScheduler,
    ccDirector,
    menu_nodes,
    label_nodes,
    misc_nodes,
    tilemap,
    support,
    cocosDenshion,
)

cimport cython.operator
from cython.operator cimport (\
    dereference as deref, 
    address, 
    # comma, 
    # preincrement,
    )
from cython cimport typeof
from cpython.ref cimport PyObject

from cpython.dict cimport (PyDict_New, 
        PyDict_DelItem, PyDict_SetItem, PyDict_GetItem,
    )



cdef extern from "cocos2d.h" namespace "cocos2d":
    enum ccTouchesMode:
        kCCTouchesAllAtOnce
        kCCTouchesOneByOne

cdef extern from "<typeinfo>":
    int INT_MIN
    ctypedef fused alltype:
        ccScene.CCScene

    type_info typeid(pointer)

cdef extern from "<typeinfo>" namespace "std":

    cppclass type_info:
        bool operator== (const type_info& rhs)
        const char* name()


cdef extern from "cc.h":
    # ctypedef void (call_back_func)(void* cb, int type, 
    #         void* var1=NULL, void* var2=NULL)
    ctypedef int call_back_func
    enum CB_TYPE:
        CB_SCHEDULE,
        CB_CallFunc,
        CB_CallFuncN,
        CB_CallFuncND,
        CB_CallFuncO,
        CB_MenuHandler,
        CB_EventHandler,
        CB_Compare,

    const char* cc_type_name(void* p)

    cppclass CCPyFunc(cocoa.CCObject):
        CCPyFunc()
        void init(void* data, call_back_func func)
        # void init(object obj, bool isFunc)
        void Schedule(float)
        void CallFunc()
        void CallFuncN(ccNode.CCNode*)
        void CallFuncND(ccNode.CCNode*, void*)
        void CallFuncO(cocoa.CCObject*)
        void MenuHandler(cocoa.CCObject*)
        void EventHandler(touch.CCEvent*)
        void Compare(cocoa.CCObject*)

        cocoa.SEL_SCHEDULE get_Schedule()
        cocoa.SEL_CallFunc get_CallFunc()
        cocoa.SEL_CallFuncN get_CallFuncN()
        cocoa.SEL_CallFuncND get_CallFuncND()
        cocoa.SEL_CallFuncO get_CallFuncO()
        cocoa.SEL_MenuHandler get_MenuHandler()
        cocoa.SEL_EventHandler get_EventHandler()
        cocoa.SEL_Compare get_Compare()


    enum TOUCH_TYPE:
        TH_Began,
        TH_Moved,
        TH_Ended,
        TH_Cancelled,
        THS_Began,
        THS_Moved,
        THS_Ended,
        THS_Cancelled,

    # typedef void(*touch_func)(TOUCH_TYPE tt, cocos2d::CCTouch *pTouch,
    #         cocos2d::CCEvent *pEvent);
    ctypedef int touch_func
    # typedef void(*touchs_func)(TOUCH_TYPE tt, cocos2d::CCSet *pTouches,
    #         cocos2d::CCEvent *pEvent);
    ctypedef int touchs_func

    cppclass CCPyDelegate(touch.CCTouchDelegate):
        CCPyDelegate()
        inline void init(void* data, touch_func touch, touchs_func touchs)


#------------
#------------
#------------
