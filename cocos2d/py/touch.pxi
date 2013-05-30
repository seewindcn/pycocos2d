#----------touch.pxd-------------
cdef class CCEvent(CCObject):
    cdef inline touch.CCEvent* event(self):
        return <touch.CCEvent*> self._co

cdef class CCTouch(CCObject):
    cdef inline touch.CCTouch* touch(self):
        return <touch.CCTouch*> self._co

    def getLocation(self):
        o = CCPoint()
        o._co = self.touch().getLocation()
        return o

    def getPreviousLocation(self):
        o = CCPoint()
        o._co = self.touch().getPreviousLocation()
        return o

    def getDelta(self):
        o = CCPoint()
        o._co = self.touch().getDelta()
        return o

    def getLocationInView(self):
        o = CCPoint()
        o._co = self.touch().getLocationInView()
        return o

    def getPreviousLocationInView(self):
        o = CCPoint()
        o._co = self.touch().getPreviousLocationInView()
        return o

    def setTouchInfo(self, int id, float x, float y):
        self.touch().setTouchInfo(id, x, y)

    def getID(self):
        return self.touch().getID()



cdef class CCTouchDelegate:
    cdef touch.CCTouchDelegate* _co

    def ccTouchBegan(self, CCTouch pTouch, CCEvent pEvent):
        return self._co.ccTouchBegan(pTouch.touch(), pEvent.event())

    def ccTouchMoved(self, CCTouch pTouch, CCEvent pEvent):
        self._co.ccTouchMoved(pTouch.touch(), pEvent.event())

    def ccTouchEnded(self, CCTouch pTouch, CCEvent pEvent):
        self._co.ccTouchEnded(pTouch.touch(), pEvent.event())

    def ccTouchCancelled(self, CCTouch pTouch, CCEvent pEvent):
        self._co.ccTouchCancelled(pTouch.touch(), pEvent.event())

    def ccTouchesBegan(self, CCSet pTouches, CCEvent pEvent):
        self._co.ccTouchesBegan(pTouches.set(), pEvent.event())

    def ccTouchesMoved(self, CCSet pTouches, CCEvent pEvent):
        self._co.ccTouchesMoved(pTouches.set(), pEvent.event())

    def ccTouchesEnded(self, CCSet pTouches, CCEvent pEvent):
        self._co.ccTouchesEnded(pTouches.set(), pEvent.event())

    def ccTouchesCancelled(self, CCSet pTouches, CCEvent pEvent):
        self._co.ccTouchesCancelled(pTouches.set(), pEvent.event())


cdef class CCTouchHandler(CCObject):
    cdef inline touch.CCTouchHandler* handler(self):
        return <touch.CCTouchHandler*>self._co

    @classmethod
    def handlerWithDelegate(cls, CCTouchDelegate pDelegate, int nPriority):
        o = cls()
        o.set_co(<int>touch.CCTouchHandler_handlerWithDelegate(pDelegate._co, nPriority))
        return o

    def getDelegate(self):
        o = CCTouchDelegate()
        o._co = self.handler().getDelegate()
        return o
    def setDelegate(self, CCTouchDelegate pDelegate):
        self.handler().setDelegate(pDelegate._co)
    Delegate = property(getDelegate, setDelegate)

    def getPriority(self):
        return self.handler().getPriority()
    def setPriority(self, int nPriority):
        self.handler().setPriority(nPriority)
    Priority = property(getPriority, setPriority)

    def getEnabledSelectors(self):
        return self.handler().getEnabledSelectors()
    def setEnalbedSelectors(self, int nValue):
        self.handler().setEnalbedSelectors(nValue)
    EnabledSelectors = property(getEnabledSelectors, setEnalbedSelectors)

    def initWithDelegate(self, CCTouchDelegate pDelegate, int nPriority):
        return self.handler().initWithDelegate(pDelegate._co, nPriority)


cdef class CCStandardTouchHandler(CCTouchHandler):
    @classmethod
    def handlerWithDelegate(cls,CCTouchDelegate pDelegate, int nPriority):
        o = cls()
        o.set_co(<int>touch.CCStandardTouchHandler_handlerWithDelegate(pDelegate._co, nPriority))
        return o


cdef class CCTargetedTouchHandler(CCTouchHandler):
    cdef inline touch.CCTargetedTouchHandler* target(self):
        return <touch.CCTargetedTouchHandler*>self._co

    @classmethod
    def handlerWithDelegate(cls,CCTouchDelegate pDelegate, int nPriority, bool bSwallow):
        o = cls()
        o.set_co(<int>touch.CCTargetedTouchHandler_handlerWithDelegate(pDelegate._co, 
                nPriority, bSwallow))
        return o

    def isSwallowsTouches(self):
        return self.target().isSwallowsTouches()
    def setSwallowsTouches(self, bool bSwallowsTouches):
        self.target().setSwallowsTouches(bSwallowsTouches)
    SwallowsTouches = property(isSwallowsTouches, setSwallowsTouches)

    def getClaimedTouches(self):
        o = CCSet()
        o._co = self.target().getClaimedTouches()
        return o

    def initWithDelegate(self, CCTouchDelegate pDelegate, int nPriority, bool bSwallow):
        return self.target().initWithDelegate(pDelegate._co, nPriority, bSwallow)


cdef class EGLTouchDelegate(CCTouchDelegate):
    pass

cdef class CCTouchDispatcher(CCObject):
    cdef inline touch.CCTouchDispatcher* disp(self):
        return <touch.CCTouchDispatcher*> self._co

    def init(self):
        return self.disp().init()

    def new(self):
        self._co = <cocoa.CCObject*>new touch.CCTouchDispatcher()
        self.autorelease()
        return self

    cdef inline touch.CCTouchDelegate* _get_delegate(self, object pDelegate):
        if isinstance(pDelegate, PyxDelegate):
            return <touch.CCTouchDelegate*>&(<PyxDelegate>pDelegate)._co
        elif isinstance(pDelegate, CCTouchDelegate):
            return (<CCTouchDelegate>pDelegate)._co
        raise ValueError('delegate type no found')

    def isDispatchEvents(self):
        return self.disp().isDispatchEvents()
    def setDispatchEvents(self, bool bDispatchEvents):
        self.disp().setDispatchEvents(bDispatchEvents)
    DispatchEvents = property(isDispatchEvents, setDispatchEvents)

    def addStandardDelegate(self, pDelegate, int nPriority):
        self.disp().addStandardDelegate(self._get_delegate(pDelegate), 
                nPriority)

    def addTargetedDelegate(self, pDelegate, 
            int nPriority, bool bSwallowsTouches):
        self.disp().addTargetedDelegate(self._get_delegate(pDelegate), 
                nPriority, bSwallowsTouches)

    def removeDelegate(self, pDelegate):
        self.disp().removeDelegate(self._get_delegate(pDelegate))

    def removeAllDelegates(self):
        self.disp().removeAllDelegates()

    def setPriority(self, int nPriority, pDelegate):
        self.disp().setPriority(nPriority, self._get_delegate(pDelegate))

    def touches(self, CCSet pTouches, CCEvent pEvent, unsigned int uIndex):
        self.disp().touches(pTouches.set(), pEvent.event(), uIndex)

    def findHandler(self, pDelegate):
        o = CCTouchHandler()
        o._co = <cocoa.CCObject*> self.disp().findHandler(self._get_delegate(pDelegate))
        return o
