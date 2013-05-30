cdef class CCSpriteFrame(CCObject):
    cdef inline sprite.CCSpriteFrame* frame(self):
        return <sprite.CCSpriteFrame*> self._co

    @classmethod
    def create(cls, str filename, CCRect rect, bool rotated=None, 
                CCPoint offset=None, CCSize originalSize=None):
        o = cls()
        if rotated is None:
            o.set_co(<int>sprite.CCSpriteFrame_create(filename, rect._co))
        else:
            o.set_co(<int>sprite.CCSpriteFrame_create(filename, rect._co,
                rotated, offset._co, originalSize._co))
        return o

    @classmethod
    def createWithTexture(cls, CCTexture2D pobTexture, CCRect rect, 
                bool rotated=None, CCPoint offset=None, 
                CCSize originalSize=None):
        o = cls()
        if rotated is None:
            o.set_co(<int>sprite.CCSpriteFrame_createWithTexture(
                pobTexture.texture2d(), rect._co))
        else:
            o.set_co(<int>sprite.CCSpriteFrame_createWithTexture(
                pobTexture.texture2d(), rect._co,
                rotated, offset._co,
                originalSize._co))
        return o

    def getRectInPixels(self):
        o = CCRect()
        o._co = self.frame().getRectInPixels()
        return o
    def setRectInPixels(self, CCRect value):
        self.frame().setRectInPixels(value._co)
    RectInPixels = property(getRectInPixels, setRectInPixels)

    def isRotated(self):
        return self.frame().isRotated()
    def setRotated(self, bool bRotated):
        self.frame().setRotated(bRotated)
    Rotated = property(isRotated, setRotated)

    def getRect(self):
        o = CCRect()
        o._co = self.frame().getRect()
        return o
    def setRect(self, CCRect value):
        self.frame().setRect(value._co)
    Rect = property(getRect, setRect)

    def getOffsetInPixels(self):
        o = CCPoint()
        o._co = self.frame().getOffsetInPixels()
        return o
    def setOffsetInPixels(self, CCPoint offsetInPixels):
        self.frame().setOffsetInPixels(offsetInPixels._co)
    OffsetInPixels = property(getOffsetInPixels, setOffsetInPixels)

    def getOriginalSizeInPixels(self):
        o = CCSize()
        o._co = self.frame().getOriginalSizeInPixels()
        return o
    def setOriginalSizeInPixels(self, CCSize sizeInPixels):
        self.frame().setOriginalSizeInPixels(sizeInPixels._co)
    OriginalSizeInPixels = property(getOriginalSizeInPixels, setOriginalSizeInPixels)

    def getOriginalSize(self):
        o = CCSize()
        o._co = self.frame().getOriginalSize()
        return o
    def setOriginalSize(self, CCSize sizeInPixels):
        self.frame().setOriginalSize(sizeInPixels._co)
    OriginalSize = property(getOriginalSize, setOriginalSize)


    def getTexture(self):
        o = CCTexture2D()
        o._co = <cocoa.CCObject*> self.frame().getTexture()
        return o
    def setTexture(self, CCTexture2D pobTexture):
        self.frame().setTexture(pobTexture.texture2d())
    Texture = property(getTexture, setTexture)

    def getOffset(self):
        o = CCPoint()
        o._co = self.frame().getOffset()
        return o
    def setOffset(self, CCPoint offsets):
        self.frame().setOffset(offsets._co)
    Offset = property(getOffset, setOffset)

    def initWithTexture(self, CCTexture2D pobTexture, CCRect rect, 
                bool rotated=None, CCPoint offset=None, 
                CCSize originalSize=None):
        if rotated is None:
            return self.frame().initWithTexture(pobTexture.texture2d(), rect._co)
        return self.frame().initWithTexture(pobTexture.texture2d(), rect._co,
            rotated, offset._co,
            originalSize._co)

    def initWithTextureFilename(self, str filename, CCRect rect,
            bool rotated=None, CCPoint offset=None,
            CCSize originalSize=None):
        if rotated is None:
            return self.frame().initWithTextureFilename(filename, rect._co)
        return self.frame().initWithTextureFilename(filename, rect._co,
                rotated, offset._co,
                originalSize._co)


cdef class CCSpriteFrameCache(CCObject):
    cdef inline sprite.CCSpriteFrameCache* cache(self):
        return <sprite.CCSpriteFrameCache*> self._co

    @classmethod
    def sharedSpriteFrameCache(cls):
        o = cls()
        o.set_co(<int>sprite.CCSpriteFrameCache_sharedSpriteFrameCache())
        return o

    @classmethod
    def purgeSharedSpriteFrameCache(cls):
        sprite.CCSpriteFrameCache_purgeSharedSpriteFrameCache()

    def init(self):
        self.cache().init()

    def addSpriteFramesWithFile(self, str pszPlist, str textureFileName=None,
                CCTexture2D pobTexture=None):
        if textureFileName is not None:
            self.cache().addSpriteFramesWithFile(pszPlist, textureFileName)
        elif pobTexture is not None:
            self.cache().addSpriteFramesWithFile1(pszPlist, pobTexture.texture2d())
        else:
            self.cache().addSpriteFramesWithFile(pszPlist)

    def addSpriteFrame(self, CCSpriteFrame pobFrame, str pszFrameName):
        self.cache().addSpriteFrame(pobFrame.frame(), pszFrameName)

    def removeSpriteFrames(self):
        self.cache().removeSpriteFrames()

    def removeUnusedSpriteFrames(self):
        self.cache().removeUnusedSpriteFrames()

    def removeSpriteFrameByName(self, str pszName):
        self.cache().removeSpriteFrameByName(pszName)

    def removeSpriteFramesFromFile(self, str plist):
        self.cache().removeSpriteFramesFromFile(plist)

    def removeSpriteFramesFromTexture(self, CCTexture2D texture):
        self.cache().removeSpriteFramesFromTexture(texture.texture2d())

    def spriteFrameByName(self, str pszName):
        o = CCSpriteFrame()
        o._co = <cocoa.CCObject*>self.cache().spriteFrameByName(pszName)
        return o


cdef class CCSpriteBatchNode(CCNode):
    cdef inline sprite.CCSpriteBatchNode* sprite_node(self):
        return <sprite.CCSpriteBatchNode*> self._co

    @classmethod
    def create(cls, str fileImage, unsigned int capacity=0):
        o = cls()
        if capacity==0:
            o.set_co(<int>sprite.CCSpriteBatchNode_create(fileImage))
        else:
            o.set_co(<int>sprite.CCSpriteBatchNode_create(fileImage, capacity))
        return o

    @classmethod
    def createWithTexture(cls, CCTexture2D tex, unsigned int capacity=0):
        o = cls()
        if capacity==0:
            o.set_co(<int>sprite.CCSpriteBatchNode_createWithTexture(tex.texture2d()))
        else:
            o.set_co(<int>sprite.CCSpriteBatchNode_createWithTexture(tex.texture2d(), capacity))
        return o

    def getTextureAtlas(self):
        o = CCTextureAtlas()
        o._co = <cocoa.CCObject*>self.sprite_node().getTextureAtlas()
        return o
    def setTextureAtlas(self, CCTextureAtlas textureAtlas):
        self.sprite_node().setTextureAtlas(textureAtlas.atlas())
    TextureAtlas = property(getTextureAtlas, setTextureAtlas)

    def getDescendants(self):
        o = CCArray()
        o._co = <cocoa.CCObject*>self.sprite_node().getDescendants()
        return o

    def initWithTexture(self, CCTexture2D tex, unsigned int capacity):
        return self.sprite_node().initWithTexture(tex.texture2d(), capacity)

    def initWithFile(self, str fileImage, unsigned int capacity):
        return self.sprite_node().initWithFile(fileImage, capacity)

    def init(self):
        return self.sprite_node().init()

    def increaseAtlasCapacity(self):
        self.sprite_node().increaseAtlasCapacity()

    def removeChildAtIndex(self, unsigned int index, bool doCleanup):
        self.sprite_node().removeChildAtIndex(index, doCleanup)

    def insertChild(self, CCSprite child, unsigned int index):
        self.sprite_node().insertChild(child.sprite(), index)

    def appendChild(self, CCSprite sprite):
        self.sprite_node().appendChild(sprite.sprite())

    def removeSpriteFromAtlas(self, CCSprite sprite):
        self.sprite_node().removeSpriteFromAtlas(sprite.sprite())

    def rebuildIndexInOrder(self, CCSprite parent, unsigned int index):
        return self.sprite_node().rebuildIndexInOrder(parent.sprite(), index)

    def highestAtlasIndexInChild(self, CCSprite sprite):
        return self.sprite_node().highestAtlasIndexInChild(sprite.sprite())

    def lowestAtlasIndexInChild(self, CCSprite sprite):
        return self.sprite_node().lowestAtlasIndexInChild(sprite.sprite())

    def atlasIndexForChild(self, CCSprite sprite, int z):
        return self.sprite_node().atlasIndexForChild(sprite.sprite(), z)

    def reorderBatch(self, bool reorder):
        self.sprite_node().reorderBatch(reorder)


cdef class CCAnimationFrame(CCObject):
    cdef inline sprite.CCAnimationFrame* frame(self):
        return <sprite.CCAnimationFrame*> self._co

    def new(self):
        self._co = <cocoa.CCObject*>new sprite.CCAnimationFrame()
        self.autorelease()
        return self

    def initWithSpriteFrame(self, CCSpriteFrame spriteFrame, 
                float delayUnits, CCDictionary userInfo):
        return self.frame().initWithSpriteFrame(spriteFrame.frame(),
                delayUnits, userInfo.dict())

    def getDelayUnits(self):
        return self.frame().getDelayUnits()
    def setDelayUnits(self, float value):
        self.frame().setDelayUnits(value)
    DelayUnits = property(getDelayUnits, setDelayUnits)

    def getSpriteFrame(self):
        o = CCSpriteFrame()
        o._co = <cocoa.CCObject*>self.frame().getSpriteFrame()
        return o
    def setSpriteFrame(self, CCSpriteFrame var):
        self.frame().setSpriteFrame(var.frame())
    SpriteFrame = property(getSpriteFrame, setSpriteFrame)

    def getUserInfo(self):
        o = CCDictionary()
        o._co = <cocoa.CCObject*>self.frame().getUserInfo()
        return o
    def setUserInfo(self, CCDictionary var):
        self.frame().setUserInfo(var.dict())
    UserInfo = property(getUserInfo, setUserInfo)


cdef class CCAnimation(CCObject):
    cdef inline sprite.CCAnimation* animation(self):
        return <sprite.CCAnimation*> self._co

    @classmethod
    def create(cls, CCArray arrayOfAnimationFrameNames, 
                float delayPerUnit=0.0, unsigned int loops=0):
        o = cls()
        if delayPerUnit==0.0  and loops==0:
            o.set_co(<int>sprite.CCAnimation_create(arrayOfAnimationFrameNames.array(),
                    delayPerUnit, loops))
        if delayPerUnit==0.0:
            o.set_co(<int>sprite.CCAnimation_create(arrayOfAnimationFrameNames.array(),
                    delayPerUnit))
        else:
            o.set_co(<int>sprite.CCAnimation_create())
        return o

    @classmethod
    def createWithSpriteFrames(cls, CCArray arrayOfSpriteFrameNames, float delay):
        o = cls()
        o.set_co(<int>sprite.CCAnimation_createWithSpriteFrames(
                arrayOfSpriteFrameNames.array(), delay))
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new sprite.CCAnimation()
        self.autorelease()
        return self

    def addSpriteFrame(self, CCSpriteFrame pFrame):
        self.animation().addSpriteFrame(pFrame.frame())

    def addSpriteFrameWithFileName(self, str pszFileName):
        self.animation().addSpriteFrameWithFileName(pszFileName)

    def addSpriteFrameWithTexture(self, CCTexture2D pobTexture, CCRect rect):
        self.animation().addSpriteFrameWithTexture(pobTexture.texture2d(), rect._co)

    def init(self):
        return self.animation().init()

    def initWithSpriteFrames(self, CCArray pFrames, float delay):
        return self.animation().initWithSpriteFrames(pFrames.array(), delay)

    def initWithAnimationFrames(self, CCArray arrayOfAnimationFrames, 
                float delayPerUnit, unsigned int loops):
        return self.animation().initWithAnimationFrames(arrayOfAnimationFrames.array(),
                delayPerUnit, loops)

    def getTotalDelayUnits(self):
        return self.animation().getTotalDelayUnits()

    def getDelayPerUnit(self):
        return self.animation().getDelayPerUnit()
    def setDelayPerUnit(self, float var):
        self.animation().setDelayPerUnit(var)
    DelayPerUnit = property(getDelayPerUnit, setDelayPerUnit)

    def getDuration(self):
        return self.animation().getDuration()

    def getFrames(self):
        o = CCArray()
        o.set_co(<int>self.animation().getFrames())
        return o
    def setFrames(self, CCArray var):
        self.animation().setFrames(var.array())
    Frames = property(getFrames, setFrames)

    def getRestoreOriginalFrame(self):
        return self.animation().getRestoreOriginalFrame()
    def setRestoreOriginalFrame(self, bool var):
        self.animation().setRestoreOriginalFrame(var)
    RestoreOriginalFrame = property(getRestoreOriginalFrame, setRestoreOriginalFrame)

    def getLoops(self):
        return self.animation().getLoops()
    def setLoops(self, unsigned int var):
        self.animation().setLoops(var)
    Loops = property(getLoops, setLoops)


cdef class CCAnimationCache(CCObject):
    cdef inline sprite.CCAnimationCache* cache(self):
        return <sprite.CCAnimationCache*> self._co

    @classmethod
    def sharedAnimationCache(cls):
        o = CCAnimationCache()
        o._co = <cocoa.CCObject*>sprite.sharedAnimationCache()
        return o

    @classmethod
    def purgeSharedAnimationCache(cls):
        sprite.purgeSharedAnimationCache()

    def new(self):
        self._co = <cocoa.CCObject*>new sprite.CCAnimationCache()
        self.autorelease()
        return self

    def addAnimation(self, CCAnimation animation, str name):
        self.cache().addAnimation(animation.animation(), name)

    def removeAnimationByName(self, str name):
        self.cache().removeAnimationByName(name)

    def animationByName(self, str name):
        o = CCAnimation()
        o._co = <cocoa.CCObject*>self.cache().animationByName(name)
        return o

    def addAnimationsWithDictionary(self, CCDictionary dictionary):
        self.cache().addAnimationsWithDictionary(dictionary.dict())

    def addAnimationsWithFile(self, str plist):
        self.cache().addAnimationsWithFile(plist)

    def init(self):
        return self.cache().init()


cdef class CCSprite(CCNode):
    cdef inline sprite.CCSprite* sprite(self):
        return <sprite.CCSprite*> self._co

    @classmethod
    def create(cls, str pszFileName='', CCRect rect=None):
        cdef sprite.CCSprite* p
        if pszFileName and rect:
            p = sprite.CCSprite_create(pszFileName, rect._co)
        elif pszFileName:
            p = sprite.CCSprite_create(pszFileName)
        else:
            p = sprite.CCSprite_create()
        o = cls()
        o.set_co(<int>p)
        return o

    @classmethod
    def createWithTexture(cls, CCTexture2D pTexture, CCRect rect=None):
        cdef sprite.CCSprite* p
        if rect:
            p = sprite.CCSprite_createWithTexture(pTexture.texture2d(), rect._co)
        else:
            p = sprite.CCSprite_createWithTexture(pTexture.texture2d())
        o = cls()
        o.set_co(<int>p)
        return o

    @classmethod
    def createWithSpriteFrame(cls, CCSpriteFrame pSpriteFrame):
        cdef sprite.CCSprite* p
        p = sprite.CCSprite_createWithSpriteFrame(pSpriteFrame.frame())
        o = cls()
        o.set_co(<int>p)
        return o

    @classmethod
    def createWithSpriteFrameName(cls, str pszSpriteFrameName):
        cdef sprite.CCSprite* p
        p = sprite.CCSprite_createWithSpriteFrameName(pszSpriteFrameName)
        o = cls()
        o.set_co(<int>p)
        return o

    def init(self):
        return self.sprite().init()

    def initWithTexture(self, CCTexture2D pTexture, 
                CCRect rect=None, rotated=None):
        if rotated:
            p = self.sprite().initWithTexture(pTexture.texture2d(), 
                    rect._co, rotated)
        elif rect:
            p = self.sprite().initWithTexture(pTexture.texture2d(), 
                    rect._co)
        else:
            p = self.sprite().initWithTexture(pTexture.texture2d())
        return p

    def initWithSpriteFrameName(self, str pszSpriteFrameName):
        return self.sprite().initWithSpriteFrameName(pszSpriteFrameName)

    def setBlendFunc(self, ccBlendFunc blendFunc):
        self.sprite().setBlendFunc(blendFunc._co)
    def getBlendFunc(self):
        o = ccBlendFunc()
        o._co = self.sprite().getBlendFunc()
        return o

    def setOpacity(self, shaders.GLubyte opacity):
        self.sprite().setOpacity(opacity)

    def getOpacity(self):
        return self.sprite().getOpacity()

    def getColor(self):
        o = ccColor3B()
        o._co = self.sprite().getColor()
        return o
    def setColor(self, ccColor3B color):
        self.sprite().setColor(color._co)
    
    def isOpacityModifyRGB(self):
        return self.sprite().isOpacityModifyRGB()
    def setOpacityModifyRGB(self, bool bValue):
        self.sprite().setOpacityModifyRGB(bValue)

