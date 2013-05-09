#-*- coding:utf-8 -*-
from cocos2d import *
from c_base import BaseCtrl

class GameDelegate(PyDelegate):
    def __init__(self, ctl):
        PyDelegate.__init__(self)
        self.ctl = ctl

    def Began(self, pTouch, pEvent):
        return True

    def Moved(self, pTouch, pEvent):
        CCLOG('Moved')

    def Ended(self, pTouch, pEvent):
        pass

    def Cancelled(self, pTouch, pEvent):
        pass

    def sBegan(self, pTouch, pEvent):
        pass

    def sMoved(self, pTouch, pEvent):
        # print 'sMoved', pTouch, pTouch.count(), pEvent
        self.ctl.view.move(pTouch.anyObject(CCTouch))

    def sEnded(self, pTouch, pEvent):
        pass

    def sCancelled(self, pTouch, pEvent):
        pass


class GameCtrl(BaseCtrl):
    def __init__(self, ctl, view):
        BaseCtrl.__init__(self, ctl, view)
        self.delegate = GameDelegate(self)
        # self.ctl.director.TouchDispatcher.addTargetedDelegate(self.delegate, 1, True)
        self.ctl.director.TouchDispatcher.addStandardDelegate(self.delegate, 1)

    def stop(self):
        self.ctl.director.TouchDispatcher.removeDelegate(self.delegate)
