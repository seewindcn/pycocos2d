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

enum CBAssignType {
    CB_ASSIGN_MEMBER,
    CB_ASSIGN_CUSTOM,
};

USING_NS_CC;
USING_NS_CC_EXT;

typedef bool (*assign_func)(void* cb, int type,
        CCObject*, const char*,  void *);

class CC_DLL CCBOwner: public CCPyFunc, public CCBSelectorResolver, public CCBMemberVariableAssigner
{
public:
    inline void initAssign(assign_func func){
        m_assign = func;
    };

    void CCControlHandler(cocos2d::CCObject*, CCControlEvent);
    inline SEL_CCControlHandler get_CCControlHandler() {
        return (SEL_CCControlHandler)&CCBOwner::CCControlHandler; };
    virtual SEL_MenuHandler onResolveCCBCCMenuItemSelector(CCObject * pTarget, const char* pSelectorName);
    virtual SEL_CallFuncN onResolveCCBCCCallFuncSelector(CCObject * pTarget, const char* pSelectorName);
    virtual SEL_CCControlHandler onResolveCCBCCControlSelector(CCObject * pTarget, const char* pSelectorName);
    virtual bool onAssignCCBMemberVariable(CCObject* pTarget, const char* pMemberVariableName, CCNode* pNode);
    virtual bool onAssignCCBCustomProperty(CCObject* pTarget, const char* pMemberVariableName, CCBValue* pCCBValue);
protected:
    assign_func m_assign;
};



#endif //__COCOS2D_CC_EXT_H__
