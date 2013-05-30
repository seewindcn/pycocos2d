#-----------platform------------------
cdef class CCAcceleration:
    cdef double x, y, z
    cdef double timestamp

cdef class CCEGLView:
    cdef platform.CCEGLView* _co
    # def new(self):
    #     self._co = new platform.CCEGLView()
        # self.autorelease()
    #     return self

    @classmethod
    def sharedOpenGLView(cls):
        o = CCEGLView()
        o._co = platform.CCEGLView_sharedOpenGLView()
        return o

    def isOpenGLReady(self):
        return self._co.isOpenGLReady()

    def setContentScaleFactor(self, float contentScaleFactor):
        return self._co.setContentScaleFactor(contentScaleFactor)

    #keep compatible
    def end(self):
        self._co.end()

    def swapBuffers(self):
        self._co.swapBuffers()

    def setIMEKeyboardState(self, bool bOpen):
        self._co.setIMEKeyboardState(bOpen)



cdef class CCImage(CCObject):
    cdef inline platform.CCImage* image(self):
        return <platform.CCImage*> self._co

    def new(self):
        self._co = <cocoa.CCObject*>new platform.CCImage()
        self.autorelease()
        return self

    def initWithImageFile(self, str strPath, platform.EImageFormat imageType):
        return self.image().initWithImageFile(strPath, imageType)

    def initWithImageFileThreadSafe(self, str fullpath, platform.EImageFormat imageType):
        return self.image().initWithImageFileThreadSafe(fullpath, imageType)

    def initWithImageData(self, int pData, 
                int nDataLen,
                platform.EImageFormat eFmt,
                int nWidth,
                int nHeight,
                int nBitsPerComponent,
                ):
        return self.image().initWithImageData(<void*>pData,
                nDataLen,
                eFmt,
                nWidth,
                nHeight,
                nBitsPerComponent)

    def initWithString(self, str pText,
            int nWidth,
            int nHeight,
            platform.ETextAlign eAlignMask,
            str pFontName,
            int nSize):
        return self.image().initWithString(pText, nWidth, nHeight, 
                eAlignMask, pFontName, nSize)

    def getDate(self):
        return self.image().getData()

    def getDataLen(self):
        return self.image().getDataLen()

    def hasAlpha(self):
        return self.image().hasAlpha()

    def isPremultipliedAlpha(self):
        return self.image().isPremultipliedAlpha()

    def saveToFile(self, str pszFilePath, bool bIsToRGB):
        return self.image().saveToFile(pszFilePath, bIsToRGB)

    def getWidth(self):
        return self.image().getWidth()


cdef class CCFileUtils(TypeInfo):
    cdef inline platform.CCFileUtils* utils(self):
        return <platform.CCFileUtils*>self._co

    def purgeCachedEntries(self):
        self.utils().purgeCachedEntries()

    def getFileData(self, str pszFileName, str pszMode):
        cdef unsigned long pSize
        cdef unsigned char* p
        p = self.utils().getFileData(pszFileName, pszMode, &pSize)
        return p, pSize

    def getFileDataFromZip(self, str pszZipFilePath, str pszFileName):
        cdef unsigned long pSize
        cdef unsigned char* p
        p = self.utils().getFileDataFromZip(pszZipFilePath, pszFileName, &pSize)
        return p, pSize


    def fullPathForFilename(self, str pszFileName):
        return self.utils().fullPathForFilename(pszFileName)

    def loadFilenameLookupDictionaryFromFile(self, str filename):
        self.utils().loadFilenameLookupDictionaryFromFile(filename)

    def setFilenameLookupDictionary(self, CCDictionary pFilenameLookupDict):
        self.utils().setFilenameLookupDictionary(pFilenameLookupDict.dict())

    def fullPathFromRelativeFile(self, str pszFileName, str pszRelativeFile):
        return self.utils().fullPathFromRelativeFile(pszFileName, pszRelativeFile)

    def setSearchResolutionsOrder(self, searchResolutionsOrder):
        cdef vector[string] v
        n = v.size()
        for i in xrange(n):
            v.push_back(searchResolutionsOrder[i])
        self.utils().setSearchResolutionsOrder(v)


    def getSearchResolutionsOrder(self):
        cdef vector[string] v 
        v = self.utils().getSearchResolutionsOrder()
        rs = []
        n = v.size()
        for i in xrange(n):
            rs.append(v[i])
        return rs

    def addSearchResolutionsOrder(self, order):
        self.utils().addSearchResolutionsOrder(order)

    def getSearchPaths(self):
        cdef vector[string] v
        v = self.utils().getSearchPaths()
        n = v.size()
        rs = []
        for i in xrange(n):
            rs.append(v[i])
        return rs

    def setSearchPaths(self, searchPaths):
        cdef vector[string] v
        for p in searchPaths:
            v.push_back(p)
        self.utils().setSearchPaths(v)
        

    def addSearchPath(self, path):
        self.utils().addSearchPath(path)

    def getWritablePath(self):
        return self.utils().getWritablePath()

    def isFileExist(self, strFilePath):
        cdef string s = strFilePath
        return self.utils().isFileExist(s)

    def isAbsolutePath(self, strPath):
        cdef string s = strPath
        return self.utils().isAbsolutePath(s)

    def setPopupNotify(self, bool bNotify):
        self.utils().setPopupNotify(bNotify)

    def isPopupNotify(self):
        return self.utils().isPopupNotify()

