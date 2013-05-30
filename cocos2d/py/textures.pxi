cdef class CCTexture2D(CCObject):
    cdef inline textures.CCTexture2D* texture2d(self):
        return <textures.CCTexture2D*> self._co


    @classmethod
    def setDefaultAlphaPixelFormat(cls, textures.CCTexture2DPixelFormat format):
        textures.CCTexture2D_setDefaultAlphaPixelFormat(format)

    @classmethod
    def defaultAlphaPixelFormat(cls):
        return textures.CCTexture2D_defaultAlphaPixelFormat()

    # @classmethod
    # def PVRImagesHavePremultipliedAlpha(cls, bool haveAlphaPremultiplied):
    #     textures.CCTexture2D_PVRImagesHavePremultipliedAlpha(haveAlphaPremultiplied)

    def description(self):
        return self.texture2d().description()

    def releaseData(self, int data):
        self.texture2d().releaseData(<void*>data)

    def keepData(self, int data, unsigned int length):
        self.texture2d().keepData(<void*>data, length)

    def initWithData(self, int data, textures.CCTexture2DPixelFormat pixelFormat,
            unsigned int pixelsWide, unsigned int pixelsHigh, 
            CCSize contentSize):
        return self.texture2d().initWithData(<void*>data, pixelFormat, 
                pixelsWide, pixelsHigh, contentSize._co)

    def drawAtPoint(self, CCPoint point):
        self.texture2d().drawAtPoint(point._co)

    def drawInRect(self, CCRect rect):
        self.texture2d().drawInRect(rect._co)

    def initWithImage(self, CCImage uiImage):
        self.texture2d().initWithImage(uiImage.image()) 

    def initWithString(self, str text,  str fontName, float fontSize, 
                CCSize dimensions, include_h.CCTextAlignment hAlignment, 
                include_h.CCVerticalTextAlignment vAlignment):
        return self.texture2d().initWithString(text, fontName, fontSize,
                dimensions._co, hAlignment, vAlignment)

    def initWithString(self, str text, str fontName, float fontSize):
        """ #/** Initializes a texture from a string with font name and font size #*/"""
        return self.texture2d().initWithString(text, fontName, fontSize)

    # def initWithPVRTCData(self, int data, int level, int bpp, bool hasAlpha, 
    #             int length, include_h.CCTexture2DPixelFormat pixelFormat):
    #     """ #/** Initializes a texture from a PVRTC buffer #*/ """
    #     return self.texture2d().initWithPVRTCData(<void*>data, level, bpp, hasAlpha,
    #             length, pixelFormat)

    # def initWithPVRFile(self, str file):
    #     """ #/** Initializes a texture from a PVR file #*/ """
    #     return self.texture2d().initWithPVRFile(file)

    def setTexParameters(self, ccTexParams texParams):
        """ #/** sets the min filter, mag filter, wrap s and wrap t texture parameters. """
        self.texture2d().setTexParameters(&texParams._co)

    def setAntiAliasTexParameters(self):
        """ #/** sets antialias texture parameters: """
        self.texture2d().setAntiAliasTexParameters()

    def setAliasTexParameters(self):
        """ #/** sets alias texture parameters: """
        self.texture2d().setAliasTexParameters()

    def generateMipmap(self):
        """ #/** Generates mipmap images for the texture. """
        self.texture2d().generateMipmap()

    def stringForFormat(self):
        """ #/** returns the pixel format."""
        return self.texture2d().stringForFormat()

    def bitsPerPixelForFormat(self, textures.CCTexture2DPixelFormat format):
        """ #/** Helper functions that returns bits per pixels for a given format. """
        if format is None:
            return self.texture2d().bitsPerPixelForFormat()
        return self.texture2d().bitsPerPixelForFormat(format)


    def getContentSizeInPixels(self):
        """ #/** content size #*/ """
        s = CCSize()
        s._co = self.texture2d().getContentSizeInPixels()
        return s
        
    def hasPremultipliedAlpha(self):
        return self.texture2d().hasPremultipliedAlpha()

    def hasMipmaps(self):
        return self.texture2d().hasMipmaps()

#--------------CCTextureAtlas.h---------------
cdef class CCTextureAtlas(CCObject):
    cdef inline textures.CCTextureAtlas* atlas(self):
        return <textures.CCTextureAtlas*> self._co

    def new(self):
        self._co = <cocoa.CCObject*>new textures.CCTextureAtlas()
        self.autorelease()
        return self

    def description(self):
        return self.atlas().description()

    def initWithFile(self, str file, unsigned int capacity):
        return self.atlas().initWithFile(file, capacity)

    def initWithTexture(self, CCTexture2D texture, unsigned int capacity):
        return self.atlas().initWithTexture(texture.texture2d(), capacity)

        # void updateQuad(ccV3F_C4B_T2F_Quad* quad, unsigned int index)

        # void insertQuad(ccV3F_C4B_T2F_Quad* quad, unsigned int index)

        # void insertQuads(ccV3F_C4B_T2F_Quad* quads, unsigned int index, unsigned int amount)

    def insertQuadFromIndex(self, unsigned int fromIndex, unsigned int newIndex):
        self.atlas().insertQuadFromIndex(fromIndex, newIndex)

    def removeQuadAtIndex(self, unsigned int index):
        self.atlas().removeQuadAtIndex(index)

    def removeQuadsAtIndex(self, unsigned int index, unsigned int amount):
        self.atlas().removeQuadsAtIndex(index, amount)

    def removeAllQuads(self):
        self.atlas().removeAllQuads()


    def resizeCapacity(self, unsigned int n):
        return self.atlas().resizeCapacity(n)

    def increaseTotalQuadsWith(self, unsigned int amount):
        self.atlas().increaseTotalQuadsWith(amount)

    def moveQuadsFromIndex(self, unsigned int oldIndex, 
                unsigned int amount, unsigned int newIndex):
        self.atlas().moveQuadsFromIndex(oldIndex, amount, newIndex)

    def moveQuadsFromIndex1(self, unsigned int index, unsigned int newIndex):
        self.atlas().moveQuadsFromIndex1(index, newIndex)

    def fillWithEmptyQuadsFromIndex(self, unsigned int index, unsigned int amount):
        self.atlas().fillWithEmptyQuadsFromIndex(index, amount)


    def drawNumberOfQuads(self, unsigned int n, unsigned int start=0):
        if start==0:
            self.atlas().drawNumberOfQuads(n)
        else:
            self.atlas().drawNumberOfQuads(n)

    def drawQuads(self):
        self.atlas().drawQuads()

    def listenBackToForeground(self, CCObject obj):
        self.atlas().listenBackToForeground(obj._co)


cdef class CCTextureCache(CCObject):
    cdef inline textures.CCTextureCache* cache(self):
        return <textures.CCTextureCache*>self._co

    @classmethod
    def sharedTextureCache(cls):
        o = cls()
        o.set_co(<int>textures.sharedTextureCache())
        return o

    @classmethod
    def purgeSharedTextureCache(cls):
        textures.purgeSharedTextureCache()

    @classmethod
    def reloadAllTextures(cls):
        textures.reloadAllTextures()

    def new(self):
        self._co = <cocoa.CCObject*>new textures.CCTextureCache()
        self.autorelease()
        return self

    def description(self):
        return self.cache().description()

    def snapshotTextures(self):
        o = CCDictionary()
        o._co = <cocoa.CCObject*>self.cache().snapshotTextures()
        return o

    def addImage(self, str fileimage):
        o = CCTexture2D()
        o._co = <cocoa.CCObject*>self.cache().addImage(fileimage)
        return o

    # def addImageAsync(self, str path, CCObject target, SEL_CallFuncO selector)

    def addUIImage(self, CCImage image, str key):
        o = CCTexture2D()
        o._co = <cocoa.CCObject*>self.cache().addUIImage(image.image(), key)
        return o

    def textureForKey(self, str key):
        o = CCTexture2D()
        o._co = <cocoa.CCObject*>self.cache().textureForKey(key)
        return o

    def removeAllTextures(self):
        self.cache().removeAllTextures()

    def removeUnusedTextures(self):
        self.cache().removeUnusedTextures()

    def removeTexture(self, CCTexture2D texture):
        self.cache().removeTexture(texture.texture2d())

    def removeTextureForKey(self, str textureKeyName):
        self.cache().removeTextureForKey(textureKeyName)

    def dumpCachedTextureInfo(self):
        self.cache().dumpCachedTextureInfo()

#ifdef CC_SUPPORT_PVRTC
    # def addPVRTCImage(self, str fileimage, int bpp, bool hasAlpha, int width):
    #     o = CCTexture2D()
    #     o._co = self.cache().addPVRTCImage(fileimage, bpp, hasAlpha, width)
    #     return o
#endif // CC_SUPPORT_PVRTC
    
    # def addPVRImage(self, str filename):
    #     o = CCTexture2D()
    #     o._co = self.cache().addPVRImage(filename)
    #     return o

