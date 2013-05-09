# distutils: language = c++

from libcpp cimport bool
from cocoa cimport *

cdef extern from "cocos2d.h" namespace "cocos2d":
    cppclass CCTimer(CCObject):
        CCTimer()
        float getInterval()
        void setInterval(float fInterval)
        SEL_SCHEDULE getSelector() const
        bool initWithTarget(CCObject *pTarget, SEL_SCHEDULE pfnSelector)
        bool initWithTarget(CCObject *pTarget, SEL_SCHEDULE pfnSelector, float fSeconds, unsigned int nRepeat, float fDelay)
        bool initWithScriptHandler(int nHandler, float fSeconds)
        void update(float dt)
        inline int getScriptHandler()


    CCTimer* CCTimer_timerWithTarget "cocos2d::CCTimer::timerWithTarget"(CCObject *pTarget, SEL_SCHEDULE pfnSelector)
    CCTimer* CCTimer_timerWithTarget "cocos2d::CCTimer::timerWithTarget"(CCObject *pTarget, SEL_SCHEDULE pfnSelector, float fSeconds)
    CCTimer* CCTimer_timerWithScriptHandler "cocos2d::CCTimer::timerWithScriptHandler"(int nHandler, float fSeconds)


    cppclass CCScheduler(CCObject):
        CCScheduler()

        inline float getTimeScale()
        inline void setTimeScale(float fTimeScale)

        void update(float dt)

        void scheduleSelector(SEL_SCHEDULE pfnSelector, CCObject *pTarget, float fInterval, unsigned int repeat, float delay, bool bPaused)

        void scheduleSelector(SEL_SCHEDULE pfnSelector, CCObject *pTarget, float fInterval, bool bPaused)
        void scheduleUpdateForTarget(CCObject *pTarget, int nPriority, bool bPaused)

        void unscheduleSelector(SEL_SCHEDULE pfnSelector, CCObject *pTarget)

        void unscheduleUpdateForTarget(const CCObject *pTarget)

        void unscheduleAllForTarget(CCObject *pTarget)

        void unscheduleAll()
        
        void unscheduleAllWithMinPriority(int nMinPriority)

        unsigned int scheduleScriptFunc(unsigned int nHandler, float fInterval, bool bPaused)
        
        void unscheduleScriptEntry(unsigned int uScheduleScriptEntryID)

        void pauseTarget(CCObject *pTarget)

        void resumeTarget(CCObject *pTarget)

        bool isTargetPaused(CCObject *pTarget)

        CCSet* pauseAllTargets()

        CCSet* pauseAllTargetsWithMinPriority(int nMinPriority)

        void resumeTargets(CCSet* targetsToResume)


#--------------        
#--------------        
#--------------        