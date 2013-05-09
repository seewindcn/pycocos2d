#-*- coding:utf-8 -*-
from cocos2d import *


class BaseView(object):
    layer_cls = CCLayer
    def __init__(self, ctl):
        self.ctl = ctl
        self.scene = None

    def stop(self):
        pass

    @property
    def director(self):
        return self.ctl.director


    def init(self):
        if self.scene is not None:
            return self.scene
        self.scene = CCScene.create()
        self.layer = self.layer_cls.create()
        self.scene.addChild(self.layer)
        self.winSize = self.director.getWinSize()
        self.addChild = self.layer.addChild
        self.removeChild = self.layer.removeChild

        self._ui()
        
        return self.scene

    def _ui(self):
        pass
