/*********
*
*/
#ifndef __COCOS2D_CC_EXT_H__
#define __COCOS2D_CC_EXT_H__

#include "cocos-ext.h"
#include "cc.h"

enum{
    CB_CCControlHandler = CB_Compare + 1,
};

USING_NS_CC;
USING_NS_CC_EXT;

class CC_DLL CCBOwner: public CCPyFunc, CCBSelectorResolver
{
public:
    void CCControlHandler(cocos2d::CCObject*, CCControlEvent);
    inline SEL_CCControlHandler get_CCControlHandler() {
        return (SEL_CCControlHandler)&CCBOwner::CCControlHandler; };
    virtual SEL_MenuHandler onResolveCCBCCMenuItemSelector(CCObject * pTarget, const char* pSelectorName);
    virtual SEL_CallFuncN onResolveCCBCCCallFuncSelector(CCObject * pTarget, const char* pSelectorName);
    virtual SEL_CCControlHandler onResolveCCBCCControlSelector(CCObject * pTarget, const char* pSelectorName);
};



#endif //__COCOS2D_CC_EXT_H__
