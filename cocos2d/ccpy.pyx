#!python
#cython: boundscheck=True
#cython: embedsignature=False
#cython: profile=False
#cython: nonecheck=False
#cython: initializedcheck=True
# distutils: language = c++
import traceback
include "cc.pxi"
include "py/include_h.pxi"
include "py/cocoa.pxi"
include "py/platform.pxi"
include "py/keypad.pxi"
include "py/touch.pxi"
include "py/actions.pxi"
include "py/CCNode.pxi"
include "py/camera.pxi"
include "py/scene.pxi"
include "py/textures.pxi"
include "py/sprite.pxi"
include "py/tilemap.pxi"
include "py/director.pxi"
include "py/menu.pxi"
include "py/nodes.pxi"
include "py/cocosDenshion.pxi"
#ifdef _CC_CCB_
include "py/ccb.pxi"
#endif


cdef void _call_back(void* data, int t, cocoa.CCObject* var1, 
            void* var2, float var3):
    cdef CallBack cb_obj = <CallBack>data
    cb_obj._call_back(t, var1, var2, var3)


cdef class CallBack:
    cdef CCPyFunc _co
    cdef object caches, obj

    # cdef inline CCPyFunc* func(self):
    #     return <CCPyFunc*>self._co
    def __cinit__(self, obj=None):
        self.init(obj)

    cdef init(self, object obj):
        self.caches = PyDict_New()
        self._co.init(<void*>self, <call_back_func>&_call_back)
        self.obj = obj

    def reg(self, CCObject obj):
        PyDict_SetItem(self.caches, <int>obj._co, obj)

    def unreg(self, CCObject obj):
        PyDict_DelItem(self.caches, <int>obj._co)

    cdef inline _new_obj(self, cocoa.CCObject* co, cls):
        cdef CCObject o = cls()
        o._co = co
        return o

    cdef object _get_obj(self, cocoa.CCObject* co, cls=CCObject):
        cdef PyObject* obj = PyDict_GetItem(self.caches, <int>co)
        if obj != NULL:
            return <object>obj
        return self._new_obj(co, cls)

    cdef inline _call_obj(self, int t, cocoa.CCObject* var1, 
            void* var2, float var3):
        try:
            #use switch
            if t == 0:#CB_SCHEDULE:
                self.obj(var3)
            elif t == 1:#CB_CallFunc:
                self.obj()
            elif t == 2:
                self.obj(self._get_obj(var1, CCNode))
            elif t == 3:#CB_CallFuncND
                self.obj(self._get_obj(var1), <int>var2)
            elif t in (4, 5, 7):#CB_CallFuncN:
                self.obj(self._get_obj(var1))
            elif t == 6:
                self.obj(self._get_obj(var1, CCEvent))
            return -1
        except:
            traceback.print_exc()

    cdef inline _call_self(self, int t, cocoa.CCObject* var1,
            void* var2, float var3):
        if t == 0:
            self.Schedule(var3)
        elif t == 1:
            self.CallFunc()
        elif t == 2:
            self.CallFuncN(self._get_obj(var1, CCNode))
        elif t == 3:
            self.CallFuncND(self._get_obj(var1, CCNode), <int>var2)
        elif t == 4:
            self.CallFuncO(self._get_obj(var1))
        elif t == 5:
            self.MenuHandler(self._get_obj(var1))
        elif t == 6:
            self.EventHandler(self._get_obj(var1, CCEvent))
        elif t == 7:
            self.Compare(self._get_obj(var1))
        return -1


    cdef inline _call_back(self, int t, cocoa.CCObject* var1, 
            void* var2, float var3):
        if self.obj is not None:
            self._call_obj(t, var1, var2, var3)

    cdef inline cocoa.SEL_SCHEDULE get_Schedule(self):
        return self._co.get_Schedule()

    cdef inline cocoa.SEL_CallFunc get_CallFunc(self):
        return self._co.get_CallFunc()

    cdef inline cocoa.SEL_CallFuncN get_CallFuncN(self):
        return self._co.get_CallFuncN()

    cdef inline cocoa.SEL_CallFuncND get_CallFuncND(self):
        return self._co.get_CallFuncND()

    cdef inline cocoa.SEL_CallFuncO get_CallFuncO(self):
        return self._co.get_CallFuncO()

    cdef inline cocoa.SEL_MenuHandler get_MenuHandler(self):
        return self._co.get_MenuHandler()

    cdef inline cocoa.SEL_EventHandler get_EventHandler(self):
        return self._co.get_EventHandler()

    cdef inline cocoa.SEL_Compare get_Compare(self):
        return self._co.get_Compare()



cdef int _touch(void* data, int t, touch.CCTouch* pTouch, touch.CCEvent* pEvent):
    cdef PyxDelegate pyobj = <PyxDelegate>data
    return pyobj._touch(t, pTouch, pEvent)

cdef void _touchs(void* data, int t, cocoa.CCSet* pTouchs, touch.CCEvent* pEvent):
    cdef PyxDelegate pyobj = <PyxDelegate>data
    pyobj._touchs(t, pTouchs, pEvent)

cdef class PyxDelegate:
    cdef CCPyDelegate _co
    def __cinit__(self):
        self.init()

    def init(self):
        self._co.init(<void*>self, <touch_func>&_touch, <touchs_func>&_touchs)

    cdef _touch(self, int t, touch.CCTouch* pTouch, touch.CCEvent* pEvent):
        cdef CCTouch th = CCTouch()
        cdef CCEvent e = CCEvent()
        th._co = <cocoa.CCObject*>pTouch
        e._co = <cocoa.CCObject*>pEvent
        if t == 0:
            return self.Began(th, e)
        elif t == 1:
            self.Moved(th, e)
        elif t == 2:
            self.Ended(th, e)
        elif t == 3:
            self.Cancelled(th, e)
        return -1

    cdef _touchs(self, int t, cocoa.CCSet* pTouchs, touch.CCEvent* pEvent):
        cdef CCSet th = CCSet()
        cdef CCEvent e = CCEvent()
        th._co = <cocoa.CCObject*>pTouchs
        e._co = <cocoa.CCObject*>pEvent
        if t == 4:
            self.sBegan(th, e)
        elif t == 5:
            self.sMoved(th, e)
        elif t == 6:
            self.sEnded(th, e)
        elif t == 7:
            self.sCancelled(th, e)


# def get_typeof(CCObject obj):
#     return typeof(obj._co)

# def type_name(CCObject obj):
#     return cc_type_name(obj._co)

# cdef object create_by(pointer _co):
##     if typeof(_co) == typeof(ccScene.CCScene*):
#         return CCScene()._set_co(_co)


def ccpClamp(CCPoint p, CCPoint min_inclusive, CCPoint max_inclusive):
    o = CCPoint()
    o._co = support.ccpClamp(p._co, min_inclusive._co, max_inclusive._co)
    return o

#---------------------
#---------------------
#---------------------
