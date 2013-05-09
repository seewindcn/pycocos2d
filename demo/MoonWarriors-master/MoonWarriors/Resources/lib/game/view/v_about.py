#-*- coding:utf-8 -*-

from cocos2d import *

from game.constant import *
from v_base import BaseView
from effect import Effect


class AboutView(BaseView):
    def _ui(self):
        winSize = self.winSize

        sp = CCSprite.create(s_loading)
        sp.setAnchorPoint(0, 0)
        self.addChild(sp, 0, 1)
        
        imageCache = CCTextureCache.sharedTextureCache().addImage(s_menuTitle)
        title = CCSprite.createWithTexture(imageCache, 
                CCRectMake(0, 36, 100, 34))
        title.setPosition(winSize.width/2, winSize.height - 60)
        self.addChild(title)
        
        about = CCLabelTTF.create(
                "   I recode this game according to the logic of MoonWarriors-html5,almost all of the code  keep unanimous with the original. \n     This showcase utilizes many features from Cocos2d-x engine, including: Parallax background, tilemap, actions, ease, frame animation, schedule, Labels, keyboard Dispatcher, Scene Transition", 
                "Arial", 18, 
                CCSizeMake(winSize.width * 0.85, 320), 
                kCCTextAlignmentLeft)
        about.setPosition(winSize.width / 2, winSize.height / 2 - 20)
        about.setAnchorPoint(0.5, 0.5)
        self.addChild(about)
        
        
        backLb = CCLabelBMFont.create("Go Back", s_font)
        goBack = CCMenuItemLabel.create(backLb, self.ctl.cb_goback)
        goBack.setScale(0.6)
        fadeIn = CCFadeTo.create(1, 80)
        fadeOut = CCFadeTo.create(1, 255)
        ease1 = CCEaseSineInOut.create(fadeIn)
        ease2 = CCEaseSineInOut.create(fadeOut)
        seq = CCSequence.create(ease1, ease2)
        # 参数必须要强转，不然ndk编译不过
        goBack.runAction(CCRepeatForever.create(seq))
        
        menu = CCMenu.create(goBack)
        menu.setPosition(winSize.width / 2, 50)
        self.addChild(menu)
