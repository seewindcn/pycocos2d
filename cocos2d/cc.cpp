/*************
*
**************/

#include "cc.h"

void CCPyFunc::Schedule(float d) {
    m_cb(m_data, CB_SCHEDULE, NULL, NULL, d);
//    if (m_isFunc) {
//        PyObject_Call(m_obj, Py_BuildValue("(d)", d), NULL);
//        return;
//    }
//    PyObject* func = PyObject_GetAttrString(m_obj, "Schedule");
//    PyObject_Call(func, Py_BuildValue("(d)", d), NULL);
}

void CCPyFunc::CallFunc() {
    m_cb(m_data, CB_CallFunc, NULL, NULL, 0.0);
}

void CCPyFunc::CallFuncN(cocos2d::CCNode * var) {
    m_cb(m_data, CB_CallFuncN, var, NULL, 0.0);
}

void CCPyFunc::CallFuncND(cocos2d::CCNode * var, void * var1) {
    m_cb(m_data, CB_CallFuncND, var, var1, 0.0);
}

void CCPyFunc::CallFuncO(cocos2d::CCObject *var) {
    m_cb(m_data, CB_CallFuncO, var, NULL, 0.0);
}

void CCPyFunc::MenuHandler(cocos2d::CCObject *var) {
    m_cb(m_data, CB_MenuHandler, var, NULL, 0.0);
}

void CCPyFunc::EventHandler(cocos2d::CCEvent *var) {
    m_cb(m_data, CB_EventHandler, var, NULL, 0.0);
}

void CCPyFunc::Compare(cocos2d::CCObject *var) {
    m_cb(m_data, CB_Compare, var, NULL, 0.0);
}


bool CCPyDelegate::ccTouchBegan(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent) {
    return m_touch(m_data, TH_Began, pTouch, pEvent);
}

void CCPyDelegate::ccTouchMoved(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent) {
    m_touch(m_data, TH_Moved, pTouch, pEvent);

}

void CCPyDelegate::ccTouchEnded(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent) {
    m_touch(m_data, TH_Ended, pTouch, pEvent);

}

void CCPyDelegate::ccTouchCancelled(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent) {
    m_touch(m_data, TH_Cancelled, pTouch, pEvent);
}


void CCPyDelegate::ccTouchesBegan(cocos2d::CCSet *pTouches, cocos2d::CCEvent *pEvent) {
    m_touchs(m_data, THS_Began, pTouches, pEvent);
}

void CCPyDelegate::ccTouchesMoved(cocos2d::CCSet *pTouches, cocos2d::CCEvent *pEvent) {
    m_touchs(m_data, THS_Moved, pTouches, pEvent);
}

void CCPyDelegate::ccTouchesEnded(cocos2d::CCSet *pTouches, cocos2d::CCEvent *pEvent) {
    m_touchs(m_data, THS_Ended, pTouches, pEvent);
}

void CCPyDelegate::ccTouchesCancelled(cocos2d::CCSet *pTouches, cocos2d::CCEvent *pEvent) {
    m_touchs(m_data, THS_Cancelled, pTouches, pEvent);
}