#-*- coding:utf-8 -*-

from cocos2d import *

from game.constant import *
from v_base import BaseView
from effect import Effect


class OptionsView(BaseView):
    def _ui(self):
        self.cb_setOptions = CallBack(self.setOptions)
        winSize = self.winSize
        
        sp = CCSprite.create(s_loading)
        sp.setAnchorPoint(0, 0)
        self.addChild(sp, 0, 1)
        
        imageCache = CCTextureCache.sharedTextureCache().addImage(s_menuTitle)
        title = CCSprite.createWithTexture(imageCache, CCRectMake(0, 0, 134, 34))
        title.setPosition(winSize.width/2, winSize.height - 60)
        self.addChild(title)

        menuTitle = CCMenuItemFont.create("Sound")
        menuTitle.setFontName("Arial")
        menuTitle.setFontSize(18)
        menuTitle.setEnabled(False)
        
        CCMenuItemFont.setFontName("Arial")
        CCMenuItemFont.setFontSize(26)
        toggle = CCMenuItemToggle.createWithTarget(
                self.cb_setOptions,
                CCMenuItemFont.create("On"),
                CCMenuItemFont.create("Off"))
        
        # selectId = Config.sharedConfig().getAudioState()? 0 : 1
        # toggle.setSelectedIndex(selectId)
        
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
        
        menu = CCMenu.create(menuTitle, toggle, goBack)
        menu.alignItemsInColumns(2, 1)
        self.addChild(menu)

        pos = goBack.getPosition()
        pos.y -= 50
        goBack.setPosition1(pos)
        
        
    def setOptions(self):
        # tmpSound = Config.sharedConfig().getAudioState()
        # Config.sharedConfig().updateAudioState(!tmpSound)
        
        # if (Config.sharedConfig().getAudioState()) {
        #     SimpleAudioEngine.sharedEngine().resumeAllEffects()
        #     SimpleAudioEngine.sharedEngine().resumeBackgroundMusic()
        # }else{
        #     SimpleAudioEngine.sharedEngine().pauseAllEffects()
        #     SimpleAudioEngine.sharedEngine().pauseBackgroundMusic()
        # }
        pass
    

