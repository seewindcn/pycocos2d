# distutils: language = c++

from libcpp cimport bool
from touch cimport *
from cocoa cimport *
from platform cimport *
from script cimport *
from ccLayer cimport *
from label_nodes cimport *
from ccNode cimport *
from sprite cimport *

cdef extern from "cocos2d.h" namespace "cocos2d":
    ctypedef enum tCCMenuState:
        kCCMenuStateWaiting,
        kCCMenuStateTrackingTouch
        kCCMenuHandlerPriority

    cppclass CCMenu(CCLayer):
        CCMenu()
        bool init()

        bool initWithArray(CCArray* pArrayOfItems)

        void alignItemsVertically()
        void alignItemsVerticallyWithPadding(float padding)

        void alignItemsHorizontally()
        void alignItemsHorizontallyWithPadding(float padding)

        void alignItemsInColumns(unsigned int columns, ...)
        void alignItemsInColumns(unsigned int columns, va_list args)
        void alignItemsInColumnsWithArray(CCArray* rows)

        void alignItemsInRows(unsigned int rows, ...)
        void alignItemsInRows(unsigned int rows, va_list args)
        void alignItemsInRowsWithArray(CCArray* columns)

        void setHandlerPriority(int newPriority)


        void setOpacityModifyRGB(bool bValue)
        bool isOpacityModifyRGB()
        
        bool isEnabled()
        void setEnabled(bool value)

    CCMenu* CCMenu_create"cocos2d::CCMenu::create"()
    CCMenu* CCMenu_create"cocos2d::CCMenu::create"(CCMenuItem* item, ...)
    CCMenu* CCMenu_createWithArray"cocos2d::CCMenu::createWithArray"(CCArray* pArrayOfItems)
    CCMenu* CCMenu_createWithItem"cocos2d::CCMenu::createWithItem"(CCMenuItem* item)
    CCMenu* CCMenu_createWithItems"cocos2d::CCMenu::createWithItems"(CCMenuItem *firstItem, va_list args)



    cppclass CCMenuItem(CCNode):
        CCMenuItem()
        bool initWithTarget(CCObject *rec, SEL_MenuHandler selector)
        CCRect rect()
        void activate()
        void selected()
        void unselected()
        
        int getScriptTapHandler()

        bool isEnabled()
        void setEnabled(bool value)
        bool isSelected()
        
        # void setTarget(CCObject *rec, SEL_MenuHandler selector)

    CCMenuItem* CCMenuItem_create"cocos2d::CCMenuItem::create"()
    CCMenuItem* CCMenuItem_create"cocos2d::CCMenuItem::create"(CCObject *rec, SEL_MenuHandler selector)


    cppclass CCMenuItemLabel(CCMenuItem):
        CCMenuItemLabel()
        bool initWithLabel(CCNode* label, CCObject* target, SEL_MenuHandler selector)
        void setString(const char * label)
        void activate()
        void selected()
        void unselected()
        void setOpacity(GLubyte opacity)
        GLubyte getOpacity()
        void setColor(const ccColor3B& color)
        const ccColor3B& getColor()
        
        void setOpacityModifyRGB(bool bValue)
        bool isOpacityModifyRGB()


    CCMenuItemLabel* CCMenuItemLabel_create"cocos2d::CCMenuItemLabel::create"(CCNode*label, CCObject* target, SEL_MenuHandler selector)
    CCMenuItemLabel* CCMenuItemLabel_create"cocos2d::CCMenuItemLabel::create"(CCNode *label)


    cppclass CCMenuItemAtlasFont(CCMenuItemLabel):
        CCMenuItemAtlasFont()
        bool initWithString(const char *value, const char *charMapFile, int itemWidth, int itemHeight, char startCharMap, CCObject* target, SEL_MenuHandler selector)
    CCMenuItemAtlasFont* CCMenuItemAtlasFont_create"cocos2d::CCMenuItemAtlasFont::create"(const char *value, const char *charMapFile, int itemWidth, int itemHeight, char startCharMap)
    CCMenuItemAtlasFont* CCMenuItemAtlasFont_create"cocos2d::CCMenuItemAtlasFont::create"(const char *value, const char *charMapFile, int itemWidth, int itemHeight, char startCharMap, CCObject* target, SEL_MenuHandler selector)


    cppclass CCMenuItemFont(CCMenuItemLabel):
        CCMenuItemFont()
        bool initWithString(const char *value, CCObject* target, SEL_MenuHandler selector)
        void setFontSizeObj(unsigned int s)
        unsigned int fontSizeObj()
        void setFontNameObj(const char* name)
        const char* fontNameObj()

    void CCMenuItemFont_setFontSize"cocos2d::CCMenuItemFont::setFontSize"(unsigned int s)
    unsigned int CCMenuItemFont_fontSize"cocos2d::CCMenuItemFont::fontSize"()
    void CCMenuItemFont_setFontName"cocos2d::CCMenuItemFont::setFontName"(const char *name)
    const char *CCMenuItemFont_fontName"cocos2d::CCMenuItemFont::fontName"()
    CCMenuItemFont * CCMenuItemFont_create"cocos2d::CCMenuItemFont::create"(const char *value)
    CCMenuItemFont * CCMenuItemFont_create"cocos2d::CCMenuItemFont::create"(const char *value, CCObject* target, SEL_MenuHandler selector)

  
    cppclass CCMenuItemSprite(CCMenuItem):
        # CC_PROPERTY(CCNode*, m_pNormalImage, NormalImage)
        CCNode* getNormalImage()
        void setNormalImage(CCNode* var)
        # CC_PROPERTY(CCNode*, m_pSelectedImage, SelectedImage)
        CCNode* getSelectedImage()
        void setSelectedImage(CCNode* var)
        # CC_PROPERTY(CCNode*, m_pDisabledImage, DisabledImage)
        CCNode* getDisabledImage()
        void setDisabledImage(CCNode* var)

        CCMenuItemSprite()
        bool initWithNormalSprite(CCNode* normalSprite, CCNode* selectedSprite, CCNode* disabledSprite, CCObject* target, SEL_MenuHandler selector)
        void setColor(const ccColor3B& color)
        const ccColor3B& getColor()
        void setOpacity(GLubyte opacity)
        GLubyte getOpacity()
    
        void selected()
        void unselected()
        void setEnabled(bool bEnabled)
        
        void setOpacityModifyRGB(bool bValue)
        bool isOpacityModifyRGB()

    CCMenuItemSprite * CCMenuItemSprite_create"cocos2d::CCMenuItemSprite::create"(CCNode* normalSprite, CCNode* selectedSprite, CCNode* disabledSprite)
    CCMenuItemSprite * CCMenuItemSprite_create"cocos2d::CCMenuItemSprite::create"(CCNode* normalSprite, CCNode* selectedSprite, CCObject* target, SEL_MenuHandler selector)
    CCMenuItemSprite * CCMenuItemSprite_create"cocos2d::CCMenuItemSprite::create"(CCNode* normalSprite, CCNode* selectedSprite, CCNode* disabledSprite, CCObject* target, SEL_MenuHandler selector)


    cppclass CCMenuItemImage(CCMenuItemSprite):
        CCMenuItemImage()
        bool init()
        bool initWithNormalImage(const char *normalImage, const char *selectedImage, const char *disabledImage, CCObject* target, SEL_MenuHandler selector)
        void setNormalSpriteFrame(CCSpriteFrame* frame)
        void setSelectedSpriteFrame(CCSpriteFrame* frame)
        void setDisabledSpriteFrame(CCSpriteFrame* frame)

    CCMenuItemImage* CCMenuItemImage_create"cocos2d::CCMenuItemImage::create"()
    CCMenuItemImage* CCMenuItemImage_create"cocos2d::CCMenuItemImage::create"(const char *normalImage, const char *selectedImage)
    CCMenuItemImage* CCMenuItemImage_create"cocos2d::CCMenuItemImage::create"(const char *normalImage, const char *selectedImage, const char *disabledImage)
    CCMenuItemImage* CCMenuItemImage_create"cocos2d::CCMenuItemImage::create"(const char *normalImage, const char *selectedImage, CCObject* target, SEL_MenuHandler selector)
    CCMenuItemImage* CCMenuItemImage_create"cocos2d::CCMenuItemImage::create"(const char *normalImage, const char *selectedImage, const char *disabledImage, CCObject* target, SEL_MenuHandler selector)


    cppclass CCMenuItemToggle(CCMenuItem):
        # CC_PROPERTY(GLubyte, m_cOpacity, Opacity)
        GLubyte getOpacity()
        void setOpacity(GLubyte var)
        # CC_PROPERTY_PASS_BY_REF(ccColor3B, m_tColor, Color)
        ccColor3B getColor()
        void setColor(ccColor3B var)
        # CC_PROPERTY(unsigned int, m_uSelectedIndex, SelectedIndex)
        unsigned int getSelectedIndex()
        void setSelectedIndex(unsigned int var)
        # CC_PROPERTY(CCArray*, m_pSubItems, SubItems)
        CCArray* getSubItems()
        void setSubItems(CCArray* var)

        CCMenuItemToggle()
        bool initWithTarget(CCObject* target, SEL_MenuHandler selector, CCMenuItem* item, va_list args)
        bool initWithItem(CCMenuItem *item)
        void addSubItem(CCMenuItem *item)
        
        CCMenuItem* selectedItem()
        void activate()
        void selected()
        void unselected()
        void setEnabled(bool var)
        
        void setOpacityModifyRGB(bool bValue)
        bool isOpacityModifyRGB()
    CCMenuItemToggle* CCMenuItemToggle_createWithTarget"cocos2d::CCMenuItemToggle::createWithTarget"(CCObject* target, SEL_MenuHandler selector, CCMenuItem* item, ...)  
    CCMenuItemToggle* CCMenuItemToggle_create"cocos2d::CCMenuItemToggle::create"()
    CCMenuItemToggle* CCMenuItemToggle_create"cocos2d::CCMenuItemToggle::create"(CCMenuItem *item)








