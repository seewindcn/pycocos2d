# distutils: language = c++

from libcpp cimport bool
from shaders cimport *
from cocoa cimport *

cdef extern from "cocos2d.h" namespace "cocos2d":
    cppclass CCCamera
    cppclass CCGridBase
    cppclass CCTouch
    cppclass CCAction
    cppclass CCRGBAProtocol
    cppclass CCLabelProtocol
    cppclass CCScheduler
    cppclass CCActionManager
    cppclass CCGLProgram


    cppclass CCNode(CCObject):
        char* description()
        void setZOrder(int zOrder)
        int getZOrder()
        void setVertexZ(float vertexZ)
        float getVertexZ()
        void setScaleX(float fScaleX)
        float getScaleX()
        void setScaleY(float fScaleY)
        float getScaleY()
        void setScale(float scale)
        float getScale()
        void setPosition(CCPoint &position)
        CCPoint& getPosition()
        void setPosition(float x, float y)
        void getPosition(float* x, float* y)
        void setPositionX(float x)
        float getPositionX()
        void setPositionY(float y)
        float getPositionY()
        void setSkewX(float fSkewX)
        float getSkewX()
        void setSkewY(float fSkewY)
        float getSkewY()
        void setAnchorPoint(CCPoint& anchorPoint)
        CCPoint& getAnchorPoint()
        CCPoint& getAnchorPointInPoints()
        void setContentSize(CCSize& contentSize)
        CCSize& getContentSize()
        void setVisible(bool visible)
        bool isVisible()
        void setRotation(float fRotation)
        float getRotation()
        void setRotationX(float fRotaionX)
        float getRotationX()
        void setRotationY(float fRotationY)
        float getRotationY()
        void setOrderOfArrival(unsigned int uOrderOfArrival)
        unsigned int getOrderOfArrival()
        void setGLServerState(ccGLServerState glServerState)
        ccGLServerState getGLServerState()
        void ignoreAnchorPointForPosition(bool ignore)
        bool isIgnoreAnchorPointForPosition()

        #/// @name Children and Parent
        void addChild(CCNode * child)
        void addChild(CCNode * child, int zOrder)
        void addChild(CCNode* child, int zOrder, int tag)
        CCNode * getChildByTag(int tag)
        CCArray* getChildren()
        unsigned int getChildrenCount()
        void setParent(CCNode* parent)
        CCNode* getParent()
        void removeFromParent()
        void removeFromParentAndCleanup(bool cleanup)
        void removeChild(CCNode* child)
        void removeChild(CCNode* child, bool cleanup)
        void removeChildByTag(int tag)
        void removeChildByTag(int tag, bool cleanup)
        void removeAllChildren()
        void removeAllChildrenWithCleanup(bool cleanup)
        void reorderChild(CCNode * child, int zOrder)
        void sortAllChildren()

        #/// @name Grid object for effects
        CCGridBase* getGrid()
        void setGrid(CCGridBase *pGrid)

        #/// @name Tag & User data
        int getTag()
        void setTag(int nTag)
        void* getUserData()
        void setUserData(void *pUserData)
        void setUserObject(CCObject *pUserObject)

        #/// @name Shader Program
        CCGLProgram* getShaderProgram()
        void setShaderProgram(CCGLProgram *pShaderProgram)

        CCCamera* getCamera()
        bool isRunning()

        #/// @name Script Bindings for lua
        void registerScriptHandler(int handler)
        void unregisterScriptHandler()
        inline int getScriptHandler()
        void scheduleUpdateWithPriorityLua(int nHandler, int priority)

        #/// @name Event Callbacks
        void onEnter()
        void onEnterTransitionDidFinish()
        void onExit()
        void onExitTransitionDidStart()

        void cleanup()
        void draw()
        void visit()
        CCRect boundingBox()

        #/// @name Actions
        void setActionManager(CCActionManager* actionManager)
        CCActionManager* getActionManager()
        CCAction* runAction(CCAction* action)
        void stopAllActions()
        void stopAction(CCAction* action)
        void stopActionByTag(int tag)
        CCAction* getActionByTag(int tag)
        unsigned int numberOfRunningActions()

        #/// @name Scheduler and Timer
        void setScheduler(CCScheduler* scheduler)
        CCScheduler* getScheduler()
        bool isScheduled(SEL_SCHEDULE selector)
        void scheduleUpdate()
        void scheduleUpdateWithPriority(int priority)
        void unscheduleUpdate()
        void schedule(SEL_SCHEDULE selector, float interval, unsigned int repeat, float delay)
        void schedule(SEL_SCHEDULE selector, float interval)
        void scheduleOnce(SEL_SCHEDULE selector, float delay)
        void schedule(SEL_SCHEDULE selector)
        void unschedule(SEL_SCHEDULE selector)
        void unscheduleAllSelectors()
        void resumeSchedulerAndActions()
        void pauseSchedulerAndActions()
        void update(float delta)

        #/// @name Transformations
        void transform()
        void transformAncestors()
        CCAffineTransform nodeToParentTransform()
        CCAffineTransform parentToNodeTransform()
        CCAffineTransform nodeToWorldTransform()
        CCAffineTransform worldToNodeTransform()

        #/// @name Coordinate Converters
        CCPoint convertToNodeSpace(CCPoint& worldPoint)
        CCPoint convertToWorldSpace(CCPoint& nodePoint)
        CCPoint convertToNodeSpaceAR(CCPoint& worldPoint)
        CCPoint convertToWorldSpaceAR(CCPoint& nodePoint)
        CCPoint convertTouchToNodeSpace(CCTouch * touch)
        CCPoint convertTouchToNodeSpaceAR(CCTouch * touch)

    #-----------CCAtlasNode.h-------------------
    cppclass CCTextureAtlas
    cppclass CCTextureProtocol
    cppclass CCTexture2D

    #cppclass CCAtlasNode(CCNode, CCRGBAProtocol, CCTextureProtocol):
    cppclass CCAtlasNode(CCNode):
        void CCAtlasNode()
        bool initWithTileFile(const char* tile, unsigned int tileWidth, unsigned int tileHeight, unsigned int itemsToRender)
        void updateAtlasValues()
        void draw()
        CCTexture2D* getTexture()
        void setTexture(CCTexture2D *texture)


    CCAtlasNode * CCAtlasNode_create"cocos2d::CCAtlasNode::create"(const char* tile,
        unsigned int tileWidth, unsigned int tileHeight,
        unsigned int itemsToRender)

#---------------------
#---------------------
