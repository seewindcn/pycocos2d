#---------keypad.pxd--------------
cdef class CCKeypadDelegate:
    cdef keypad.CCKeypadDelegate* _co
    def keyBackClicked(self):
        self._co.keyBackClicked()
    def keyMenuClicked(self):
        self._co.keyMenuClicked()

cdef class CCKeypadHandler(CCObject):
    cdef inline keypad.CCKeypadHandler* handler(self):
        return <keypad.CCKeypadHandler*>self._co

    @classmethod
    def handlerWithDelegate(cls, CCKeypadDelegate pDelegate):
        o = cls()
        o.set_co(<int>keypad.CCKeypadHandler_handlerWithDelegate(pDelegate._co))
        return o

    def getDelegate(self):
        o = CCKeypadDelegate()
        o._co = self.handler().getDelegate()
        return o
    def setDelegate(self, CCKeypadDelegate pDelegate):
        self.handler().setDelegate(pDelegate._co)
    Delegate = property(getDelegate, setDelegate)

    def initWithDelegate(self, CCKeypadDelegate pDelegate):
        return self.handler().initWithDelegate(pDelegate._co)


cdef class CCKeypadDispatcher(CCObject):
    cdef inline keypad.CCKeypadDispatcher* disp(self):
        return <keypad.CCKeypadDispatcher*>self._co

    def new(self):
        self._co = <cocoa.CCObject*>new keypad.CCKeypadDispatcher()
        self.autorelease()
        return self

    def addDelegate(self, CCKeypadDelegate pDelegate):
        self.disp().addDelegate(pDelegate._co)

    def removeDelegate(self, CCKeypadDelegate pDelegate):
        self.disp().removeDelegate(pDelegate._co)

    def forceAddDelegate(self, CCKeypadDelegate pDelegate):
        self.disp().forceAddDelegate(pDelegate._co)

    def forceRemoveDelegate(self, CCKeypadDelegate pDelegate):
        self.disp().forceRemoveDelegate(pDelegate._co)

    def dispatchKeypadMSG(self, keypad.ccKeypadMSGType nMsgType):
        self.disp().dispatchKeypadMSG(nMsgType)

