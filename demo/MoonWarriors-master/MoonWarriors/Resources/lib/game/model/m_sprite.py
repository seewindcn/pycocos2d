#-*- coding:utf-8 -*-
from cocos2d import *


class UnitSprite(object):
    def __init__(self, view):
        self.view = view
        self.ctl = view.ctl
        self.ui_create()

    def ui_create(self, *args, **kw):
        self.sprite = CCSprite.create(*args, **kw)
        self.boundingBox = self.sprite.boundingBox

