# distutils: language = c++

from libcpp cimport bool
from libcpp.string cimport string
from libcpp.set cimport set
from touch cimport *
from cocoa cimport *
from ccNode cimport *
from platform cimport *
from script cimport *
from sprite cimport *

cdef extern from "cocos2d.h" namespace "cocos2d":
    cppclass CCLabelAtlas(CCAtlasNode):
        CCLabelAtlas()
        bool initWithString(const char *string, const char *charMapFile, unsigned int itemWidth, unsigned int itemHeight, unsigned int startCharMap)
        bool initWithString(const char *string, const char *fntFile)
        void updateAtlasValues()
        void setString(const char *label)
        const char* getString()
        void draw()
    CCLabelAtlas * CCLabelAtlas_create"cocos2d::CCLabelAtlas::create"(const char *string, const char *charMapFile, unsigned int itemWidth, unsigned int itemHeight, unsigned int startCharMap)
    CCLabelAtlas* CCLabelAtlas_create"cocos2d::CCLabelAtlas::create"(const char *string, const char *fntFile)

    enum:
        kCCLabelAutomaticWidth

    ctypedef struct ccBMFontDef:
        unsigned int charID
        CCRect rect
        short xOffset
        short yOffset
        short xAdvance


    ctypedef struct ccBMFontPadding:
        int    left
        int top
        int right
        int bottom

    ctypedef struct tCCFontDefHashElement:
        unsigned int    key
        ccBMFontDef     fontDef
        UT_hash_handle  hh

    ctypedef struct tCCKerningHashElement:
        int             key
        int             amount
        UT_hash_handle  hh


    cppclass CCBMFontConfiguration(CCObject):
        tCCFontDefHashElement *m_pFontDefDictionary
        int m_nCommonHeight
        ccBMFontPadding    m_tPadding
        string m_sAtlasName
        tCCKerningHashElement *m_pKerningDictionary
        set[unsigned int] *m_pCharacterSet

        CCBMFontConfiguration()
        const char * description()


        bool initWithFNTfile(const char *FNTfile)
        
        inline const char* getAtlasName()
        inline void setAtlasName(const char* atlasName)
        
        set[unsigned int]* getCharacterSet() const

    CCBMFontConfiguration * create"cocos2d::CCBMFontConfiguration::create"(const char *FNTfile)


    cppclass CCLabelBMFont(CCSpriteBatchNode):
        CCLabelBMFont()
        bool init()
        bool initWithString(const char *str, const char *fntFile, 
            float width, CCTextAlignment alignment, 
            CCPoint imageOffset)
        #bool initWithString(const char *str, const char *fntFile, float width = kCCLabelAutomaticWidth, CCTextAlignment alignment = kCCTextAlignmentLeft, CCPoint imageOffset = CCPointZero)
        void createFontChars()
        void setString(const char *label)
        void setString(const char *label, bool fromUpdate)
        void updateString(bool fromUpdate)
        const char* getString()
        void setCString(const char *label)
        void setAnchorPoint(const CCPoint& var)
        void updateLabel()
        void setAlignment(CCTextAlignment alignment)
        void setWidth(float width)
        void setLineBreakWithoutSpace(bool breakWithoutSpace)
        void setScale(float scale)
        void setScaleX(float scaleX)
        void setScaleY(float scaleY)
        bool isOpacityModifyRGB()
        void setOpacityModifyRGB(bool isOpacityModifyRGB)
        void setFntFile(const char* fntFile)
        const char* getFntFile()
        void draw()

    void CCLabelBMFont_purgeCachedData"cocos2d::CCLabelBMFont::purgeCachedData"()
    CCLabelBMFont * CCLabelBMFont_create"cocos2d::CCLabelBMFont::create"(const char *str, const char *fntFile, float width, CCTextAlignment alignment, CCPoint imageOffset)
    CCLabelBMFont * CCLabelBMFont_create"cocos2d::CCLabelBMFont::create"(const char *str, const char *fntFile, float width, CCTextAlignment alignment)
    CCLabelBMFont * CCLabelBMFont_create"cocos2d::CCLabelBMFont::create"(const char *str, const char *fntFile, float width)
    CCLabelBMFont * CCLabelBMFont_create"cocos2d::CCLabelBMFont::create"(const char *str, const char *fntFile)
    CCLabelBMFont * CCLabelBMFont_create"cocos2d::CCLabelBMFont::create"()




    CCBMFontConfiguration * FNTConfigLoadFile( const char *file )
    void FNTConfigRemoveCache()


    cppclass CCLabelTTF(CCSprite):
        CCLabelTTF()
        const char* description()    
        bool initWithString(const char *string, const char *fontName, float fontSize)
        bool initWithString(const char *string, const char *fontName, float fontSize,
                            const CCSize& dimensions, CCTextAlignment hAlignment)
        bool initWithString(const char *string, const char *fontName, float fontSize,
                            const CCSize& dimensions, CCTextAlignment hAlignment, 
                            CCVerticalTextAlignment vAlignment)
        
        bool init()

        void setString(const char *label)
        const char* getString()
        
        CCTextAlignment getHorizontalAlignment()
        void setHorizontalAlignment(CCTextAlignment alignment)
        
        CCVerticalTextAlignment getVerticalAlignment()
        void setVerticalAlignment(CCVerticalTextAlignment verticalAlignment)
        
        CCSize getDimensions()
        void setDimensions(const CCSize &dim)
        
        float getFontSize()
        void setFontSize(float fontSize)
        
        const char* getFontName()
        void setFontName(const char *fontName)


    CCLabelTTF * CCLabelTTF_create"cocos2d::CCLabelTTF::create"()
    CCLabelTTF * CCLabelTTF_create"cocos2d::CCLabelTTF::create"(const char *string, const char *fontName, float fontSize)
    CCLabelTTF * CCLabelTTF_create"cocos2d::CCLabelTTF::create"(const char *string, const char *fontName, float fontSize,
                               const CCSize& dimensions, CCTextAlignment hAlignment)
    CCLabelTTF * CCLabelTTF_create"cocos2d::CCLabelTTF::create"(const char *string, const char *fontName, float fontSize,
                               const CCSize& dimensions, CCTextAlignment hAlignment, 
                               CCVerticalTextAlignment vAlignment)
    CCLabelTTF * CCLabelTTF_node"cocos2d::CCLabelTTF::node"()












