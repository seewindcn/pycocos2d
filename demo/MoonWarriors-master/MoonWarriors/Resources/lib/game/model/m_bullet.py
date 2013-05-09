#-*- coding:utf-8 -*-
from cocos2d import *

from m_sprite import UnitSprite
from game.constant import *
from game import config


class Bullet(UnitSprite):
    frees = set()
    def __init__(self, view, speed, weapon, attackMode):
        UnitSprite.__init__(self, view)
        self.active = True
        self.zOrder = 3000
        self.velocityx = 0
        self.power = 1
        self.HP = 1
        self.velocityy = 200 - speed
        self.attackMode = attackMode
        # self.parentType

        CCSpriteFrameCache.sharedSpriteFrameCache().addSpriteFramesWithFile(s_bullet_plist)
        self.sprite.initWithSpriteFrameName(weapon)
        self.sprite.setBlendFunc(cbl)


    def update(self, dt):
        position = self.sprite.getPosition()
        position.x -= self.velocityx * dt
        position.y -= self.velocityy * dt
        self.sprite.setPosition1(position)

    def init(self):
        return True

    def hurt(self):
        if not self.active:
            return
        self.HP -= 1
        if self.HP <= 0:
            self.active = False
            

    def destroy(self):
        # 子弹爆炸特效
        self.cb_removeExplode = CallBack(self.removeExplode)
        explode = CCSprite.create(s_hit)
        explode.setBlendFunc(cbl)
        explode.setPosition1(self.sprite.getPosition())
        explode.setRotation(CCRANDOM_0_1() * 360)
        explode.setScale(0.75)
        self.sprite.getParent().addChild(explode, 9999)

        self.sprite.removeFromParent()
        if self in config.play_bullet:
            config.play_bullet.remove(self)
        else:
            config.enemy_bullet.remove(self)
        self.frees.add(self)
        
        removeExplode = CCCallFuncN.create(self.cb_removeExplode)
        explode.runAction(CCScaleBy.create(0.3, 2, 2))
        explode.runAction(CCSequence.create(
                CCFadeOut.create(0.3), removeExplode))

        self.view.unit_destroy(self)
        

    def removeExplode(self, pSender):
        self.frees.remove(self)
        pSender.removeFromParent()

    def collideRect(self):
        pos = self.sprite.getPosition()
        return CCRectMake(pos.x - 3, pos.y - 3, 6, 6)





