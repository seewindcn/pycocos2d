import random
from ccpy import *
from math import floor

#print dir()
GL_ZERO=                          0
GL_ONE=                           1
GL_SRC_COLOR=                     int('0x0300', 0)
GL_ONE_MINUS_SRC_COLOR=           int('0x0301', 0)
GL_SRC_ALPHA=                     int('0x0302', 0)
GL_ONE_MINUS_SRC_ALPHA=           int('0x0303', 0)
GL_DST_ALPHA=                     int('0x0304', 0)
GL_ONE_MINUS_DST_ALPHA=           int('0x0305', 0)


CCPointZero = CCPoint()
CCPointZero.zero()

CCSizeZero = CCSize()
CCSizeZero.zero()

CCRectZero = CCRect()
CCRectZero.zero()

RAND_MAX = int('0x7fffffff', 0)

def ccp(x, y):
    return CCPoint(x, y)

def ccpAdd(v1, v2):
    return ccp(v1.x + v2.x, v1.y + v2.y)


def ccc3(x, y, z):
    return ccColor3B(x, y, z)
    
def ccc4(x, y, z, a):
    return ccColor4B(x, y, z, a)

def CCRectMake(x, y, width, height):
    return CCRect(x, y, width, height)

def CCSizeMake(width, height):
    return CCSize(width, height)

def CCRANDOM_0_1():
    return random.random()
    # ((float)rand()/RAND_MAX)

def CCLOG(msg, *args):
    if args:
        msg = msg % args
    print msg
CCLog = CCLOG

class PyDelegate(PyxDelegate):
    def Began(self, pTouch, pEvent):
        pass
    def Moved(self, pTouch, pEvent):
        pass
    def Ended(self, pTouch, pEvent):
        pass
    def Cancelled(self, pTouch, pEvent):
        pass

    def sBegan(self, pTouch, pEvent):
        pass
    def sMoved(self, pTouch, pEvent):
        pass
    def sEnded(self, pTouch, pEvent):
        pass
    def sCancelled(self, pTouch, pEvent):
        pass


