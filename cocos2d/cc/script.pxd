# distutils: language = c++

from libcpp cimport bool
from cocoa cimport *

cdef extern from "cocos2d.h" namespace "cocos2d":
    ctypedef struct lua_State

    cppclass CCTimer
    cppclass CCLayer
    cppclass CCMenuItem
    cppclass CCNotificationCenter
    cppclass CCCallFunc
    cppclass CCAcceleration

    cppclass CCScriptHandlerEntry(CCObject):
        pass

    cppclass CCTouchScriptHandlerEntry(CCScriptHandlerEntry):
        pass