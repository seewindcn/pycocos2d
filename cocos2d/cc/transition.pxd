# distutils: language = c++

from libcpp cimport bool
from cocoa cimport *
from ccNode cimport CCNode
from actions cimport *
from ccScene cimport *

cdef extern from "cocos2d.h" namespace "cocos2d":
    ctypedef enum tOrientation:
        kCCTransitionOrientationLeftOver
        kCCTransitionOrientationRightOver
        kCCTransitionOrientationUpOver = 0
        kCCTransitionOrientationDownOver = 1,
        


    cppclass CCTransitionEaseScene:
        CCActionInterval* easeActionWithAction(CCActionInterval * action)

    cppclass CCTransitionScene(CCScene):
        CCTransitionScene()
        void draw()
        void onEnter()
        void onExit()
        void cleanup()
        bool initWithDuration(float t,CCScene* scene)
        void finish()
        void hideOutShowIn()
    CCTransitionScene * CCTransitionScene_create"cocos2d::CCTransitionScene::create"(float t, CCScene *scene)


    cppclass CCTransitionSceneOriented(CCTransitionScene):
        CCTransitionSceneOriented()
        bool initWithDuration(float t,CCScene* scene,tOrientation orientation)

    CCTransitionSceneOriented * CCTransitionSceneOriented_create"cocos2d::CCTransitionSceneOriented::create"(float t,CCScene* scene, tOrientation orientation)


    cppclass CCTransitionRotoZoom(CCTransitionScene):
        CCTransitionRotoZoom()
        void onEnter()
    CCTransitionRotoZoom* CCTransitionRotoZoom_create"cocos2d::CCTransitionRotoZoom::create"(float t, CCScene* scene)


    cppclass CCTransitionJumpZoom(CCTransitionScene):
        CCTransitionJumpZoom()
        void onEnter()
    CCTransitionJumpZoom* CCTransitionJumpZoom_create"cocos2d::CCTransitionJumpZoom::create"(float t, CCScene* scene)


    cppclass CCTransitionMoveInL(CCTransitionScene):
        CCTransitionMoveInL()
        void initScenes()
        CCActionInterval* action()

        CCActionInterval* easeActionWithAction(CCActionInterval * action)

        void onEnter()

    CCTransitionMoveInL* CCTransitionMoveInL_create"cocos2d::CCTransitionMoveInL::create"(float t, CCScene* scene)


    cppclass CCTransitionMoveInR(CCTransitionMoveInL):
        CCTransitionMoveInR()
        void initScenes()

    CCTransitionMoveInR* CCTransitionMoveInR_create"cocos2d::CCTransitionMoveInR::create"(float t, CCScene* scene)



    cppclass CCTransitionMoveInT(CCTransitionMoveInL):
        CCTransitionMoveInT()
        void initScenes()

    CCTransitionMoveInT* CCTransitionMoveInT_create"cocos2d::CCTransitionMoveInT::create"(float t, CCScene* scene)


    cppclass CCTransitionMoveInB(CCTransitionMoveInL):
        CCTransitionMoveInB()
        void initScenes()

    CCTransitionMoveInB* CCTransitionMoveInB_create"cocos2d::CCTransitionMoveInB::create"(float t, CCScene* scene)



    cppclass CCTransitionSlideInL(CCTransitionScene):
        CCTransitionSlideInL()
        void initScenes()
        CCActionInterval* action()

        void onEnter()
        
        CCActionInterval* easeActionWithAction(CCActionInterval * action)

    CCTransitionSlideInL* CCTransitionSlideInL_create"cocos2d::CCTransitionSlideInL::create"(float t, CCScene* scene)



    cppclass CCTransitionSlideInR(CCTransitionSlideInL):
        CCTransitionSlideInR()
        void initScenes()
        CCActionInterval* action()

    CCTransitionSlideInR* CCTransitionSlideInR_create"cocos2d::CCTransitionSlideInR::create"(float t, CCScene* scene)


    cppclass CCTransitionSlideInB(CCTransitionSlideInL):
        CCTransitionSlideInB()
        void initScenes()
        CCActionInterval* action()

    CCTransitionSlideInB* CCTransitionSlideInB_create"cocos2d::CCTransitionSlideInB::create"(float t, CCScene* scene)


    cppclass CCTransitionSlideInT(CCTransitionSlideInL):
        CCTransitionSlideInT()

        void initScenes()
        CCActionInterval* action()

    CCTransitionSlideInT* CCTransitionSlideInT_create"cocos2d::CCTransitionSlideInT::create"(float t, CCScene* scene)



    cppclass CCTransitionShrinkGrow(CCTransitionScene):
        CCTransitionShrinkGrow()
        void onEnter()
        CCActionInterval* easeActionWithAction(CCActionInterval * action)

    CCTransitionShrinkGrow* CCTransitionShrinkGrow_create"cocos2d::CCTransitionShrinkGrow::create"(float t, CCScene* scene)



    cppclass CCTransitionFlipX(CCTransitionSceneOriented):
        CCTransitionFlipX()
        void onEnter()

    CCTransitionFlipX* CCTransitionFlipX_create"cocos2d::CCTransitionFlipX::create"(float t, CCScene* s, tOrientation o)
    CCTransitionFlipX* CCTransitionFlipX_create"cocos2d::CCTransitionFlipX::create"(float t, CCScene* s)



    cppclass CCTransitionFlipY(CCTransitionSceneOriented):
        CCTransitionFlipY()
        void onEnter()

    CCTransitionFlipY* CCTransitionFlipY_create"cocos2d::CCTransitionFlipY::create"(float t, CCScene* s, tOrientation o)
    CCTransitionFlipY* CCTransitionFlipY_create"cocos2d::CCTransitionFlipY::create"(float t, CCScene* s)



    cppclass CCTransitionFlipAngular(CCTransitionSceneOriented):
        CCTransitionFlipAngular()

        void onEnter()
        
    CCTransitionFlipAngular* CCTransitionFlipAngular_create"cocos2d::CCTransitionFlipAngular::create"(float t, CCScene* s, tOrientation o)
    CCTransitionFlipAngular* CCTransitionFlipAngular_create"cocos2d::CCTransitionFlipAngular::create"(float t, CCScene* s)



    cppclass CCTransitionZoomFlipX(CCTransitionSceneOriented):
        CCTransitionZoomFlipX()

        void onEnter()

    CCTransitionZoomFlipX* CCTransitionZoomFlipX_create"cocos2d::CCTransitionZoomFlipX::create"(float t, CCScene* s, tOrientation o)
    CCTransitionZoomFlipX* CCTransitionZoomFlipX_create"cocos2d::CCTransitionZoomFlipX::create"(float t, CCScene* s)



    cppclass CCTransitionZoomFlipY(CCTransitionSceneOriented):
        CCTransitionZoomFlipY()

        void onEnter()

    CCTransitionZoomFlipY* CCTransitionZoomFlipY_create"cocos2d::CCTransitionZoomFlipY::create"(float t, CCScene* s, tOrientation o)
    CCTransitionZoomFlipY* CCTransitionZoomFlipY_create"cocos2d::CCTransitionZoomFlipY::create"(float t, CCScene* s)


    cppclass CCTransitionZoomFlipAngular(CCTransitionSceneOriented):
        CCTransitionZoomFlipAngular()

        void onEnter()

    CCTransitionZoomFlipAngular* CCTransitionZoomFlipAngular_create"cocos2d::CCTransitionZoomFlipAngular::create"(float t, CCScene* s, tOrientation o)
    CCTransitionZoomFlipAngular* CCTransitionZoomFlipAngular_create"cocos2d::CCTransitionZoomFlipAngular::create"(float t, CCScene* s)



    cppclass CCTransitionFade(CCTransitionScene):
        CCTransitionFade()
        bool initWithDuration(float t, CCScene*scene ,const ccColor3B& color)
        bool initWithDuration(float t,CCScene* scene) 
        void onEnter()
        void onExit()

    CCTransitionFade* CCTransitionFade_create"cocos2d::CCTransitionFade::create"(float duration,CCScene* scene, const ccColor3B& color)
    CCTransitionFade* CCTransitionFade_create"cocos2d::CCTransitionFade::create"(float duration,CCScene* scene)


    cppclass CCRenderTexture:
        pass

    cppclass CCTransitionCrossFade(CCTransitionScene):
        CCTransitionCrossFade()

        void draw()
        void onEnter()
        void onExit()

    CCTransitionCrossFade* CCTransitionCrossFade_create"cocos2d::CCTransitionCrossFade::create"(float t, CCScene* scene)



    cppclass CCTransitionTurnOffTiles(CCTransitionScene):
        CCTransitionTurnOffTiles()

        void onEnter()
        CCActionInterval * easeActionWithAction(CCActionInterval * action)

    CCTransitionTurnOffTiles* CCTransitionTurnOffTiles_create"cocos2d::CCTransitionTurnOffTiles::create"(float t, CCScene* scene)



    cppclass CCTransitionSplitCols(CCTransitionScene):
        CCTransitionSplitCols()

        CCActionInterval* action()
        void onEnter()
        CCActionInterval * easeActionWithAction(CCActionInterval * action)

    CCTransitionSplitCols* CCTransitionSplitCols_create"cocos2d::CCTransitionSplitCols::create"(float t, CCScene* scene)


    cppclass CCTransitionSplitRows(CCTransitionSplitCols):
        CCTransitionSplitRows()

        CCActionInterval* action()

    CCTransitionSplitRows* CCTransitionSplitRows_create"cocos2d::CCTransitionSplitRows::create"(float t, CCScene* scene)


    cppclass CCTransitionFadeTR(CCTransitionScene):
        CCTransitionFadeTR()
        CCActionInterval* actionWithSize(const CCSize& size)
        void onEnter()
        CCActionInterval* easeActionWithAction(CCActionInterval * action)

    CCTransitionFadeTR* CCTransitionFadeTR_create"cocos2d::CCTransitionFadeTR::create"(float t, CCScene* scene)


    cppclass CCTransitionFadeBL(CCTransitionFadeTR):
        CCTransitionFadeBL()
        CCActionInterval* actionWithSize(const CCSize& size)

    CCTransitionFadeBL* CCTransitionFadeBL_create"cocos2d::CCTransitionFadeBL::create"(float t, CCScene* scene)


    cppclass CCTransitionFadeUp(CCTransitionFadeTR):
        CCTransitionFadeUp()
        CCActionInterval* actionWithSize(const CCSize& size)

    CCTransitionFadeUp* CCTransitionFadeUp_create"cocos2d::CCTransitionFadeUp::create"(float t, CCScene* scene)


    cppclass CCTransitionFadeDown(CCTransitionFadeTR):
        CCTransitionFadeDown()
        CCActionInterval* actionWithSize(const CCSize& size)

    CCTransitionFadeDown* CCTransitionFadeDown_create"cocos2d::CCTransitionFadeDown::create"(float t, CCScene* scene)



    cppclass CCTransitionPageTurn(CCTransitionScene):
        CCTransitionPageTurn()
        bool initWithDuration(float t,CCScene* scene,bool backwards)
        CCActionInterval* actionWithSize(const CCSize& vector)
        void onEnter()

    CCTransitionPageTurn* CCTransitionPageTurn_create"cocos2d::CCTransitionPageTurn::create"(float t,CCScene* scene,bool backwards)



    cppclass CCTransitionProgress(CCTransitionScene):
        CCTransitionProgress()
        void onEnter()
        void onExit()
    CCTransitionProgress* CCTransitionProgress_create"cocos2d::CCTransitionProgress::create"(float t, CCScene* scene)


    cppclass CCTransitionProgressRadialCCW(CCTransitionProgress):
        pass
    CCTransitionProgressRadialCCW* CCTransitionProgressRadialCCW_create"cocos2d::CCTransitionProgressRadialCCW::create"(float t, CCScene* scene)


    cppclass CCTransitionProgressRadialCW(CCTransitionProgress):
        pass
    CCTransitionProgressRadialCW* CCTransitionProgressRadialCW_create"cocos2d::CCTransitionProgressRadialCW::create"(float t, CCScene* scene)


    cppclass CCTransitionProgressHorizontal(CCTransitionProgress):
        pass
    CCTransitionProgressHorizontal* CCTransitionProgressHorizontal_create"cocos2d::CCTransitionProgressHorizontal::create"(float t, CCScene* scene)


    cppclass CCTransitionProgressVertical(CCTransitionProgress):
        pass
    CCTransitionProgressVertical* CCTransitionProgressVertical_create"cocos2d::CCTransitionProgressVertical::create"(float t, CCScene* scene)


    cppclass CCTransitionProgressInOut(CCTransitionProgress):
        pass
    CCTransitionProgressInOut* CCTransitionProgressInOut_create"cocos2d::CCTransitionProgressInOut::create"(float t, CCScene* scene)


    cppclass CCTransitionProgressOutIn(CCTransitionProgress):
        pass
    CCTransitionProgressOutIn* CCTransitionProgressOutIn_create"cocos2d::CCTransitionProgressOutIn::create"(float t, CCScene* scene)






