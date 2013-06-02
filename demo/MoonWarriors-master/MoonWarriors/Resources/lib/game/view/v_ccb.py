#-*- coding:utf-8 -*-

from cocos2d import *

from game.constant import *
from v_base import BaseView
from effect import Effect
from game import config


class CCBView(BaseView):
    def _ui(self):
        winSize = self.winSize
        
        sp = CCSprite.create(s_loading)
        sp.setAnchorPoint(0, 0)
        self.addChild(sp, 0, 1)
        

        
        backLb = CCLabelBMFont.create("Go Back", s_font)
        goBack = CCMenuItemLabel.create(backLb,
                self.ctl.cb_goback)
        goBack.setScale(0.6)
        fadeIn = CCFadeTo.create(1, 80)
        fadeOut = CCFadeTo.create(1, 255)
        ease1 = CCEaseSineInOut.create(fadeIn)
        ease2 = CCEaseSineInOut.create(fadeOut)
        seq = CCSequence.create(ease1, ease2)
        # 这里也是，参数必须强转，否则NDK编译不过
        goBack.runAction(CCRepeatForever.create(seq))
        
        menu = CCMenu.create(goBack)
        menu.alignItemsVerticallyWithPadding(21)
        self.addChild(menu)

        pos = goBack.getPosition()
        pos.y -= 50
        goBack.setPosition1(pos)
        self._ccb()
        

    def _ccb(self):
        self.cb = CallBack(self.call_back)
        library = CCNodeLoaderLibrary.newDefaultCCNodeLoaderLibrary()
        reader = CCBReader()
        reader.new(library)
        reader.autorelease()
        reader.setCCBRootPath('ccb/')
        o = reader.readNodeGraphFromFile('ccb/TestAni.ccbi', self.cb.getCallBack())
        o.setPosition(self.winSize.width/2, self.winSize.height/2)
        reader.getAnimationManager().runAnimationsForSequenceNamed("wave")
        self.addChild(o)

        
    def call_back(self, *args):
        print 'ccb call_back', args
    

