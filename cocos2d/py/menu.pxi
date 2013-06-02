cdef class CCMenu(CCLayer):
    cdef inline menu_nodes.CCMenu* menu(self):
        return <menu_nodes.CCMenu*>self._co

    @classmethod
    def create(cls, *args):
        cdef CCArray array
        o = cls()
        if not args:
            o.set_co(<int>menu_nodes.CCMenu_create())
        else:
            array = CCArray.create(len(args))
            for item in args:
                array.addObject(<CCMenuItem>item)
            o.set_co(<int>menu_nodes.CCMenu_createWithArray(array.array()))
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new menu_nodes.CCMenu()
        self.autorelease()
        return self

    def initWithArray(self, CCArray pArrayOfItems):
        return self.menu().initWithArray(pArrayOfItems.array())

    def alignItemsVertically(self):
        self.menu().alignItemsVertically()

    def alignItemsVerticallyWithPadding(self, padding):
        padding = float(padding)
        self.menu().alignItemsVerticallyWithPadding(padding)

    def alignItemsHorizontally(self):
        self.menu().alignItemsHorizontally()

    def alignItemsHorizontallyWithPadding(self, padding):
        padding = float(padding)
        self.menu().alignItemsHorizontallyWithPadding(padding)

    # def alignItemsInColumns(self, unsigned int columns, ...):
    def alignItemsInColumns(self, unsigned int columns, *args):
        cdef CCArray array = CCArray.create(len(args)+1)
        array.addObject(CCInteger(columns))
        for i in args:
            array.addObject(CCInteger(i))
        self.menu().alignItemsInColumnsWithArray(array.array())

    def alignItemsInColumnsWithArray(self, CCArray rows):
        self.menu().alignItemsInColumnsWithArray(rows.array())

    # def alignItemsInRows(unsigned int rows, ...)
    def alignItemsInRows(self, unsigned int rows, *args):
        cdef CCArray array = CCArray.create(len(args)+1)
        array.addObject(CCInteger(rows))
        for i in args:
            array.addObject(CCInteger(i))
        self.menu().alignItemsInRowsWithArray(array.array())

    def alignItemsInRowsWithArray(self, CCArray columns):
        self.menu().alignItemsInRowsWithArray(columns.array())

    def setHandlerPriority(self, int newPriority):
        self.menu().setHandlerPriority(newPriority)

    def setOpacityModifyRGB(self, bool bValue):
        self.menu().setOpacityModifyRGB(bValue)

    def isOpacityModifyRGB(self):
        return self.menu().isOpacityModifyRGB()
    
    def isEnabled(self):
        return self.menu().isEnabled()
    def setEnabled(self, bool value):
        self.menu().setEnabled(value)


cdef class CCMenuItem(CCNode):
    cdef inline menu_nodes.CCMenuItem* item(self):
        return <menu_nodes.CCMenuItem*>self._co

    # @classmethod
    # def create(cls, CCObject *rec, SEL_MenuHandler selector):

    def new(self):
        self._co = <cocoa.CCObject*>new menu_nodes.CCMenuItem()
        self.autorelease()
        return self

    # def initWithTarget(self, CCObject rec, SEL_MenuHandler selector)

    def rect(self):
        o = CCRect()
        o._co = self.item().rect()
        return o

    def activate(self):
        self.item().activate()

    def selected(self):
        self.item().selected()

    def unselected(self):
        self.item().unselected()
    
    def getScriptTapHandler(self):
        return self.item().getScriptTapHandler()

    def isEnabled(self):
        return self.item().isEnabled()
    def setEnabled(self, bool value):
        self.item().setEnabled(value)
    Enabled = property(isEnabled, setEnabled)

    def isSelected(self):
        return self.item().isSelected()
    
    # void setTarget(CCObject *rec, SEL_MenuHandler selector)


cdef class CCMenuItemLabel(CCMenuItem):
    cdef inline menu_nodes.CCMenuItemLabel* label(self):
        return <menu_nodes.CCMenuItemLabel*>self._co

    @classmethod
    def create(cls, CCNode label, CallBack cb=None):
        cdef CCMenuItemLabel o = CCMenuItemLabel()
        if cb is None:
            o.set_co(<int>menu_nodes.CCMenuItemLabel_create(label.node()))
        else:
            o.set_co(<int>menu_nodes.CCMenuItemLabel_create(label.node(), 
                    cb._co, cb.get_MenuHandler()))
            # cb.reg(o)
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new menu_nodes.CCMenuItemLabel()
        self.autorelease()
        return self

    # def initWithLabel(self, CCNode* label, CCObject* target, SEL_MenuHandler selector)

    def setString(self, str label):
        self.label().setString(label)

    def setOpacity(self, shaders.GLubyte opacity):
        self.label().setOpacity(opacity)

    def getOpacity(self):
        return self.label().getOpacity()

    def getColor(self):
        o = ccColor3B()
        o._co = self.label().getColor()
        return o
    def setColor(self, ccColor3B color):
        self.label().setColor(color._co)
    
    def isOpacityModifyRGB(self):
        return self.label().isOpacityModifyRGB()
    def setOpacityModifyRGB(self, bool bValue):
        self.label().setOpacityModifyRGB(bValue)


cdef class CCMenuItemAtlasFont(CCMenuItemLabel):
    def new(self):
        self._co = <cocoa.CCObject*>new menu_nodes.CCMenuItemAtlasFont()
        self.autorelease()
        return self

    # def initWithString(self, str value, str charMapFile, int itemWidth, 
    #         int itemHeight, char startCharMap, CCObject* target, SEL_MenuHandler selector)


cdef class CCMenuItemFont(CCMenuItemLabel):
    cdef inline menu_nodes.CCMenuItemFont* font(self):
        return <menu_nodes.CCMenuItemFont*>self._co

    @classmethod
    def setFontSize(cls, unsigned int s):
        menu_nodes.CCMenuItemFont_setFontSize(s)

    @classmethod
    def fontSize(cls):
        return menu_nodes.CCMenuItemFont_fontSize()

    @classmethod
    def setFontName(cls, str name):
        menu_nodes.CCMenuItemFont_setFontName(name)

    @classmethod
    def fontName(cls):
        menu_nodes.CCMenuItemFont_fontName()

    @classmethod
    def create(cls, str value):
        o = cls()
        o.set_co(<int>menu_nodes.CCMenuItemFont_create(value))
        return o

    # @classmethod
    # def create(cls, const char *value, CCObject* target, SEL_MenuHandler selector)


    def new(self):
        self._co = <cocoa.CCObject*>new menu_nodes.CCMenuItemFont()
        self.autorelease()
        return self

    # bool initWithString(const char *value, CCObject* target, SEL_MenuHandler selector)

    def fontSizeObj(self):
        return self.font().fontSizeObj()
    def setFontSizeObj(self, unsigned int s):
        self.font().setFontSizeObj(s)

    def setFontNameObj(self, str name):
        self.font().setFontNameObj(name)
    def fontNameObj(self):
        return self.font().fontNameObj()


cdef class CCMenuItemSprite(CCMenuItem):
    cdef inline menu_nodes.CCMenuItemSprite* sprite(self):
        return <menu_nodes.CCMenuItemSprite*>self._co

    @classmethod
    def create(cls, CCNode normalSprite, CCNode selectedSprite, 
            CCNode disabledSprite=None, 
            CallBack cb=None):
        cdef CCMenuItemSprite o = cls()
        if disabledSprite and cb:
            o._co = <cocoa.CCObject*>menu_nodes.CCMenuItemSprite_create(
                    normalSprite.node(),
                    selectedSprite.node(),
                    disabledSprite.node(),
                    cb._co, cb.get_MenuHandler(),
                    )
        elif disabledSprite:
            o._co = <cocoa.CCObject*>menu_nodes.CCMenuItemSprite_create(
                    normalSprite.node(),
                    selectedSprite.node(),
                    disabledSprite.node(),
                    )
        elif cb:
            o._co = <cocoa.CCObject*>menu_nodes.CCMenuItemSprite_create(
                    normalSprite.node(),
                    selectedSprite.node(),
                    cb._co, cb.get_MenuHandler(),
                    )
        return o



    # CC_PROPERTY(CCNode*, m_pNormalImage, NormalImage)
    def getNormalImage(self):
        node = CCNode()
        node._co = <cocoa.CCObject*>self.sprite().getNormalImage()
        return node
    def setNormalImage(self, CCNode var):
        self.sprite().setNormalImage(var.node())

    # CC_PROPERTY(CCNode*, m_pSelectedImage, SelectedImage)
    def getSelectedImage(self):
        node = CCNode()
        node._co = <cocoa.CCObject*>self.sprite().getSelectedImage()
        return node
    def setSelectedImage(self, CCNode var):
        self.sprite().setSelectedImage(var.node())

    # CC_PROPERTY(CCNode*, m_pDisabledImage, DisabledImage)
    def getDisabledImage(self):
        node = CCNode()
        node._co = <cocoa.CCObject*>self.sprite().getDisabledImage()
        return node
    def setDisabledImage(self, CCNode var):
        self.sprite().setDisabledImage(var.node())
    
    def new(self):
        self._co = <cocoa.CCObject*>new menu_nodes.CCMenuItemSprite()
        self.autorelease()
        return self

    # def initWithNormalSprite(self, CCNode normalSprite, CCNode selectedSprite, 
    #         CCNode disabledSprite, CCObject target, SEL_MenuHandler selector):

    def setColor(self, ccColor3B color):
        self.sprite().setColor(color._co)
    def getColor(self):
        o = ccColor3B()
        o._co = self.sprite().getColor()
        return o

    def setOpacity(self, shaders.GLubyte opacity):
        self.sprite().setOpacity(opacity)
    def getOpacity(self):
        return self.sprite().getOpacity()

    def setOpacityModifyRGB(self, bool bValue):
        self.sprite().setOpacityModifyRGB(bValue)
    def isOpacityModifyRGB(self):
        return self.sprite().isOpacityModifyRGB()


cdef class CCMenuItemImage(CCMenuItemSprite):
    cdef inline menu_nodes.CCMenuItemImage* image(self):
        return <menu_nodes.CCMenuItemImage*>self._co

    @classmethod
    def create(cls, str normalImage, str selectedImage, 
                disabledImage=None, CallBack cb=None):
        o = cls()
        if disabledImage and cb:
            o.set_co(<int>menu_nodes.CCMenuItemImage_create(normalImage, selectedImage,
                    disabledImage, cb._co, cb.get_MenuHandler()))
        elif disabledImage:
            o.set_co(<int>menu_nodes.CCMenuItemImage_create(normalImage, selectedImage,
                    disabledImage))
        elif cb:
            o.set_co(<int>menu_nodes.CCMenuItemImage_create(normalImage, selectedImage,
                    cb._co, cb.get_MenuHandler()))
        else:
            o.set_co(<int>menu_nodes.CCMenuItemImage_create(normalImage, selectedImage))
        return o

    # @classmethod
    # def create(cls, const char *normalImage, const char *selectedImage, const char *disabledImage, CCObject* target, SEL_MenuHandler selector)

    def new(self):
        self._co = <cocoa.CCObject*>new menu_nodes.CCMenuItemImage()
        self.autorelease()
        return self

    def init(self):
        return self.image().init()

    # def initWithNormalImage(self, str normalImage, str selectedImage, 
    #         str disabledImage, CCObject target, SEL_MenuHandler selector):

    def setNormalSpriteFrame(self, CCSpriteFrame frame):
        self.image().setNormalSpriteFrame(frame.frame())

    def setSelectedSpriteFrame(self, CCSpriteFrame frame):
        self.image().setSelectedSpriteFrame(frame.frame())

    def setDisabledSpriteFrame(self, CCSpriteFrame frame):
        self.image().setDisabledSpriteFrame(frame.frame())


cdef class CCMenuItemToggle(CCMenuItem):
    cdef inline menu_nodes.CCMenuItemToggle* toggle(self):
        return <menu_nodes.CCMenuItemToggle*>self._co

    @classmethod
    def createWithTarget(cls, CallBack cb, CCMenuItem item, *args):
        cdef CCMenuItemToggle o = cls()
        cdef menu_nodes.CCMenuItemToggle* co
        cdef int l = len(args)
        if l == 0:
            co = menu_nodes.CCMenuItemToggle_createWithTarget(
                    cb._co, cb.get_MenuHandler(),
                    item.item(), 
                    NULL)
        elif l == 1:
            co = menu_nodes.CCMenuItemToggle_createWithTarget(
                    cb._co, cb.get_MenuHandler(),
                    item.item(), 
                    (<CCObject>args[0])._co, 
                    NULL)
        elif l == 2:
            co = menu_nodes.CCMenuItemToggle_createWithTarget(
                    cb._co, cb.get_MenuHandler(),
                    item.item(), 
                    (<CCObject>args[0])._co, 
                    (<CCObject>args[1])._co, 
                    NULL)
        elif l == 3:
            co = menu_nodes.CCMenuItemToggle_createWithTarget(
                    cb._co, cb.get_MenuHandler(),
                    item.item(), 
                    (<CCObject>args[0])._co, 
                    (<CCObject>args[1])._co, 
                    (<CCObject>args[2])._co, 
                    NULL)
        elif l == 4:
            co = menu_nodes.CCMenuItemToggle_createWithTarget(
                    cb._co, cb.get_MenuHandler(),
                    item.item(), 
                    (<CCObject>args[0])._co, 
                    (<CCObject>args[1])._co, 
                    (<CCObject>args[2])._co, 
                    (<CCObject>args[3])._co, 
                    NULL)
        elif l == 5:
            co = menu_nodes.CCMenuItemToggle_createWithTarget(
                    cb._co, cb.get_MenuHandler(),
                    item.item(), 
                    (<CCObject>args[0])._co, 
                    (<CCObject>args[1])._co, 
                    (<CCObject>args[2])._co, 
                    (<CCObject>args[3])._co, 
                    (<CCObject>args[4])._co, 
                    NULL)
        else:
            raise ValueError('args to much(>6)')
        o._co = <cocoa.CCObject*>co
        return o



    @classmethod
    def create(cls, CCMenuItem item=None):
        o = cls()
        if item is None:
            o.set_co(<int>menu_nodes.CCMenuItemToggle_create())
        else:
            o.set_co(<int>menu_nodes.CCMenuItemToggle_create(item.item()))
        return o

# CCMenuItemToggle* CCMenuItemToggle_createWithTarget"cocos2d::CCMenuItemToggle::

    # CC_PROPERTY(GLubyte, m_cOpacity, Opacity)
    def getOpacity(self):
        return self.toggle().getOpacity()
    def setOpacity(self, shaders.GLubyte var):
        self.toggle().setOpacity(var)

    # CC_PROPERTY_PASS_BY_REF(ccColor3B, m_tColor, Color)
    def getColor(self):
        o = ccColor3B()
        o._co = self.toggle().getColor()
        return o
    def setColor(self, ccColor3B var):
        self.toggle().setColor(var._co)

    # CC_PROPERTY(unsigned int, m_uSelectedIndex, SelectedIndex)
    def getSelectedIndex(self):
        return self.toggle().getSelectedIndex()
    def setSelectedIndex(self, unsigned int var):
        self.toggle().setSelectedIndex(var)

    # CC_PROPERTY(CCArray*, m_pSubItems, SubItems)
    def getSubItems(self):
        o = CCArray()
        o._co = <cocoa.CCObject*>self.toggle().getSubItems()
        return o
    def setSubItems(self, CCArray var):
        self.toggle().setSubItems(var.array())
    
    def new(self):
        self._co = <cocoa.CCObject*>new menu_nodes.CCMenuItemToggle()
        self.autorelease()
        return self

    # def initWithTarget(self, CCObject* target, SEL_MenuHandler selector, 
    #         CCMenuItem* item, va_list args)
    def initWithItem(self, CCMenuItem item):
        return self.toggle().initWithItem(item.item())

    def addSubItem(self, CCMenuItem item):
        self.toggle().addSubItem(item.item())
    
    def selectedItem(self):
        o = CCMenuItem()
        o._co = <cocoa.CCObject*>self.toggle().selectedItem()
        return o

    def setOpacityModifyRGB(self, bool bValue):
        self.toggle().setOpacityModifyRGB(bValue)

    def isOpacityModifyRGB(self):
        return self.toggle().isOpacityModifyRGB()
