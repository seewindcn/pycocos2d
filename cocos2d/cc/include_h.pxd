# distutils: language = c++

from libcpp cimport bool
from shaders cimport *
from cocoa cimport *

cdef extern from "cocos2d.h" namespace "cocos2d":
    cppclass CCImage
    cppclass CCGLProgram

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

    cppclass CCDirectorDelegate:
        void updateProjection()


    #--------ccTypes.h----------
    ctypedef struct ccColor3B:
        GLubyte r
        GLubyte g
        GLubyte b

    inline ccColor3B ccc3(const GLubyte r, const GLubyte g, const GLubyte b)
    const ccColor3B ccWHITE={255,255,255}
    # //! Yellow color (255,255,0)
    const ccColor3B ccYELLOW={255,255,0}
    # //! Blue color (0,0,255)
    const ccColor3B ccBLUE={0,0,255}
    # //! Green Color (0,255,0)
    const ccColor3B ccGREEN={0,255,0}
    # //! Red Color (255,0,0,)
    const ccColor3B ccRED={255,0,0}
    # //! Magenta Color (255,0,255)
    const ccColor3B ccMAGENTA={255,0,255}
    # //! Black Color (0,0,0)
    const ccColor3B ccBLACK={0,0,0}
    # //! Orange Color (255,127,0)
    const ccColor3B ccORANGE={255,127,0}
    # //! Gray Color (166,166,166)
    const ccColor3B ccGRAY={166,166,166}

    ctypedef struct ccColor4B:
        GLubyte r
        GLubyte g
        GLubyte b
        GLubyte a

    inline ccColor4B ccc4(const GLubyte r, const GLubyte g, const GLubyte b, const GLubyte o)

    ctypedef struct ccColor4F:
        GLfloat r
        GLfloat g
        GLfloat b
        GLfloat a

    inline ccColor4F ccc4FFromccc3B(ccColor3B c)
    inline ccColor4F ccc4f(const GLfloat r, const GLfloat g, const GLfloat b, const GLfloat a)
    inline ccColor4F ccc4FFromccc4B(ccColor4B c)
    inline ccColor4B ccc4BFromccc4F(ccColor4F c)
    inline bool ccc4FEqual(ccColor4F a, ccColor4F b)

    ctypedef struct ccVertex2F:
        GLfloat x
        GLfloat y
    inline ccVertex2F vertex2(const float x, const float y)

    ctypedef struct ccVertex3F:
        GLfloat x
        GLfloat y
        GLfloat z

    inline ccVertex3F vertex3(const float x, const float y, const float z)

    ctypedef struct ccTex2F:
        GLfloat u
        GLfloat v
    inline ccTex2F tex2(const float u, const float v)


    ctypedef struct ccPointSprite:
        ccVertex2F    pos
        ccColor4B    color
        GLfloat        size

    ctypedef struct ccQuad2:
        ccVertex2F        tl
        ccVertex2F        tr
        ccVertex2F        bl
        ccVertex2F        br


    ctypedef struct ccQuad3:
        ccVertex3F        bl
        ccVertex3F        br
        ccVertex3F        tl
        ccVertex3F        tr

    ctypedef struct ccV2F_C4B_T2F:
        ccVertex2F        vertices
        ccColor4B        colors
        ccTex2F            texCoords

    ctypedef struct ccV2F_C4F_T2F:
        ccVertex2F        vertices
        ccColor4F        colors
        ccTex2F            texCoords

    ctypedef struct ccV3F_C4B_T2F:
        ccVertex3F        vertices
        ccColor4B        colors
        ccTex2F            texCoords

    ctypedef struct ccV2F_C4B_T2F_Triangle:
        ccV2F_C4B_T2F a
        ccV2F_C4B_T2F b
        ccV2F_C4B_T2F c

    ctypedef struct ccV2F_C4B_T2F_Quad:
        ccV2F_C4B_T2F    bl
        ccV2F_C4B_T2F    br
        ccV2F_C4B_T2F    tl
        ccV2F_C4B_T2F    tr

    ctypedef struct ccV3F_C4B_T2F_Quad:
        ccV3F_C4B_T2F    tl
        ccV3F_C4B_T2F    bl
        ccV3F_C4B_T2F    tr
        ccV3F_C4B_T2F    br

    ctypedef struct ccV2F_C4F_T2F_Quad:
        ccV2F_C4F_T2F    bl
        ccV2F_C4F_T2F    br
        ccV2F_C4F_T2F    tl
        ccV2F_C4F_T2F    tr

    ctypedef struct ccBlendFunc:
        GLenum src
        GLenum dst

    const ccBlendFunc kCCBlendFuncDisable = {GL_ONE, GL_ZERO}

    ctypedef enum CCVerticalTextAlignment:
        kCCVerticalTextAlignmentTop,
        kCCVerticalTextAlignmentCenter,
        kCCVerticalTextAlignmentBottom,

    ctypedef enum CCTextAlignment:
        kCCTextAlignmentLeft,
        kCCTextAlignmentCenter,
        kCCTextAlignmentRight,


    ctypedef struct ccT2F_Quad:
        ccTex2F    bl
        ccTex2F    br
        ccTex2F    tl
        ccTex2F    tr

    ctypedef struct ccAnimationFrameData:
        ccT2F_Quad texCoords
        float delay
        CCSize size


    cppclass TypeInfo:
        long getClassTypeInfo()

    inline unsigned int getHashCodeByString(const char *key)




















