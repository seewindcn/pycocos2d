/*************
*
**************/

#include "cc_ext.h"


void CCBOwner::CCControlHandler(CCObject* object, CCControlEvent event) {
    m_cb(m_data, CB_CCControlHandler, object, (void *)event, 0.0);
}

SEL_MenuHandler CCBOwner::onResolveCCBCCMenuItemSelector(CCObject *pTarget, char const *pSelectorName) {
    return this->get_MenuHandler();
}

SEL_CallFuncN CCBOwner::onResolveCCBCCCallFuncSelector(CCObject *pTarget, char const *pSelectorName) {
    return this->get_CallFuncN();
}

SEL_CCControlHandler CCBOwner::onResolveCCBCCControlSelector(CCObject *pTarget, char const *pSelectorName) {
    return this->get_CCControlHandler();
}