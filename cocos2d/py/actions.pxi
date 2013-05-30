#------------actions.pxd------------
cdef class CCAction(CCObject):
    cdef inline actions.CCAction* action(self):
        return <actions.CCAction*>self._co

    @classmethod
    def create(cls):
        o = cls()
        o.set_co(<int>actions.CCAction_create())
        return o 

    def new(self):
        self._co = <cocoa.CCObject*>new actions.CCAction()
        self.autorelease()
        return self

    def description(self):
        return self.action().description()

    def isDone(self):
        return self.action().isDone()

    def startWithTarget(self, CCNode pTarget):
        self.action().startWithTarget(pTarget.node())

    def stop(self):
        self.action().stop()

    def step(self, float dt):
        self.action().step(dt)

    def getTarget(self, cls=CCNode):
        cdef CCNode o = cls()
        o._co = <cocoa.CCObject*>self.action().getTarget()
        return o
    def setTarget(self, CCNode pTarget):
        self.action().setTarget(pTarget.node())
    Target = property(getTarget, setTarget)
    
    def getOriginalTarget(self, cls=CCNode):
        cdef CCNode o = cls()
        o._co = <cocoa.CCObject*>self.action().getOriginalTarget()
        return o
    def setOriginalTarget(self, CCNode pOriginalTarget):
        self.action().setOriginalTarget(pOriginalTarget.node())
    OriginalTarget = property(getOriginalTarget, setOriginalTarget)

    def getTag(self):
        return self.action().getTag()
    def setTag(self, int nTag):
        self.action().setTag(nTag)
    Tag = property(getTag, setTag)


cdef class CCFiniteTimeAction(CCAction):
    cdef inline actions.CCFiniteTimeAction* fta(self):
        return <actions.CCFiniteTimeAction*>self._co

    def new(self):
        self._co = <cocoa.CCObject*>new actions.CCFiniteTimeAction()
        self.autorelease()
        return self

    def getDuration(self):
        return self.fta().getDuration()
    def setDuration(self, float duration):
        self.fta().setDuration(duration)
    Duration = property(getDuration, setDuration)

    def reverse(self):
        o = CCFiniteTimeAction()
        o._co = <cocoa.CCObject*>self.fta().reverse()
        return o


cdef class CCSpeed(CCAction):
    cdef inline actions.CCSpeed* speed(self):
        return <actions.CCSpeed*>self._co

    @classmethod
    def create(cls, CCActionInterval pAction, float fSpeed):
        cdef CCSpeed o = cls()
        o._create(pAction, fSpeed)
        return o

    def __cinit__(self, CCActionInterval pAction=None, float fSpeed=0.0):
        if pAction is not None:
            self._create(pAction, fSpeed)

    cdef _create(self, CCActionInterval pAction, float fSpeed):
        self._co = <cocoa.CCObject*>actions.CCSpeed_create(pAction.interval(), fSpeed)

    def new(self):
        self._co = <cocoa.CCObject*>new actions.CCSpeed()
        self.autorelease()
        return self

    def getSpeed(self):
        return self.speed().getSpeed()
    def setSpeed(self, float fSpeed):
        self.speed().setSpeed(fSpeed)
    Speed = property(getSpeed, setSpeed)

    def initWithAction(self, CCActionInterval pAction, float fSpeed):
        return self.speed().initWithAction(pAction.interval(), fSpeed)

    def reverse(self):
        o = CCActionInterval()
        o._co = <cocoa.CCObject*>self.speed().reverse()
        return o

    def setInnerAction(self, CCActionInterval pAction):
        self.speed().setInnerAction(pAction.interval())

    def getInnerAction(self):
        o = CCActionInterval()
        o._co = <cocoa.CCObject*>self.speed().getInnerAction()
        return o



cdef class CCFollow(CCAction):
    cdef inline actions.CCFollow* follow(self):
        return <actions.CCFollow*>self._co

    def __cinit__(self, CCNode pFollowedNode=None, CCRect rect=None):
        if pFollowedNode is not None:
            self._create(pFollowedNode, rect)

    @classmethod
    def create(cls, CCNode pFollowedNode, CCRect rect=None):
        cdef CCFollow o = cls()
        o._create(pFollowedNode, rect)
        return o

    cdef _create(self, CCNode pFollowedNode, CCRect rect):
        if rect is None:
            self._co = <cocoa.CCObject*>actions.CCFollow_create(pFollowedNode.node(), 
                    cocoa.CCRectZero)
        else:
            self._co = <cocoa.CCObject*>actions.CCFollow_create(pFollowedNode.node(), 
                    rect._co)


    def new(self):
        self._co = <cocoa.CCObject*>new actions.CCFollow()
        self.autorelease()
        return self

    def isBoundarySet(self):
        return self.follow().isBoundarySet()
    def setBoudarySet(self, bool bValue):
        self.follow().setBoudarySet(bValue)
    BoundarySet = property(isBoundarySet, setBoudarySet)

    def initWithTarget(self, CCNode pFollowedNode, CCRect rect=None):
        if rect is None:
            return self.follow().initWithTarget(pFollowedNode.node(), cocoa.CCRectZero)
        return self.follow().initWithTarget(pFollowedNode.node(), rect._co)



cdef class CCActionInterval(CCFiniteTimeAction):
    cdef inline actions.CCActionInterval* interval(self):
        return <actions.CCActionInterval*>self._co

    @classmethod
    def create(cls, d):
        o = cls()
        o.set_co(<int>actions.CCActionInterval_create(d))
        return o

    def getElapsed(self):
        return self.interval().getElapsed()

    def initWithDuration(self, float d):
        return self.interval().initWithDuration(d)

    def reverse(self):
        o = CCActionInterval()
        o._co = <cocoa.CCObject*>self.interval().reverse_()
        return o

    def getAmplitudeRate(self):
        return self.interval().getAmplitudeRate()
    def setAmplitudeRate(self, float amp):
        self.interval().setAmplitudeRate(amp)
    AmplitudeRate = property(getAmplitudeRate, setAmplitudeRate)



cdef class CCSequence(CCActionInterval):
    cdef inline actions.CCSequence* seq(self):
        return <actions.CCSequence*>self._co


    @classmethod
    def create(cls, CCFiniteTimeAction pAction1, *args):
        cdef CCSequence o = cls()
        o._create(pAction1, args)
        return o

    def __cinit__(self, CCFiniteTimeAction pAction1=None, *args):
        if pAction1 is not None:
            self._create(pAction1, args)

    cdef _create(self, CCFiniteTimeAction pAction1, args):
        cdef CCArray array
        cdef actions.CCSequence* co
        cdef int l = len(args)
        if l == 0:
            co = actions.CCSequence_create(pAction1.fta(), NULL)
        elif l == 1:
            co = actions.CCSequence_create(pAction1.fta(), 
                    (<CCObject>args[0])._co, 
                    NULL)
        elif l == 2:
            co = actions.CCSequence_create(pAction1.fta(), 
                    (<CCObject>args[0])._co, 
                    (<CCObject>args[1])._co, 
                    NULL)
        elif l == 3:
            co = actions.CCSequence_create(pAction1.fta(), 
                    (<CCObject>args[0])._co, 
                    (<CCObject>args[1])._co, 
                    (<CCObject>args[2])._co, 
                    NULL)
        elif l == 4:
            co = actions.CCSequence_create(pAction1.fta(), 
                    (<CCObject>args[0])._co, 
                    (<CCObject>args[1])._co, 
                    (<CCObject>args[2])._co, 
                    (<CCObject>args[3])._co, 
                    NULL)
        elif l == 5:
            co = actions.CCSequence_create(pAction1.fta(), 
                    (<CCObject>args[0])._co, 
                    (<CCObject>args[1])._co, 
                    (<CCObject>args[2])._co, 
                    (<CCObject>args[3])._co, 
                    (<CCObject>args[4])._co, 
                    NULL)
        else:
            array = CCArray.create(len(args)+1)
            array.addObject(pAction1)
            for act in args:
                array.addObject(<CCObject>act)
            co = actions.CCSequence_create(array.array())
        self._co = <cocoa.CCObject*>co

    @classmethod
    def createByArray(cls, CCArray arrayOfActions):
        o = cls()
        o.set_co(<int>actions.CCSequence_create(arrayOfActions.array()))
        return o

    # @classmethod
    # def createWithVariableList(cls, CCFiniteTimeAction pAction1, *args):
    #     pass

    @classmethod
    def createWithTwoActions(cls, CCFiniteTimeAction pActionOne, 
            CCFiniteTimeAction pActionTwo):
        o = cls()
        o.set_co(<int>actions.CCSequence_createWithTwoActions(pActionOne.fta(), 
                pActionTwo.fta()))
        return o

    def initWithTwoActions(self, CCFiniteTimeAction pActionOne, 
            CCFiniteTimeAction pActionTwo):
        return self.seq().initWithTwoActions(pActionOne.fta(), 
                pActionTwo.fta())

cdef class CCRepeat(CCActionInterval):
    cdef inline actions.CCRepeat* repeat(self):
        return <actions.CCRepeat*>self._co

    @classmethod
    def create(cls, CCFiniteTimeAction pAction, unsigned int times):
        cdef CCRepeat o = cls()
        o._create(pAction, times)
        return o

    def __cinit__(self, CCFiniteTimeAction pAction=None, unsigned int times=0):
        if pAction is not None:
            self._create(pAction, times)

    cdef _create(self, CCFiniteTimeAction pAction, unsigned int times):
        self._co = <cocoa.CCObject*>actions.CCRepeat_create(pAction.fta(), times)

    def initWithAction(self, CCFiniteTimeAction pAction, unsigned int times):
        return self.repeat().initWithAction(pAction.fta(), times)

    def getInnerAction(self):
        o = CCFiniteTimeAction()
        o._co = <cocoa.CCObject*>self.repeat().getInnerAction()
        return o
    def setInnerAction(self, CCFiniteTimeAction pAction):
        self.repeat().setInnerAction(pAction.fta())
    InnerAction = property(getInnerAction, setInnerAction)


cdef class CCRepeatForever(CCActionInterval):
    cdef inline actions.CCRepeatForever* forever(self):
        return <actions.CCRepeatForever*>self._co

    @classmethod
    def create(cls, CCActionInterval pAction):
        cdef CCRepeatForever o = cls()
        o._create(pAction)
        return o

    def __cinit__(self, CCActionInterval pAction=None):
        if pAction is not None:
            self._create(pAction)

    cdef _create(self, CCActionInterval pAction):
        self._co = <cocoa.CCObject*>actions.CCRepeatForever_create(pAction.interval())

    def new(self):
        self._co = <cocoa.CCObject*>new actions.CCRepeatForever()
        self.autorelease()
        return self

    def initWithAction(self, CCActionInterval pAction):
        return self.forever().initWithAction(pAction.interval())

    def getInnerAction(self):
        o = CCActionInterval()
        o._co = <cocoa.CCObject*>self.forever().getInnerAction()
        return o
    def setInnerAction(self, CCActionInterval pAction):
        self.forever().setInnerAction(pAction.interval())
    InnerAction = property(getInnerAction, setInnerAction)


cdef class CCSpawn(CCActionInterval):
    cdef inline actions.CCSpawn* spawn(self):
        return <actions.CCSpawn*>self._co

    @classmethod
    def create(cls, CCFiniteTimeAction pAction1, *args):
        cdef CCSpawn o = cls()
        o._create(pAction1, args)
        return o

    def __cinit__(self, CCFiniteTimeAction pAction1=None, *args):
        if pAction1 is not None:
            self._create(pAction1, args)

    cdef _create(self, CCFiniteTimeAction pAction1, args):
        cdef CCArray array
        cdef actions.CCSpawn* co
        cdef l = len(args)
        if l == 0:
            co = actions.CCSpawn_create(pAction1.fta(), NULL)
        elif l == 1:
            co = actions.CCSpawn_create(pAction1.fta(), 
                    (<CCObject>args[0])._co,
                    NULL)
        elif l == 2:
            co = actions.CCSpawn_create(pAction1.fta(), 
                    (<CCObject>args[0])._co,
                    (<CCObject>args[1])._co,
                    NULL)
        elif l == 3:
            co = actions.CCSpawn_create(pAction1.fta(), 
                    (<CCObject>args[0])._co,
                    (<CCObject>args[1])._co,
                    (<CCObject>args[2])._co,
                    NULL)
        elif l == 4:
            co = actions.CCSpawn_create(pAction1.fta(), 
                    (<CCObject>args[0])._co,
                    (<CCObject>args[1])._co,
                    (<CCObject>args[2])._co,
                    (<CCObject>args[3])._co,
                    NULL)
        elif l == 5:
            co = actions.CCSpawn_create(pAction1.fta(), 
                    (<CCObject>args[0])._co,
                    (<CCObject>args[1])._co,
                    (<CCObject>args[2])._co,
                    (<CCObject>args[3])._co,
                    (<CCObject>args[4])._co,
                    NULL)
        else:
            array = CCArray.create(len(args)+1)
            array.addObject(pAction1)
            for act in args:
                array.addObject(<CCObject>act)
            co = actions.CCSpawn_create(array.array())
        self._co = <cocoa.CCObject*>co

    @classmethod
    def createByArray(cls, CCArray arrayOfActions):
        o = cls()
        o.set_co(<int>actions.CCSpawn_create(arrayOfActions.array()))
        return o

    # @classmethod
    # def createWithVariableList(cls, CCFiniteTimeAction *pAction1, *args):
    #     pass

    @classmethod
    def createWithTwoActions(cls, CCFiniteTimeAction pAction1, CCFiniteTimeAction pAction2):
        o = cls()
        o.set_co(<int>actions.CCSpawn_createWithTwoActions(pAction1.fta(), pAction2.fta()))
        return o

    def initWithTwoActions(self, CCFiniteTimeAction pAction1, CCFiniteTimeAction pAction2):
        return self.spawn().initWithTwoActions(pAction1.fta(), pAction2.fta())


cdef class CCRotateTo(CCActionInterval):
    @classmethod
    def create(cls, float fDuration, float fDeltaAngleX, fDeltaAngleY=None):
        cdef CCRotateTo o = cls()
        o._create(fDuration, fDeltaAngleX, fDeltaAngleY)
        return o

    def __cinit__(self, fDuration=None, float fDeltaAngleX=0.0, fDeltaAngleY=None):
        if fDuration is not None:
            self._create(fDuration, fDeltaAngleX, fDeltaAngleY)

    cdef _create(self, float fDuration, float fDeltaAngleX, object fDeltaAngleY):
        if fDeltaAngleY is None:
            self._co = <cocoa.CCObject*>actions.CCRotateTo_create(fDuration, fDeltaAngleX)
        else:
            self._co = <cocoa.CCObject*>actions.CCRotateTo_create(fDuration, 
                    fDeltaAngleX, fDeltaAngleY)

    # bool initWithDuration(float fDuration, float fDeltaAngle)
    # bool initWithDuration(float fDuration, float fDeltaAngleX, float fDeltaAngleY)


cdef class CCRotateBy(CCActionInterval):
    @classmethod
    def create(cls, float fDuration, float fDeltaAngleX, fDeltaAngleY=None):
        cdef CCRotateBy o = cls()
        o._create(fDuration, fDeltaAngleX, fDeltaAngleY)
        return o

    def __cinit__(self, fDuration=None, float fDeltaAngleX=0.0, fDeltaAngleY=None):
        if fDuration is not None:
            self._create(fDuration, fDeltaAngleX, fDeltaAngleY)

    cdef _create(self, float fDuration, float fDeltaAngleX, object fDeltaAngleY):
        if fDeltaAngleY is None:
            self._co = <cocoa.CCObject*>actions.CCRotateBy_create(fDuration, fDeltaAngleX)
        else:
            self._co = <cocoa.CCObject*>actions.CCRotateBy_create(fDuration, 
                    fDeltaAngleX, fDeltaAngleY)

    # bool initWithDuration(float fDuration, float fDeltaAngle)
    # bool initWithDuration(float fDuration, float fDeltaAngleX, float fDeltaAngleY)


cdef class CCMoveBy(CCActionInterval):
    @classmethod
    def create(cls, float duration, CCPoint deltaPosition):
        cdef CCMoveBy o = cls()
        o._create(duration, deltaPosition)
        return o

    def __cinit__(self, duration=None, CCPoint deltaPosition=None):
        if duration is not None:
            self._create(duration, deltaPosition)

    cdef _create(self, float duration, CCPoint deltaPosition):
        self._co = <cocoa.CCObject*>actions.CCMoveBy_create(duration, deltaPosition._co)

    # bool initWithDuration(float duration, const CCPoint& deltaPosition)


cdef class CCMoveTo(CCMoveBy):
    @classmethod
    def create(cls, float duration, CCPoint position):
        cdef CCMoveTo o = cls()
        o._create(duration, position)
        return o

    def __cinit__(self, duration=None, CCPoint position=None):
        if duration is not None:
            self._create(duration, position)

    cdef _create(self, float duration, CCPoint position):
        self._co = <cocoa.CCObject*>actions.CCMoveTo_create(duration, position._co)

    # bool initWithDuration(float duration, const CCPoint& position)


cdef class CCSkewTo(CCActionInterval):
    cdef inline actions.CCSkewTo* skewto(self):
        return <actions.CCSkewTo*>self._co

    @classmethod
    def create(cls, float t, float sx, float sy):
        cdef CCSkewTo o = cls()
        o._create(t, sx, sy)
        return o

    def __cinit__(self, t=None, float sx=0.0, float sy=0.0):
        if t is not None:
            self._create(t, sx, sy)

    cdef _create(self, float t, float sx, float sy):
        self._co = <cocoa.CCObject*>actions.CCSkewTo_create(t, sx, sy)

    def new(self):
        self._co = <cocoa.CCObject*>new actions.CCSkewTo()
        self.autorelease()
        return self

    def initWithDuration(self, float t, float sx, float sy):
        return self.skewto().initWithDuration(t, sx, sy)



cdef class CCSkewBy(CCSkewTo):
    @classmethod
    def create(cls, float t, float deltaSkewX, float deltaSkewY):
        cdef CCSkewBy o = cls()
        o._create(t, deltaSkewX, deltaSkewY)
        return o

    def __cinit__(self, t=None, float deltaSkewX=0.0, float deltaSkewY=0.0):
        if t is not None:
            self._create(t, deltaSkewX, deltaSkewY)

    cdef _create(self, float t, float deltaSkewX, float deltaSkewY):
        self._co = <cocoa.CCObject*>actions.CCSkewBy_create(t, deltaSkewX, deltaSkewY)

    # bool initWithDuration(float t, float sx, float sy)


cdef class CCJumpBy(CCActionInterval):
    @classmethod
    def create(cls, float duration, CCPoint position, float height, unsigned int jumps):
        cdef CCJumpBy o = cls()
        o._create(duration, position, height, jumps)
        return o

    def __cinit__(self, duration=None, CCPoint position=None, 
                float height=0.0, unsigned int jumps=0):
        if duration is not None:
            self._create(duration, position, height, jumps)

    cdef _create(self, float duration, CCPoint position, float height, int jumps):
        self._co = <cocoa.CCObject*>actions.CCJumpBy_create(duration, 
                position._co, height, jumps)
    # bool initWithDuration(float duration, const CCPoint& position, float height, unsigned int jumps)


cdef class CCJumpTo(CCJumpBy):
    @classmethod
    def create(cls, float duration, CCPoint position, float height, int jumps):
        cdef CCJumpTo o = cls()
        o._create(duration, position, height, jumps)
        return o

    def __cinit__(self, duration=None, CCPoint position=None, 
                float height=0.0, int jumps=0):
        if duration is not None:
            self._create(duration, position, height, jumps)

    cdef _create(self, float duration, CCPoint position, float height, int jumps):
        self._co = <cocoa.CCObject*>actions.CCJumpTo_create(duration, position._co, 
                height, jumps)


cdef class ccBezierConfig:
    cdef actions.ccBezierConfig _co
    def getendPosition(self):
        o = CCPoint()
        o._co = self._co.endPosition
        return o
    def setendPosition(self, CCPoint var):
        self._co.endPosition = var._co
    endPosition = property(getendPosition, setendPosition)

    def getcontrolPoint_1(self):
        o = CCPoint()
        o._co = self._co.controlPoint_1
        return o
    def setcontrolPoint_1(self, CCPoint var):
        self._co.controlPoint_1 = var._co
    controlPoint_1 = property(getcontrolPoint_1, setcontrolPoint_1)

    def getcontrolPoint_2(self):
        o = CCPoint()
        o._co = self._co.controlPoint_2
        return o
    def setcontrolPoint_2(self, CCPoint var):
        self._co.controlPoint_2 = var._co
    controlPoint_2 = property(getcontrolPoint_2, setcontrolPoint_2)


cdef class CCBezierBy(CCActionInterval):
    @classmethod
    def create(cls, float t, ccBezierConfig c):
        cdef CCBezierBy o = cls()
        o._create(t, c)
        return o

    def __cinit__(self, t=None, ccBezierConfig c=None):
        if t is not None:
            self._create(t, c)

    cdef _create(self, float t, ccBezierConfig c):
        self._co = <cocoa.CCObject*>actions.CCBezierBy_create(t, c._co)
    # bool initWithDuration(float t, const ccBezierConfig& c)


cdef class CCBezierTo(CCBezierBy):
    @classmethod
    def create(cls, float t, ccBezierConfig c):
        cdef CCBezierTo o = cls()
        o._create(t, c)
        return o

    def __cinit__(self, t=None, ccBezierConfig c=None):
        if t is not None:
            self._create(t, c)

    cdef _create(self, float t, ccBezierConfig c):
        self._co = <cocoa.CCObject*>actions.CCBezierTo_create(t, c._co)

    # bool initWithDuration(float t, const ccBezierConfig &c)


cdef class CCScaleTo(CCActionInterval):
    @classmethod
    def create(cls, float duration, float sx, sy=None):
        cdef CCScaleTo o = cls()
        o._create(duration, sx, sy)
        return o

    def __cinit__(self, duration=None, float sx=0.0, sy=None):
        if duration is not None:
            self._create(duration, sx, sy)

    cdef _create(self, float duration, float sx, object sy):
        if sy is None:
            self._co = <cocoa.CCObject*>actions.CCScaleTo_create(duration, sx)
        else:
            self._co = <cocoa.CCObject*>actions.CCScaleTo_create(duration, sx, sy)

    # bool initWithDuration(float duration, float s)
    # bool initWithDuration(float duration, float sx, float sy)


cdef class CCScaleBy(CCScaleTo):
    @classmethod
    def create(cls, float duration, float sx, sy=None):
        cdef CCScaleBy o = cls()
        o._create(duration, sx, sy)
        return o

    def __cinit__(self, duration=None, float sx=0.0, sy=None):
        if duration is not None:
            self._create(duration, sx, sy)

    cdef _create(self, float duration, float sx, object sy):
        if sy is None:
            self._co = <cocoa.CCObject*>actions.CCScaleBy_create(duration, sx)
        else:
            self._co = <cocoa.CCObject*>actions.CCScaleBy_create(duration, sx, sy)


cdef class CCBlink(CCActionInterval):
    @classmethod
    def create(cls, float duration, unsigned int uBlinks):
        cdef CCBlink o = cls()
        o._create(duration, uBlinks)
        return o

    def __cinit__(self, duration=None, unsigned int uBlinks=0):
        if duration  is not None:
            self._create(duration, uBlinks)

    cdef _create(self, float duration, unsigned int uBlinks):
        self._co = <cocoa.CCObject*>actions.CCBlink_create(duration, uBlinks)
    # bool initWithDuration(float duration, unsigned int uBlinks)


cdef class CCFadeIn(CCActionInterval):
    @classmethod
    def create(cls, float d):
        cdef CCFadeIn o = cls()
        o._create(d)
        return o

    def __cinit__(self, d=None):
        if d is not None:
            self._create(d)

    cdef _create(self, float d):
        self._co = <cocoa.CCObject*>actions.CCFadeIn_create(d)


cdef class CCFadeOut(CCActionInterval):
    @classmethod
    def create(cls, float d):
        cdef CCFadeOut o = cls()
        o._create(d)
        return o

    def __cinit__(self, d=None):
        if d is not None:
            self._create(d)

    cdef _create(self, float d):
        self._co = <cocoa.CCObject*>actions.CCFadeOut_create(d)


cdef class CCFadeTo(CCActionInterval):
    # bool initWithDuration(float duration, GLubyte opacity)
    @classmethod
    def create(cls, float duration, shaders.GLubyte opacity):
        cdef CCFadeTo o = cls()
        o._create(duration, opacity)
        return o

    def __cinit__(self, duration=None, shaders.GLubyte opacity=0):
        if duration is not None:
            self._create(duration, opacity)

    cdef _create(self, float duration, shaders.GLubyte opacity):
        self._co = <cocoa.CCObject*>actions.CCFadeTo_create(duration, opacity)


cdef class CCTintTo(CCActionInterval):
    # bool initWithDuration(float duration, GLubyte red, GLubyte green, GLubyte blue)
    @classmethod
    def create(cls, float duration, shaders.GLubyte red, 
            shaders.GLubyte green, shaders.GLubyte blue):
        cdef CCTintTo o = cls()
        o._create(duration, red, green, blue)
        return o

    def __cinit__(self, duration=None, shaders.GLubyte red=0, 
            shaders.GLubyte green=0, shaders.GLubyte blue=0):
        if duration is not None:
            self._create(duration, red, green, blue)

    cdef _create(self, float duration, shaders.GLubyte red, 
            shaders.GLubyte green, shaders.GLubyte blue):
        self._co = <cocoa.CCObject*>actions.CCTintTo_create(duration, red, green, blue)


cdef class CCTintBy(CCActionInterval):
    # bool initWithDuration(float duration, GLshort deltaRed, GLshort deltaGreen, GLshort deltaBlue)
    @classmethod
    def create(cls, float duration, shaders.GLshort deltaRed, 
                shaders.GLshort deltaGreen, shaders.GLshort deltaBlue):
        cdef CCTintBy o = cls()
        o._create(duration, deltaRed, deltaGreen, deltaBlue)
        return o

    def __cinit__(self, duration=None, shaders.GLshort deltaRed=0, 
                shaders.GLshort deltaGreen=0, shaders.GLshort deltaBlue=0):
        if duration is not None:
            self._create(duration, deltaRed, deltaGreen, deltaBlue)

    cdef _create(self, float duration, shaders.GLshort deltaRed, 
                shaders.GLshort deltaGreen, shaders.GLshort deltaBlue):
        self._co = <cocoa.CCObject*>actions.CCTintBy_create(duration, 
                deltaRed, deltaGreen, deltaBlue)


cdef class CCDelayTime(CCActionInterval):
    @classmethod
    def create(cls, d):
        cdef CCDelayTime o = cls()
        o._create(d)
        return o

    def __cinit__(self, d=None):
        if d is not None:
            self._create(d)

    cdef _create(self, float d):
        self._co = <cocoa.CCObject*>actions.CCDelayTime_create(d)


cdef class CCReverseTime(CCActionInterval):
    cdef inline actions.CCReverseTime* time(self):
        return <actions.CCReverseTime*>self._co

    @classmethod
    def create(cls, CCFiniteTimeAction pAction):
        cdef CCReverseTime o = cls()
        o._create(pAction)
        return o

    def __cinit__(self, CCFiniteTimeAction pAction=None):
        if pAction is not None:
            self._create(pAction)

    cdef _create(self, CCFiniteTimeAction pAction):
        self._co = <cocoa.CCObject*>actions.CCReverseTime_create(pAction.fta())

    def new(self):
        self._co = <cocoa.CCObject*>new actions.CCReverseTime()
        self.autorelease()
        return self


    def initWithAction(self, CCFiniteTimeAction pAction):
        return self.time().initWithAction(pAction.fta())



cdef class CCAnimate(CCActionInterval):
    cdef inline actions.CCAnimate* animate(self):
        return <actions.CCAnimate*>self._co

    @classmethod
    def create(cls, CCAnimation pAnimation):
        cdef CCAnimate o = cls()
        o._create(pAnimation)
        return o

    def __cinit__(self, CCAnimation pAnimation=None):
        if pAnimation is not None:
            self._create(pAnimation)

    cdef _create(self, CCAnimation pAnimation):
        self._co = <cocoa.CCObject*>actions.CCAnimate_create(pAnimation.animation())

    def initWithAnimation(self, CCAnimation pAnimation):
        return self.animate().initWithAnimation(pAnimation.animation())

    def new(self):
        self._co = <cocoa.CCObject*>new actions.CCAnimate()
        self.autorelease()
        return self

    #CC_SYNTHESIZE_RETAIN(CCAnimation*, m_pAnimation, Animation)
    def getAnimation(self):
        o = CCAnimation()
        o._co = self.animate().getAnimation()
        return o
    def setAnimation(self, CCAnimation var):
        self.animate().setAnimation(var.animation())
    Animation = property(getAnimation, setAnimation)



cdef class CCTargetedAction(CCActionInterval):
    cdef inline actions.CCTargetedAction* target(self):
        return <actions.CCTargetedAction*>self._co

    @classmethod
    def create(cls, CCNode pTarget, CCFiniteTimeAction pAction):
        cdef CCTargetedAction o = cls()
        o._create(pTarget, pAction)
        return o

    def __cinit__(self, CCNode pTarget=None, CCFiniteTimeAction pAction=None):
        if pTarget is not None:
            self._create(pTarget, pAction)

    cdef _create(self, CCNode pTarget, CCFiniteTimeAction pAction):
        self._co = <cocoa.CCObject*>actions.CCTargetedAction_create(pTarget.node(), 
                pAction.fta())

    def new(self):
        self._co = <cocoa.CCObject*>new actions.CCTargetedAction()
        self.autorelease()
        return self

    #CC_SYNTHESIZE_RETAIN(CCNode*, m_pForcedTarget, ForcedTarget)
    def getForcedTarget(self):
        o = CCNode()
        o._co = <cocoa.CCObject*>self.target().getForcedTarget()
        return o
    def setForcedTarget(self, CCNode var):
        self.target().setForcedTarget(var.node())
    ForcedTarget = property(getForcedTarget, setForcedTarget)       


cdef class CCActionCamera(CCActionInterval):
    cdef inline actions.CCActionCamera* camera(self):
        return <actions.CCActionCamera*>self._co

    def new(self):
        self._co = <cocoa.CCObject*>new actions.CCActionCamera()
        self.autorelease()
        return self


cdef class CCOrbitCamera(CCActionCamera):
    cdef inline actions.CCOrbitCamera* ocamera(self):
        return <actions.CCOrbitCamera*>self._co

    @classmethod
    def create(cls, float t, float radius, float deltaRadius, 
            float angleZ, float deltaAngleZ, float angleX, float deltaAngleX):
        cdef CCOrbitCamera o = cls()
        o._create(t, radius, deltaRadius,
                angleZ, deltaAngleZ, angleX, deltaAngleX)
        return o

    def __cinit__(self, t=None, float radius=0.0, float deltaRadius=0.0, 
            float angleZ=0.0, float deltaAngleZ=0.0, 
            float angleX=0.0, float deltaAngleX=0.0):
        if t is not None:
            self._create(t, radius, deltaRadius,
                    angleZ, deltaAngleZ, angleX, deltaAngleX)

    cdef _create(self, float t, float radius, float deltaRadius, 
            float angleZ, float deltaAngleZ, float angleX, float deltaAngleX):
        self._co = <cocoa.CCObject*>actions.CCOrbitCamera_create(t, radius, deltaRadius,
                angleZ, deltaAngleZ, angleX, deltaAngleX)

    def new(self):
        self._co = <cocoa.CCObject*>new actions.CCOrbitCamera()
        self.autorelease()
        return self

    def initWithDuration(self, float t, float radius, float deltaRadius, 
            float angleZ, float deltaAngleZ, float angleX, float deltaAngleX):
        return self.ocamera().initWithDuration(t, radius, deltaRadius,
                angleZ, deltaAngleZ, angleX, deltaAngleX)

    def sphericalRadius(self):
        cdef float r, zenith, azimuth
        self.ocamera().sphericalRadius(&r, &zenith, &azimuth)
        return r, zenith, azimuth



cdef class CCPointArray(CCObject):
    cdef inline actions.CCPointArray* array(self):
        return <actions.CCPointArray*>self._co

    @classmethod
    def create(cls, unsigned int capacity):
        o = cls()
        o.set_co(<int>actions.CCPointArray_create(capacity))
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new actions.CCPointArray()
        self.autorelease()
        return self

    def initWithCapacity(self, unsigned int capacity):
        return self.array().initWithCapacity(capacity)

    def addControlPoint(self, CCPoint controlPoint):
        self.array().addControlPoint(controlPoint._co)
    
    def insertControlPoint(self, CCPoint controlPoint, unsigned int index):
        self.array().insertControlPoint(controlPoint._co, index)
    
    def replaceControlPoint(self, CCPoint controlPoint, unsigned int index):
        self.array().replaceControlPoint(controlPoint._co, index)
    
    def getControlPointAtIndex(self, unsigned int index):
        o = CCPoint()
        o._co = self.array().getControlPointAtIndex(index)
        return o
    
    def removeControlPointAtIndex(self, unsigned int index):
        self.array().removeControlPointAtIndex(index)
    
    def count(self):
        return self.array().count()
    
    def reverse(self):
        o = CCPointArray()
        o._co = self.array().reverse()
        return o
    
    def reverseInline(self):
        self.array().reverseInline()
    
    # const std::vector<CCPoint*>* getControlPoints()
    # void setControlPoints(std::vector<CCPoint*> *controlPoints)


cdef class CCCardinalSplineTo(CCActionInterval):
    cdef inline actions.CCCardinalSplineTo* lineto(self):
        return <actions.CCCardinalSplineTo*>self._co

    @classmethod
    def create(cls, float duration, CCPointArray points, float tension):
        cdef CCCardinalSplineTo o = cls()
        o._create1(duration, points, tension)
        return o

    def __cinit__(self, duration=None, CCPointArray points=None, float tension=0.0):
        if duration is not None:
            self._create1(duration, points, tension)

    cdef _create1(self, float duration, CCPointArray points, float tension):
        self._co = <cocoa.CCObject*>actions.CCCardinalSplineTo_create(duration, 
                points.array(), tension)

    def new(self):
        self._co = <cocoa.CCObject*>new actions.CCCardinalSplineTo()
        self.autorelease()
        return self

    def initWithDuration(self, float duration, CCPointArray points, float tension):
        return self.lineto().initWithDuration(duration, points.array(), tension)

    def updatePosition(self, CCPoint newPos):
        self.lineto().updatePosition(newPos._co)

    def getPoints(self):
        o = CCPointArray()
        o._co = <cocoa.CCObject*>self.lineto().getPoints()
        return o
    def setPoints(self, CCPointArray points):
        self.lineto().setPoints(points.array())
    Points = property(getPoints, setPoints)


cdef class CCCardinalSplineBy(CCCardinalSplineTo):
    @classmethod
    def create(cls, float duration, CCPointArray points, float tension):
        cdef CCCardinalSplineBy o = cls()
        o._create(duration, points, tension)
        return o

    def __cinit__(self, duration=None, CCPointArray points=None, float tension=0.0):
        if duration is not None:
            self._create(duration, points, tension)

    cdef _create(self, float duration, CCPointArray points, float tension):
        self._co = <cocoa.CCObject*>actions.CCCardinalSplineBy_create(duration, 
                points.array(), tension)
    # CCCardinalSplineBy()


cdef class CCCatmullRomTo(CCCardinalSplineTo):
    @classmethod
    def create(cls, float dt, CCPointArray points):
        cdef CCCatmullRomTo o = cls()
        o._create(dt, points)
        return o

    def __cinit__(self, dt=None, CCPointArray points=None):
        if dt is not None:
            self._create(dt, points)

    cdef _create(self, float dt, CCPointArray points):
        self._co = <cocoa.CCObject*>actions.CCCatmullRomTo_create(dt, points.array())
    # bool initWithDuration(float dt, CCPointArray* points)


cdef class CCCatmullRomBy(CCCatmullRomTo):
    @classmethod
    def create(cls, float dt, CCPointArray points):
        cdef CCCatmullRomBy o = cls()
        o._create(dt, points)
        return o

    def __cinit__(self, dt=None, CCPointArray points=None):
        if dt is not None:
            self._create(dt, points)

    cdef _create(self, float dt, CCPointArray points):
        self._co = <cocoa.CCObject*>actions.CCCatmullRomBy_create(dt, points.array())
    # bool initWithDuration(float dt, CCPointArray* points)


cdef class CCActionEase(CCActionInterval):
    @classmethod
    def create(cls, CCActionInterval pAction):
        cdef CCActionEase o = cls()
        o._create(pAction)
        return o

    def __cinit__(self, CCActionInterval pAction=None):
        if pAction is not None:
            self._create(pAction)

    cdef _create(self, CCActionInterval pAction):
        self._co = <cocoa.CCObject*>actions.CCActionEase_create(pAction.interval())
    # bool initWithAction(CCActionInterval *pAction)


cdef class CCEaseRateAction(CCActionEase):
    cdef inline actions.CCEaseRateAction* era(self):
        return <actions.CCEaseRateAction*>self._co

    @classmethod
    def create(cls, CCActionInterval pAction, float fRate):
        cdef CCEaseRateAction o = cls()
        o._create1(pAction, fRate)
        return o

    def __cinit__(self, CCActionInterval pAction=None, float fRate=0.0):
        if pAction is not None:
            self._create1(pAction, fRate)

    cdef _create1(self, CCActionInterval pAction, float fRate):
        self._co = <cocoa.CCObject*>actions.CCEaseRateAction_create(pAction.interval(), 
                fRate)

    def getRate(self):
        return self.era().getRate()
    def setRate(self, float rate):
        self.era().setRate(rate)
    Rate = property(getRate, setRate)

    # bool initWithAction(CCActionInterval *pAction, float fRate)


cdef class CCEaseIn(CCEaseRateAction):
    @classmethod
    def create(cls, CCActionInterval pAction, float fRate):
        cdef CCEaseIn o = cls()
        o._create1(pAction, fRate)
        return o

    def __cinit__(self, CCActionInterval pAction=None, float fRate=0.0):
        if pAction is not None:
            self._create1(pAction, fRate)

    cdef _create1(self, CCActionInterval pAction, float fRate):
        self._co = <cocoa.CCObject*>actions.CCEaseIn_create(pAction.interval(), 
                fRate)


cdef class CCEaseOut(CCEaseRateAction):
    @classmethod
    def create(cls, CCActionInterval pAction, float fRate):
        cdef CCEaseOut o = cls()
        o._create1(pAction, fRate)
        return o

    def __cinit__(self, CCActionInterval pAction=None, float fRate=0.0):
        if pAction is not None:
            self._create1(pAction, fRate)

    cdef _create1(self, CCActionInterval pAction, float fRate):
        self._co = <cocoa.CCObject*>actions.CCEaseOut_create(pAction.interval(), 
                fRate)


cdef class CCEaseInOut(CCEaseRateAction):
    @classmethod
    def create(cls, CCActionInterval pAction, float fRate):
        cdef CCEaseInOut o = cls()
        o._create1(pAction, fRate)
        return o

    def __cinit__(self, CCActionInterval pAction=None, float fRate=0.0):
        if pAction is not None:
            self._create1(pAction, fRate)

    cdef _create1(self, CCActionInterval pAction, float fRate):
        self._co = <cocoa.CCObject*>actions.CCEaseInOut_create(pAction.interval(), fRate)


cdef class CCEaseExponentialIn(CCActionEase):
    @classmethod
    def create(cls, CCActionInterval pAction):
        cdef CCEaseExponentialIn o = cls()
        o._create(pAction)
        return o

    def __cinit__(self, CCActionInterval pAction=None):
        if pAction is not None:
            self._create(pAction)

    cdef _create(self, CCActionInterval pAction):
        self._co = <cocoa.CCObject*>actions.CCEaseExponentialIn_create(pAction.interval())


cdef class CCEaseExponentialOut(CCActionEase):
    @classmethod
    def create(cls, CCActionInterval pAction):
        cdef CCEaseExponentialOut o = cls()
        o._create(pAction)
        return o

    def __cinit__(self, CCActionInterval pAction=None):
        if pAction is not None:
            self._create(pAction)

    cdef _create(self, CCActionInterval pAction):
        self._co = <cocoa.CCObject*>actions.CCEaseExponentialOut_create(pAction.interval())


cdef class CCEaseExponentialInOut(CCActionEase):
    @classmethod
    def create(cls, CCActionInterval pAction):
        cdef CCEaseExponentialInOut o = cls()
        o._create(pAction)
        return o

    def __cinit__(self, CCActionInterval pAction):
        if pAction is not None:
            self._create(pAction)

    cdef _create(self, CCActionInterval pAction):
        self._co = <cocoa.CCObject*>actions.CCEaseExponentialInOut_create(pAction.interval())


cdef class CCEaseSineIn(CCActionEase):
    @classmethod
    def create(cls, CCActionInterval pAction):
        cdef CCEaseSineIn o = cls()
        o._create(pAction)
        return o

    def __cinit__(self, CCActionInterval pAction=None):
        if pAction is not None:
            self._create(pAction)

    cdef _create(self, CCActionInterval pAction):
        self._co = <cocoa.CCObject*>actions.CCEaseSineIn_create(pAction.interval())

cdef class CCEaseSineOut(CCActionEase):
    @classmethod
    def create(cls, CCActionInterval pAction):
        cdef CCEaseSineOut o = cls()
        o._create(pAction)
        return o

    def __cinit__(self, CCActionInterval pAction=None):
        if pAction is not None:
            self._create(pAction)

    cdef _create(self, CCActionInterval pAction):
        self._co = <cocoa.CCObject*>actions.CCEaseSineOut_create(pAction.interval())

cdef class CCEaseSineInOut(CCActionEase):
    @classmethod
    def create(cls, CCActionInterval pAction):
        cdef CCEaseSineInOut o = cls()
        o._create(pAction)
        return o

    def __cinit__(self, CCActionInterval pAction=None):
        if pAction is not None:
            self._create(pAction)

    cdef _create(self, CCActionInterval pAction):
        self._co = <cocoa.CCObject*>actions.CCEaseSineInOut_create(pAction.interval())


cdef class CCEaseElastic(CCActionEase):
    cdef inline actions.CCEaseElastic* elastic(self):
        return <actions.CCEaseElastic*>self._co

    @classmethod
    def create(cls, CCActionInterval pAction, fPeriod=None):
        cdef CCEaseElastic o = cls()
        o._create1(pAction, fPeriod)
        return o

    def __cinit__(self, CCActionInterval pAction=None, fPeriod=None):
        if pAction is not None:
            self._create1(pAction, fPeriod)

    cdef _create1(self, CCActionInterval pAction, object fPeriod):
        if fPeriod is None:
            self._co = <cocoa.CCObject*>actions.CCEaseElastic_create(pAction.interval())
                 
        else:
            self._co = <cocoa.CCObject*>actions.CCEaseElastic_create(pAction.interval(), 
                    fPeriod)

    def getPeriod(self):
        return self.elastic().getPeriod()
    def setPeriod(self, float fPeriod):
        self.elastic().setPeriod(fPeriod)
    Period = property(getPeriod, setPeriod)
    # bool initWithAction(CCActionInterval *pAction, float fPeriod)# = 0.3)


cdef class CCEaseElasticIn(CCEaseElastic):
    @classmethod
    def create(cls, CCActionInterval pAction, fPeriod=None):
        cdef CCEaseElasticIn o = cls()
        o._create1(pAction, fPeriod)
        return o

    def __cinit__(self, CCActionInterval pAction=None, fPeriod=None):
        if pAction is not None:
            self._create1(pAction, fPeriod)

    cdef _create1(self, CCActionInterval pAction, object fPeriod):
        if fPeriod is None:
            self._co = <cocoa.CCObject*>actions.CCEaseElasticIn_create(
                    pAction.interval())
        else:
            self._co = <cocoa.CCObject*>actions.CCEaseElasticIn_create(
                    pAction.interval(), fPeriod)
        


cdef class CCEaseElasticOut(CCEaseElastic):
    @classmethod
    def create(cls, CCActionInterval pAction, fPeriod=None):
        cdef CCEaseElasticOut o = cls()
        o._create1(pAction, fPeriod)
        return o

    def __cinit__(self, CCActionInterval pAction=None, fPeriod=None):
        if pAction is not None:
            self._create1(pAction, fPeriod)

    cdef _create1(self, CCActionInterval pAction, fPeriod):
        if fPeriod is None:
            self._co = <cocoa.CCObject*>actions.CCEaseElasticOut_create(
                    pAction.interval())
        else:
            self._co = <cocoa.CCObject*>actions.CCEaseElasticOut_create(
                    pAction.interval(), fPeriod)


cdef class CCEaseElasticInOut(CCEaseElastic):
    @classmethod
    def create(cls, CCActionInterval pAction, fPeriod=None):
        cdef CCEaseElasticInOut o = cls()
        o._create1(pAction, fPeriod)
        return o

    def __cinit__(self, CCActionInterval pAction=None, fPeriod=None):
        if pAction is not None:
            self._create1(pAction, fPeriod)

    cdef _create1(self, CCActionInterval pAction, object fPeriod):
        if fPeriod is None:
            self._co = <cocoa.CCObject*>actions.CCEaseElasticInOut_create(
                    pAction.interval())
        else:
            self._co = <cocoa.CCObject*>actions.CCEaseElasticInOut_create(
                    pAction.interval(), fPeriod)


cdef class CCEaseBounce(CCActionEase):
    @classmethod
    def create(cls, CCActionInterval pAction):
        cdef CCEaseBounce o = cls()
        o._create(pAction)
        return o

    def __cinit__(self, CCActionInterval pAction=None):
        if pAction is not None:
            self._create(pAction)

    cdef _create(self, CCActionInterval pAction):
        self._co = <cocoa.CCObject*>actions.CCEaseBounce_create(pAction.interval())


cdef class CCEaseBounceIn(CCEaseBounce):
    @classmethod
    def create(cls, CCActionInterval pAction):
        cdef CCEaseBounceIn o = cls()
        o._create(pAction)
        return o

    def __cinit__(self, CCActionInterval pAction=None):
        if pAction is not None:
            self._create(pAction)

    cdef _create(self, CCActionInterval pAction):
        self._co = <cocoa.CCObject*>actions.CCEaseBounceIn_create(pAction.interval())


cdef class CCEaseBounceOut(CCEaseBounce):
    @classmethod
    def create(cls, CCActionInterval pAction):
        cdef CCEaseBounceOut o = cls()
        o._create(pAction)
        return o

    def __cinit__(self, CCActionInterval pAction=None):
        if pAction is not None:
            self._create(pAction)

    cdef _create(self, CCActionInterval pAction):
        self._co = <cocoa.CCObject*>actions.CCEaseBounceOut_create(pAction.interval())


cdef class CCEaseBounceInOut(CCEaseBounce):
    @classmethod
    def create(cls, CCActionInterval pAction):
        cdef CCEaseBounceInOut o = cls()
        o._create(pAction)
        return o

    def __cinit__(self, CCActionInterval pAction=None):
        if pAction is not None:
            self._create(pAction)

    cdef _create(self, CCActionInterval pAction):
        self._co = <cocoa.CCObject*>actions.CCEaseBounceInOut_create(pAction.interval())


cdef class CCEaseBackIn(CCActionEase):
    @classmethod
    def create(cls, CCActionInterval pAction):
        cdef CCEaseBackIn o = cls()
        o._create1(pAction)
        return o

    def __cinit__(self, CCActionInterval pAction=None):
        if pAction is not None:
            self._create1(pAction)

    cdef _create1(self, CCActionInterval pAction):
        self._co = <cocoa.CCObject*>actions.CCEaseBackIn_create(pAction.interval())


cdef class CCEaseBackOut(CCActionEase):
    @classmethod
    def create(cls, CCActionInterval pAction):
        cdef CCEaseBackOut o = cls()
        o._create(pAction)
        return o

    def __cinit__(self, CCActionInterval pAction=None):
        if pAction is not None:
            self._create(pAction)

    cdef _create(self, CCActionInterval pAction):
        self._co = <cocoa.CCObject*>actions.CCEaseBackOut_create(pAction.interval())


cdef class CCEaseBackInOut(CCActionEase):
    @classmethod
    def create(cls, CCActionInterval pAction):
        cdef CCEaseBackInOut o = cls()
        o._create(pAction)
        return o

    def __cinit__(self, CCActionInterval pAction=None):
        if pAction is not None:
            self._create(pAction)

    cdef _create(self, CCActionInterval pAction):
        self._co = <cocoa.CCObject*>actions.CCEaseBackInOut_create(pAction.interval())


cdef class CCActionInstant(CCFiniteTimeAction):
    def new(self):
        self._co = <cocoa.CCObject*>new actions.CCActionInstant()
        self.autorelease()
        return self


cdef class CCShow(CCActionInstant):
    @classmethod
    def create(cls):
        cdef CCShow o = cls()
        o._co = <cocoa.CCObject*>actions.CCShow_create()
        return o

    def __cinit__(self):
        self._co = <cocoa.CCObject*>actions.CCShow_create()
    # CCShow()


cdef class CCHide(CCActionInstant):
    @classmethod
    def create(cls):
        cdef CCHide o = cls()
        o._co = <cocoa.CCObject*>actions.CCHide_create()
        return o
    # CCHide()

    def __cinit__(self):
        self._co = <cocoa.CCObject*>actions.CCHide_create()


cdef class CCToggleVisibility(CCActionInstant):
    @classmethod
    def create(cls):
        cdef CCToggleVisibility o = cls()
        o._co = <cocoa.CCObject*>actions.CCToggleVisibility_create()
        return o

    def __cinit__(self):
        self._co = <cocoa.CCObject*>actions.CCToggleVisibility_create()

    # CCToggleVisibility()


cdef class CCFlipX(CCActionInstant):
    @classmethod
    def create(cls, bool x):
        cdef CCFlipX o = cls()
        o._co = <cocoa.CCObject*>actions.CCFlipX_create(x)
        return o

    def __cinit__(self, x=None):
        if x is not None:
            self._co = <cocoa.CCObject*>actions.CCFlipX_create(x)

    # CCFlipX()
    # bool initWithFlipX(bool x)


cdef class CCFlipY(CCActionInstant):
    @classmethod
    def create(cls, bool y):
        cdef CCFlipY o = cls()
        o._co = <cocoa.CCObject*>actions.CCFlipY_create(y)
        return o

    def __cinit__(self, y=None):
        if y is not None:
            self._co = <cocoa.CCObject*>actions.CCFlipY_create(y)

    # CCFlipY()
    # bool initWithFlipY(bool y)


cdef class CCPlace(CCActionInstant):
    @classmethod
    def create(cls, CCPoint pos):
        cdef CCPlace o = cls()
        o._co = <cocoa.CCObject*>actions.CCPlace_create(pos._co)
        return o

    def __cinit__(self, CCPoint pos=None):
        if pos is not None:
            self._co = <cocoa.CCObject*>actions.CCPlace_create(pos._co)

    # CCPlace()


cdef class CCCallFunc(CCActionInstant):
    cdef inline actions.CCCallFunc* func(self):
        return <actions.CCCallFunc*>self._co

    @classmethod
    def create(cls, CallBack cb):
        cdef CCCallFunc o = cls()
        o._create(cb)
        return o

    @classmethod
    def createByHandler(cls, int nHandler):
        cdef CCCallFunc o = cls()
        o._co = <cocoa.CCObject*>actions.CCCallFunc_create(nHandler)
        return o

    def __cinit__(self, CallBack cb=None):
        if cb is not None:
            self._create(cb)

    cdef _create(self, CallBack cb):
        self._co = <cocoa.CCObject*>actions.CCCallFunc_create(&cb._co, cb.get_CallFunc())
        # cb.reg(self)

    def new(self):
        self._co = <cocoa.CCObject*>new actions.CCCallFunc()
        self.autorelease()
        return self

    def execute(self):
        self.func().execute()

    def getTargetCallback(self, cls=CCObject):
        cdef CCObject o = cls()
        o._co = <cocoa.CCObject*>self.func().getTargetCallback()
        return o

    def setTargetCallback(self, CCObject pSel):
        self.func().setTargetCallback(pSel._co)

    def getScriptHandler(self):
        return self.func().getScriptHandler()


cdef class CCCallFuncN(CCCallFunc):
    cdef inline actions.CCCallFuncN* funcN(self):
        return <actions.CCCallFuncN*>self._co

    @classmethod
    def createByHandler(cls, int nHandler):
        cdef CCCallFuncN o = cls()
        o._co = <cocoa.CCObject*>actions.CCCallFuncN_create(nHandler)
        return o

    @classmethod
    def create(cls, CallBack cb):
        cdef CCCallFuncN o = cls()
        o._create(cb)
        return o

    def __cinit__(self, CallBack cb=None):
        if cb is not None:
            self._create(cb)

    cdef _create(self, CallBack cb):
        self._co = <cocoa.CCObject*>actions.CCCallFuncN_create(&cb._co, cb.get_CallFuncN())
        # cb.reg(self)

    def new(self):
        self._co = <cocoa.CCObject*>new actions.CCCallFuncN()
        self.autorelease()
        return self

    def getClassTypeInfo(self):
        return self.funcN().getClassTypeInfo()


cdef class CCCallFuncND(CCCallFuncN):
    cdef inline actions.CCCallFuncND* funcND(self):
        return <actions.CCCallFuncND*>self._co

    @classmethod
    def create(cls, CallBack cb, int data=0):
        cdef CCCallFuncND o = cls()
        o._create1(cb, data)
        # cb.reg(o)
        return o
    def __cinit__(self, CallBack cb=None, int data=0):
        if cb is not None:
            self._create1(cb, data)

    cdef _create1(self, CallBack cb, int data):
        cdef void* d = NULL
        if data != 0:
            d = <void*>data
        self._co = <cocoa.CCObject*>actions.CCCallFuncND_create(
                &cb._co, cb.get_CallFuncND(), d)
        # cb.reg(self)

cdef class CCCallFuncO(CCCallFunc):
    cdef inline actions.CCCallFuncO* funcO(self):
        return <actions.CCCallFuncO*>self._co

    @classmethod
    def create(cls, CallBack cb, CCObject obj):
        cdef CCCallFuncO o = cls()
        o._create1(cb, obj)
        return o

    def __cinit__(self, CallBack cb=None, CCObject obj=None):
        if cb is not None:
            self._create1(cb, obj)

    cdef _create1(self, CallBack cb, CCObject obj):
        self._co = <cocoa.CCObject*>actions.CCCallFuncO_create(
                &cb._co, cb.get_CallFuncO(), obj._co)
        # cb.reg(self)

    def new(self):
        self._co = <cocoa.CCObject*>new actions.CCCallFuncO()
        self.autorelease()
        return self

    def getClassTypeInfo(self):
        return self.funcO().getClassTypeInfo()

    def getObject(self, cls=CCObject):
        cdef CCObject o = cls()
        o._co = self.funcO().getObject()
        return o

    def setObject(self, CCObject pObj):
        self.funcO().setObject(pObj._co)




# cdef class CCActionTweenDelegate:
#     cdef actions.CCActionTweenDelegate _co
    # def updateTweenAction(self, float value, str key):
        # self._co.updateTweenAction(value, key)

cdef class CCActionTween(CCActionInterval):
    @classmethod
    def create(cls, float aDuration, str key, float from1, float to):
        cdef CCActionTween o = cls()
        o._create(aDuration, key, from1, to)
        return o

    def __cinit__(self, aDuration=None, str key='', float from1=0.0, float to=0.0):
        if aDuration is not None:
            self._create(aDuration, key, from1, to)

    cdef _create(self, float aDuration, str key, float from1, float to):
        self._co = <cocoa.CCObject*>actions.CCActionTween_create(
                aDuration, key, from1, to)



cdef class CCActionManager(CCObject):
    cdef inline actions.CCActionManager* mgr(self):
        return <actions.CCActionManager*>self._co

    def new(self):
        self._co = <cocoa.CCObject*>new actions.CCActionManager()
        self.autorelease()
        return self

    def addAction(self, CCAction pAction, CCNode pTarget, bool paused):
        self.mgr().addAction(pAction.action(), pTarget.node(), paused)

    def removeAllActions(self):
        self.mgr().removeAllActions()

    def removeAllActionsFromTarget(self, CCObject pTarget):
        self.mgr().removeAllActionsFromTarget(pTarget._co)

    def removeAction(self, CCAction pAction):
        self.mgr().removeAction(pAction.action())

    def removeActionByTag(self, unsigned int tag, CCObject pTarget):
        self.mgr().removeActionByTag(tag, pTarget._co)

    def getActionByTag(self, unsigned int tag, CCObject pTarget):
        o = CCAction()
        o._co = <cocoa.CCObject*>self.mgr().getActionByTag(tag, pTarget._co)
        return o

    def numberOfRunningActionsInTarget(self, CCObject pTarget):
        return self.mgr().numberOfRunningActionsInTarget(pTarget._co)

    def pauseTarget(self, CCObject pTarget):
        self.mgr().pauseTarget(pTarget._co)

    def resumeTarget(self, CCObject pTarget):
        self.mgr().resumeTarget(pTarget._co)
        
    def pauseAllRunningActions(self):
        self.mgr().pauseAllRunningActions()
    
    def resumeTargets(self, CCSet targetsToResume):
        self.mgr().resumeTargets(targetsToResume.set())

        