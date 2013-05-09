# distutils: language = c++

from libcpp cimport bool
from ccNode cimport *

cdef extern from "cocos2d.h" namespace "cocos2d":
    cppclass CCScene(CCNode):
        CCScene() nogil except +
        bool init()

    CCScene *CCScene_create"cocos2d::CCScene::create"()





