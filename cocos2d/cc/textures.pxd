from libcpp cimport bool
from cocoa cimport *
from shaders cimport *
from platform cimport *
from include_h cimport *

cdef extern from "cocos2d.h" namespace "cocos2d":
    #----------CCTexture2D.h-----------
    ctypedef enum CCTexture2DPixelFormat:
        #! 32-bit texture: RGBA8888
        kCCTexture2DPixelFormat_RGBA8888,
        #! 24-bit texture: RGBA888
        kCCTexture2DPixelFormat_RGB888,
        #! 16-bit texture without Alpha channel
        kCCTexture2DPixelFormat_RGB565,
        #! 8-bit textures used as masks
        kCCTexture2DPixelFormat_A8,
        #! 8-bit intensity texture
        kCCTexture2DPixelFormat_I8,
        #! 16-bit textures used as masks
        kCCTexture2DPixelFormat_AI88,
        #! 16-bit textures: RGBA4444
        kCCTexture2DPixelFormat_RGBA4444,
        #! 16-bit textures: RGB5A1
        kCCTexture2DPixelFormat_RGB5A1,    
        #! 4-bit PVRTC-compressed texture: PVRTC4
        kCCTexture2DPixelFormat_PVRTC4,
        #! 2-bit PVRTC-compressed texture: PVRTC2
        kCCTexture2DPixelFormat_PVRTC2,

        #! Default texture format: RGBA8888
        kCCTexture2DPixelFormat_Default = kCCTexture2DPixelFormat_RGBA8888,

        # backward compatibility stuff
        kTexture2DPixelFormat_RGBA8888 = kCCTexture2DPixelFormat_RGBA8888,
        kTexture2DPixelFormat_RGB888 = kCCTexture2DPixelFormat_RGB888,
        kTexture2DPixelFormat_RGB565 = kCCTexture2DPixelFormat_RGB565,
        kTexture2DPixelFormat_A8 = kCCTexture2DPixelFormat_A8,
        kTexture2DPixelFormat_RGBA4444 = kCCTexture2DPixelFormat_RGBA4444,
        kTexture2DPixelFormat_RGB5A1 = kCCTexture2DPixelFormat_RGB5A1,
        kTexture2DPixelFormat_Default = kCCTexture2DPixelFormat_Default


    ctypedef struct ccTexParams:
        GLuint    minFilter
        GLuint    magFilter
        GLuint    wrapS
        GLuint    wrapT


    cppclass CCTexture2D(CCObject):
        CCTexture2D()
        const char* description()

        #/** These functions are needed to create mutable textures #*/
        void releaseData(void *data)
        void* keepData(void *data, unsigned int length)

        #/** Initializes with a texture2d with data #*/
        bool initWithData(const void* data, CCTexture2DPixelFormat pixelFormat, unsigned int pixelsWide, unsigned int pixelsHigh, const CCSize& contentSize)

        #/**
        #*/
        #/** draws a texture at a given point #*/
        void drawAtPoint(const CCPoint& point)
        #/** draws a texture inside a rect #*/
        void drawInRect(const CCRect& rect)

        #/**
        #*/
        #/** Initializes a texture from a UIImage object #*/

        bool initWithImage(CCImage * uiImage)

        #/** Initializes a texture from a string with dimensions, alignment, font name and font size #*/
        bool initWithString(const char *text,  const char *fontName, float fontSize, const CCSize& dimensions, CCTextAlignment hAlignment, CCVerticalTextAlignment vAlignment)
        #/** Initializes a texture from a string with font name and font size #*/
        bool initWithString(const char *text, const char *fontName, float fontSize)

    #ifdef CC_SUPPORT_PVRTC    
        #/**
        #*/
        #/** Initializes a texture from a PVRTC buffer #*/
        bool initWithPVRTCData(const void *data, int level, int bpp, bool hasAlpha, int length, CCTexture2DPixelFormat pixelFormat)
    #endif // CC_SUPPORT_PVRTC
        
        #/** Initializes a texture from a PVR file #*/
        bool initWithPVRFile(const char* file)

        #/** sets the min filter, mag filter, wrap s and wrap t texture parameters.
        #*/
        void setTexParameters(ccTexParams* texParams)

        #/** sets antialias texture parameters:
        #*/
        void setAntiAliasTexParameters()

        #/** sets alias texture parameters:
        #*/
        void setAliasTexParameters()


        #/** Generates mipmap images for the texture.
        #*/
        void generateMipmap()

        #/** returns the pixel format.
         #*/
        const char* stringForFormat()

        #/** returns the bits-per-pixel of the in-memory OpenGL texture
        #*/
        unsigned int bitsPerPixelForFormat()  

        #/** Helper functions that returns bits per pixels for a given format.
         #*/
        unsigned int bitsPerPixelForFormat(CCTexture2DPixelFormat format)


        #/** content size #*/
        const CCSize& getContentSizeInPixels()
        
        bool hasPremultipliedAlpha()
        bool hasMipmaps()


    #/** sets the default pixel format for UIImagescontains alpha channel.
    #*/
    void CCTexture2D_setDefaultAlphaPixelFormat "cocos2d::CCTexture2D::setDefaultAlphaPixelFormat"(CCTexture2DPixelFormat format)

    #/** returns the alpha pixel format
    #*/
    CCTexture2DPixelFormat CCTexture2D_defaultAlphaPixelFormat "cocos2d::CCTexture2D::defaultAlphaPixelFormat"()

    #/** treats (or not) PVR files as if they have alpha premultiplied.
     #*/
    void CCTexture2D_PVRImagesHavePremultipliedAlpha "cocos2d::CCTexture2D::PVRImagesHavePremultipliedAlpha"(bool haveAlphaPremultiplied)


    #--------------CCTextureAtlas.h---------------
    cppclass CCTextureAtlas(CCObject):
        CCTextureAtlas()
        const char* description()
        bool initWithFile(const char* file, unsigned int capacity)

        bool initWithTexture(CCTexture2D *texture, unsigned int capacity)

        void updateQuad(ccV3F_C4B_T2F_Quad* quad, unsigned int index)

        void insertQuad(ccV3F_C4B_T2F_Quad* quad, unsigned int index)

        void insertQuads(ccV3F_C4B_T2F_Quad* quads, unsigned int index, unsigned int amount)

        void insertQuadFromIndex(unsigned int fromIndex, unsigned int newIndex)

        void removeQuadAtIndex(unsigned int index)

        void removeQuadsAtIndex(unsigned int index, unsigned int amount)
        void removeAllQuads()


        bool resizeCapacity(unsigned int n)

        void increaseTotalQuadsWith(unsigned int amount)

        void moveQuadsFromIndex(unsigned int oldIndex, unsigned int amount, unsigned int newIndex)

        void moveQuadsFromIndex1 "cocos2d::CCTextureAtlas::moveQuadsFromIndex"(unsigned int index, unsigned int newIndex)

        void fillWithEmptyQuadsFromIndex(unsigned int index, unsigned int amount)

        void drawNumberOfQuads(unsigned int n)

        void drawNumberOfQuads(unsigned int n, unsigned int start)

        void drawQuads()
        void listenBackToForeground(CCObject *obj)


    CCTextureAtlas* CCTextureAtlas_createWithTexture "cocos2d::CCTextureAtlas::createWithTexture"(CCTexture2D *texture, unsigned int capacity)
    CCTextureAtlas* CCTextureAtlas_create "cocos2d::CCTextureAtlas::create"(const char* file , unsigned int capacity)




    cppclass CCTextureCache(CCObject):
        CCTextureCache()
        const char* description()
        CCDictionary* snapshotTextures()
        CCTexture2D* addImage(const char* fileimage)

        void addImageAsync(const char *path, CCObject *target, SEL_CallFuncO selector)

        CCTexture2D* addUIImage(CCImage *image, const char *key)

        CCTexture2D* textureForKey(const char* key)
        void removeAllTextures()

        void removeUnusedTextures()

        void removeTexture(CCTexture2D* texture)

        void removeTextureForKey(const char *textureKeyName)

        void dumpCachedTextureInfo()

    #ifdef CC_SUPPORT_PVRTC
        CCTexture2D* addPVRTCImage(const char* fileimage, int bpp, bool hasAlpha, int width)
    #endif // CC_SUPPORT_PVRTC
        
        CCTexture2D* addPVRImage(const char* filename)

    CCTextureCache * sharedTextureCache"cocos2d::CCTextureCache::sharedTextureCache"()
    void purgeSharedTextureCache"cocos2d::CCTextureCache::purgeSharedTextureCache"()
    void reloadAllTextures"cocos2d::CCTextureCache::reloadAllTextures"()


    ctypedef struct CCPVRMipmap:
        unsigned char *address
        unsigned int len

    ctypedef struct ccPVRTexturePixelFormatInfo:
        GLenum internalFormat
        GLenum format
        GLenum type
        unsigned int bpp #uint32_t bpp
        bool compressed
        bool alpha
        CCTexture2DPixelFormat ccPixelFormat

    ctypedef enum:
        CC_PVRMIPMAP_MAX










#---------------------
#---------------------
#---------------------
#---------------------




