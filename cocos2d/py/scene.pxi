cdef class CCScene(CCNode):
    cdef inline ccScene.CCScene *scene(self):
        return <ccScene.CCScene*> self._co

    @classmethod
    def create(cls):
        cdef CCScene o = cls()
        o._co = <cocoa.CCObject*>ccScene.CCScene_create()
        return o


#--------------transition.pxd---------------
cdef class CCTransitionScene(CCScene):
    cdef inline transition.CCTransitionScene* trans(self):
        return <transition.CCTransitionScene*>self._co

    @classmethod
    def create(cls, t, CCScene scene):
        cdef CCTransitionScene o = cls()
        o._co = <cocoa.CCObject*>transition.CCTransitionScene_create(t, scene.scene())
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionScene()
    # bool initWithDuration(t,CCScene* scene)

    def finish(self):
        self.trans().finish()

    def hideOutShowIn(self):
        self.trans().hideOutShowIn()



cdef class CCTransitionSceneOriented(CCTransitionScene):
    cdef inline transition.CCTransitionSceneOriented* oriented(self):
        return <transition.CCTransitionSceneOriented*>self._co

    @classmethod
    def create(cls, t,CCScene scene, transition.tOrientation orientation):
        cdef CCTransitionSceneOriented o = cls()
        o._co = <cocoa.CCObject*>transition.CCTransitionSceneOriented_create(
                t, scene.scene(), orientation)
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionSceneOriented()

    # bool initWithDuration(float t,CCScene* scene,tOrientation orientation)



cdef class CCTransitionRotoZoom(CCTransitionScene):
    cdef inline transition.CCTransitionRotoZoom* zoom(self):
        return <transition.CCTransitionRotoZoom*>self._co

    @classmethod
    def create(cls, t, CCScene scene):
        cdef CCTransitionRotoZoom o = cls()
        o._co = <cocoa.CCObject*>transition.CCTransitionRotoZoom_create(t, scene.scene())
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionRotoZoom()



cdef class CCTransitionJumpZoom(CCTransitionScene):
    cdef inline transition.CCTransitionJumpZoom* zoom(self):
        return <transition.CCTransitionJumpZoom*>self._co

    @classmethod
    def create(cls, t, CCScene scene):
        cdef CCTransitionJumpZoom o = cls()
        o._co = <cocoa.CCObject*>transition.CCTransitionJumpZoom_create(
                t, scene.scene())
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionJumpZoom()



cdef class CCTransitionMoveInL(CCTransitionScene):
    cdef inline transition.CCTransitionMoveInL* moveInL(self):
        return <transition.CCTransitionMoveInL*>self._co

    @classmethod
    def create(cls, t, CCScene scene):
        cdef CCTransitionMoveInL o = cls()
        o._co = transition.CCTransitionMoveInL_create(t, scene.scene())
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionMoveInL()

    def initScenes(self):
        self.moveInL().initScenes()

    def action(self, cls=CCActionInterval):
        cdef CCActionInterval o = cls()
        o._co = <cocoa.CCObject*>self.moveInL().action()
        return o

    def easeActionWithAction(self, CCActionInterval action, cls=CCActionInterval):
        cdef CCActionInterval o = cls()
        o._co = <cocoa.CCObject*>self.moveInL().easeActionWithAction(action.interval())
        return o



cdef class CCTransitionMoveInR(CCTransitionMoveInL):
    cdef inline transition.CCTransitionMoveInR* moveInR(self):
        return <transition.CCTransitionMoveInR*>self._co

    @classmethod
    def create(cls, t, CCScene scene):
        cdef CCTransitionMoveInR o = cls()
        o._co = <cocoa.CCObject*>transition.CCTransitionMoveInR_create(t, scene.scene())
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionMoveInR()



cdef class CCTransitionMoveInT(CCTransitionMoveInL):
    cdef inline transition.CCTransitionMoveInT* moveInT(self):
        return <transition.CCTransitionMoveInT*>self._co

    @classmethod
    def create(cls, t, CCScene scene):
        cdef CCTransitionMoveInT o = cls()
        o._co = <cocoa.CCObject*>transition.CCTransitionMoveInT_create(t, scene.scene())
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionMoveInT()


cdef class CCTransitionMoveInB(CCTransitionMoveInL):
    cdef inline transition.CCTransitionMoveInB* moveInB(self):
        return <transition.CCTransitionMoveInB*>self._co

    @classmethod
    def create(cls, t, CCScene scene):
        cdef CCTransitionMoveInB o = cls()
        o._co = <cocoa.CCObject*>transition.CCTransitionMoveInB_create(t, scene.scene())
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionMoveInB()



cdef class CCTransitionSlideInL(CCTransitionScene):
    cdef inline transition.CCTransitionSlideInL* slideInL(self):
        return <transition.CCTransitionSlideInL*>self._co

    @classmethod
    def create(cls, t, CCScene scene):
        cdef CCTransitionSlideInL o = cls()
        o._co = <cocoa.CCObject*>transition.CCTransitionSlideInL_create(t, scene.scene())
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionSlideInL()

    def initScenes(self):
        self.slideInL().initScenes()

    def action(self, cls=CCActionInterval):
        cdef CCActionInterval o = cls()
        o._co = <cocoa.CCObject*>self.slideInL().action()
        return o

    def easeActionWithAction(self, CCActionInterval action, cls=CCActionInterval):
        cdef CCActionInterval o = cls()
        o._co = <cocoa.CCObject*>self.slideInL().easeActionWithAction(action.interval())
        return o


cdef class CCTransitionSlideInR(CCTransitionSlideInL):
    cdef inline transition.CCTransitionSlideInR* slideInR(self):
        return <transition.CCTransitionSlideInR*>self._co

    @classmethod
    def create(cls, t, CCScene scene):
        cdef CCTransitionSlideInR o = cls()
        o._co = <cocoa.CCObject*>transition.CCTransitionMoveInR_create(t, scene.scene())
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionSlideInR()


cdef class CCTransitionSlideInB(CCTransitionSlideInL):
    cdef inline transition.CCTransitionSlideInB* slideInB(self):
        return <transition.CCTransitionSlideInB*>self._co

    @classmethod
    def create(cls, t, CCScene scene):
        cdef CCTransitionSlideInB o = cls()
        o._co = <cocoa.CCObject*>transition.CCTransitionSlideInB_create(t, scene.scene())
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionSlideInB()


cdef class CCTransitionSlideInT(CCTransitionSlideInL):
    cdef inline transition.CCTransitionSlideInT* slideInT(self):
        return <transition.CCTransitionSlideInT*>self._co

    @classmethod
    def create(cls, t, CCScene scene):
        cdef CCTransitionSlideInT o = cls()
        o._co = <cocoa.CCObject*>transition.CCTransitionSlideInT_create(t, scene.scene())
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionSlideInT()


cdef class CCTransitionShrinkGrow(CCTransitionScene):
    cdef inline transition.CCTransitionShrinkGrow* grow(self):
        return <transition.CCTransitionShrinkGrow*>self._co

    @classmethod
    def create(cls, t, CCScene scene):
        cdef CCTransitionShrinkGrow o = cls()
        o._co = <cocoa.CCObject*>transition.CCTransitionShrinkGrow_create(t, scene.scene())
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionShrinkGrow()

    def easeActionWithAction(self, CCActionInterval action, cls=CCActionInterval):
        cdef CCActionInterval o = cls()
        o._co = <cocoa.CCObject*>self.grow().easeActionWithAction(action.interval())
        return o



cdef class CCTransitionFlipX(CCTransitionSceneOriented):
    cdef inline transition.CCTransitionFlipX* flipX(self):
        return <transition.CCTransitionFlipX*>self._co

    @classmethod
    def create(cls, t, CCScene s, orientation=None):
        cdef CCTransitionFlipX o = cls()
        if orientation is None:
            o._co = <cocoa.CCObject*>transition.CCTransitionFlipX_create(t, s.scene())
        else:
            o._co = <cocoa.CCObject*>transition.CCTransitionFlipX_create(t, s.scene(), orientation)
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionFlipX()




cdef class CCTransitionFlipY(CCTransitionSceneOriented):
    cdef inline transition.CCTransitionFlipY* flipY(self):
        return <transition.CCTransitionFlipY*>self._co

    @classmethod
    def create(cls, t, CCScene s, orientation=None):
        cdef CCTransitionFlipY o = cls()
        if orientation is None:
            o._co = <cocoa.CCObject*>transition.CCTransitionFlipY_create(t, s.scene())
        else:
            o._co = <cocoa.CCObject*>transition.CCTransitionFlipY_create(t, s.scene(), orientation)
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionFlipY()



cdef class CCTransitionFlipAngular(CCTransitionSceneOriented):
    cdef inline transition.CCTransitionFlipAngular* lar(self):
        return <transition.CCTransitionFlipAngular*>self._co

    @classmethod
    def create(cls, t, CCScene s, orientation=None):
        cdef CCTransitionFlipAngular o = cls()
        if orientation is None:
            o._co = <cocoa.CCObject*>transition.CCTransitionFlipAngular_create(t, s.scene())
        else:
            o._co = <cocoa.CCObject*>transition.CCTransitionFlipAngular_create(t, s.scene(), orientation)
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionFlipAngular()

    

cdef class CCTransitionZoomFlipX(CCTransitionSceneOriented):
    cdef inline transition.CCTransitionZoomFlipX* flipX(self):
        return <transition.CCTransitionZoomFlipX*>self._co

    @classmethod
    def create(cls, t, CCScene s, orientation=None):
        cdef CCTransitionZoomFlipX o = cls()
        if orientation is None:
            o._co = <cocoa.CCObject*>transition.CCTransitionZoomFlipX_create(t, s.scene())
        else:
            o._co = <cocoa.CCObject*>transition.CCTransitionZoomFlipX_create(t, s.scene(), orientation)

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionZoomFlipX()



cdef class CCTransitionZoomFlipY(CCTransitionSceneOriented):
    cdef inline transition.CCTransitionZoomFlipY* flipY(self):
        return <transition.CCTransitionZoomFlipY*>self._co

    @classmethod
    def create(cls, t, CCScene s, orientation=None):
        cdef CCTransitionZoomFlipY o = cls()
        if orientation is None:
            o._co = <cocoa.CCObject*>transition.CCTransitionZoomFlipY_create(t, s.scene())
        else:
            o._co = <cocoa.CCObject*>transition.CCTransitionZoomFlipY_create(t, s.scene(), orientation)

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionZoomFlipY()



cdef class CCTransitionZoomFlipAngular(CCTransitionSceneOriented):
    cdef inline transition.CCTransitionZoomFlipAngular* lar(self):
        return <transition.CCTransitionZoomFlipAngular*>self._co

    @classmethod
    def create(cls, t, CCScene s, orientation=None):
        cdef CCTransitionZoomFlipAngular o = cls()
        if orientation is None:
            o._co = <cocoa.CCObject*>transition.CCTransitionZoomFlipAngular_create(t, 
                    s.scene())
        else:
            o._co = <cocoa.CCObject*>transition.CCTransitionZoomFlipAngular_create(t, 
                    s.scene(), orientation)
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionZoomFlipAngular()




cdef class CCTransitionFade(CCTransitionScene):
    cdef inline transition.CCTransitionFade* fade(self):
        return <transition.CCTransitionFade*>self._co

    @classmethod
    def create(cls, duration, CCScene scene, ccColor3B color=None):
        cdef CCTransitionFade o = cls()
        if ccColor3B is None:
            o._co = <cocoa.CCObject*>transition.CCTransitionFade_create(duration, 
                    scene.scene())
        else:
            o._co = <cocoa.CCObject*>transition.CCTransitionFade_create(duration, 
                    scene.scene(), color._co)
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionFade()

    # bool initWithDuration(t, CCScene*scene ,const ccColor3B& color)
    # bool initWithDuration(t,CCScene* scene) 
    # void onEnter()
    # void onExit()


cdef class CCTransitionCrossFade(CCTransitionScene):
    cdef inline transition.CCTransitionCrossFade* cfade(self):
        return <transition.CCTransitionCrossFade*>self._co

    @classmethod
    def create(cls, t, CCScene scene):
        cdef CCTransitionCrossFade o = cls()
        o._co = <cocoa.CCObject*>transition.CCTransitionCrossFade_create(t, scene.scene())
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionCrossFade()

    # void draw()
    # void onEnter()
    # void onExit()




cdef class CCTransitionTurnOffTiles(CCTransitionScene):
    cdef inline transition.CCTransitionTurnOffTiles* tiles(self):
        return <transition.CCTransitionTurnOffTiles*>self._co

    @classmethod
    def create(cls, t, CCScene scene):
        cdef CCTransitionTurnOffTiles o = cls()
        o._co = <cocoa.CCObject*>transition.CCTransitionTurnOffTiles_create(t, 
                scene.scene())
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionTurnOffTiles()

    # void onEnter()
    def easeActionWithAction(self, CCActionInterval action):
        cdef CCActionInterval o = CCActionInterval()
        o._co = <cocoa.CCObject*>self.tiles().easeActionWithAction(action.interval())
        return o



cdef class CCTransitionSplitCols(CCTransitionScene):
    cdef inline transition.CCTransitionSplitCols* cols(self):
        return <transition.CCTransitionSplitCols*>self._co

    @classmethod
    def create(cls, t, CCScene scene):
        cdef CCTransitionSplitCols o = cls()
        o._co = <cocoa.CCObject*>transition.CCTransitionSplitCols_create(t,
                scene.scene())
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionSplitCols()

    def action(self, cls=CCActionInterval):
        cdef CCActionInterval o = cls()
        o._co = <cocoa.CCObject*>self.cols().action()
        return o

    # void onEnter()
    def easeActionWithAction(self, CCActionInterval action):
        cdef CCActionInterval o = CCActionInterval()
        o._co = <cocoa.CCObject*>self.cols().easeActionWithAction(action.interval())
        return o



cdef class CCTransitionSplitRows(CCTransitionSplitCols):
    cdef inline transition.CCTransitionSplitRows* rows(self):
        return <transition.CCTransitionSplitRows*>self._co

    @classmethod
    def create(cls, t, CCScene scene):
        cdef CCTransitionSplitRows o = cls()
        o._co = <cocoa.CCObject*>transition.CCTransitionSplitRows_create(t,
                scene.scene())
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionSplitRows()



cdef class CCTransitionFadeTR(CCTransitionScene):
    cdef inline transition.CCTransitionFadeTR* tr(self):
        return <transition.CCTransitionFadeTR*>self._co

    @classmethod
    def create(cls, t, CCScene scene):
        cdef CCTransitionFadeTR o = cls()
        o._co = <cocoa.CCObject*>transition.CCTransitionFadeTR_create(t,
                scene.scene())
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionFadeTR()

    def actionWithSize(self, CCSize size, cls=CCActionInterval):
        cdef CCActionInterval o = cls()
        o._co = <cocoa.CCObject*>self.tr().actionWithSize(size._co)
        return o

    def easeActionWithAction(self, CCActionInterval action):
        cdef CCActionInterval o = CCActionInterval()
        o._co = <cocoa.CCObject*>self.tr().easeActionWithAction(action.interval())
        return o



cdef class CCTransitionFadeBL(CCTransitionFadeTR):
    cdef inline transition.CCTransitionFadeBL* bl(self):
        return <transition.CCTransitionFadeBL*>self._co

    @classmethod
    def create(cls, t, CCScene scene):
        cdef CCTransitionFadeBL o = cls()
        o._co = <cocoa.CCObject*>transition.CCTransitionFadeBL_create(t,
                scene.scene())
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionFadeBL()




cdef class CCTransitionFadeUp(CCTransitionFadeTR):
    cdef inline transition.CCTransitionFadeUp* up(self):
        return <transition.CCTransitionFadeUp*>self._co

    @classmethod
    def create(cls, t, CCScene scene):
        cdef CCTransitionFadeUp o = cls()
        o._co = <cocoa.CCObject*>transition.CCTransitionFadeUp_create(t,
                scene.scene())
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionFadeTR()



cdef class CCTransitionFadeDown(CCTransitionFadeTR):
    cdef inline transition.CCTransitionFadeDown* down(self):
        return <transition.CCTransitionFadeDown*>self._co

    @classmethod
    def create(cls, t, CCScene scene):
        cdef CCTransitionFadeDown o = cls()
        o._co = <cocoa.CCObject*>transition.CCTransitionFadeDown_create(t,
                scene.scene())
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionFadeDown()



cdef class CCTransitionPageTurn(CCTransitionScene):
    cdef inline transition.CCTransitionPageTurn* turn(self):
        return <transition.CCTransitionPageTurn*>self._co

    @classmethod
    def create(cls, t, CCScene scene, bool backwards):
        cdef CCTransitionPageTurn o = cls()
        o._co = <cocoa.CCObject*>transition.CCTransitionPageTurn_create(t,
                scene.scene(), backwards)
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionPageTurn()

    # bool initWithDuration(float t,CCScene* scene,bool backwards)
    def actionWithSize(self, CCSize size, cls=CCActionInterval):
        cdef CCActionInterval o = cls()
        o._co = <cocoa.CCObject*>self.turn().actionWithSize(size._co)
        return o




cdef class CCTransitionProgress(CCTransitionScene):
    cdef inline transition.CCTransitionProgress* progress(self):
        return <transition.CCTransitionProgress*>self._co

    @classmethod
    def create(cls, t, CCScene scene):
        cdef CCTransitionProgress o = cls()
        o._co = <cocoa.CCObject*>transition.CCTransitionProgress_create(t,
                scene.scene())
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionProgress()



# cppclass CCTransitionProgressRadialCCW(CCTransitionProgress):
#     pass
# CCTransitionProgressRadialCCW* CCTransitionProgressRadialCCW_create"cocos2d::CCTransitionProgressRadialCCW::create"(float t, CCScene* scene)


# cppclass CCTransitionProgressRadialCW(CCTransitionProgress):
#     pass
# CCTransitionProgressRadialCW* CCTransitionProgressRadialCW_create"cocos2d::CCTransitionProgressRadialCW::create"(float t, CCScene* scene)


# cppclass CCTransitionProgressHorizontal(CCTransitionProgress):
#     pass
# CCTransitionProgressHorizontal* CCTransitionProgressHorizontal_create"cocos2d::CCTransitionProgressHorizontal::create"(float t, CCScene* scene)


# cppclass CCTransitionProgressVertical(CCTransitionProgress):
#     pass
# CCTransitionProgressVertical* CCTransitionProgressVertical_create"cocos2d::CCTransitionProgressVertical::create"(float t, CCScene* scene)


# cppclass CCTransitionProgressInOut(CCTransitionProgress):
#     pass
# CCTransitionProgressInOut* CCTransitionProgressInOut_create"cocos2d::CCTransitionProgressInOut::create"(float t, CCScene* scene)


# cppclass CCTransitionProgressOutIn(CCTransitionProgress):
#     pass
# CCTransitionProgressOutIn* CCTransitionProgressOutIn_create"cocos2d::CCTransitionProgressOutIn::create"(float t, CCScene* scene)


cdef class CCLayer(CCNode):
    cdef inline ccLayer.CCLayer *layer(self):
        return <ccLayer.CCLayer*> self._co

    @classmethod
    def create(cls):
        cdef CCLayer o = cls()
        o._co = <cocoa.CCObject*>ccLayer.CCLayer_create()
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new ccLayer.CCLayer()
        self.autorelease()
        return self

    def init(self):
        return self.layer().init()

    # def onEnter()
    # void onExit()
    # void onEnterTransitionDidFinish()

    #     # default implements are used to call script callback if exist
    #     bool ccTouchBegan(CCTouch *pTouch, CCEvent *pEvent)
    #     void ccTouchMoved(CCTouch *pTouch, CCEvent *pEvent)
    #     void ccTouchEnded(CCTouch *pTouch, CCEvent *pEvent)
    #     void ccTouchCancelled(CCTouch *pTouch, CCEvent *pEvent)
    
    #     # default implements are used to call script callback if exist
    #     void ccTouchesBegan(CCSet *pTouches, CCEvent *pEvent)
    #     void ccTouchesMoved(CCSet *pTouches, CCEvent *pEvent)
    #     void ccTouchesEnded(CCSet *pTouches, CCEvent *pEvent)
    #     void ccTouchesCancelled(CCSet *pTouches, CCEvent *pEvent)
    
    #     void didAccelerate(CCAcceleration* pAccelerationValue)
    def registerScriptAccelerateHandler(self, int nHandler):
        self.layer().registerScriptAccelerateHandler(nHandler)

    def unregisterScriptAccelerateHandler(self):
        self.layer().unregisterScriptAccelerateHandler()

    def registerWithTouchDispatcher(self):
        self.layer().registerWithTouchDispatcher()

    def registerScriptTouchHandler(self, int nHandler, 
            bool bIsMultiTouches = False, int nPriority = INT_MIN, 
            bool bSwallowsTouches = False):
        self.layer().registerScriptTouchHandler(nHandler, bIsMultiTouches,
                nPriority, bSwallowsTouches)

    def unregisterScriptTouchHandler(self):
        self.layer().unregisterScriptHandler()

    def isTouchEnabled(self):
        return self.layer().isTouchEnabled()
    def setTouchEnabled(self, bool value):
        self.layer().setTouchEnabled(value)

    def setTouchMode(self, ccLayer.ccTouchesMode mode):
        self.layer().setTouchMode(mode)
    def getTouchMode(self):
        return self.getTouchMode()

    def setTouchPriority(self, int priority):
        self.layer().setTouchPriority(priority)
    def getTouchPriority(self):
        return self.layer().getTouchPriority()

    def isAccelerometerEnabled(self):
        return self.layer().isAccelerometerEnabled()
    def setAccelerometerEnabled(self, bool value):
        self.layer().setAccelerometerEnabled(value)

    def setAccelerometerInterval(self,double interval):
        self.layer().setAccelerometerInterval(interval)

    def isKeypadEnabled(self):
        return self.layer().isKeypadEnabled()
    def setKeypadEnabled(self, bool value):
        self.layer().setKeypadEnabled(value)

    def registerScriptKeypadHandler(self, int nHandler):
        self.layer().registerScriptKeypadHandler(nHandler)
    def unregisterScriptKeypadHandler(self):
        self.layer().unregisterScriptKeypadHandler()

    def keyBackClicked(self):
        self.layer().keyBackClicked()
    def keyMenuClicked(self):
        self.layer().keyMenuClicked()

    # inline CCTouchScriptHandlerEntry* getScriptTouchHandlerEntry()
    # inline CCScriptHandlerEntry* getScriptKeypadHandlerEntry()
    # inline CCScriptHandlerEntry* getScriptAccelerateHandlerEntry()


cdef class CCLayerColor(CCLayer):
    cdef inline ccLayer.CCLayerColor* color(self):
        return <ccLayer.CCLayerColor*>self._co

    @classmethod
    def create(cls, ccColor4B color=None, width=None, height=None):
        cdef CCLayerColor o = cls()
        if color is None:
            o._co = <cocoa.CCObject*>ccLayer.CCLayerColor_create()
        elif width is None:
            o._co = <cocoa.CCObject*>ccLayer.CCLayerColor_create(color._co)
        else:
            o._co = <cocoa.CCObject*>ccLayer.CCLayerColor_create(color._co,
                    width, height)
        return o

    def initWithColor(self, ccColor4B color, width=None, height=None):
        if width is None:
            return self.color().initWithColor(color._co)
        else:
            return self.color().initWithColor(color._co,
                    width, height)


    def changeWidth(self, w):
        self.color().changeWidth(w)

    def changeHeight(self, h):
        self.color().changeHeight(h)

    def changeWidthAndHeight(self, w, h):
        self.color().changeWidthAndHeight(w, h)

    def setOpacityModifyRGB(self, bValue):
        self.color().setOpacityModifyRGB(bValue)

    def isOpacityModifyRGB(self):
        return self.color().isOpacityModifyRGB()






