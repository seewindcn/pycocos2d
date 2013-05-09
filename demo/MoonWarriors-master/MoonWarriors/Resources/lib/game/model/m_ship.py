#-*- coding:utf-8 -*-
from cocos2d import *

from m_sprite import UnitSprite
from m_bullet import Bullet
from game.constant import *
from game import config
from game.view.effect import Effect


class Ship(UnitSprite):
    def __init__(self, view):
        UnitSprite.__init__(self, view)
        # 速度
        self.speed = 220
        # 子弹速度
        self.bulletSpeed = 900
        # 生命值
        self.HP = 3
        # 子弹类型
        self.bulletTypeValue = 1
        # 子弹威力
        self.bulletPowerValue = 1
        # 是否在投掷炸弹
        self.throwBombing = False
        # 是否可被攻击
        self.canBeAttack = True
        self.isThrowBomb = False
        self.zOder = 3000
        # 最大子弹威力
        self.maxBulletPowerValue = 4
        # 出现的初始位置
        self.appearPosition = ccp(160, 60)
        self.hurtColorLife = 0
        self.active = True
        self.init_ui()

    def stop(self):
        self.ctl.unschedule(self.cb_shoot)

    def init_cb(self):
        self.cb_shoot = CallBack(self.shoot)
        self.cb_makeAttack = CallBack(self.makeAttack)

    def init_ui(self):
        self.init_cb()
        # init life
        shipTextureCache = CCTextureCache.sharedTextureCache().addImage(s_ship01)
        rec = CCRectMake(0, 0, 60, 38)
        self.sprite.initWithTexture(shipTextureCache, rec)

        self.sprite.setPosition1(self.appearPosition)
        
        # set frame
        frame0 = CCSpriteFrame.createWithTexture(shipTextureCache, 
                CCRectMake(0, 0, 60, 38))
        frame1 = CCSpriteFrame.createWithTexture(shipTextureCache, 
                CCRectMake(60, 0, 60, 38))

        animFrames = CCArray.create()
        animFrames.addObject(frame0)
        animFrames.addObject(frame1)
        
        # ship animate
        # 这个方法有差异
        animation = CCAnimation.createWithSpriteFrames(animFrames, 0.1)
        animate = CCAnimate.create(animation)
        self.sprite.runAction(CCRepeatForever.create(animate))
        
        # 子弹发射
        self.ctl.schedule(self.cb_shoot, 0.16)
        
        # revive effect
        self.canBeAttack = False
        ghostSprite = CCSprite.createWithTexture(shipTextureCache, 
                CCRectMake(0, 45, 60, 38))
        ghostSprite.setBlendFunc(cbl)
        ghostSprite.setScale(8)
        ghostSprite.setPosition(self.sprite.getContentSize().width / 2, 12)
        self.sprite.addChild(ghostSprite, 3000, 99999)
        ghostSprite.runAction(CCScaleTo.create(0.5, 1, 1))
        
        # 闪烁动画
        blinks = CCBlink.create(3, 9)
        # 回调，攻击使能
        # 带执行者回调，谁执行Action传谁。这里是this执行的动作，所以传的就是this
        self.shipContentSize = self.sprite.getContentSize()
        makeBeAttack = CCCallFuncN.create(self.cb_makeAttack)
        self.sprite.runAction(CCSequence.create(CCDelayTime.create(0.5), 
                blinks, makeBeAttack))



    def update(self, dt):
        pass


    def makeAttack(self, pSender):
        pSender.removeChildByTag(99999)
        # self.sprite.setContentSize(self.shipContentSize)
        self.canBeAttack = True
        self.sprite.setVisible(True)
        CCLog("makeAttack %s:%s", self.shipContentSize, 
                self.sprite.getContentSize())
        
    def shoot(self, dt):
        offset = 13
        position = self.sprite.getPosition()
        contentSize = self.sprite.getContentSize()
        bullet_a = Bullet(self.view, self.bulletSpeed, "W1.png", 1)
        config.play_bullet.add(bullet_a)
        self.sprite.getParent().addChild(bullet_a.sprite, bullet_a.zOrder, 901)
        bullet_a.sprite.setPosition(position.x + offset, 
                position.y + 3 + contentSize.height * 0.3)

        
        bullet_b = Bullet(self.view, self.bulletSpeed, "W1.png", 1)
        config.play_bullet.add(bullet_b)
        self.sprite.getParent().addChild(bullet_b.sprite, bullet_b.zOrder, 901)
        bullet_b.sprite.setPosition(position.x - offset, 
                position.y + 3 + contentSize.height * 0.3)


    def hurt(self):
        CCLOG("hurt on ship")
        if not self.canBeAttack:
            return
        if not self.active:
            return            

        self.HP -= 1
        self.sprite.setColor(ccc3(255, 0, 0))
        if self.HP <= 0:
            self.active = False

    def destroy(self):
        self.stop()
        CCLOG("destroy one ship")
        config.updateLifeCount()
        CCLOG("life count is %d", config.life)

        Effect.explode(self.sprite.getParent(), self.sprite.getPosition())
        self.sprite.removeFromParent()
        
        # if (Config.sharedConfig().getAudioState()){
        #     CocosDenshion.SimpleAudioEngine.sharedEngine().playEffect(s_shipDestroyEffect)
        self.view.unit_destroy(self)
            

    def collideRect(self):
        pos = self.sprite.getPosition()
        cs = self.shipContentSize
        return CCRectMake(pos.x - cs.width / 2 , 
                pos.y - cs.height / 2, 
                cs.width, cs.height / 2)




