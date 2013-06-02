#-*- coding:utf-8 -*-
from cocos2d import *

from game.constant import *
from v_base import BaseView
from effect import Effect
from game import config


class StartView(BaseView):
    def onButtonEffect(self):
        if config.isAudioOn:
             self.ctl.audio.playEffect(s_buttonEffect);

    def stop(self):
        self.ctl.unschedule(self.cb_update)

    def on_newGame(self):
        self.ctl.view_game()


    def on_flareEffect(self, node):
        self._flareEffect_func = CCCallFunc.create(self.cb_newGame)
        Effect.flareEffect(self.layer, self._flareEffect_func)
        

    def on_menuCallback(self, sender):
        self.onButtonEffect()
        node = sender.cast(CCNode)
        tag = node.getTag()
        if tag == 20:
            self.ctl.view_options()
        elif tag == 21:
            self.ctl.view_about()
        elif tag == 22:
            self.ctl.view_ccb()


    def on_update(self, dt):
        if self.m_ship.getPositionY() > self.winSize.height:
            pos = ccp(CCRANDOM_0_1() * self.winSize.width, 10)
            self.m_ship.setPosition1(pos)
            self.m_ship.runAction(
                CCMoveBy.create(
                    floor(5 * CCRANDOM_0_1()), 
                    ccp(CCRANDOM_0_1() * self.winSize.width, pos.y + self.winSize.height)
                )
            )
            

    def _ui_cb(self):
        self.cb_newGame = CallBack(self.on_newGame)
        self.cb_flareEffect = CallBack(self.on_flareEffect)
        self.cb_menuCallback = CallBack(self.on_menuCallback)
        self.cb_update = CallBack(self.on_update)


    def _ui(self):
        self._ui_cb()
        director = CCDirector.sharedDirector()
        winSize = self.winSize
        sl = CCSprite.create(s_loading)
        sl.setAnchorPoint(0, 0)
        self.addChild(sl)

        logo = CCSprite.create(s_logo)
        logo.setAnchorPoint(0.5, 1)
        logo.setPosition(winSize.width/2, winSize.height-50)
        self.addChild(logo, 10, 1)

        newGameNormal = CCSprite.create(s_menu, CCRectMake(0, 0, 126, 33))

        newGameSelected = CCSprite.create(s_menu, CCRectMake(0, 33, 126, 33))
        newGameDisabled = CCSprite.create(s_menu, CCRectMake(0, 33*2, 126, 33))
        
        gameSettingNormal = CCSprite.create(s_menu, CCRectMake(126, 0, 126, 33))
        gameSettingNSelected = CCSprite.create(s_menu, CCRectMake(126, 33, 126, 33))
        gameSettingDesabled = CCSprite.create(s_menu, CCRectMake(126, 33*2, 126, 33))
        
        aboutNormal = CCSprite.create(s_menu, CCRectMake(252, 0, 126, 33))
        aboutSelected = CCSprite.create(s_menu, CCRectMake(252, 33, 126, 33))
        aboutDesabled = CCSprite.create(s_menu, CCRectMake(252, 33*2, 126, 33))

        ccbNormal = CCSprite.create(s_menu, CCRectMake(252, 0, 126, 33))
        ccbSelected = CCSprite.create(s_menu, CCRectMake(252, 33, 126, 33))
        ccbDesabled = CCSprite.create(s_menu, CCRectMake(252, 33*2, 126, 33))

        newGame = CCMenuItemSprite.create(newGameNormal, 
                newGameSelected, newGameDisabled, 
                self.cb_flareEffect)

        gameSetting = CCMenuItemSprite.create(gameSettingNormal, 
                gameSettingNSelected, gameSettingDesabled, 
                self.cb_menuCallback)

        gameSetting.setTag(20)
        about = CCMenuItemSprite.create(aboutNormal, 
                aboutSelected, aboutDesabled, 
                self.cb_menuCallback)
        about.setTag(21)

        #ccb test
        ccbTest = CCMenuItemSprite.create(ccbNormal,
                ccbSelected, ccbDesabled,
                self.cb_menuCallback)
        ccbTest.setTag(22)

        # 最后一个参数要是NULL
        menu = CCMenu.create(newGame, gameSetting, about, ccbTest)
        menu.alignItemsVerticallyWithPadding(20)
        menu.setPosition(winSize.width / 2, winSize.height / 2 - 80)
        self.addChild(menu, 1, 2)

        self.ctl.schedule(self.cb_update, 0.1)

        # ships
        textCache = CCTextureCache.sharedTextureCache().addImage(s_ship01)
        self.m_ship = CCSprite.createWithTexture(textCache, CCRectMake(0, 45, 60, 38))
        self.addChild(self.m_ship, 0, 4)
        position = ccp(CCRANDOM_0_1() * winSize.width, 0)
        self.m_ship.setPosition1(position)
        self.m_ship.runAction(CCMoveBy.create(2, ccp(CCRANDOM_0_1() * winSize.width, position.y + winSize.height + 100)))

        
        if config.isAudioOn:
            self.ctl.audio.setBackgroundMusicVolume(0.7)
            self.ctl.audio.playBackgroundMusic(s_mainMainMusic, True)


