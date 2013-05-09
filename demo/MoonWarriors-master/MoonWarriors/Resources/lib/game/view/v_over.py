#-*- coding:utf-8 -*-
from cocos2d import *

from game import config
from game.constant import *
from v_base import BaseView
from game.model.m_enemy import Enemy
from game.model.m_ship import Ship
from effect import Effect


class GameOverView(BaseView):
    def _ui(self):
        self.cb_playAgain = CallBack(self.playAgain)
        winSize = self.winSize
        
        sp = CCSprite.create(s_loading)
        sp.setAnchorPoint(0, 0)
        self.addChild(sp, 0, 1)
        
        logo = CCSprite.create(s_gameOver)
        logo.setAnchorPoint(0, 0)
        logo.setPosition(0, 300)
        self.addChild(logo, 10, 1)
        
        playAgainNormal = CCSprite.create(s_menu, CCRectMake(378, 0, 126, 33))
        playAgainSelected = CCSprite.create(s_menu, CCRectMake(378, 33, 126, 33))
        playAgainDisabled = CCSprite.create(s_menu, CCRectMake(378, 33*2, 126, 33))
        
        cocos2dx = CCSprite.create(s_cocos2dx)
        cocos2dx.setPosition(160, 150)
        self.addChild(cocos2dx, 10)
        
        playAgain = CCMenuItemSprite.create(playAgainNormal, 
                playAgainSelected, playAgainDisabled, 
                self.cb_playAgain)
        
        menu = CCMenu.create(playAgain)
        self.addChild(menu, 1, 2)
        menu.setPosition(winSize.width / 2, 220)
        
        tempScore = config.scoreValue
        lb = CCLabelTTF.create('Your score:%d' % tempScore, 
                "Arial Bold", 16)
        lb.setPosition(160, 280)
        lb.setColor(ccc3(250, 179, 0))
        self.addChild(lb, 10)
        
        # CocosDenshion.SimpleAudioEngine.sharedEngine().playBackgroundMusic(s_mainMainMusic, true)
        
    def playAgain(self, sender):
        self.ctl.view_game()
