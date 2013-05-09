#-*- coding:utf-8 -*-
from cocos2d import *

from game import config
from game.constant import *
from v_base import BaseView
from game.model.m_enemy import Enemy
from game.model.m_ship import Ship
from effect import Effect


class PauseLayer(object):
    def __init__(self, ctl):
        self.ctl = ctl
        self._ui()

    def stop(self):
        self.ctl.director.TouchDispatcher.removeDelegate(self.delegate)

    def init_delegate(self):
        self.delegate = PyDelegate()
        self.delegate.Began = self.begin
        self.delegate.sBegan = self.begin
        self.ctl.director.TouchDispatcher.addTargetedDelegate(self.delegate, 
                -9999, True)

    def _ui(self):
        self.layer = CCLayerColor.create()
        # 擦哦，ccc4的最后一个参数才是透明度，有点坑
        if not self.layer.initWithColor(ccc4(0, 0, 0, 100)):
            return False

        winSize = self.ctl.winSize
        
        # 开启触控
        play = CCMenuItemImage.create("play.png", "play.png")
        play.setAnchorPoint(1, 0)
        play.setTag(10)
        play.setPosition(winSize.width, 0)
        
        
        self.menu = menu = CCMenu.create(play)
        menu.setAnchorPoint(0, 0)
        self.layer.addChild(menu, 1, 10)
        menu.setPosition1(CCPointZero)
        self.init_delegate()

        
    def begin(self, touch, pEvent):
        # 因为回调调不到了，所以resume写在了这里
        # CCLog("touch play")
        rect = self.menu.getChildByTag(10).boundingBox()
        if rect.containsPoint(touch.getLocation()):
            self.stop()
            self.ctl.director.resume()
            # SimpleAudioEngine.sharedEngine().resumeAllEffects()
            # SimpleAudioEngine.sharedEngine().resumeBackgroundMusic()
            self.layer.removeFromParent()
        return True
