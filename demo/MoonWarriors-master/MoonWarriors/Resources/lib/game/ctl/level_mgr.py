#-*- coding:utf-8 -*-
from cocos2d import *

from game import config
from game.model.m_enemy import Enemy

class LevelManager(object):
    def __init__(self, ctl):
        self.ctl = ctl
        self.enemies = config.enemies
        self.enemyTypes = config.enemyTypes

    def init(self, gameLayer):
        self.gameLayer = gameLayer
        self.cb_repeatAction = CallBack(self.repeatAction)

    def loadLevelResource(self, dt):
        # CCLOG('loadLevelResource')
        for en in self.enemies:
            if en.showType == "Repeate":
                if dt % en.showTime != 0:
                    continue
                # 数组长度
                for i in en.types:
                    self.addEnemyToGameLayer(i)



    def addEnemyToGameLayer(self, type):
        winSize = self.ctl.winSize
        enemyType = self.enemyTypes[type]
        enemy = Enemy(self.gameLayer, enemyType)
        
        enemyPos = ccp( 80 + (winSize.width - 160) * CCRANDOM_0_1(), winSize.height)
        eSize = enemy.sprite.getContentSize()
        enemy.sprite.setPosition1(enemyPos)
        
        # CCPoint offset #= ((GameLayer*)self.gameLayer).getShip().getPosition()
        # CCAction *tempAction #= CCMoveTo.create(1, offset)
        # CCMoveBy *a0
        # CCMoveBy *a1
        # CCCallFuncN *onComplete

        if enemy.moveType == 0:
            if self.gameLayer.ship:
                offset = self.gameLayer.ship.sprite.getPosition()
            else:
                offset = ccp(winSize.width / 2, 0)
            tempAction = CCMoveTo.create(1, offset)
        if enemy.moveType == 1:
            offset = ccp(0, -winSize.height - eSize.height)
            tempAction = CCMoveBy.create(4, offset)
        if enemy.moveType == 2:
            offset = ccp(0, -100 - 200 * CCRANDOM_0_1())
            a0 = CCMoveBy.create(0.5, offset)
            a1 = CCMoveBy.create(1, ccp(-50 - 100 * CCRANDOM_0_1(), 0))
            
            onComplete = CCCallFuncN.create(self.cb_repeatAction)
            tempAction = CCSequence.create(a0, a1, onComplete)
        if enemy.moveType == 3:
            newX = 320 if (enemyPos.x <= winSize.width / 2 ) else - 320
            a0 = CCMoveBy.create(4, ccp(newX, -240))
            a1 = CCMoveBy.create(4, ccp(-newX, -320))
            tempAction = CCSequence.create(a0, a1)
        

        self.gameLayer.addChild(enemy.sprite, enemy.sprite.getZOrder(), 1000)
        config.enemy_items.add(enemy)
        enemy.sprite.runAction(tempAction)


    def repeatAction(self, pSender):
        delay = CCDelayTime.create(1)
        mv = CCMoveBy.create(1, ccp(100 + 100 * CCRANDOM_0_1(), 0))
        seq = CCSequence.create(delay, mv, delay.copy(), mv.reverse())
        pSender.runAction(CCRepeatForever.create(seq))


