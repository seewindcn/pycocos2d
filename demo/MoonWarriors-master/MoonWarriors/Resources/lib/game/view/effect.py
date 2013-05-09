#-*- coding:utf-8 -*-


from cocos2d import *
from game.constant import *

def on_killSprite(node):
    node.removeFromParent()


class Effect(object):
    cb_killSprite = CallBack(on_killSprite)

    @classmethod
    def flareEffect(cls, parent, cb):
        winSize = CCDirector.sharedDirector().getWinSize()
        # 特效图片
        flare = CCSprite.create(s_flare)
        
        # 设置混合模式
        flare.setBlendFunc(cbl)
        
        # 添加到父节点
        parent.addChild(flare, 10)
        
        # 设置初始透明度
        flare.setOpacity(0)
        
        # 设置初始位置
        flare.setPosition(-30, winSize.height - 130)
        
        # 设置初始角度
        flare.setRotation(-120)
        
        # 设置初始放大系数
        flare.setScale(0.2)
        
        # 透明度渐变
        opacityAnim = CCFadeTo.create(0.5, 255)
        opacDim = CCFadeTo.create(1, 0)
        
        # 大小渐变
        bigAnim = CCScaleBy.create(0.7, 1.2, 1.2)
        
        # 渐变速度
        biggerEase = CCEaseSineOut.create(bigAnim)
        moveAnim = CCMoveBy.create(0.5, ccp(328, 0))
        moveEase = CCEaseSineOut.create(moveAnim)
        
        # 角度旋转
        roteAnim = CCRotateBy.create(2.5, 90)
        
        # 角度旋转速度，指数变化
        rotateEase = CCEaseExponentialOut.create(roteAnim)
        
        # 放大到原大小
        bigger = CCScaleTo.create(0.5, 1)
        
        # 动画完成后回调函数,干掉精灵
        removeFunc =  CCCallFuncN.create(Effect.cb_killSprite)
        
        # 执行动画和回调函数
        flare.runAction(CCSequence.create(opacityAnim, 
                biggerEase, opacDim, removeFunc, cb))
        flare.runAction(moveEase)
        flare.runAction(rotateEase)
        flare.runAction(bigger)


    @classmethod
    def explode(cls, parent, pos):
        # 第一帧
        pFrame = CCSpriteFrameCache.sharedSpriteFrameCache().spriteFrameByName(
                "explosion_01.png")
        explosion = CCSprite.createWithSpriteFrame(pFrame)
        parent.addChild(explosion)
        explosion.setPosition1(pos)
        
        cs = explosion.getContentSize()
        
        # 完成之后的回调
        removeFunc =  CCCallFuncN.create(Effect.cb_killSprite)
        
        # 爆炸动画
        animation = CCAnimationCache.sharedAnimationCache().animationByName(
                "Explosion")
        explosion.runAction(
                CCSequence.create(
                CCAnimate.create(animation), 
                removeFunc)
                )
    

    @classmethod
    def spark(cls, pos, parent, scale, duration):
        """ 闪光动画 """
        # spark 精灵
        one = CCSprite.create(s_explode1)
        two = CCSprite.create(s_explode2)
        three = CCSprite.create(s_explode3)
        
        # 混合模式
        one.setBlendFunc(cbl)
        two.setBlendFunc(cbl)
        three.setBlendFunc(cbl)
        
        one.setPosition1(pos)
        two.setPosition1(pos)
        three.setPosition1(pos)
        
        #这个为什么不加？加上去感觉太亮了吧
        # parent.addChild(one)
        parent.addChild(two)
        parent.addChild(three)
        
        one.setScale(scale)
        two.setScale(scale)
        three.setScale(scale)
        
        three.setRotation(CCRANDOM_0_1() * 360)
        
        left = CCRotateBy.create(duration, -45)
        right = CCRotateBy.create(duration, 45)
        scaleBy = CCScaleBy.create(duration, 3)
        fadeOut = CCFadeOut.create(duration)
        

        #JS写这个地方真是爽，这里却要写3个回调和3个动作
        removeOne =  CCCallFuncN.create(Effect.cb_killSprite)
        removeTwo =  CCCallFuncN.create(Effect.cb_killSprite)
        removeThree =  CCCallFuncN.create(Effect.cb_killSprite)
        seqOne = CCSequence.create(fadeOut, removeOne)
        seqTwo = CCSequence.create(fadeOut.copy(), removeTwo)
        seqThree = CCSequence.create(fadeOut.copy(), removeThree)
        
        one.runAction(left)
        two.runAction(right)
        
        one.runAction(scaleBy)
        two.runAction(scaleBy.copy())
        three.runAction(scaleBy.copy())
        
        one.runAction(seqOne)
        two.runAction(seqTwo)
        three.runAction(seqThree)
    


    #动画加入缓存
    @classmethod
    def sharedExplosion(cls):
        CCSpriteFrameCache.sharedSpriteFrameCache().addSpriteFramesWithFile(
                s_explosion_plist)
        animFrames = CCArray.create()
        
        # char str[64] = {0}
        
        # 这个sprintf真心很强大啊
        for i in xrange(1, 35):
            # sprintf(str, "explosion_%02d.png", i)
            # CCLOG("%s",str)
            s = "explosion_%02d.png" % i
            frame = CCSpriteFrameCache.sharedSpriteFrameCache().spriteFrameByName(s)
            animFrames.addObject(frame)
            
        animation = CCAnimation.createWithSpriteFrames(animFrames, 0.04)
        
        # 帧动画命名
        CCAnimationCache.sharedAnimationCache().addAnimation(
                animation, "Explosion")





