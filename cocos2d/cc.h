/*********
*
*/
#ifndef __COCOS2D_CC_H__
#define __COCOS2D_CC_H__

#include "cocos2d.h"
#include "Python.h"
#include <typeinfo>
//using namespace cocos2d;


typedef void(*call_back_func)(void* cb, int type,
        void * var1,
        void * var2, float var3);

enum CB_TYPE {
    CB_SCHEDULE,
    CB_CallFunc,
    CB_CallFuncN,
    CB_CallFuncND,
    CB_CallFuncO,
    CB_MenuHandler,
    CB_EventHandler,
    CB_Compare,
};

//inline const char* cc_type_name(void* p) {
//    return typeid(*p).name();
//}



class CC_DLL CCPyFunc : public cocos2d::CCObject
{
public:
    CCPyFunc()
        : m_cb(NULL), m_data(NULL)
    {};

    ~CCPyFunc() {
        m_cb = NULL;
    }

    inline void init(void* data, call_back_func func){
        m_cb = func;
        m_data = data;

    }

    void Schedule(float);
    void CallFunc();
    void CallFuncN(cocos2d::CCNode*);
    void CallFuncND(cocos2d::CCNode*, void*);
    void CallFuncO(cocos2d::CCObject*);
    void MenuHandler(cocos2d::CCObject*);
    void EventHandler(cocos2d::CCEvent*);
    void Compare(cocos2d::CCObject*);
    inline cocos2d::SEL_SCHEDULE get_Schedule() {
        return (cocos2d::SEL_SCHEDULE)&CCPyFunc::Schedule; };
    inline cocos2d::SEL_CallFunc get_CallFunc() {
        return (cocos2d::SEL_CallFunc)&CCPyFunc::CallFunc; };
    inline cocos2d::SEL_CallFuncN get_CallFuncN() {
        return (cocos2d::SEL_CallFuncN)&CCPyFunc::CallFuncN; };
    inline cocos2d::SEL_CallFuncND get_CallFuncND() {
        return (cocos2d::SEL_CallFuncND)&CCPyFunc::CallFuncND; };
    inline cocos2d::SEL_CallFuncO get_CallFuncO() {
        return (cocos2d::SEL_CallFuncO)&CCPyFunc::CallFuncO; };
    inline cocos2d::SEL_MenuHandler get_MenuHandler() {
        return (cocos2d::SEL_MenuHandler)&CCPyFunc::MenuHandler; };
    inline cocos2d::SEL_EventHandler get_EventHandler() {
        return (cocos2d::SEL_EventHandler)&CCPyFunc::EventHandler; };
    inline cocos2d::SEL_Compare get_Compare() {
        return (cocos2d::SEL_Compare)&CCPyFunc::Compare; };

protected:
    call_back_func m_cb;
    void* m_data;
};


enum TOUCH_TYPE {
    TH_Began,
    TH_Moved,
    TH_Ended,
    TH_Cancelled,
    THS_Began,
    THS_Moved,
    THS_Ended,
    THS_Cancelled,
};

typedef int(*touch_func)(void* data, TOUCH_TYPE tt, cocos2d::CCTouch *pTouch,
        cocos2d::CCEvent *pEvent);
typedef void(*touchs_func)(void* data, TOUCH_TYPE tt, cocos2d::CCSet *pTouches,
        cocos2d::CCEvent *pEvent);

class CC_DLL CCPyDelegate: public cocos2d::CCObject, public cocos2d::CCTouchDelegate
{
public:
    CCPyDelegate()
    : m_touch(NULL),
        m_touchs(NULL),
        m_data(NULL)
    {};

    ~CCPyDelegate() {
        m_touch = NULL;
        m_touchs = NULL;
    }

    inline void init(void* data,
            touch_func touch,
            touchs_func touchs){
        m_touch = touch;
        m_touchs = touchs;
        m_data = data;
    }
    virtual bool ccTouchBegan(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    // optional

    virtual void ccTouchMoved(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    virtual void ccTouchEnded(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    virtual void ccTouchCancelled(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);

    // optional
    virtual void ccTouchesBegan(cocos2d::CCSet *pTouches, cocos2d::CCEvent *pEvent);
    virtual void ccTouchesMoved(cocos2d::CCSet *pTouches, cocos2d::CCEvent *pEvent);
    virtual void ccTouchesEnded(cocos2d::CCSet *pTouches, cocos2d::CCEvent *pEvent);
    virtual void ccTouchesCancelled(cocos2d::CCSet *pTouches, cocos2d::CCEvent *pEvent);
protected:
    touch_func m_touch;
    touchs_func m_touchs;
    void* m_data;
};

#endif //__COCOS2D_CC_H__

