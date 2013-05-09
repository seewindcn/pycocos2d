# distutils: language = c++

from libcpp cimport bool

from include_h cimport *
from platform cimport *
from touch cimport *
from keypad cimport *

from cocoa cimport *
from ccNode cimport *
from ccScene cimport *
from ccLayer cimport *

cdef extern from "cocos2d.h" namespace "cocos2d":
    ctypedef enum ccDirectorProjection:
        # sets a 2D projection (orthogonal projection)
        kCCDirectorProjection2D
        # sets a 3D projection with a fovy=60, znear=0.5f and zfar=1500.
        kCCDirectorProjection3D
        # it calls "updateProjection" on the projection delegate.
        kCCDirectorProjectionCustom
        # Default projection is 3D projection
        kCCDirectorProjectionDefault = kCCDirectorProjection3D

    

    cppclass CCDirector(CCObject):
        CCDirector()
        bool init()
        long getClassTypeInfo()
        inline CCScene* getRunningScene()
        inline double getAnimationInterval()
        void setAnimationInterval(double dValue)
        inline bool isDisplayStats()
        inline void setDisplayStats(bool bDisplayStats)
        inline float getSecondsPerFrame()
        inline CCEGLView* getOpenGLView()
        void setOpenGLView(CCEGLView *pobOpenGLView)
        inline bool isNextDeltaTimeZero()
        void setNextDeltaTimeZero(bool bNextDeltaTimeZero)
        inline bool isPaused()
        inline unsigned int getTotalFrames()
        inline ccDirectorProjection getProjection()
        void setProjection(ccDirectorProjection kProjection)
        inline bool isSendCleanupToScene()
        CCNode* getNotificationNode()
        void setNotificationNode(CCNode *node)
        CCDirectorDelegate* getDelegate() const
        void setDelegate(CCDirectorDelegate* pDelegate)
        CCSize getWinSize()
        CCSize getWinSizeInPixels()
        CCSize getVisibleSize()
        CCPoint getVisibleOrigin()
        CCPoint convertToGL(const CCPoint& obPoint)
        CCPoint convertToUI(const CCPoint& obPoint)
        float getZEye()
        void runWithScene(CCScene *pScene)
        void pushScene(CCScene *pScene)
        void popScene()
        void popToRootScene()
        void replaceScene(CCScene *pScene)
        void end()
        void pause()
        void resume()
        void stopAnimation()
        void startAnimation()
        void drawScene()
        void purgeCachedData()
        void setGLDefaultValues()
        void setAlphaBlending(bool bOn)
        void setDepthTest(bool bOn)
        void mainLoop()
        void setContentScaleFactor(float scaleFactor)
        float getContentScaleFactor()


        #CC_PROPERTY(CCScheduler*, m_pScheduler, Scheduler);
        CCScheduler* getScheduler()
        void setScheduler(CCScheduler* var)

        #CC_PROPERTY(CCActionManager*, m_pActionManager, ActionManager);
        CCActionManager* getActionManager()
        void setActionManager(CCActionManager* var)

        #CC_PROPERTY(CCTouchDispatcher*, m_pTouchDispatcher, TouchDispatcher);
        CCTouchDispatcher* getTouchDispatcher()
        void setTouchDispatcher(CCTouchDispatcher* var)

        #CC_PROPERTY(CCKeypadDispatcher*, m_pKeypadDispatcher, KeypadDispatcher);
        CCKeypadDispatcher* getKeypadDispatcher()
        void setKeypadDispatcher(CCKeypadDispatcher* var)

        # #CC_PROPERTY(CCAccelerometer*, m_pAccelerometer, Accelerometer);
        # CCAccelerometer* getAccelerometer()
        # void setAccelerometer(CCAccelerometer* var)


    CCDirector* sharedDirector "cocos2d::CCDirector::sharedDirector"()










