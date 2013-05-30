#----------ccNode.pxd-----------
cdef class CCNode(CCObject):
    cdef inline ccNode.CCNode *node(self):
        return <ccNode.CCNode*> self._co

    def description(self):
        return self.node().description()

    def setZOrder(self, int zOrder):
        self.node().setZOrder(zOrder)

    def getZOrder(self):
        return self.node().getZOrder()

    def setVertexZ(self, float vertexZ):
        self.node().setVertexZ(vertexZ)

    def getVertexZ(self):
        return self.node().getVertexZ()

    def setScaleX(self, float fScaleX):
        self.node().setScaleX(fScaleX)

    def getScaleX(self):
        return self.node().getScaleX()

    def setScaleY(self, float fScaleY):
        self.node().setScaleY(fScaleY)

    def getScaleY(self):
        return self.node().getScaleY()

    def setScale(self, scale):
        self.node().setScale(scale)

    def getScale(self):
        return self.node().getScale()

    def setPosition1(self, CCPoint position):
        self.node().setPosition(position._co)

    def getPosition(self):
        p = CCPoint()
        p._co = self.node().getPosition()
        return p

    def setPosition(self, x, y):
        self.node().setPosition(x, y)

    def getPositionXY(self):
        return self.node().getPositionX(), self.node().getPositionY()

    def setPositionX(self, x):
        self.node().setPositionX(x)

    def getPositionX(self):
        return self.node().getPositionX()

    def setPositionY(self, y):
        self.node().setPositionY(y)

    def getPositionY(self):
        return self.node().getPositionY()

    def setSkewX(self, fSkewX):
        self.node().setSkewX(fSkewX)

    def getSkewX(self):
        return self.node().getSkewX()

    def setSkewY(self, fSkewY):
        self.node().setSkewY(fSkewY)

    def getSkewY(self):
        return self.node().getSkewY()

    def setAnchorPoint(self, x, y):
        cdef cocoa.CCPoint co
        co.setPoint(x, y)
        self.node().setAnchorPoint(co)

    def setAnchorPoint1(self, CCPoint anchorPoint):
        self.node().setAnchorPoint(anchorPoint._co)

    def getAnchorPoint(self):
        p = CCPoint()
        p._co = self.node().getAnchorPoint()
        return p

    def getAnchorPointInPoints(self):
        p = CCPoint()
        p._co = self.node().getAnchorPointInPoints()
        return p

    def setContentSize(self, CCSize contentSize):
        self.node().setContentSize(contentSize._co)

    def getContentSize(self):
        s = CCSize()
        s._co = self.node().getContentSize()
        return s

    def setVisible(self, bool visible):
        self.node().setVisible(visible)

    def isVisible(self):
        return self.node().isVisible()

    def setRotation(self, fRotation):
        self.node().setRotation(fRotation)

    def getRotation(self):
        return self.node().getRotation()

    def setRotationX(self, fRotaionX):
        self.node().setRotationX(fRotaionX)

    def getRotationX(self):
        return self.node().getRotationX()

    def setRotationY(self, fRotationY):
        self.node().setRotationY(fRotationY)

    def getRotationY(self):
        return self.node().getRotationY()


    def setOrderOfArrival(self, unsigned int uOrderOfArrival):
        self.node().setOrderOfArrival(uOrderOfArrival)

    def getOrderOfArrival(self):
        return self.node().getOrderOfArrival()

    def setGLServerState(self, shaders.ccGLServerState glServerState):
        self.node().setGLServerState(glServerState)

    def getGLServerState(self):
        return self.node().getGLServerState()

    def ignoreAnchorPointForPosition(self, bool ignore):
        self.node().ignoreAnchorPointForPosition(ignore)

    def isIgnoreAnchorPointForPosition(self):
        return self.node().isIgnoreAnchorPointForPosition()


    def addChild(self, CCNode child, zOrder=None, tag=None):
        if zOrder is None and tag is None:
            self.node().addChild(child.node())
        elif tag is None:
            self.node().addChild(child.node(), zOrder)
        else:
            self.node().addChild(child.node(), zOrder, tag)

    def getChildByTag(self, int tag):
        n = CCNode()
        n._co = <cocoa.CCObject*>self.node().getChildByTag(tag)
        return n

    def getChildren(self):
        a = CCArray()
        a._co = <cocoa.CCObject*>self.node().getChildren()
        return a

    def getChildrenCount(self):
        return self.node().getChildrenCount()

    def setParent(self, CCNode parent):
        self.node().setParent(parent.node())

    def getParent(self):
        n = CCNode()
        n._co = <cocoa.CCObject*>self.node().getParent()
        return n

    def removeFromParent(self):
        self.node().removeFromParent()

    def removeFromParentAndCleanup(self, bool cleanup):
        self.node().removeFromParentAndCleanup(cleanup)

    def removeChild(self, CCNode child, cleanup=None):
        if cleanup is None:
            self.node().removeChild(child.node())
        else:
            self.node().removeChild(child.node(), cleanup)

    def removeChildByTag(self, int tag, cleanup=None):
        if cleanup is None:
            self.node().removeChildByTag(tag)
        else:
            self.node().removeChildByTag(tag, cleanup)

    def removeAllChildren(self, cleanup=None):
        if cleanup is None:
            self.node().removeAllChildren()
        else:
            self.node().removeAllChildrenWithCleanup(cleanup)

    def removeAllChildrenWithCleanup(self, cleanup):
        self.node().removeAllChildrenWithCleanup(cleanup)

    def reorderChild(self, CCNode child, int zOrder):
        self.node().reorderChild(child.node(), zOrder)

    def sortAllChildren(self):
        self.node().sortAllChildren()


    # CCGridBase* getGrid()
    # void setGrid(CCGridBase *pGrid)

    #/// @name Tag & User data
    def getTag(self):
        return self.node().getTag()

    def setTag(self, int nTag):
        self.node().setTag(nTag)

    def getUserData(self):
        return <object>self.node().getUserData()

    def setUserData(self, object pUserData):
        self.node().setUserData(<void*>pUserData)

    def setUserObject(self, CCObject pUserObject):
        self.node().setUserObject(pUserObject._co)

    #/// @name Shader Program
    # CCGLProgram* getShaderProgram()
    # void setShaderProgram(CCGLProgram *pShaderProgram)

    def getCamera(self):
        c = CCCamera()
        c._co = <cocoa.CCObject*>self.node().getCamera()
        return c

    def isRunning(self):
        return self.node().isRunning()

    #/// @name Script Bindings for lua
    def registerScriptHandler(self, int handler):
        self.node().registerScriptHandler(handler)

    def unregisterScriptHandler(self):
        self.node().unregisterScriptHandler()

    cdef inline int getScriptHandler(self):
        return self.node().getScriptHandler()

    def scheduleUpdateWithPriorityLua(self, int nHandler, int priority):
        self.node().scheduleUpdateWithPriorityLua(nHandler, priority)


        # #/// @name Event Callbacks
        # void onEnter()
        # void onEnterTransitionDidFinish()
        # void onExit()
        # void onExitTransitionDidStart()

    def cleanup(self):
        self.node().cleanup()

    def draw(self):
        self.node().draw()

    def visit(self):
        self.node().visit()

    def boundingBox(self):
        o = CCRect()
        o._co = self.node().boundingBox()
        return o

    #/// @name Actions
    def getActionManager(self):
        o = CCActionManager()
        o._co = <cocoa.CCObject*>self.node().getActionManager()
        return o
    def setActionManager(self, CCActionManager actionManager):
        self.node().setActionManager(actionManager.mgr())
    Manager = property(getActionManager, setActionManager)

    def runAction(self, CCAction action):
        o = CCAction()
        o._co = <cocoa.CCObject*>self.node().runAction(action.action())
        return o

    def stopAllActions(self):
        self.node().stopAllActions()

    def stopAction(self, CCAction action):
        self.node().stopAction(action.action())

    def stopActionByTag(self, int tag):
        self.node().stopActionByTag(tag)

    def getActionByTag(self, int tag):
        o = CCAction()
        o._co = <cocoa.CCObject*>self.node().getActionByTag(tag)
        return o
    def numberOfRunningActions(self):
        return self.node().numberOfRunningActions()

        # #/// @name Scheduler and Timer
    def setScheduler(self, CCScheduler scheduler):
        self.node().setScheduler(scheduler.scheduler())

    def getScheduler(self):
        o = CCScheduler()
        o._co = <cocoa.CCObject*>self.node().getScheduler()
        return o

    # def isScheduled(self, int selector):
    #     return self.node().isScheduled(<cocoa.SEL_SCHEDULE>selector)

    def scheduleUpdate(self):
        self.node().scheduleUpdate()

    def scheduleUpdateWithPriority(self, int priority):
        self.node().scheduleUpdateWithPriority(priority)

    def unscheduleUpdate(self):
        self.node().unscheduleUpdate()

        # void schedule(SEL_SCHEDULE selector, float interval, unsigned int repeat, float delay)
        # void schedule(SEL_SCHEDULE selector, float interval)
        # void scheduleOnce(SEL_SCHEDULE selector, float delay)
        # void schedule(SEL_SCHEDULE selector)
        # void unschedule(SEL_SCHEDULE selector)

    def unscheduleAllSelectors(self):
        self.node().unscheduleAllSelectors()

    def resumeSchedulerAndActions(self):
        self.node().resumeSchedulerAndActions()

    def pauseSchedulerAndActions(self):
        self.node().pauseSchedulerAndActions()


    #/// @name Transformations
    def transform(self):
        self.node().transform()

    def transformAncestors(self):
        self.node().transformAncestors()

    def nodeToParentTransform(self):
        o = CCAffineTransform()
        o._co = self.node().nodeToParentTransform()
        return o
    def parentToNodeTransform(self):
        o = CCAffineTransform()
        o._co = self.node().parentToNodeTransform()
        return o
    def nodeToWorldTransform(self):
        o = CCAffineTransform()
        o._co = self.node().nodeToWorldTransform()
        return o
    def worldToNodeTransform(self):
        o = CCAffineTransform()
        o._co = self.node().worldToNodeTransform()
        return o

    #/// @name Coordinate Converters
    def convertToNodeSpace(self, CCPoint worldPoint):
        o = CCPoint()
        o._co = self.node().convertToNodeSpace(worldPoint._co)
        return o

    def convertToWorldSpace(self, CCPoint nodePoint):
        o = CCPoint()
        o._co = self.node().convertToWorldSpace(nodePoint._co)
        return o

    def convertToNodeSpaceAR(self, CCPoint worldPoint):
        o = CCPoint()
        o._co = self.node().convertToNodeSpaceAR(worldPoint._co)
        return o

    def convertToWorldSpaceAR(self, CCPoint nodePoint):
        o = CCPoint()
        o._co = self.node().convertToWorldSpaceAR(nodePoint._co)
        return o

    def convertTouchToNodeSpace(self, CCTouch touch):
        o = CCPoint()
        o._co = self.node().convertTouchToNodeSpace(touch.touch())
        return o

    def convertTouchToNodeSpaceAR(self, CCTouch touch):
        o = CCPoint()
        o._co = self.node().convertTouchToNodeSpaceAR(touch.touch())
        return o


cdef class CCAtlasNode(CCNode):
    cdef inline ccNode.CCAtlasNode* atlas(self):
        return <ccNode.CCAtlasNode*>self._co

    @classmethod
    def create(cls, str tile,unsigned int tileWidth, 
            unsigned int tileHeight, unsigned int itemsToRender):
        o = cls()
        o.set_co(<int>ccNode.CCAtlasNode_create(tile,
                tileWidth, tileHeight,
                itemsToRender))
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new ccNode.CCAtlasNode()
        self.autorelease()
        return self

    def initWithTileFile(self, str tile, unsigned int tileWidth, 
            unsigned int tileHeight, unsigned int itemsToRender):
        return self.atlas().initWithTileFile(tile, tileWidth,
                tileHeight, itemsToRender)

    def updateAtlasValues(self):
        self.atlas().updateAtlasValues()

    def getTexture(self):
        o = CCTexture2D()
        o._co = <cocoa.CCObject*>self.atlas().getTexture()
        return o
    def setTexture(self, CCTexture2D texture):
        self.atlas().setTexture(texture.texture2d())

