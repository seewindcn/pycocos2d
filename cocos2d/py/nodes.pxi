cdef class CCLabelAtlas(CCAtlasNode):
    cdef inline label_nodes.CCLabelAtlas* label(self):
        return <label_nodes.CCLabelAtlas*>self._co

    def new(self):
        self._co = <cocoa.CCObject*>new label_nodes.CCLabelAtlas()
        self.autorelease()
        return self

    def initWithString(self, str string, str charMapFile, 
            unsigned int itemWidth, unsigned int itemHeight, 
            unsigned int startCharMap):
        return self.label().initWithString(string, charMapFile,
            itemWidth, itemHeight, startCharMap)

    def initWithString(self, str string, str fntFile):
        return self.label().initWithString(string, fntFile)

    def setString(self, str label):
        self.label().setString(label)
    def getString(self):
        return self.label().getString()


cdef class CCBMFontConfiguration(CCObject):
    cdef inline label_nodes.CCBMFontConfiguration* cfg(self):
        return <label_nodes.CCBMFontConfiguration*>self._co

    # tCCFontDefHashElement *m_pFontDefDictionary
    # int m_nCommonHeight
    # ccBMFontPadding    m_tPadding
    # string m_sAtlasName
    # tCCKerningHashElement *m_pKerningDictionary
    # set[unsigned int] *m_pCharacterSet
    def new(self):
        self._co = <cocoa.CCObject*>new label_nodes.CCBMFontConfiguration()
        self.autorelease()
        return self

    def description(self):
        return self.cfg().description()

    def initWithFNTfile(self, str FNTfile):
        return self.cfg().initWithFNTfile(FNTfile)
    
    def getAtlasName(self):
        return self.cfg().getAtlasName()
    def setAtlasName(self, str atlasName):
        self.cfg().setAtlasName(atlasName)
    
    def getCharacterSet(self):
        cdef cset[unsigned int]* s
        cdef cset[unsigned int].iterator begin, end
        cdef int l
        cdef unsigned int v
        s = self.cfg().getCharacterSet()
        if s.empty():
            return
        rs = []
        begin = s.begin()
        l = s.size()
        for i in xrange(l):
            v = deref(begin)
            rs.append(v)
            begin = cython.operator.preincrement(begin)
        return rs


cdef class CCLabelBMFont(CCSpriteBatchNode):
    cdef inline label_nodes.CCLabelBMFont* font(self):
        return <label_nodes.CCLabelBMFont*>self._co

    @classmethod
    def create(cls, str str, str fntFile, 
            width=None, 
            alignment=None,
            CCPoint imageOffset=None):
        o = cls()
        if width is None:
            o.set_co(<int>label_nodes.CCLabelBMFont_create(str, fntFile))
        elif alignment is None:
            o.set_co(<int>label_nodes.CCLabelBMFont_create(str, fntFile, width))
        elif imageOffset is None:
            o.set_co(<int>label_nodes.CCLabelBMFont_create(str, fntFile, width,
                alignment))
        else:
            o.set_co(<int>label_nodes.CCLabelBMFont_create(str, fntFile, width,
                alignment, imageOffset._co))
        return o

    @classmethod
    def purgeCachedData(cls):
        label_nodes.CCLabelBMFont_purgeCachedData()

    def new(self):
        self._co = <cocoa.CCObject*>new label_nodes.CCLabelBMFont()
        self.autorelease()
        return self

    def initWithString(self, str str, str fntFile, 
            float width, include_h.CCTextAlignment alignment, CCPoint imageOffset):
        return self.font().initWithString(str, fntFile, width,
                alignment, imageOffset._co)

    #bool initWithString(const char *str, const char *fntFile, float width = kCCLabelAutomaticWidth, CCTextAlignment alignment = kCCTextAlignmentLeft, CCPoint imageOffset = CCPointZero)

    def createFontChars(self):
        self.font().createFontChars()

    def setString(self, str label, fromUpdate=None):
        if fromUpdate is None:
            self.font().setString(label)
        else:
            self.font().setString(label, fromUpdate)

    def getString(self):
        return self.font().getString()

    # void setCString(const char *label)

    def updateLabel(self):
        self.font().updateLabel()

    def setAlignment(self, include_h.CCTextAlignment alignment):
        self.font().setAlignment(alignment)

    def setWidth(self, float width):
        self.font().setWidth(width)

    def setLineBreakWithoutSpace(self, bool breakWithoutSpace):
        self.font().setLineBreakWithoutSpace(breakWithoutSpace)

    def isOpacityModifyRGB(self):
        return self.font().isOpacityModifyRGB()

    def setOpacityModifyRGB(self, bool isOpacityModifyRGB):
        self.font().setOpacityModifyRGB(isOpacityModifyRGB)

    def setFntFile(self, str fntFile):
        self.font().setFntFile(fntFile)

    def getFntFile(self):
        return self.font().getFntFile()


def FNTConfigLoadFile(str file):
    o = CCBMFontConfiguration()
    o._co = <cocoa.CCObject*>label_nodes.FNTConfigLoadFile(file)
    return o

def FNTConfigRemoveCache():
    label_nodes.FNTConfigRemoveCache()


cdef class CCLabelTTF(CCSprite):
    cdef inline label_nodes.CCLabelTTF* ttf(self):
        return <label_nodes.CCLabelTTF*>self._co

    @classmethod
    def create(cls, str string, str fontName, float fontSize,
                        CCSize dimensions=None, 
                        hAlignment=None,
                        vAlignment=None):
        o = cls()
        if dimensions is None:
            o.set_co(<int>label_nodes.CCLabelTTF_create(string, fontName, fontSize))
        elif vAlignment is None:
            o.set_co(<int>label_nodes.CCLabelTTF_create(string, fontName, fontSize,
                dimensions._co, hAlignment))
        else:
            o.set_co(<int>label_nodes.CCLabelTTF_create(string, fontName, fontSize,
                dimensions._co, hAlignment,
                vAlignment))
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new label_nodes.CCLabelTTF()
        self.autorelease()
        return self

    def initWithString(self, str string, str fontName, float fontSize,
                        CCSize dimensions=None, 
                        hAlignment=None,
                        vAlignment=None):
        if dimensions is None:
            return self.ttf().initWithString(string, fontName, fontSize)
        elif vAlignment is None:
            return self.ttf().initWithString(string, fontName, fontSize,
                dimensions._co, hAlignment)
        else:
            return self.ttf().initWithString(string, fontName, fontSize,
                dimensions._co, hAlignment,
                vAlignment)

    def getString(self):
        return self.ttf().getString()
    def setString(self, str label):
        self.ttf().setString(label)

    def getHorizontalAlignment(self):
        return self.ttf().getHorizontalAlignment()
    def setHorizontalAlignment(self, include_h.CCTextAlignment alignment):
        self.ttf().setHorizontalAlignment(alignment)
    
    def getVerticalAlignment(self):
        return self.ttf().getVerticalAlignment()
    def setVerticalAlignment(self, include_h.CCVerticalTextAlignment verticalAlignment):
        self.ttf().setVerticalAlignment(verticalAlignment)
    
    def getDimensions(self):
        o = CCSize()
        o._co = self.ttf().getDimensions()
        return o
    def setDimensions(self, CCSize dim):
        self.ttf().setDimensions(dim._co)
    
    def getFontSize(self):
        return self.ttf().getFontSize()
    def setFontSize(self, float fontSize):
        self.ttf().setFontSize(fontSize)
    
    def getFontName(self):
        return self.ttf().getFontName()
    def setFontName(self, str fontName):
        self.ttf().setFontName(fontName)


cdef class CCClippingNode(CCNode):
    cdef inline misc_nodes.CCClippingNode* clip(self):
        return <misc_nodes.CCClippingNode*>self._co

    @classmethod
    def create(cls, CCNode pStencil=None):
        o = cls()
        if pStencil is None:
            o.set_co(<int>misc_nodes.CCClippingNode_create())
        else:
            o.set_co(<int>misc_nodes.CCClippingNode_create(pStencil.node()))
        return o

    def init1(self, CCNode pStencil):
        return self.clip().init(pStencil.node())

    def getStencil(self):
        o = CCNode()
        o._co = <cocoa.CCObject*>self.clip().getStencil()
        return o
    def setStencil(self, CCNode pStencil):
        self.clip().setStencil(pStencil.node())
    
    def getAlphaThreshold(self):
        return self.clip().getAlphaThreshold()
    def setAlphaThreshold(self, shaders.GLfloat fAlphaThreshold):
        self.clip().setAlphaThreshold(fAlphaThreshold)
    
    def isInverted(self):
        return self.clip().isInverted()
    def setInverted(self, bool bInverted):
        self.clip().setInverted(bInverted)


cdef class CCMotionStreak(CCNode):
    cdef inline misc_nodes.CCMotionStreak* streak(self):
        return <misc_nodes.CCMotionStreak*>self._co

    @classmethod
    def create(cls, float fade, float minSeg, float stroke, 
            ccColor3B color, str path):
        o = cls()
        o.set_co(<int>misc_nodes.CCMotionStreak_create(fade, 
                minSeg, stroke,
                color._co, path))
        return o

    @classmethod
    def create1(cls, float fade, float minSeg, float stroke, 
            ccColor3B color, CCTexture2D texture):
        o = cls()
        o.set_co(<int>misc_nodes.CCMotionStreak_create1(fade, 
                minSeg, stroke,
                color._co, texture.texture2d()))
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new misc_nodes.CCMotionStreak()
        self.autorelease()
        return self

    def initWithFade(self, float fade, float minSeg, float stroke, 
            ccColor3B color, str path):
        return self.streak().initWithFade(fade, minSeg, stroke,
                color._co, path)
    def initWithFade1(self, float fade, float minSeg, float stroke, 
            ccColor3B color, CCTexture2D texture):
        return self.streak().initWithFade1(fade, minSeg, stroke,
                color._co, texture.texture2d())

    def tintWithColor(self, ccColor3B colors):
        self.streak().tintWithColor(colors._co)

    def reset(self):
        self.streak().reset()

    def getTexture(self):
        o = CCTexture2D()
        o._co = <cocoa.CCObject*>self.streak().getTexture()
        return o
    def setTexture(self, CCTexture2D texture):
        self.streak().setTexture(texture.texture2d())

    def setBlendFunc(self, ccBlendFunc blendFunc):
        self.streak().setBlendFunc(blendFunc._co)
    def getBlendFunc(self):
        o = ccBlendFunc()
        o._co = self.streak().getBlendFunc()
        return o

    def getColor(self):
        o = ccColor3B()
        o._co = self.streak().getColor()
        return o
    def setColor(self, ccColor3B color):
        self.streak().setColor(color._co)

    def getOpacity(self):
        return self.streak().getOpacity()
    def setOpacity(self, shaders.GLubyte opacity):
        self.streak().setOpacity(opacity)

    def isOpacityModifyRGB(self):
        return self.streak().isOpacityModifyRGB()
    def setOpacityModifyRGB(self, bool bValue):
        self.streak().setOpacityModifyRGB(bValue)

    def isFastMode(self):
        return self.streak().isFastMode()
    def setFastMode(self, bool bFastMode):
        self.streak().setFastMode(bFastMode)

    def isStartingPositionInitialized(self):
        return self.streak().isStartingPositionInitialized()
    def setStartingPositionInitialized(self, bool bStartingPositionInitialized):
        self.streak().setStartingPositionInitialized(bStartingPositionInitialized)



cdef class CCProgressTimer(CCNode):
    cdef inline misc_nodes.CCProgressTimer* timer(self):
        return <misc_nodes.CCProgressTimer*>self._co

    def new(self):
        self._co = <cocoa.CCObject*>new misc_nodes.CCProgressTimer()
        self.autorelease()
        return self

    def initWithSprite(self, CCSprite sp):
        return self.timer().initWithSprite(sp.sprite())

    def getType(self):
        return self.timer().getType()
    def setType(self, misc_nodes.CCProgressTimerType type):
        self.timer().setType(type)

    def getPercentage(self):
        return self.timer().getPercentage()
    def setPercentage(self, float fPercentage):
        self.timer().setPercentage(fPercentage)


    def getSprite(self):
        o = CCSprite()
        o._co = <cocoa.CCObject*>self.timer().getSprite()
        return o
    def setSprite(self, CCSprite pSprite):
        self.timer().setSprite(pSprite.sprite())

    def setReverseProgress(self, bool reverse):
        self.timer().setReverseProgress(reverse)

    # def getColor(self):
        o = ccColor3B()
        o._co = self.timer().getColor()
        return o
    def setColor(self, ccColor3B color):
        self.timer().setColor(color._co)

    def getOpacity(self):
        return self.timer().getOpacity()
    def setOpacity(self, shaders.GLubyte opacity):
        self.timer().setOpacity(opacity)

    def isOpacityModifyRGB(self):
        return self.timer().isOpacityModifyRGB()
    def setOpacityModifyRGB(self, bool bValue):
        self.timer().setOpacityModifyRGB(bValue)
    
    def isReverseDirection(self):
        return self.timer().isReverseDirection()
    def setReverseDirection(self, bool value):
        self.timer().setReverseDirection(value)


cdef class CCRenderTexture(CCNode):
    cdef inline misc_nodes.CCRenderTexture* texture(self):
        return <misc_nodes.CCRenderTexture*>self._co


    @classmethod
    def create(cls, int w, int h, 
            eFormat=None, 
            uDepthStencilFormat=None):
        o = cls()
        if eFormat is None:
            o.set_co(<int>misc_nodes.CCRenderTexture_create(w, h))
        elif uDepthStencilFormat is None:
            o.set_co(<int>misc_nodes.CCRenderTexture_create(w, h,
                    eFormat))
        else:
            o.set_co(<int>misc_nodes.CCRenderTexture_create(w, h,
                    eFormat, uDepthStencilFormat))
        return o


    def new(self):
        self._co = <cocoa.CCObject*>new misc_nodes.CCRenderTexture()
        self.autorelease()
        return self

    # CC_PROPERTY(CCSprite*, m_pSprite, Sprite)
    def getSprite(self):
        o = CCSprite()
        o._co = <cocoa.CCObject*>self.texture().getSprite()
        return o
    def setSprite(self, CCSprite var):
        self.texture().setSprite(var.sprite())

    def initWithWidthAndHeight(self, int w, int h, 
            include_h.CCTexture2DPixelFormat eFormat,
            uDepthStencilFormat=None):
        if uDepthStencilFormat is None:
            return self.texture().initWithWidthAndHeight(w, h,
                    eFormat)
        else:
            return self.texture().initWithWidthAndHeight(w, h,
                    eFormat,
                    uDepthStencilFormat)

    def begin(self):
        self.texture().begin()

    def beginWithClear(self, float r, float g, float b, float a, 
            depthValue=None, stencilValue=None):
        if depthValue is None:
            self.texture().beginWithClear(r, g, b, a)
        elif stencilValue is None:
            self.texture().beginWithClear(r, g, b, a,
                depthValue)
        else:
            self.texture().beginWithClear(r, g, b, a,
                depthValue, stencilValue)

    def endToLua(self):
        self.texture().endToLua()

    def end(self):
        self.texture().end()

    def clear(self, float r, float g, float b, float a):
        self.texture().clear(r, g, b, a)

    def clearDepth(self, float depthValue):
        self.texture().clearDepth(depthValue)

    def clearStencil(self, int stencilValue):
        self.texture().clearStencil(stencilValue)

    def newCCImage(self, bool flipImage=True):
        o = CCImage()
        o._co = <cocoa.CCObject*>self.texture().newCCImage(flipImage)
        return o
    #CCImage* newCCImage(bool flipImage = true)

    def saveToFile(self, str szFilePath, format=None):
        if format is None:
            return self.texture().saveToFile(szFilePath)
        return self.texture().saveToFile(szFilePath, format)

    def listenToBackground(self, CCObject obj):
        self.texture().listenToBackground(obj._co)
    
    def listenToForeground(self, CCObject obj):
        self.texture().listenToForeground(obj._co)
    
    def getClearFlags(self):
        return self.texture().getClearFlags()
    def setClearFlags(self, unsigned int uClearFlags):
        self.texture().setClearFlags(uClearFlags)
    
    def getClearColor(self):
        o = ccColor4F()
        o._co = self.texture().getClearColor()
        return o
    def setClearColor(self, ccColor4F clearColor):
        self.texture().setClearColor(clearColor._co)
    
    def getClearDepth(self):
        return self.texture().getClearDepth()
    def setClearDepth(self, float fClearDepth):
        self.texture().setClearDepth(fClearDepth)
    
    def getClearStencil(self):
        return self.texture().getClearStencil()
    def setClearStencil(self, float fClearStencil):
        self.texture().setClearStencil(fClearStencil)
    
    def isAutoDraw(self):
        return self.texture().isAutoDraw()
    def setAutoDraw(self, bool bAutoDraw):
        self.texture().setAutoDraw(bAutoDraw)

