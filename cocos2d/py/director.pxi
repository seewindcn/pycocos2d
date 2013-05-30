#-------------ccScheduler.pxd--------------
cdef class CCTimer(CCObject):
    cdef ccScheduler.CCTimer* timer(self):
        return <ccScheduler.CCTimer*> self._co

    @classmethod
    def timerWithTarget(cls, CallBack cb, fSeconds=None):
        cdef CCTimer o = cls()
        if fSeconds is None:
            o._co = <cocoa.CCObject*>ccScheduler.CCTimer_timerWithTarget(&cb._co, 
                    cb.get_Schedule())
        else:
            o._co = <cocoa.CCObject*>ccScheduler.CCTimer_timerWithTarget(&cb._co, 
                    cb.get_Schedule(), fSeconds)
        return o

    @classmethod
    def timerWithScriptHandler(cls, int nHandler, float fSeconds):
        o = cls()
        o.set_co(<int>ccScheduler.CCTimer_timerWithScriptHandler(nHandler, fSeconds))
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new ccScheduler.CCTimer()
        self.autorelease()
        return self

    def getInterval(self):
        return self.timer().getInterval()
    def setInterval(self, float fInterval):
        self.timer().setInterval(fInterval)
    Interval = property(getInterval, setInterval)

    # def getSelector(self):
    #     return <int>self.timer().getSelector()

    def initWithTarget(self, CallBack cb):
        return self.timer().initWithTarget(&cb._co, cb.get_Schedule())

    def initWithTarget(self, CallBack cb, 
            fSeconds=None, unsigned int nRepeat=0, float fDelay=0.0):
        if fSeconds is None:
            return self.timer().initWithTarget(&cb._co, cb.get_Schedule())
        return self.timer().initWithTarget(&cb._co, cb.get_Schedule(),
                fSeconds, nRepeat, fDelay)

    def initWithScriptHandler(self, int nHandler, float fSeconds):
        return self.timer().initWithScriptHandler(nHandler, fSeconds)

    def getScriptHandler(self):
        return self.timer().getScriptHandler()


cdef class CCScheduler(CCObject):
    cdef inline ccScheduler.CCScheduler* scheduler(self):
        return <ccScheduler.CCScheduler*>self._co

    def getTimeScale(self):
        return self.scheduler().getTimeScale()
    def setTimeScale(self, float fTimeScale):
        self.scheduler().setTimeScale(fTimeScale)
    TimeScale = property(getTimeScale, setTimeScale)

    def scheduleSelector(self, CallBack cb,
        float fInterval, repeat=None, delay=0.0, bool bPaused=False):
        if repeat is None:
            self.scheduler().scheduleSelector(cb.get_Schedule(), &cb._co,
                    fInterval, bPaused)
        else:
            self.scheduler().scheduleSelector(cb.get_Schedule(), &cb._co,
                    fInterval, repeat, delay, bPaused)

    def scheduleUpdateForTarget(self, CallBack cb, int nPriority, bool bPaused):
        self.scheduler().scheduleUpdateForTarget(&cb._co, nPriority, bPaused)

    def unscheduleSelector(self, CallBack cb):
        self.scheduler().unscheduleSelector(cb.get_Schedule(), &cb._co)

    def unscheduleUpdateForTarget(self, CCObject pTarget):
        self.scheduler().unscheduleUpdateForTarget(pTarget._co)

    def unscheduleAllForTarget(self, CCObject pTarget):
        self.scheduler().unscheduleAllForTarget(pTarget._co)

    def unscheduleAll(self):
        self.scheduler().unscheduleAll()
    
    def unscheduleAllWithMinPriority(self, int nMinPriority):
        self.scheduler().unscheduleAllWithMinPriority(nMinPriority)

    def scheduleScriptFunc(self, unsigned int nHandler, float fInterval, bool bPaused):
        return self.scheduler().scheduleScriptFunc(nHandler, fInterval, bPaused)
    
    def unscheduleScriptEntry(self, unsigned int uScheduleScriptEntryID):
        self.scheduler().unscheduleScriptEntry(uScheduleScriptEntryID)

    def pauseTarget(self, CCObject pTarget):
        self.scheduler().pauseTarget(pTarget._co)

    def resumeTarget(self, CCObject pTarget):
        self.scheduler().resumeTarget(pTarget._co)

    def isTargetPaused(self, CCObject pTarget):
        return self.scheduler().isTargetPaused(pTarget._co)

    def pauseAllTargets(self):
        o = CCSet()
        o._co = self.scheduler().pauseAllTargets()
        return o

    def pauseAllTargetsWithMinPriority(self, int nMinPriority):
        o = CCSet()
        o._co = self.scheduler().pauseAllTargetsWithMinPriority(nMinPriority)
        return o

    def resumeTargets(self, CCSet targetsToResume):
        self.scheduler().resumeTargets(targetsToResume.set())


cdef class CCDirector(CCObject):
    cdef inline ccDirector.CCDirector* director(self):
        return <ccDirector.CCDirector*> self._co

    @classmethod
    def sharedDirector(cls):
        o = cls()
        o.set_co(<int>ccDirector.sharedDirector())
        return o

    def init(self):
        return self.director().init()

    def getClassTypeInfo(self):
        return self.director().getClassTypeInfo()

    def getRunningScene(self):
        # return create_by(self.director().getRunningScene())
        cdef ccScene.CCScene* s = self.director().getRunningScene()
        if s == NULL:
            return
        o = CCScene()
        o._co = <cocoa.CCObject*>s
        return o

    def getAnimationInterval(self):
        return self.director().getAnimationInterval()
    def setAnimationInterval(self, double dValue):
        self.director().setAnimationInterval(dValue)
    AnimationInterval = property(getAnimationInterval, setAnimationInterval)

    def isDisplayStats(self):
        return self.director().isDisplayStats()
    def setDisplayStats(self, bool bDisplayStats):
        self.director().setDisplayStats(bDisplayStats)
    DisplayStats = property(isDisplayStats, setDisplayStats)

    def getSecondsPerFrame(self):
        return self.director().getSecondsPerFrame()

    def getOpenGLView(self):
        o = CCEGLView()
        o._co = self.director().getOpenGLView()
        return o
    def setOpenGLView(self, CCEGLView pobOpenGLView):
        self.director().setOpenGLView(pobOpenGLView._co)
    OpenGLView = property(getOpenGLView, setOpenGLView)

    def isNextDeltaTimeZero(self):
        return self.director().isNextDeltaTimeZero()
    def setNextDeltaTimeZero(self, bool bNextDeltaTimeZero):
        self.director().setNextDeltaTimeZero(bNextDeltaTimeZero)
    NextDeltaTimeZero = property(isNextDeltaTimeZero, setNextDeltaTimeZero)

    def isPaused(self):
        return self.director().isPaused()

    def getTotalFrames(self):
        return self.director().getTotalFrames()

    def getProjection(self):
        return self.director().getProjection()
    def setProjection(self, ccDirector.ccDirectorProjection kProjection):
        self.director().setProjection(kProjection)
    Projection = property(getProjection, setProjection)

    def isSendCleanupToScene(self):
        return self.director().isSendCleanupToScene()

    def getNotificationNode(self):
        o = CCNode()
        o._co = <cocoa.CCObject*>self.director().getNotificationNode()
        return o
    def setNotificationNode(self, CCNode node):
        self.director().setNotificationNode(node.node())
    NotificationNode = property(getNotificationNode, setNotificationNode)

    def getDelegate(self):
        o = CCDirectorDelegate()
        o._co = self.director().getDelegate()
        return o
    def setDelegate(self, CCDirectorDelegate pDelegate):
        self.director().setDelegate(pDelegate._co)
    Delegate = property(getDelegate, setDelegate)

    def getWinSize(self):
        o = CCSize()
        o._co = self.director().getWinSize()
        return o

    def getWinSizeInPixels(self):
        o = CCSize()
        o._co = self.director().getWinSizeInPixels()
        return o

    def getVisibleSize(self):
        o = CCSize()
        o._co = self.director().getVisibleSize()
        return o

    def getVisibleOrigin(self):
        o = CCPoint()
        o._co = self.director().getVisibleOrigin()
        return o

    def convertToGL(self, CCPoint obPoint):
        o = CCPoint()
        o._co = self.director().convertToGL(obPoint._co)
        return o

    def convertToUI(self, CCPoint obPoint):
        o = CCPoint()
        o._co = self.director().convertToUI(obPoint._co)
        return o

    def getZEye(self):
        return self.director().getZEye()

    def runWithScene(self, CCScene pScene):
        self.director().runWithScene(pScene.scene())

    def pushScene(self, CCScene pScene):
        self.director().pushScene(pScene.scene())

    def popScene(self):
        self.director().popScene()

    def popToRootScene(self):
        self.director().popToRootScene()

    def replaceScene(self, CCScene pScene):
        self.director().replaceScene(pScene.scene())

    def end(self):
        self.director().end()

    def pause(self):
        self.director().pause()

    def resume(self):
        self.director().resume()

    def stopAnimation(self):
        self.director().stopAnimation()

    def startAnimation(self):
        self.director().startAnimation()

    def drawScene(self):
        self.director().drawScene()

    def purgeCachedData(self):
        self.director().purgeCachedData()

    def setGLDefaultValues(self):
        self.director().setGLDefaultValues()

    def setAlphaBlending(self, bool bOn):
        self.director().setAlphaBlending(bOn)

    def setDepthTest(self, bool bOn):
        self.director().setDepthTest(bOn)

    def mainLoop(self):
        self.director().mainLoop()

    def getContentScaleFactor(self):
        return self.director().getContentScaleFactor()
    def setContentScaleFactor(self, float scaleFactor):
        self.director().setContentScaleFactor(scaleFactor)
    ContentScaleFactor = property(getContentScaleFactor, setContentScaleFactor)


    """ #CC_PROPERTY(CCScheduler*, m_pScheduler, Scheduler); """
    def getScheduler(self):
        o = CCScheduler()
        o._co = <cocoa.CCObject*>self.director().getScheduler()
        return o
    def setScheduler(self, CCScheduler var):
        self.director().setScheduler(var.scheduler())
    Scheduler = property(getScheduler, setScheduler)

    # #CC_PROPERTY(CCActionManager*, m_pActionManager, ActionManager);
    def getActionManager(self):
        o = CCActionManager()
        o._co = <cocoa.CCObject*>self.director().getActionManager()
        return o
    def setActionManager(self, CCActionManager var):
        self.director().setActionManager(var.mgr())
    ActionManager = property(getActionManager, setActionManager)

    # #CC_PROPERTY(CCTouchDispatcher*, m_pTouchDispatcher, TouchDispatcher);
    def getTouchDispatcher(self):
        o = CCTouchDispatcher()
        o._co = <cocoa.CCObject*>self.director().getTouchDispatcher()
        return o
    def setTouchDispatcher(self, CCTouchDispatcher var):
        self.director().setTouchDispatcher(var.disp())
    TouchDispatcher = property(getTouchDispatcher, setTouchDispatcher)

    # #CC_PROPERTY(CCKeypadDispatcher*, m_pKeypadDispatcher, KeypadDispatcher);
    def getKeypadDispatcher(self):
        o = CCKeypadDispatcher()
        o._co = <cocoa.CCObject*>self.director().getKeypadDispatcher()
    def setKeypadDispatcher(self, CCKeypadDispatcher var):
        self.director().setKeypadDispatcher(var.disp())
    KeypadDispatcher = property(getKeypadDispatcher, setKeypadDispatcher)

        # #CC_PROPERTY(CCAccelerometer*, m_pAccelerometer, Accelerometer);
        # CCAccelerometer* getAccelerometer()
        # void setAccelerometer(CCAccelerometer* var)
