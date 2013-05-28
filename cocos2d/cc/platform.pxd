# distutils: language = c++

from libcpp cimport bool
from libcpp.string cimport string
from libcpp.vector cimport vector
from cocoa cimport *
from include_h cimport *

cdef extern from "cocos2d.h" namespace "cocos2d":
    struct cc_timeval:
        long tv_sec
        long tv_usec

    cppclass CCTime:
        pass

    int CCTime_gettimeofdayCocos2d "cocos2d::CCTime::gettimeofdayCocos2d"(cc_timeval *tp, void *tzp)
    double CCTime_timersubCocos2d "cocos2d::CCTime::timersubCocos2d"(cc_timeval *start, cc_timeval *end)


    #---------CCAccelerometerDelegate.h------
    cppclass CCAcceleration:
        double x, y, z
        double timestamp

    cppclass CCAccelerometerDelegate:
        void didAccelerate(CCAcceleration* pAccelerationValue)



    cppclass CCEGLViewProtocol:
        pass

    #-------CCEGLView.h------------
    cppclass CCEGLView(CCEGLViewProtocol):
        CCEGLView()
        bool    isOpenGLReady()
        bool    setContentScaleFactor(float contentScaleFactor)
        #keep compatible
        void    end()
        void    swapBuffers()
        void setIMEKeyboardState(bool bOpen)

    CCEGLView* CCEGLView_sharedOpenGLView"cocos2d::CCEGLView::sharedOpenGLView"()


    #-----------CCImage.h--------------

    ctypedef enum EImageFormat "cocos2d::CCImage::EImageFormat":
        kFmtJpg
        kFmtPng
        kFmtTiff
        kFmtRawData
        kFmtUnKnown

    ctypedef enum ETextAlign "cocos2d::CCImage::ETextAlign":
        kAlignCenter      
        kAlignTop        
        kAlignTopRight   
        kAlignRight       
        kAlignBottomRight 
        kAlignBottom      
        kAlignBottomLeft  
        kAlignLeft        
        kAlignTopLeft     


    cppclass CCImage(CCObject):
        CCImage() except +
        bool initWithImageFile(const char * strPath, EImageFormat imageType)
        bool initWithImageFileThreadSafe(const char *fullpath, EImageFormat imageType)
        bool initWithImageData(void * pData, 
                               int nDataLen, 
                               EImageFormat eFmt,
                               int nWidth,
                               int nHeight,
                               int nBitsPerComponent)
        bool initWithString(
            const char *    pText, 
            int             nWidth,
            int             nHeight,
            ETextAlign      eAlignMask,
            const char *    pFontName,
            int             nSize)

        unsigned char *   getData()
        int         getDataLen()

        bool hasAlpha()
        bool isPremultipliedAlpha()
        bool saveToFile(const char *pszFilePath, bool bIsToRGB)

        #CC_SYNTHESIZE_READONLY(unsigned short,   m_nWidth,       Width)
        unsigned short getWidth()
        #CC_SYNTHESIZE_READONLY(unsigned short,   m_nHeight,      Height)
        unsigned short getHeight()
        #CC_SYNTHESIZE_READONLY(int,     m_nBitsPerComponent,   BitsPerComponent)
        int getBitsPerComponent()


    #-------------CCFileUtils.h-------------
    cppclass CCFileUtils(TypeInfo):
        #const char* fullPathFromRelativePath(const char *pszRelativePath)
        # void setResourceDirectory(const char *pszDirectoryName)
        # const char* getResourceDirectory()
        void purgeCachedEntries()
        unsigned char* getFileData(const char* pszFileName, const char* pszMode, unsigned long * pSize)
        unsigned char* getFileDataFromZip(const char* pszZipFilePath, const char* pszFileName, unsigned long * pSize)
        string fullPathForFilename(const char* pszFileName)
        void loadFilenameLookupDictionaryFromFile(const char* filename)
        void setFilenameLookupDictionary(CCDictionary* pFilenameLookupDict)
        const char* fullPathFromRelativeFile(const char *pszFilename, const char *pszRelativeFile)
        void setSearchResolutionsOrder(const vector[string]& searchResolutionsOrder)
        const vector[string]& getSearchResolutionsOrder()
        void addSearchResolutionsOrder(const char* order)
        const vector[string]& getSearchPaths()
        void setSearchPaths(const vector[string]& searchPaths)
        void addSearchPath(const char* path)
        string getWritablePath()
        bool isFileExist(const string& strFilePath)
        bool isAbsolutePath(const string& strPath)
        void setPopupNotify(bool bNotify)
        bool isPopupNotify()

    CCFileUtils* CCFileUtils_sharedFileUtils"cocos2d::CCFileUtils::sharedFileUtils"()
    void CCFileUtils_purgeFileUtils"cocos2d::CCFileUtils::purgeFileUtils"()








