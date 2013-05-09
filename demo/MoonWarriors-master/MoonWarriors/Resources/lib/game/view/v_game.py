#-*- coding:utf-8 -*-
from cocos2d import *

from game import config
from game.constant import *
from v_base import BaseView
from v_pause import PauseLayer
from game.model.m_enemy import Enemy
from game.model.m_ship import Ship
from effect import Effect

statePlaying = 0
stateGameOver = 1

class GameView(BaseView):
    def stop(self):
        self.ctl.unschedule(self.cb_update)
        self.ctl.unschedule(self.cb_scoreCounter)
        self.ctl.unschedule(self.cb_movingBackground)
        for en in config.enemy_items:
            en.stop()


    def init_cb(self):
        self.cb_movingBackground = CallBack(self.movingBackground)
        self.cb_doPause = CallBack(self.doPause)
        self.cb_scoreCounter = CallBack(self.scoreCounter)
        self.cb_update = CallBack(self.update)
        self.cb_gameOver = CallBack(self.gameOver)

    def _ui(self):
        self.isBackSkyReload = False
        self.isBackTileReload = False
        self.tempScore = 0
        self.time = 0
        self.init_cb()

        self.state = statePlaying
        Enemy.sharedEnemy()
        Effect.sharedExplosion()
        config.resetConfig()
        self.levelManager = self.ctl.levelManager
        self.levelManager.init(self)

        #初始化背景
        self.initBackground()

        winSize = self.winSize
        self.screenRec = CCRectMake(0, 0,  winSize.width, winSize.height + 10)
        
        # score
        self.lbScore = CCLabelBMFont.create("Score:0", s_arial14_fnt)
        self.lbScore.setAnchorPoint(1, 0)
        self.lbScore.setAlignment(kCCTextAlignmentRight)
        self.addChild(self.lbScore, 1000)
        self.lbScore.setPosition(winSize.width - 5, winSize.height - 30)
        
        # ship life
        shipTexture = CCTextureCache.sharedTextureCache().addImage(s_ship01)
        life = CCSprite.createWithTexture(shipTexture, CCRectMake(0, 0, 60, 38))
        life.setScale(0.6)
        life.setPosition(30, winSize.height-23)
        self.addChild(life, 1, 5)
        
        # ship life count
        self.lifeCount = CCLabelTTF.create(str(config.life), "Arial", 20)
        self.lifeCount.setPosition(60, winSize.height-20)
        self.lifeCount.setColor(ccc3(255,0, 0))
        self.addChild(self.lifeCount, 1000)
        
        # ship
        self.ship = None
        self.init_ship()
        
        pause = CCMenuItemImage.create("pause.png", "pause.png", 
                cb=self.cb_doPause)
        pause.setAnchorPoint(1, 0)
        pause.setPosition(winSize.width, 0)
        menu = CCMenu.create(pause)
        menu.setAnchorPoint(0, 0)
        self.addChild(menu, 1, 10)
        menu.setPosition1(CCPointZero)
        
        # 调 update函数
        # self.layer.scheduleUpdate()
        self.ctl.schedule(self.cb_update, 1/80.0)
        
        # 每秒调一次 scoreCounter函数
        self.ctl.schedule(self.cb_scoreCounter, 1)
        
        # if (Config.sharedConfig().getAudioState()) {
        #     SimpleAudioEngine.sharedEngine().playBackgroundMusic(s_bgMusic, true)
        # }


    def initBackground(self):
        self.backSky = CCSprite.create(s_bg01)
        self.backSky.setAnchorPoint(0, 0)
        self.backSkyHeight = self.backSky.getContentSize().height
        self.addChild(self.backSky, -10)
        
        # Tile map
        self.backTileMap = CCTMXTiledMap.create(s_level01)
        self.addChild(self.backTileMap, -9)
        self.backTileMapHeight = self.backTileMap.getMapSize().height * self.backTileMap.getTileSize().height
        
        
        self.backSkyHeight -= 48
        self.backTileMapHeight -= 200
        self.backSky.runAction(CCMoveBy.create(3, ccp(0, -48)))
        self.backTileMap.runAction(CCMoveBy.create(3, ccp(0, -200)))
        
        self.ctl.schedule(self.cb_movingBackground, 3)

    # 这里就是视差背景了
    def movingBackground(self, dt):
        winSize = self.winSize

        self.backSky.runAction(CCMoveBy.create(3, ccp(0, -48)))
        self.backTileMap.runAction(CCMoveBy.create(3, ccp(0, -200)))
        
        # 每次移动48
        self.backSkyHeight -= 48
        
        # 每次移动200
        self.backTileMapHeight -= 200
        
        # 图的顶部到达屏幕顶部时
        if self.backSkyHeight <= self.winSize.height:
            if not self.isBackSkyReload:
                # 如果另一张图还没加载则create一个
                self.backSkyRe = CCSprite.create(s_bg01)
                self.backSkyRe.setAnchorPoint(0, 0)
                self.addChild(self.backSkyRe, -10)
                self.backSkyRe.setPosition(0, winSize.height)
                
                # 反转标志位
                self.isBackSkyReload = True
            # 第二张图紧接着第一张图滚动
            self.backSkyRe.runAction(CCMoveBy.create(3, ccp(0, -48)))
        
        # 第一张图完全经过屏幕
        if self.backSkyHeight <= 0:
            self.backSkyHeight = self.backSky.getContentSize().height
            # 移除第一张的精灵
            self.removeChild(self.backSky, True)
            # 指向第二张图的精灵
            self.backSky = self.backSkyRe
            # 第二张的精灵指针置空
            self.backSkyRe = None
            
            # 反转标志位
            self.isBackSkyReload = False
        
        if self.backTileMapHeight <= winSize.height:
            if not self.isBackTileReload:
                self.backTileMapRe = CCTMXTiledMap.create(s_level01)
                self.addChild(self.backTileMapRe, -9)
                self.backTileMapRe.setPosition(0, winSize.height)
                self.isBackTileReload = True
            self.backTileMapRe.runAction(CCMoveBy.create(3, ccp(0, -200)))
        
        if self.backTileMapHeight <= 0:
            self.backTileMapHeight = self.backTileMap.getMapSize().height * self.backTileMap.getTileSize().height
            self.removeChild(self.backTileMap, True)
            self.backTileMap = self.backTileMapRe
            self.backTileMapRe = None
            self.isBackTileReload = False

    def scoreCounter(self, dt):
        if self.state == statePlaying:
            self.time += 1
            self.levelManager.loadLevelResource(self.time)

    def doPause(self, pSender):
        self.ctl.director.pause()
        # SimpleAudioEngine.sharedEngine().pauseBackgroundMusic()
        # SimpleAudioEngine.sharedEngine().pauseAllEffects()
        self.pauseLayer = PauseLayer(self.ctl)
        self.addChild(self.pauseLayer.layer, 9999)


    def gameOver(self):
        self.ctl.view_game_over()


    def update(self, dt):
        if self.state == statePlaying:
            self.checkIsCollide()
            self.removeInactiveUnit(dt)
            self.checkIsReborn()
            self.updateUI(dt)


    def checkIsCollide(self):
        def _collide(items, bullets, is_enemy):
            for i in items:
                if not i.active:
                    continue
                if is_enemy and \
                        not self.screenRec.intersectsRect(i.boundingBox()):
                    i.active = False
                    continue


                for b in bullets:
                    if not b.active:
                        continue
                    if not self.screenRec.intersectsRect(b.boundingBox()):
                        b.active = False
                        continue
                    if self.collide(i, b):
                        i.hurt()
                        b.hurt()

        _collide(config.enemy_items, config.play_bullet, True)
        _collide([self.ship], config.enemy_bullet, False)


    def unit_destroy(self, uniter):
        if uniter == self.ship:
            self.ship = None


    def removeInactiveUnit(self, dt):
        for b in tuple(config.enemy_items) + \
                tuple(config.play_bullet) + \
                tuple(config.enemy_bullet):
            if not b.active:
                b.destroy()
        
        if self.ship and not self.ship.active:
                self.ship.destroy()

        for b in tuple(config.play_bullet) + tuple(config.enemy_bullet):
            b.update(dt)


    def init_ship(self):
        if self.ship is not None:
            return
        CCLOG('init_ship')
        self.ship = Ship(self)
        self.addChild(self.ship.sprite, self.ship.zOder, 1001)

    def checkIsReborn(self):
        if self.ship:
            return

        if config.life > 0:
            config.updateLifeCount()
            self.init_ship()
        else:
            self.state = stateGameOver
            self.ship = None
            gameOver = CCCallFunc.create(self.cb_gameOver)
            self.layer.runAction(CCSequence.create(
                    CCDelayTime.create(0.2), gameOver))
        

    def collide(self, a, b):
        aRect = a.collideRect()
        bRect = b.collideRect()
        # if a == self.ship:
        #     CCLOG('ship collide:%s', aRect)
        if aRect.intersectsRect(bRect):
            return True
        return False

    def updateUI(self, dt):
        if self.tempScore < config.scoreValue:
            self.tempScore += 5
        self.lbScore.setString('Score:%d' % self.tempScore)
        self.lifeCount.setString(str(config.life))

        
    def move(self, touch):
        if not (self.state == statePlaying and self.ship):
            return
        pos = touch.getDelta()
        currentPos = self.ship.sprite.getPosition()
        currentPos = ccpAdd(currentPos, pos)
        currentPos = ccpClamp(currentPos, CCPointZero, 
                ccp(self.winSize.width, self.winSize.height))
        self.ship.sprite.setPosition1(currentPos)



