#-*- coding:utf-8 -*-
from cocos2d import *

from m_sprite import UnitSprite
from m_bullet import Bullet
from game.constant import *
from game.view.effect import Effect
from game import config

class Enemy(UnitSprite):
    def __init__(self, view, type):
        UnitSprite.__init__(self, view)
        self.active = True
        self.speed = 200
        self.bulletSpeed = 100#-200
        self.HP = 15
        self.bulletPowerValure = 1
        self.moveType = 0
        self.scoreValue = 200
        self.zOrder = 1000
        self.delayTime = 1+1.2*CCRANDOM_0_1()
        self.attackMode = 1
        self.enemyInit(type)

    def stop(self):
        self.ctl.unschedule(self.cb_shoot)


    def enemyInit(self, type):
        if not self.sprite.init():
            return False
        self.cb_shoot = CallBack(self.shoot)
        
        self.HP = type.hp
        self.moveType = type.moveType
        self.scoreValue = type.scoreValue
        
        self.sprite.initWithSpriteFrameName(type.textureName)
        self.shipContentSize = self.sprite.getContentSize()
        self.ctl.schedule(self.cb_shoot, self.delayTime)
        return True

    def update(self, dt):
        pass

    def shoot(self, dt):
        pos = self.sprite.getPosition()
        bullet = Bullet(self.view, self.bulletSpeed, "W2.png", self.attackMode)
        config.enemy_bullet.add(bullet)
        self.sprite.getParent().addChild(bullet.sprite, self.zOrder, 900)
        bullet.sprite.setPosition(pos.x, pos.y - self.sprite.getContentSize().height * 0.2)

    def hurt(self):
        if not self.active:
            return
        self.HP -= 1
        if self.HP < 0:
            self.active = False

    def destroy(self):
        self.stop()
        # 更新分数
        config.scoreValue += self.scoreValue

        # 爆炸特效和闪光特效
        Effect.explode(self.sprite.getParent(), self.sprite.getPosition())
        
        Effect.spark(self.sprite.getPosition(), self.sprite.getParent(), 1.2, 0.7)
        
        # 敌机爆炸，从敌机数组删除
        config.enemy_items.remove(self)
        # 删除精灵
        self.sprite.removeFromParent()
        
        # # 声音
        # if (Config.sharedConfig().getAudioState()) {
        #         SimpleAudioEngine.sharedEngine().playEffect(s_explodeEffect)
        # }
        self.view.unit_destroy(self)

    def collideRect(self):
        size = self.shipContentSize
        pos = self.sprite.getPosition()
        return CCRectMake(pos.x - size.width / 2, 
                pos.y - size.height / 4, 
                size.width, size.height / 2)


    @classmethod
    def sharedEnemy(self):
        CCSpriteFrameCache.sharedSpriteFrameCache().addSpriteFramesWithFile(
                s_Enemy_plist, s_enemy)



