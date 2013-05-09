# distutils: language = c++

from libcpp cimport bool
from cocoa cimport *
from ccNode cimport CCNode
from sprite cimport *

cdef extern from "cocos2d.h" namespace "cocos2d":
    ctypedef enum:
        kCCActionTagInvalid


    cppclass CCAction(CCObject):
        CCAction()

        const char* description()

        bool isDone()

        void startWithTarget(CCNode *pTarget)

        void stop()

        void step(float dt)

        void update(float time)
        
        inline CCNode* getTarget()
        inline void setTarget(CCNode *pTarget)
        
        inline CCNode* getOriginalTarget()
        inline void setOriginalTarget(CCNode *pOriginalTarget)

        inline int getTag()
        inline void setTag(int nTag)

    CCAction* CCAction_create"cocos2d::CCAction::create"()    


    cppclass CCFiniteTimeAction(CCAction):
        CCFiniteTimeAction()
        inline float getDuration()
        inline void setDuration(float duration)

        CCFiniteTimeAction* reverse()


    cppclass CCSpeed(CCAction):
        CCSpeed()
        inline float getSpeed()
        inline void setSpeed(float fSpeed)

        bool initWithAction(CCActionInterval *pAction, float fSpeed)

        CCActionInterval* reverse()

        void setInnerAction(CCActionInterval *pAction)

        inline CCActionInterval* getInnerAction()

    CCSpeed* CCSpeed_create"cocos2d::CCSpeed::create"(CCActionInterval* pAction, float fSpeed)


    cppclass CCFollow(CCAction):
        CCFollow()
        inline bool isBoundarySet()
        inline void setBoudarySet(bool bValue)
        bool initWithTarget(CCNode *pFollowedNode, const CCRect& rect)

    CCFollow* CCFollow_create"cocos2d::CCFollow::create"(CCNode *pFollowedNode, const CCRect& rect)# = CCRectZero)


    cppclass CCActionInterval(CCFiniteTimeAction):
        inline float getElapsed()

        bool initWithDuration(float d)

        CCActionInterval* reverse_"reverse"()
        void setAmplitudeRate(float amp)
        float getAmplitudeRate()

    CCActionInterval* CCActionInterval_create"cocos2d::CCActionInterval::create"(float d)


    cppclass CCSequence(CCActionInterval):
        bool initWithTwoActions(CCFiniteTimeAction *pActionOne, CCFiniteTimeAction *pActionTwo)

    CCSequence* CCSequence_create"cocos2d::CCSequence::create"(CCFiniteTimeAction *pAction1, ...)
    CCSequence* CCSequence_create"cocos2d::CCSequence::create"(CCArray *arrayOfActions)
    CCSequence* CCSequence_createWithVariableList"cocos2d::CCSequence::createWithVariableList"(CCFiniteTimeAction *pAction1, va_list args)
    CCSequence* CCSequence_createWithTwoActions"cocos2d::CCSequence::createWithTwoActions"(CCFiniteTimeAction *pActionOne, CCFiniteTimeAction *pActionTwo)


    cppclass CCRepeat(CCActionInterval):
        bool initWithAction(CCFiniteTimeAction *pAction, unsigned int times)
        inline void setInnerAction(CCFiniteTimeAction *pAction)
        inline CCFiniteTimeAction* getInnerAction()
    CCRepeat* CCRepeat_create"cocos2d::CCRepeat::create"(CCFiniteTimeAction *pAction, unsigned int times)


    cppclass CCRepeatForever(CCActionInterval):
        CCRepeatForever()
        bool initWithAction(CCActionInterval *pAction)
        inline void setInnerAction(CCActionInterval *pAction)
        inline CCActionInterval* getInnerAction()
    CCRepeatForever* CCRepeatForever_create"cocos2d::CCRepeatForever::create"(CCActionInterval *pAction)


    cppclass CCSpawn(CCActionInterval):
        bool initWithTwoActions(CCFiniteTimeAction *pAction1, CCFiniteTimeAction *pAction2)
    CCSpawn* CCSpawn_create"cocos2d::CCSpawn::create"(CCFiniteTimeAction *pAction1, ...)
    CCSpawn* CCSpawn_create"cocos2d::CCSpawn::create"(CCArray *arrayOfActions)
    CCSpawn* CCSpawn_createWithVariableList"cocos2d::CCSpawn::createWithVariableList"(CCFiniteTimeAction *pAction1, va_list args)
    CCSpawn* CCSpawn_createWithTwoActions"cocos2d::CCSpawn::createWithTwoActions"(CCFiniteTimeAction *pAction1, CCFiniteTimeAction *pAction2)



    cppclass CCRotateTo(CCActionInterval):
        bool initWithDuration(float fDuration, float fDeltaAngle)
        bool initWithDuration(float fDuration, float fDeltaAngleX, float fDeltaAngleY)
    CCRotateTo* CCRotateTo_create"cocos2d::CCRotateTo::create"(float fDuration, float fDeltaAngle)
    CCRotateTo* CCRotateTo_create"cocos2d::CCRotateTo::create"(float fDuration, float fDeltaAngleX, float fDeltaAngleY)


    cppclass CCRotateBy(CCActionInterval):
        bool initWithDuration(float fDuration, float fDeltaAngle)
        bool initWithDuration(float fDuration, float fDeltaAngleX, float fDeltaAngleY)
    CCRotateBy* CCRotateBy_create"cocos2d::CCRotateBy::create"(float fDuration, float fDeltaAngle)
    CCRotateBy* CCRotateBy_create"cocos2d::CCRotateBy::create"(float fDuration, float fDeltaAngleX, float fDeltaAngleY)


    cppclass CCMoveBy(CCActionInterval):
        bool initWithDuration(float duration, const CCPoint& deltaPosition)
    CCMoveBy* CCMoveBy_create"cocos2d::CCMoveBy::create"(float duration, const CCPoint& deltaPosition)


    cppclass CCMoveTo(CCMoveBy):
        bool initWithDuration(float duration, const CCPoint& position)
    CCMoveTo* CCMoveTo_create"cocos2d::CCMoveTo::create"(float duration, const CCPoint& position)


    cppclass CCSkewTo(CCActionInterval):
        CCSkewTo()
        bool initWithDuration(float t, float sx, float sy)
    CCSkewTo* CCSkewTo_create"cocos2d::CCSkewTo::create"(float t, float sx, float sy)


    cppclass CCSkewBy(CCSkewTo):
        bool initWithDuration(float t, float sx, float sy)
    CCSkewBy* CCSkewBy_create"cocos2d::CCSkewBy::create"(float t, float deltaSkewX, float deltaSkewY)


    cppclass CCJumpBy(CCActionInterval):
        bool initWithDuration(float duration, const CCPoint& position, float height, unsigned int jumps)
    CCJumpBy* CCJumpBy_create"cocos2d::CCJumpBy::create"(float duration, const CCPoint& position, float height, unsigned int jumps)


    cppclass CCJumpTo(CCJumpBy):
        pass
    CCJumpTo* CCJumpTo_create"cocos2d::CCJumpTo::create"(float duration, const CCPoint& position, float height, int jumps)


    ctypedef struct ccBezierConfig:
        CCPoint endPosition
        CCPoint controlPoint_1
        CCPoint controlPoint_2


    cppclass CCBezierBy(CCActionInterval):
        bool initWithDuration(float t, const ccBezierConfig& c)
    CCBezierBy* CCBezierBy_create"cocos2d::CCBezierBy::create"(float t, const ccBezierConfig& c)


    cppclass CCBezierTo(CCBezierBy):
        bool initWithDuration(float t, const ccBezierConfig &c)
    CCBezierTo* CCBezierTo_create"cocos2d::CCBezierTo::create"(float t, const ccBezierConfig& c)


    cppclass CCScaleTo(CCActionInterval):
        bool initWithDuration(float duration, float s)
        bool initWithDuration(float duration, float sx, float sy)
    CCScaleTo* CCScaleTo_create"cocos2d::CCScaleTo::create"(float duration, float s)
    CCScaleTo* CCScaleTo_create"cocos2d::CCScaleTo::create"(float duration, float sx, float sy)


    cppclass CCScaleBy(CCScaleTo):
        pass
    CCScaleBy* CCScaleBy_create"cocos2d::CCScaleBy::create"(float duration, float s)
    CCScaleBy* CCScaleBy_create"cocos2d::CCScaleBy::create"(float duration, float sx, float sy)


    cppclass CCBlink(CCActionInterval):
        bool initWithDuration(float duration, unsigned int uBlinks)
    CCBlink* CCBlink_create"cocos2d::CCBlink::create"(float duration, unsigned int uBlinks)


    cppclass CCFadeIn(CCActionInterval):
        pass
    CCFadeIn* CCFadeIn_create"cocos2d::CCFadeIn::create"(float d)


    cppclass CCFadeOut(CCActionInterval):
        pass
    CCFadeOut* CCFadeOut_create"cocos2d::CCFadeOut::create"(float d)


    cppclass CCFadeTo(CCActionInterval):
        bool initWithDuration(float duration, GLubyte opacity)
    CCFadeTo* CCFadeTo_create"cocos2d::CCFadeTo::create"(float duration, GLubyte opacity)


    cppclass CCTintTo(CCActionInterval):
        bool initWithDuration(float duration, GLubyte red, GLubyte green, GLubyte blue)
    CCTintTo* CCTintTo_create"cocos2d::CCTintTo::create"(float duration, GLubyte red, GLubyte green, GLubyte blue)


    cppclass CCTintBy(CCActionInterval):
        bool initWithDuration(float duration, GLshort deltaRed, GLshort deltaGreen, GLshort deltaBlue)
    CCTintBy* CCTintBy_create"cocos2d::CCTintBy::create"(float duration, GLshort deltaRed, GLshort deltaGreen, GLshort deltaBlue)


    cppclass CCDelayTime(CCActionInterval):
        pass
    CCDelayTime* CCDelayTime_create"cocos2d::CCDelayTime::create"(float d)


    cppclass CCReverseTime(CCActionInterval):
        CCReverseTime()
        bool initWithAction(CCFiniteTimeAction *pAction)
    CCReverseTime* CCReverseTime_create"cocos2d::CCReverseTime::create"(CCFiniteTimeAction *pAction)


    cppclass CCAnimate(CCActionInterval):
        bool initWithAnimation(CCAnimation *pAnimation)
        CCAnimate()
        #CC_SYNTHESIZE_RETAIN(CCAnimation*, m_pAnimation, Animation)
        CCAnimation* getAnimation()
        void setAnimation(CCAnimation* var)
    CCAnimate* CCAnimate_create"cocos2d::CCAnimate::create"(CCAnimation *pAnimation)


    cppclass CCTargetedAction(CCActionInterval):
        CCTargetedAction()
        #CC_SYNTHESIZE_RETAIN(CCNode*, m_pForcedTarget, ForcedTarget)
        CCNode* getForcedTarget()
        void setForcedTarget(CCNode* var)
    CCTargetedAction* CCTargetedAction_create"cocos2d::CCTargetedAction::create"(CCNode* pTarget, CCFiniteTimeAction* pAction)





    cppclass CCActionCamera(CCActionInterval):
        CCActionCamera()


    cppclass CCOrbitCamera(CCActionCamera):
        CCOrbitCamera()
        bool initWithDuration(float t, float radius, float deltaRadius, float angleZ, float deltaAngleZ, float angleX, float deltaAngleX)
        void sphericalRadius(float *r, float *zenith, float *azimuth)
    CCOrbitCamera* CCOrbitCamera_create"cocos2d::CCOrbitCamera::create"(float t, float radius, float deltaRadius, float angleZ, float deltaAngleZ, float angleX, float deltaAngleX)


    cppclass CCPointArray(CCObject):
        CCPointArray()
        bool initWithCapacity(unsigned int capacity)
    
        void addControlPoint(CCPoint controlPoint)
        
        void insertControlPoint(CCPoint &controlPoint, unsigned int index)
        
        void replaceControlPoint(CCPoint &controlPoint, unsigned int index)
        
        CCPoint getControlPointAtIndex(unsigned int index)
        
        void removeControlPointAtIndex(unsigned int index)
        
        unsigned int count()
        
        CCPointArray* reverse()
        
        void reverseInline()
        
        CCObject* copyWithZone(CCZone *zone)
        
        # const std::vector<CCPoint*>* getControlPoints()
        # void setControlPoints(std::vector<CCPoint*> *controlPoints)
    CCPointArray* CCPointArray_create"cocos2d::CCPointArray::create"(unsigned int capacity)


    cppclass CCCardinalSplineTo(CCActionInterval):
        CCCardinalSplineTo()
        bool initWithDuration(float duration, CCPointArray* points, float tension)
        void updatePosition(CCPoint &newPos)
        inline CCPointArray* getPoints()
        inline void  setPoints(CCPointArray* points) 
    CCCardinalSplineTo* CCCardinalSplineTo_create"cocos2d::CCCardinalSplineTo::create"(float duration, CCPointArray* points, float tension)


    cppclass CCCardinalSplineBy(CCCardinalSplineTo):
        CCCardinalSplineBy()
    CCCardinalSplineBy* CCCardinalSplineBy_create"cocos2d::CCCardinalSplineBy::create"(float duration, CCPointArray* points, float tension)


    cppclass CCCatmullRomTo(CCCardinalSplineTo):
        bool initWithDuration(float dt, CCPointArray* points)
    CCCatmullRomTo* CCCatmullRomTo_create"cocos2d::CCCatmullRomTo::create"(float dt, CCPointArray* points)


    cppclass CCCatmullRomBy(CCCatmullRomTo):
        bool initWithDuration(float dt, CCPointArray* points)
    CCCatmullRomBy* CCCatmullRomBy_create"cocos2d::CCCatmullRomBy::create"(float dt, CCPointArray* points)


    cppclass CCActionEase(CCActionInterval):
        bool initWithAction(CCActionInterval *pAction)
    CCActionEase* CCActionEase_create"cocos2d::CCActionEase::create"(CCActionInterval *pAction)


    cppclass CCEaseRateAction(CCActionEase):
        inline void setRate(float rate)
        inline float getRate()
        bool initWithAction(CCActionInterval *pAction, float fRate)
    CCEaseRateAction* CCEaseRateAction_create"cocos2d::CCEaseRateAction::create"(CCActionInterval* pAction, float fRate)


    cppclass CCEaseIn(CCEaseRateAction):
        pass
    CCEaseIn* CCEaseIn_create"cocos2d::CCEaseIn::create"(CCActionInterval* pAction, float fRate)


    cppclass CCEaseOut(CCEaseRateAction):
        pass
    CCEaseOut* CCEaseOut_create"cocos2d::CCEaseOut::create"(CCActionInterval* pAction, float fRate)


    cppclass CCEaseInOut(CCEaseRateAction):
        pass
    CCEaseInOut* CCEaseInOut_create"cocos2d::CCEaseInOut::create"(CCActionInterval* pAction, float fRate)


    cppclass CCEaseExponentialIn(CCActionEase):
        pass
    CCEaseExponentialIn* CCEaseExponentialIn_create"cocos2d::CCEaseExponentialIn::create"(CCActionInterval* pAction)


    cppclass CCEaseExponentialOut(CCActionEase):
        pass
    CCEaseExponentialOut* CCEaseExponentialOut_create"cocos2d::CCEaseExponentialOut::create"(CCActionInterval* pAction)


    cppclass CCEaseExponentialInOut(CCActionEase):
        pass
    CCEaseExponentialInOut* CCEaseExponentialInOut_create"cocos2d::CCEaseExponentialInOut::create"(CCActionInterval* pAction)


    cppclass CCEaseSineIn(CCActionEase):
        pass
    CCEaseSineIn* CCEaseSineIn_create"cocos2d::CCEaseSineIn::create"(CCActionInterval* pAction)

    cppclass CCEaseSineOut(CCActionEase):
        pass
    CCEaseSineOut* CCEaseSineOut_create"cocos2d::CCEaseSineOut::create"(CCActionInterval* pAction)

    cppclass CCEaseSineInOut(CCActionEase):
        pass
    CCEaseSineInOut* CCEaseSineInOut_create"cocos2d::CCEaseSineInOut::create"(CCActionInterval* pAction)


    cppclass CCEaseElastic(CCActionEase):
        inline float getPeriod()
        inline void setPeriod(float fPeriod)
        bool initWithAction(CCActionInterval *pAction, float fPeriod)# = 0.3)
    CCEaseElastic* CCEaseElastic_create"cocos2d::CCEaseElastic::create"(CCActionInterval *pAction, float fPeriod)
    CCEaseElastic* CCEaseElastic_create"cocos2d::CCEaseElastic::create"(CCActionInterval *pAction)


    cppclass CCEaseElasticIn(CCEaseElastic):
        pass
    CCEaseElasticIn* CCEaseElasticIn_create"cocos2d::CCEaseElasticIn::create"(CCActionInterval *pAction, float fPeriod)
    CCEaseElasticIn* CCEaseElasticIn_create"cocos2d::CCEaseElasticIn::create"(CCActionInterval *pAction)


    cppclass CCEaseElasticOut(CCEaseElastic):
        pass
    CCEaseElasticOut* CCEaseElasticOut_create"cocos2d::CCEaseElasticOut::create"(CCActionInterval *pAction, float fPeriod)
    CCEaseElasticOut* CCEaseElasticOut_create"cocos2d::CCEaseElasticOut::create"(CCActionInterval *pAction)


    cppclass CCEaseElasticInOut(CCEaseElastic):
        pass
    CCEaseElasticInOut* CCEaseElasticInOut_create"cocos2d::CCEaseElasticInOut::create"(CCActionInterval *pAction, float fPeriod)
    CCEaseElasticInOut* CCEaseElasticInOut_create"cocos2d::CCEaseElasticInOut::create"(CCActionInterval *pAction)


    cppclass CCEaseBounce(CCActionEase):
        pass
    CCEaseBounce* CCEaseBounce_create"cocos2d::CCEaseBounce::create"(CCActionInterval* pAction)


    cppclass CCEaseBounceIn(CCEaseBounce):
        pass
    CCEaseBounceIn* CCEaseBounceIn_create"cocos2d::CCEaseBounceIn::create"(CCActionInterval* pAction)


    cppclass CCEaseBounceOut(CCEaseBounce):
        pass
    CCEaseBounceOut* CCEaseBounceOut_create"cocos2d::CCEaseBounceOut::create"(CCActionInterval* pAction)


    cppclass CCEaseBounceInOut(CCEaseBounce):
        pass
    CCEaseBounceInOut* CCEaseBounceInOut_create"cocos2d::CCEaseBounceInOut::create"(CCActionInterval* pAction)


    cppclass CCEaseBackIn(CCActionEase):
        pass
    CCEaseBackIn* CCEaseBackIn_create"cocos2d::CCEaseBackIn::create"(CCActionInterval* pAction)


    cppclass CCEaseBackOut(CCActionEase):
        pass
    CCEaseBackOut* CCEaseBackOut_create"cocos2d::CCEaseBackOut::create"(CCActionInterval* pAction)


    cppclass CCEaseBackInOut(CCActionEase):
        pass
    CCEaseBackInOut* CCEaseBackInOut_create"cocos2d::CCEaseBackInOut::create"(CCActionInterval* pAction)


    cppclass CCActionInstant(CCFiniteTimeAction):
        CCActionInstant()


    cppclass CCShow(CCActionInstant):
        CCShow()
    CCShow * CCShow_create"cocos2d::CCShow::create"()


    cppclass CCHide(CCActionInstant):
        CCHide()
    CCHide * CCHide_create"cocos2d::CCHide::create"()


    cppclass CCToggleVisibility(CCActionInstant):
        CCToggleVisibility()
    CCToggleVisibility * CCToggleVisibility_create"cocos2d::CCToggleVisibility::create"()


    cppclass CCFlipX(CCActionInstant):
        CCFlipX()
        bool initWithFlipX(bool x)
    CCFlipX * CCFlipX_create"cocos2d::CCFlipX::create"(bool x)


    cppclass CCFlipY(CCActionInstant):
        CCFlipY()
        bool initWithFlipY(bool y)
    CCFlipY* CCFlipY_create"cocos2d::CCFlipY::create"(bool y)


    cppclass CCPlace(CCActionInstant):
        CCPlace()
    CCPlace * CCPlace_create"cocos2d::CCPlace::create"(const CCPoint& pos)


    cppclass CCCallFunc(CCActionInstant):
        CCCallFunc()
        void execute()
        inline CCObject* getTargetCallback()
        inline void setTargetCallback(CCObject* pSel)
        inline int getScriptHandler()
    CCCallFunc * CCCallFunc_create"cocos2d::CCCallFunc::create"(int nHandler)
    CCCallFunc * CCCallFunc_create"cocos2d::CCCallFunc::create"(CCObject* pSelectorTarget, SEL_CallFunc selector)


    cppclass CCCallFuncN(CCCallFunc):
        CCCallFuncN()
        long getClassTypeInfo()
    CCCallFuncN * CCCallFuncN_create"cocos2d::CCCallFuncN::create"(int nHandler)
    CCCallFuncN * CCCallFuncN_create"cocos2d::CCCallFuncN::create"(CCObject* pSelectorTarget, SEL_CallFuncN selector)


    cppclass CCCallFuncND(CCCallFuncN):
        long getClassTypeInfo()
    CCCallFuncND * CCCallFuncND_create"cocos2d::CCCallFuncND::create"(CCObject* pSelectorTarget, SEL_CallFuncND selector, void* d)


    cppclass CCCallFuncO(CCCallFunc):
        CCCallFuncO()
        void execute()
        long getClassTypeInfo()
        inline CCObject* getObject()
        inline void setObject(CCObject* pObj)
    CCCallFuncO * CCCallFuncO_create"cocos2d::CCCallFuncO::create"(CCObject* pSelectorTarget, SEL_CallFuncO selector, CCObject* pObject)



    cppclass CCActionTweenDelegate:
        void updateTweenAction(float value, const char* key)


    cppclass CCActionTween(CCActionInterval):
        pass
    CCActionTween* CCActionTween_create"cocos2d::CCActionTween::create"(float aDuration, const char* key, float from1, float to)



    cppclass CCActionManager(CCObject):
        CCActionManager()
        void addAction(CCAction *pAction, CCNode *pTarget, bool paused)

        void removeAllActions()

        void removeAllActionsFromTarget(CCObject *pTarget)

        void removeAction(CCAction *pAction)

        void removeActionByTag(unsigned int tag, CCObject *pTarget)

        CCAction* getActionByTag(unsigned int tag, CCObject *pTarget)

        unsigned int numberOfRunningActionsInTarget(CCObject *pTarget)

        void pauseTarget(CCObject *pTarget)

        void resumeTarget(CCObject *pTarget)
        
        CCSet* pauseAllRunningActions()
        
        void resumeTargets(CCSet *targetsToResume)




#-----------
#-----------
#-----------
#-----------
#-----------
