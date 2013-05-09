# distutils: language = c++

from libcpp cimport bool
from cocoa cimport *

cdef extern from "cocos2d.h" namespace "cocos2d":
    CCPoint ccpClamp(const CCPoint&, const CCPoint&, const CCPoint&)