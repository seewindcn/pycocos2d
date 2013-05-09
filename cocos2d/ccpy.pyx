#!python
#cython: boundscheck=True
#cython: embedsignature=False
#cython: profile=False
#cython: nonecheck=False
#cython: initializedcheck=True
# distutils: language = c++
include "cc.pxi"
import traceback

kCCTextAlignmentLeft = include_h.kCCTextAlignmentLeft
kCCTextAlignmentCenter = include_h.kCCTextAlignmentCenter
kCCTextAlignmentRight = include_h.kCCTextAlignmentRight

cdef class ccBlendFunc:
    cdef include_h.ccBlendFunc _co
    def __cinit__(self, src=None, dst=None):
        if src is not None:
            self._co.src = src
        if dst is not None:
            self._co.dst = dst

    property src:
        def __get__(self):
            return self._co.src
        def __set__(self, var):
            self._co.src = var

    property dst:
        def __get__(self):
            return self._co.dst
        def __set__(self, var):
            self._co.dst = var


cdef class ccColor3B:
    cdef include_h.ccColor3B _co
    def __cinit__(self, r=0, g=0, b=0):
        self._co.r = r
        self._co.g = g
        self._co.b = b

    property r:
        def __get__(self):
            return self._co.r
        def __set__(self, var):
            self._co.r = var
    property g:
        def __get__(self):
            return self._co.g
        def __set__(self, var):
            self._co.g = var
    property b:
        def __get__(self):
            return self._co.b
        def __set__(self, var):
            self._co.b = var

cdef class ccColor4B:
    cdef include_h.ccColor4B _co
    def __cinit__(self, r=0, g=0, b=0, a=0):
        self._co.r = r
        self._co.g = g
        self._co.b = b
        self._co.a = a

    property r:
        def __get__(self):
            return self._co.r
        def __set__(self, var):
            self._co.r = var
    property g:
        def __get__(self):
            return self._co.g
        def __set__(self, var):
            self._co.g = var
    property b:
        def __get__(self):
            return self._co.b
        def __set__(self, var):
            self._co.b = var
    property a:
        def __get__(self):
            return self._co.a
        def __set__(self, var):
            self._co.a = var

cdef class ccColor4F:
    cdef include_h.ccColor4F _co
    property r:
        def __get__(self):
            return self._co.r
        def __set__(self, var):
            self._co.r = var
    property g:
        def __get__(self):
            return self._co.g
        def __set__(self, var):
            self._co.g = var
    property b:
        def __get__(self):
            return self._co.b
        def __set__(self, var):
            self._co.b = var
    property a:
        def __get__(self):
            return self._co.a
        def __set__(self, var):
            self._co.a = var


cdef class ccTexParams:
    cdef textures.ccTexParams _co
    property minFilter:
        def __get__(self):
            return self._co.minFilter
        def __set__(self, var):
            self._co.minFilter = var

    property magFilter:
        def __get__(self):
            return self._co.magFilter
        def __set__(self, var):
            self._co.magFilter = var

    property wrapS:
        def __get__(self):
            return self._co.wrapS
        def __set__(self, var):
            self._co.wrapS = var

    property wrapT:
        def __get__(self):
            return self._co.wrapT
        def __set__(self, var):
            self._co.wrapT = var



cdef class TypeInfo:
    cdef include_h.TypeInfo* _co
    def getClassTypeInfo(self):
        return self._co.getClassTypeInfo()

    @classmethod
    def getHashCodeByString(cls, key):
        return include_h.getHashCodeByString(key)


cdef class CCPoint:
    cdef cocoa.CCPoint _co

    @classmethod
    def create(cls, x, y):
        cdef CCPoint o = cls()
        o.setPoint(x, y)
        return o

    def __cinit__(self, x=0, y=0):
        self._co.x = x
        self._co.y = y

    def __str__(self):
        return 'CCPoint(x=%.2f, y=%.2f)' % (self._co.x, self._co.y)

    cpdef setPoint(self, x, y):
        self._co.setPoint(x, y)

    def equals(self, CCPoint p):
        return self._co.equals(p._co)

    def get_x(self):
        return self._co.x
    def set_x(self, float v):
        self._co.x = v
    x = property(get_x, set_x)

    def get_y(self):
        return self._co.y
    def set_y(self, float v):
        self._co.y = v
    y = property(get_y, set_y)

    def zero(self):
        self._co = cocoa.CCPointZero


cdef class CCSize:
    cdef cocoa.CCSize _co

    @classmethod
    def create(cls, width, height):
        cdef CCSize o = cls()
        o.setSize(width, height)
        return o

    def __cinit__(self, width=None, height=0.0):
        if width is not None:
            self.setSize(width, height)

    def __str__(self):
        return 'CCSize(width=%.2f, height=%.2f)' % (self._co.width, self._co.height)

    cpdef setSize(self, float width, float height):
        self._co.setSize(width, height)

    def equals(self, CCSize target):
        return self._co.equals(target._co)

    def get_width(self):
        return self._co.width
    def set_width(self, v):
        self._co.width = v
    width = property(get_width, set_width)

    def get_height(self):
        return self._co.height
    def set_height(self, v):
        self._co.height = v
    height = property(get_height, set_height)

    def zero(self):
        self._co = cocoa.CCSizeZero

cdef class CCRect:
    cdef cocoa.CCRect _co
    @classmethod
    def create(cls, x, y, width, height):
        cdef CCRect o = cls()
        o.setRect(x, y, width, height)
        return o

    def __cinit__(self, x=None, y=0.0, width=0.0, height=0.0):
        if x is not None:
            self._co.setRect(x, y, width, height)

    def setRect(self, x, y, width, height):
        self._co.setRect(x, y, width, height)

    def __str__(self):
        return 'CCRect(x=%.2f, y=%.2f, width=%.2f, height=%.2f)' % (self.x, 
                self.y, self.width, self.height)

    property x:
        def __get__(self):
            return self._co.origin.x
        def __set__(self, var):
            self._co.origin.x = var
    property y:
        def __get__(self):
            return self._co.origin.y
        def __set__(self, var):
            self._co.origin.y = var
    property width:
        def __get__(self):
            return self._co.size.width
        def __set__(self, var):
            self._co.size.width = var
    property height:
        def __get__(self):
            return self._co.size.height
        def __set__(self, var):
            self._co.size.height = var


    def equals(self, CCRect rect):
        return self._co.equals(rect._co)

    def containsPoint(self, CCPoint point):
        return self._co.containsPoint(point._co)

    def intersectsRect(self, CCRect rect):
        return self._co.intersectsRect(rect._co)

    def getMinX(self):
        return self._co.getMinX()
    def getMidX(self):
        return self._co.getMidX()
    def getMaxX(self):
        return self._co.getMaxX()
    def getMinY(self):
        return self._co.getMinY()
    def getMidY(self):
        return self._co.getMidY()
    def getMaxY(self):
        return self._co.getMaxY()

    def zero(self):
        self._co = cocoa.CCRectZero


cdef class CCAffineTransform:
    cdef cocoa.CCAffineTransform _co
    def get_a(self):
        return self._co.a
    def set_a(self, v):
        self._co.a = v
    a = property(get_a, set_a)

    def get_b(self):
        return self._co.b
    def set_b(self, v):
        self._co.b = v
    b = property(get_b, set_b)

    def get_c(self):
        return self._co.c
    def set_c(self, v):
        self._co.c = v
    c = property(get_c, set_c)

    def get_d(self):
        return self._co.d
    def set_d(self, v):
        self._co.d = v
    d = property(get_d, set_d)

    def get_tx(self):
        return self._co.tx
    def set_tx(self, v):
        self._co.tx = v
    tx = property(get_tx, set_tx)

    def get_ty(self):
        return self._co.ty
    def set_ty(self, v):
        self._co.ty = v
    ty = property(get_ty, set_ty)


cdef class CCPyObject(object):
    pass

cdef class CCZone(CCPyObject):
    cdef cocoa.CCZone* _co

    def __nonzero__(self):
        if self._co == NULL:
            return False
        return True

cdef class CCCopying(CCPyObject):
    cdef cocoa.CCObject* _co
    def __cinit__(self):
        self._co = NULL

    def __nonzero__(self):
        if self._co == NULL:
            return False
        return True

    def set_co(self, co):
        self._co = <cocoa.CCObject*><int>co

    def get_co(self):
        return <int>self._co


    cdef inline object _set_co(self, void* _co):
        self._co = <cocoa.CCObject*>_co
        return self

    cdef inline cocoa.CCCopying* copying(self):
        return <cocoa.CCCopying*>self._co

    def copyWithZone(self, CCZone zone):
        obj = self.__class__()
        obj.set_co(<int>self.copying().copyWithZone(zone._co))

cdef class CCObject(CCCopying):
    cdef bool _gc
    def __cinit__(self):
        self._gc = False

    def __dealloc__(self):
        if self._gc:
            self._co.release()

    def get_gc(self):
        return self._gc
    def set_gc(self, value):
        self._gc = <bool>value
    gc = property(get_gc, set_gc)

    def release(self):
        self._co.release()

    def retain(self):
        self._co.retain()

    def autorelease(self):
        o = CCObject()
        o.set_co(<int>self._co.autorelease())
        return o

    def cast(self, cls):
        cdef CCObject o = cls()
        o._co = self._co
        return o

    def copy(self):
        cdef CCObject o = self.__class__()
        o._co = <cocoa.CCObject*>self._co.copy()
        return o

    def isSingleReference(self):
        return self._co.isSingleReference()

    def retainCount(self):
        return self._co.retainCount()

    def isEqual(self, CCObject obj):
        return self._co.isEqual(obj._co)

    def update(self, float dt):
        self._co.update(dt)

cdef class CCBool(CCObject):
    cdef inline cocoa.CCBool *ccbool(self):
        return <cocoa.CCBool*> self._co

    @classmethod
    def create(cls, bool v):
        cdef CCBool o = cls()
        o._co = <cocoa.CCObject*>cocoa.CCBool_create(v)
        return o

    def getValue(self):
        return self.ccbool().getValue()

cdef class CCInteger(CCObject):
    cdef inline cocoa.CCInteger* int(self):
        return <cocoa.CCInteger*>self._co

    def __cinit__(self, int v=0):
        self.new(v)

    @classmethod
    def create(cls, int v):
        o = cls()
        o.set_co(<int>cocoa.CCInteger_create(v))
        return o

    def new(self, int v):
        self._co = <cocoa.CCObject*>new cocoa.CCInteger(v)
        self.autorelease()
        return self

    def getValue(self):
        return self.int().getValue()

cdef class CCDouble(CCObject):
    cdef inline cocoa.CCDouble* double(self):
        return <cocoa.CCDouble*>self._co

    def new(self, double v):
        self._co = <cocoa.CCObject*>new cocoa.CCDouble(v)
        self.autorelease()
        return self

    @classmethod
    def create(cls, double v):
        o = cls()
        o.set_co(<int>cocoa.CCDouble_create(v))
        return o

    def getValue(self):
        return self.double().getValue()

cdef class CCFloat(CCObject):
    cdef inline cocoa.CCFloat* float(self):
        return <cocoa.CCFloat*>self._co

    def new(self, double v):
        self._co = <cocoa.CCObject*>new cocoa.CCFloat(v)
        self.autorelease()
        return self

    @classmethod
    def create(cls, double v):
        o =  cls()
        o.set_co(<int> cocoa.CCFloat_create(v))
        return o

    def getValue(self):
        return self.float().getValue()




cdef class CCString(CCObject):
    cdef inline cocoa.CCString* string(self):
        return <cocoa.CCString*>self._co

    @classmethod
    def create(cls, value=''):
        cdef string s = value
        o = cls()
        o.set_co(<int>cocoa.CCString_create(s))
        return o

    @classmethod
    def createWithContentsOfFile(cls, char* filename):
        o = cls()
        o.set_co(<int>cocoa.CCString_createWithContentsOfFile(filename))
        return o

    def new(self, value=''):
        cdef string s
        if not value:
            self._co = <cocoa.CCObject*> new cocoa.CCString()
        else:
            s = value
            self._co = <cocoa.CCObject*> new cocoa.CCString(s)
        self.autorelease()
        return self

    def intValue(self):
        return self.string().intValue()

    cpdef uintValue(self):
        return self.string().uintValue()

    def floatValue(self):
        return self.string().floatValue()

    def doubleValue(self):
        return self.string().doubleValue()

    def boolValue(self):
        return self.string().boolValue()

    def getCString(self):
        return self.string().getCString()

    def length(self):
        return self.string().length()

    def compare(self, char* s):
        return self.string().compare(s)


cdef class CCSetIterator(object):
    cdef cocoa.CCSetIteratorStruct begin
    cdef cocoa.CCSetIteratorStruct end
    cdef cocoa.CCAffineTransform begincc
    cdef object cls

    def __iter__(self):
        return self

    cdef init(self, cocoa.CCSetIterator begin, cocoa.CCSetIterator end, object cls):
        self.begin = <cocoa.CCSetIteratorStruct>begin
        self.end = <cocoa.CCSetIteratorStruct>end
        self.cls = cls

    def __next__(self):
        cdef CCObject o
        cdef cocoa.CCSetIterator begin, end
        begin = <cocoa.CCSetIterator>self.begin
        end = <cocoa.CCSetIterator>self.end
        if begin == end:
            raise StopIteration
        o = <CCObject>self.cls()
        o._co = <cocoa.CCObject*>deref(begin)
        begin = <cocoa.CCSetIterator>cython.operator.preincrement(begin)
        self.begin = <cocoa.CCSetIteratorStruct>begin
        return o

cdef class CCSet(CCObject):
    cdef inline cocoa.CCSet* set(self):
        return <cocoa.CCSet*>self._co

    def new(self):
        self._co = <cocoa.CCObject*>new cocoa.CCSet()
        self.autorelease()
        return self


    def mutableCopy(self):
        cdef CCSet s = CCSet()
        s._co = <cocoa.CCObject*>self.set().mutableCopy()

    def count(self):
        return self.set().count()

    def addObject(self, CCObject obj):
        self.set().addObject(obj._co)

    def removeObject(self, CCObject obj):
        self.set().removeObject(obj._co)

    def removeAllObjects(self):
        self.set().removeAllObjects()

    def containsObject(self, CCObject obj):
        return self.set().containsObject(obj._co)

    def iter(self, cls):
        # if self.set().count() == 0:
        #     return []
        # cdef cocoa.CCSetIterator begin = self.set().begin()
        # cdef cocoa.CCSetIterator end = self.set().begin()
        # cdef CCObject o
        # def _iter():
        #     while begin != end:
        #         o = <CCObject>cls()
        #         o._co = <cocoa.CCObject*>deref(begin)
        #         yield o
        #         begin = <cocoa.CCSetIterator>cython.operator.preincrement(begin)
        # return _iter
        cdef CCSetIterator s = CCSetIterator()
        s.init(self.set().begin(), self.set().end(), cls)
        return s


    def anyObject(self, cls):
        o = cls()
        o.set_co(<int>self.set().anyObject())
        return o



cdef class CCArray(CCObject):
    cdef inline cocoa.CCArray* array(self):
        return <cocoa.CCArray*> self._co

    @classmethod
    def create(cls, capacity=None):
        o = cls()
        if capacity is None:
            o.set_co(<int>cocoa.CCArray_create())
        else:
            o.set_co(<int>cocoa.CCArray_createWithCapacity(capacity))
        return o

    @classmethod
    def createWithArray(cls, CCArray array):
        o = cls()
        o.set_co(<int>cocoa.CCArray_createWithArray(array.array()))
        return o

    @classmethod
    def createWithContentsOfFile(cls, char* filename, thread=0):
        o = cls()
        if thread:
            o.set_co(<int>cocoa.CCArray_createWithContentsOfFileThreadSafe(filename))
        else:
            o.set_co(<int> cocoa.CCArray_createWithContentsOfFile(filename))
        return o

    def count(self):
        return self.array().count()

    def capacity(self):
        return self.array().capacity()

    def indexOfObject(self, CCObject obj):
        return self.array().indexOfObject(obj._co)

    def objectAtIndex(self, int index, cls):
        obj = cls()
        obj.set_co(<int>self.array().objectAtIndex(index))

    def randomObject(self, cls):
        o = cls()
        o.set_co(<int>self.array().randomObject())
        return o

    def containsObject(self, CCObject obj):
        return self.array().containsObject(obj._co)

    def isEqualToArray(self, CCArray array):
        return self.array().isEqualToArray(array.array())

    def addObject(self, CCObject obj):
        self.array().addObject(obj._co)

    def addObjectsFromArray(self, CCArray array):
        self.array().addObjectsFromArray(array.array())

    def insertObject(self, CCObject obj, unsigned int index):
        self.array().insertObject(obj._co, index)

    def removeLastObject(self, release=1):
        cdef bool b = release
        self.array().removeLastObject(b)

    def removeObject(self, CCObject obj, release=1):
        cdef bool b = release
        self.array().removeObject(obj._co, b)

    def removeObjectAtIndex(self, unsigned int index, bool release=1):
        self.array().removeObjectAtIndex(index, release)

    def removeObjectsInArray(self, CCArray array):
        self.array().removeObjectsInArray(array.array())

    def removeAllObjects(self):
        self.array().removeAllObjects()

    def fastRemoveObject(self, CCObject obj):
        self.array().fastRemoveObject(obj._co)

    def fastRemoveObjectAtIndex(self, unsigned int index):
        self.array().fastRemoveObjectAtIndex(index)

    def exchangeObject(self, CCObject obj1, CCObject obj2):
        self.array().exchangeObject(obj1._co, obj2._co)

    def exchangeObjectAtIndex(self, unsigned int index1, unsigned int index2):
        self.array().exchangeObjectAtIndex(index1, index2)

    def replaceObjectAtIndex(self, unsigned int index, CCObject obj):
        self.array().replaceObjectAtIndex(index, obj._co)

    def reverseObjects(self):
        self.array().reverseObjects()

    def reduceMemoryFootprint(self):
        self.array().reduceMemoryFootprint()


cdef class CCDictionary(CCObject):
    cdef inline cocoa.CCDictionary* dict(self):
        return <cocoa.CCDictionary*>self._co

    @classmethod
    def create(cls):
        o = cls()
        o.set_co(<int>cocoa.CCDictionary_create())
        return o

    @classmethod
    def createWithDictionary(cls, CCDictionary srcDict):
        o = cls()
        o.set_co(<int>cocoa.CCDictionary_createWithDictionary(srcDict.dict()))
        return o

    @classmethod
    def createWithContentsOfFile(cls, char* filename, thread=0):
        o = cls()
        if thread:
            o.set_co(<int>cocoa.CCDictionary_createWithContentsOfFileThreadSafe(filename))
        else:
            o.set_co(<int>cocoa.CCDictionary_createWithContentsOfFile(filename))
        return o

    def count(self):
        return self.dict().count()

    def allKeys(self):
        a = CCArray()
        a._co = <cocoa.CCObject*>self.dict().allKeys()
        return a

    def allKeysForObject(self, CCObject obj):
        a = CCArray()
        a._co = <cocoa.CCObject*>self.dict().allKeysForObject(obj._co)
        return a

    def objectForKey(self, key, cls):
        cdef cocoa.CCObject* co
        cdef string skey
        if isinstance(key, int):
            co = self.dict().objectForKey(<int>key)
        else:
            skey = key
            co = self.dict().objectForKey(skey)
        obj = cls()
        obj.set_co(<int>co)
        return obj

    def valueForKey(self, key):
        cdef cocoa.CCObject* co
        cdef string skey
        s = CCString()
        if isinstance(key, int):
            s._co = <cocoa.CCObject*> self.dict().valueForKey(<int>key)
        else:
            skey = key
            s._co = <cocoa.CCObject*> self.dict().valueForKey(skey)
        return s

    def setobject(self, obj, key): 
        cdef string skey 
        # cdef int ikey
        #self.dict().setObject(obj._co, skey)
        if isinstance(key, int):
            # ikey = key
            self.dict().setObject_int(<cocoa.CCObject*><int>obj.get_co(), key)
        else:
            skey = key
            self.dict().setObject(<cocoa.CCObject*><int>obj.get_co(), skey)

    def removeObjectForKey(self, key):
        cdef string skey
        cdef int ikey
        if isinstance(key, int):
            ikey = key
            self.dict().removeObjectForKey(ikey)
        else:
            skey = key
            self.dict().removeObjectForKey(skey)

    def removeObjectsForKeys(self, CCArray keys):
        self.dict().removeObjectsForKeys(keys.array())

    def removeAllObjects(self):
        self.dict().removeAllObjects()

    def randomObject(self, cls):
        obj = cls()
        obj.set_co(<int>self.dict().randomObject())


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
    cdef platform.CCFileUtils* utils(self):
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

    def fullPathFromRelativePath(self, str pszRelativePath):
        return self.utils().fullPathFromRelativePath(pszRelativePath)

    def fullPathForFilename(self, str pszFileName):
        return self.utils().fullPathForFilename(pszFileName)

    def loadFilenameLookupDictionaryFromFile(self, str filename):
        self.utils().loadFilenameLookupDictionaryFromFile(filename)

    def setFilenameLookupDictionary(self, CCDictionary pFilenameLookupDict):
        self.utils().setFilenameLookupDictionary(pFilenameLookupDict.dict())

    def fullPathFromRelativeFile(self, str pszFileName, str pszRelativeFile):
        return self.utils().fullPathFromRelativeFile(pszFileName, pszRelativeFile)

    def setResourceDirectory(self, str pszDirectoryName):
        self.utils().setResourceDirectory(pszDirectoryName)

    # void setSearchResolutionsOrder(const std::vector<string>& searchResolutionsOrder)
    # const std::vector<string>& getSearchResolutionsOrder()
    # void setSearchPaths(const std::vector<string>& searchPaths)
    # const std::vector<string>& getSearchPaths()

    def getResourceDirectory(self):
        return self.utils().getResourceDirectory()

    def getWriteablePath(self):
        return self.utils().getWriteablePath()

    def setPopupNotify(self, bool bNotify):
        self.utils().setPopupNotify(bNotify)

    def isPopupNotify(self):
        return self.utils().isPopupNotify()


#----------touch.pxd-------------
cdef class CCEvent(CCObject):
    cdef inline touch.CCEvent* event(self):
        return <touch.CCEvent*> self._co

cdef class CCTouch(CCObject):
    cdef inline touch.CCTouch* touch(self):
        return <touch.CCTouch*> self._co

    def getLocation(self):
        o = CCPoint()
        o._co = self.touch().getLocation()
        return o

    def getPreviousLocation(self):
        o = CCPoint()
        o._co = self.touch().getPreviousLocation()
        return o

    def getDelta(self):
        o = CCPoint()
        o._co = self.touch().getDelta()
        return o

    def getLocationInView(self):
        o = CCPoint()
        o._co = self.touch().getLocationInView()
        return o

    def getPreviousLocationInView(self):
        o = CCPoint()
        o._co = self.touch().getPreviousLocationInView()
        return o

    def setTouchInfo(self, int id, float x, float y):
        self.touch().setTouchInfo(id, x, y)

    def getID(self):
        return self.touch().getID()



cdef class CCTouchDelegate:
    cdef touch.CCTouchDelegate* _co

    def ccTouchBegan(self, CCTouch pTouch, CCEvent pEvent):
        return self._co.ccTouchBegan(pTouch.touch(), pEvent.event())

    def ccTouchMoved(self, CCTouch pTouch, CCEvent pEvent):
        self._co.ccTouchMoved(pTouch.touch(), pEvent.event())

    def ccTouchEnded(self, CCTouch pTouch, CCEvent pEvent):
        self._co.ccTouchEnded(pTouch.touch(), pEvent.event())

    def ccTouchCancelled(self, CCTouch pTouch, CCEvent pEvent):
        self._co.ccTouchCancelled(pTouch.touch(), pEvent.event())

    def ccTouchesBegan(self, CCSet pTouches, CCEvent pEvent):
        self._co.ccTouchesBegan(pTouches.set(), pEvent.event())

    def ccTouchesMoved(self, CCSet pTouches, CCEvent pEvent):
        self._co.ccTouchesMoved(pTouches.set(), pEvent.event())

    def ccTouchesEnded(self, CCSet pTouches, CCEvent pEvent):
        self._co.ccTouchesEnded(pTouches.set(), pEvent.event())

    def ccTouchesCancelled(self, CCSet pTouches, CCEvent pEvent):
        self._co.ccTouchesCancelled(pTouches.set(), pEvent.event())


cdef class CCTouchHandler(CCObject):
    cdef inline touch.CCTouchHandler* handler(self):
        return <touch.CCTouchHandler*>self._co

    @classmethod
    def handlerWithDelegate(cls, CCTouchDelegate pDelegate, int nPriority):
        o = cls()
        o.set_co(<int>touch.CCTouchHandler_handlerWithDelegate(pDelegate._co, nPriority))
        return o

    def getDelegate(self):
        o = CCTouchDelegate()
        o._co = self.handler().getDelegate()
        return o
    def setDelegate(self, CCTouchDelegate pDelegate):
        self.handler().setDelegate(pDelegate._co)
    Delegate = property(getDelegate, setDelegate)

    def getPriority(self):
        return self.handler().getPriority()
    def setPriority(self, int nPriority):
        self.handler().setPriority(nPriority)
    Priority = property(getPriority, setPriority)

    def getEnabledSelectors(self):
        return self.handler().getEnabledSelectors()
    def setEnalbedSelectors(self, int nValue):
        self.handler().setEnalbedSelectors(nValue)
    EnabledSelectors = property(getEnabledSelectors, setEnalbedSelectors)

    def initWithDelegate(self, CCTouchDelegate pDelegate, int nPriority):
        return self.handler().initWithDelegate(pDelegate._co, nPriority)


cdef class CCStandardTouchHandler(CCTouchHandler):
    @classmethod
    def handlerWithDelegate(cls,CCTouchDelegate pDelegate, int nPriority):
        o = cls()
        o.set_co(<int>touch.CCStandardTouchHandler_handlerWithDelegate(pDelegate._co, nPriority))
        return o


cdef class CCTargetedTouchHandler(CCTouchHandler):
    cdef inline touch.CCTargetedTouchHandler* target(self):
        return <touch.CCTargetedTouchHandler*>self._co

    @classmethod
    def handlerWithDelegate(cls,CCTouchDelegate pDelegate, int nPriority, bool bSwallow):
        o = cls()
        o.set_co(<int>touch.CCTargetedTouchHandler_handlerWithDelegate(pDelegate._co, 
                nPriority, bSwallow))
        return o

    def isSwallowsTouches(self):
        return self.target().isSwallowsTouches()
    def setSwallowsTouches(self, bool bSwallowsTouches):
        self.target().setSwallowsTouches(bSwallowsTouches)
    SwallowsTouches = property(isSwallowsTouches, setSwallowsTouches)

    def getClaimedTouches(self):
        o = CCSet()
        o._co = self.target().getClaimedTouches()
        return o

    def initWithDelegate(self, CCTouchDelegate pDelegate, int nPriority, bool bSwallow):
        return self.target().initWithDelegate(pDelegate._co, nPriority, bSwallow)


cdef class EGLTouchDelegate(CCTouchDelegate):
    pass

cdef class CCTouchDispatcher(CCObject):
    cdef inline touch.CCTouchDispatcher* disp(self):
        return <touch.CCTouchDispatcher*> self._co

    def init(self):
        return self.disp().init()

    def new(self):
        self._co = <cocoa.CCObject*>new touch.CCTouchDispatcher()
        self.autorelease()
        return self

    cdef inline touch.CCTouchDelegate* _get_delegate(self, object pDelegate):
        if isinstance(pDelegate, PyxDelegate):
            return <touch.CCTouchDelegate*>&(<PyxDelegate>pDelegate)._co
        elif isinstance(pDelegate, CCTouchDelegate):
            return (<CCTouchDelegate>pDelegate)._co
        raise ValueError('delegate type no found')

    def isDispatchEvents(self):
        return self.disp().isDispatchEvents()
    def setDispatchEvents(self, bool bDispatchEvents):
        self.disp().setDispatchEvents(bDispatchEvents)
    DispatchEvents = property(isDispatchEvents, setDispatchEvents)

    def addStandardDelegate(self, pDelegate, int nPriority):
        self.disp().addStandardDelegate(self._get_delegate(pDelegate), 
                nPriority)

    def addTargetedDelegate(self, pDelegate, 
            int nPriority, bool bSwallowsTouches):
        self.disp().addTargetedDelegate(self._get_delegate(pDelegate), 
                nPriority, bSwallowsTouches)

    def removeDelegate(self, pDelegate):
        self.disp().removeDelegate(self._get_delegate(pDelegate))

    def removeAllDelegates(self):
        self.disp().removeAllDelegates()

    def setPriority(self, int nPriority, pDelegate):
        self.disp().setPriority(nPriority, self._get_delegate(pDelegate))

    def touches(self, CCSet pTouches, CCEvent pEvent, unsigned int uIndex):
        self.disp().touches(pTouches.set(), pEvent.event(), uIndex)

    def findHandler(self, pDelegate):
        o = CCTouchHandler()
        o._co = <cocoa.CCObject*> self.disp().findHandler(self._get_delegate(pDelegate))
        return o


#---------keypad.pxd--------------
cdef class CCKeypadDelegate:
    cdef keypad.CCKeypadDelegate* _co
    def keyBackClicked(self):
        self._co.keyBackClicked()
    def keyMenuClicked(self):
        self._co.keyMenuClicked()

cdef class CCKeypadHandler(CCObject):
    cdef inline keypad.CCKeypadHandler* handler(self):
        return <keypad.CCKeypadHandler*>self._co

    @classmethod
    def handlerWithDelegate(cls, CCKeypadDelegate pDelegate):
        o = cls()
        o.set_co(<int>keypad.CCKeypadHandler_handlerWithDelegate(pDelegate._co))
        return o

    def getDelegate(self):
        o = CCKeypadDelegate()
        o._co = self.handler().getDelegate()
        return o
    def setDelegate(self, CCKeypadDelegate pDelegate):
        self.handler().setDelegate(pDelegate._co)
    Delegate = property(getDelegate, setDelegate)

    def initWithDelegate(self, CCKeypadDelegate pDelegate):
        return self.handler().initWithDelegate(pDelegate._co)


cdef class CCKeypadDispatcher(CCObject):
    cdef inline keypad.CCKeypadDispatcher* disp(self):
        return <keypad.CCKeypadDispatcher*>self._co

    def new(self):
        self._co = <cocoa.CCObject*>new keypad.CCKeypadDispatcher()
        self.autorelease()
        return self

    def addDelegate(self, CCKeypadDelegate pDelegate):
        self.disp().addDelegate(pDelegate._co)

    def removeDelegate(self, CCKeypadDelegate pDelegate):
        self.disp().removeDelegate(pDelegate._co)

    def forceAddDelegate(self, CCKeypadDelegate pDelegate):
        self.disp().forceAddDelegate(pDelegate._co)

    def forceRemoveDelegate(self, CCKeypadDelegate pDelegate):
        self.disp().forceRemoveDelegate(pDelegate._co)

    def dispatchKeypadMSG(self, keypad.ccKeypadMSGType nMsgType):
        self.disp().dispatchKeypadMSG(nMsgType)



#------------actions.pxd------------
cdef class CCAction(CCObject):
    cdef inline actions.CCAction* action(self):
        return <actions.CCAction*>self._co

    @classmethod
    def create(cls):
        o = cls()
        o.set_co(<int>actions.CCAction_create())
        return o 

    def new(self):
        self._co = <cocoa.CCObject*>new actions.CCAction()
        self.autorelease()
        return self

    def description(self):
        return self.action().description()

    def isDone(self):
        return self.action().isDone()

    def startWithTarget(self, CCNode pTarget):
        self.action().startWithTarget(pTarget.node())

    def stop(self):
        self.action().stop()

    def step(self, float dt):
        self.action().step(dt)

    def getTarget(self, cls=CCNode):
        cdef CCNode o = cls()
        o._co = <cocoa.CCObject*>self.action().getTarget()
        return o
    def setTarget(self, CCNode pTarget):
        self.action().setTarget(pTarget.node())
    Target = property(getTarget, setTarget)
    
    def getOriginalTarget(self, cls=CCNode):
        cdef CCNode o = cls()
        o._co = <cocoa.CCObject*>self.action().getOriginalTarget()
        return o
    def setOriginalTarget(self, CCNode pOriginalTarget):
        self.action().setOriginalTarget(pOriginalTarget.node())
    OriginalTarget = property(getOriginalTarget, setOriginalTarget)

    def getTag(self):
        return self.action().getTag()
    def setTag(self, int nTag):
        self.action().setTag(nTag)
    Tag = property(getTag, setTag)


cdef class CCFiniteTimeAction(CCAction):
    cdef inline actions.CCFiniteTimeAction* fta(self):
        return <actions.CCFiniteTimeAction*>self._co

    def new(self):
        self._co = <cocoa.CCObject*>new actions.CCFiniteTimeAction()
        self.autorelease()
        return self

    def getDuration(self):
        return self.fta().getDuration()
    def setDuration(self, float duration):
        self.fta().setDuration(duration)
    Duration = property(getDuration, setDuration)

    def reverse(self):
        o = CCFiniteTimeAction()
        o._co = <cocoa.CCObject*>self.fta().reverse()
        return o


cdef class CCSpeed(CCAction):
    cdef inline actions.CCSpeed* speed(self):
        return <actions.CCSpeed*>self._co

    @classmethod
    def create(cls, CCActionInterval pAction, float fSpeed):
        cdef CCSpeed o = cls()
        o._create(pAction, fSpeed)
        return o

    def __cinit__(self, CCActionInterval pAction=None, float fSpeed=0.0):
        if pAction is not None:
            self._create(pAction, fSpeed)

    cdef _create(self, CCActionInterval pAction, float fSpeed):
        self._co = <cocoa.CCObject*>actions.CCSpeed_create(pAction.interval(), fSpeed)

    def new(self):
        self._co = <cocoa.CCObject*>new actions.CCSpeed()
        self.autorelease()
        return self

    def getSpeed(self):
        return self.speed().getSpeed()
    def setSpeed(self, float fSpeed):
        self.speed().setSpeed(fSpeed)
    Speed = property(getSpeed, setSpeed)

    def initWithAction(self, CCActionInterval pAction, float fSpeed):
        return self.speed().initWithAction(pAction.interval(), fSpeed)

    def reverse(self):
        o = CCActionInterval()
        o._co = <cocoa.CCObject*>self.speed().reverse()
        return o

    def setInnerAction(self, CCActionInterval pAction):
        self.speed().setInnerAction(pAction.interval())

    def getInnerAction(self):
        o = CCActionInterval()
        o._co = <cocoa.CCObject*>self.speed().getInnerAction()
        return o



cdef class CCFollow(CCAction):
    cdef inline actions.CCFollow* follow(self):
        return <actions.CCFollow*>self._co

    def __cinit__(self, CCNode pFollowedNode=None, CCRect rect=None):
        if pFollowedNode is not None:
            self._create(pFollowedNode, rect)

    @classmethod
    def create(cls, CCNode pFollowedNode, CCRect rect=None):
        cdef CCFollow o = cls()
        o._create(pFollowedNode, rect)
        return o

    cdef _create(self, CCNode pFollowedNode, CCRect rect):
        if rect is None:
            self._co = <cocoa.CCObject*>actions.CCFollow_create(pFollowedNode.node(), 
                    cocoa.CCRectZero)
        else:
            self._co = <cocoa.CCObject*>actions.CCFollow_create(pFollowedNode.node(), 
                    rect._co)


    def new(self):
        self._co = <cocoa.CCObject*>new actions.CCFollow()
        self.autorelease()
        return self

    def isBoundarySet(self):
        return self.follow().isBoundarySet()
    def setBoudarySet(self, bool bValue):
        self.follow().setBoudarySet(bValue)
    BoundarySet = property(isBoundarySet, setBoudarySet)

    def initWithTarget(self, CCNode pFollowedNode, CCRect rect=None):
        if rect is None:
            return self.follow().initWithTarget(pFollowedNode.node(), cocoa.CCRectZero)
        return self.follow().initWithTarget(pFollowedNode.node(), rect._co)



cdef class CCActionInterval(CCFiniteTimeAction):
    cdef inline actions.CCActionInterval* interval(self):
        return <actions.CCActionInterval*>self._co

    @classmethod
    def create(cls, d):
        o = cls()
        o.set_co(<int>actions.CCActionInterval_create(d))
        return o

    def getElapsed(self):
        return self.interval().getElapsed()

    def initWithDuration(self, float d):
        return self.interval().initWithDuration(d)

    def reverse(self):
        o = CCActionInterval()
        o._co = <cocoa.CCObject*>self.interval().reverse_()
        return o

    def getAmplitudeRate(self):
        return self.interval().getAmplitudeRate()
    def setAmplitudeRate(self, float amp):
        self.interval().setAmplitudeRate(amp)
    AmplitudeRate = property(getAmplitudeRate, setAmplitudeRate)



cdef class CCSequence(CCActionInterval):
    cdef inline actions.CCSequence* seq(self):
        return <actions.CCSequence*>self._co


    @classmethod
    def create(cls, CCFiniteTimeAction pAction1, *args):
        cdef CCSequence o = cls()
        o._create(pAction1, args)
        return o

    def __cinit__(self, CCFiniteTimeAction pAction1=None, *args):
        if pAction1 is not None:
            self._create(pAction1, args)

    cdef _create(self, CCFiniteTimeAction pAction1, args):
        cdef CCArray array
        cdef actions.CCSequence* co
        cdef int l = len(args)
        if l == 0:
            co = actions.CCSequence_create(pAction1.fta(), NULL)
        elif l == 1:
            co = actions.CCSequence_create(pAction1.fta(), 
                    (<CCObject>args[0])._co, 
                    NULL)
        elif l == 2:
            co = actions.CCSequence_create(pAction1.fta(), 
                    (<CCObject>args[0])._co, 
                    (<CCObject>args[1])._co, 
                    NULL)
        elif l == 3:
            co = actions.CCSequence_create(pAction1.fta(), 
                    (<CCObject>args[0])._co, 
                    (<CCObject>args[1])._co, 
                    (<CCObject>args[2])._co, 
                    NULL)
        elif l == 4:
            co = actions.CCSequence_create(pAction1.fta(), 
                    (<CCObject>args[0])._co, 
                    (<CCObject>args[1])._co, 
                    (<CCObject>args[2])._co, 
                    (<CCObject>args[3])._co, 
                    NULL)
        elif l == 5:
            co = actions.CCSequence_create(pAction1.fta(), 
                    (<CCObject>args[0])._co, 
                    (<CCObject>args[1])._co, 
                    (<CCObject>args[2])._co, 
                    (<CCObject>args[3])._co, 
                    (<CCObject>args[4])._co, 
                    NULL)
        else:
            array = CCArray.create(len(args)+1)
            array.addObject(pAction1)
            for act in args:
                array.addObject(<CCObject>act)
            co = actions.CCSequence_create(array.array())
        self._co = <cocoa.CCObject*>co

    @classmethod
    def createByArray(cls, CCArray arrayOfActions):
        o = cls()
        o.set_co(<int>actions.CCSequence_create(arrayOfActions.array()))
        return o

    # @classmethod
    # def createWithVariableList(cls, CCFiniteTimeAction pAction1, *args):
    #     pass

    @classmethod
    def createWithTwoActions(cls, CCFiniteTimeAction pActionOne, 
            CCFiniteTimeAction pActionTwo):
        o = cls()
        o.set_co(<int>actions.CCSequence_createWithTwoActions(pActionOne.fta(), 
                pActionTwo.fta()))
        return o

    def initWithTwoActions(self, CCFiniteTimeAction pActionOne, 
            CCFiniteTimeAction pActionTwo):
        return self.seq().initWithTwoActions(pActionOne.fta(), 
                pActionTwo.fta())

cdef class CCRepeat(CCActionInterval):
    cdef inline actions.CCRepeat* repeat(self):
        return <actions.CCRepeat*>self._co

    @classmethod
    def create(cls, CCFiniteTimeAction pAction, unsigned int times):
        cdef CCRepeat o = cls()
        o._create(pAction, times)
        return o

    def __cinit__(self, CCFiniteTimeAction pAction=None, unsigned int times=0):
        if pAction is not None:
            self._create(pAction, times)

    cdef _create(self, CCFiniteTimeAction pAction, unsigned int times):
        self._co = <cocoa.CCObject*>actions.CCRepeat_create(pAction.fta(), times)

    def initWithAction(self, CCFiniteTimeAction pAction, unsigned int times):
        return self.repeat().initWithAction(pAction.fta(), times)

    def getInnerAction(self):
        o = CCFiniteTimeAction()
        o._co = <cocoa.CCObject*>self.repeat().getInnerAction()
        return o
    def setInnerAction(self, CCFiniteTimeAction pAction):
        self.repeat().setInnerAction(pAction.fta())
    InnerAction = property(getInnerAction, setInnerAction)


cdef class CCRepeatForever(CCActionInterval):
    cdef inline actions.CCRepeatForever* forever(self):
        return <actions.CCRepeatForever*>self._co

    @classmethod
    def create(cls, CCActionInterval pAction):
        cdef CCRepeatForever o = cls()
        o._create(pAction)
        return o

    def __cinit__(self, CCActionInterval pAction=None):
        if pAction is not None:
            self._create(pAction)

    cdef _create(self, CCActionInterval pAction):
        self._co = <cocoa.CCObject*>actions.CCRepeatForever_create(pAction.interval())

    def new(self):
        self._co = <cocoa.CCObject*>new actions.CCRepeatForever()
        self.autorelease()
        return self

    def initWithAction(self, CCActionInterval pAction):
        return self.forever().initWithAction(pAction.interval())

    def getInnerAction(self):
        o = CCActionInterval()
        o._co = <cocoa.CCObject*>self.forever().getInnerAction()
        return o
    def setInnerAction(self, CCActionInterval pAction):
        self.forever().setInnerAction(pAction.interval())
    InnerAction = property(getInnerAction, setInnerAction)


cdef class CCSpawn(CCActionInterval):
    cdef inline actions.CCSpawn* spawn(self):
        return <actions.CCSpawn*>self._co

    @classmethod
    def create(cls, CCFiniteTimeAction pAction1, *args):
        cdef CCSpawn o = cls()
        o._create(pAction1, args)
        return o

    def __cinit__(self, CCFiniteTimeAction pAction1=None, *args):
        if pAction1 is not None:
            self._create(pAction1, args)

    cdef _create(self, CCFiniteTimeAction pAction1, args):
        cdef CCArray array
        cdef actions.CCSpawn* co
        cdef l = len(args)
        if l == 0:
            co = actions.CCSpawn_create(pAction1.fta(), NULL)
        elif l == 1:
            co = actions.CCSpawn_create(pAction1.fta(), 
                    (<CCObject>args[0])._co,
                    NULL)
        elif l == 2:
            co = actions.CCSpawn_create(pAction1.fta(), 
                    (<CCObject>args[0])._co,
                    (<CCObject>args[1])._co,
                    NULL)
        elif l == 3:
            co = actions.CCSpawn_create(pAction1.fta(), 
                    (<CCObject>args[0])._co,
                    (<CCObject>args[1])._co,
                    (<CCObject>args[2])._co,
                    NULL)
        elif l == 4:
            co = actions.CCSpawn_create(pAction1.fta(), 
                    (<CCObject>args[0])._co,
                    (<CCObject>args[1])._co,
                    (<CCObject>args[2])._co,
                    (<CCObject>args[3])._co,
                    NULL)
        elif l == 5:
            co = actions.CCSpawn_create(pAction1.fta(), 
                    (<CCObject>args[0])._co,
                    (<CCObject>args[1])._co,
                    (<CCObject>args[2])._co,
                    (<CCObject>args[3])._co,
                    (<CCObject>args[4])._co,
                    NULL)
        else:
            array = CCArray.create(len(args)+1)
            array.addObject(pAction1)
            for act in args:
                array.addObject(<CCObject>act)
            co = actions.CCSpawn_create(array.array())
        self._co = <cocoa.CCObject*>co

    @classmethod
    def createByArray(cls, CCArray arrayOfActions):
        o = cls()
        o.set_co(<int>actions.CCSpawn_create(arrayOfActions.array()))
        return o

    # @classmethod
    # def createWithVariableList(cls, CCFiniteTimeAction *pAction1, *args):
    #     pass

    @classmethod
    def createWithTwoActions(cls, CCFiniteTimeAction pAction1, CCFiniteTimeAction pAction2):
        o = cls()
        o.set_co(<int>actions.CCSpawn_createWithTwoActions(pAction1.fta(), pAction2.fta()))
        return o

    def initWithTwoActions(self, CCFiniteTimeAction pAction1, CCFiniteTimeAction pAction2):
        return self.spawn().initWithTwoActions(pAction1.fta(), pAction2.fta())


cdef class CCRotateTo(CCActionInterval):
    @classmethod
    def create(cls, float fDuration, float fDeltaAngleX, fDeltaAngleY=None):
        cdef CCRotateTo o = cls()
        o._create(fDuration, fDeltaAngleX, fDeltaAngleY)
        return o

    def __cinit__(self, fDuration=None, float fDeltaAngleX=0.0, fDeltaAngleY=None):
        if fDuration is not None:
            self._create(fDuration, fDeltaAngleX, fDeltaAngleY)

    cdef _create(self, float fDuration, float fDeltaAngleX, object fDeltaAngleY):
        if fDeltaAngleY is None:
            self._co = <cocoa.CCObject*>actions.CCRotateTo_create(fDuration, fDeltaAngleX)
        else:
            self._co = <cocoa.CCObject*>actions.CCRotateTo_create(fDuration, 
                    fDeltaAngleX, fDeltaAngleY)

    # bool initWithDuration(float fDuration, float fDeltaAngle)
    # bool initWithDuration(float fDuration, float fDeltaAngleX, float fDeltaAngleY)


cdef class CCRotateBy(CCActionInterval):
    @classmethod
    def create(cls, float fDuration, float fDeltaAngleX, fDeltaAngleY=None):
        cdef CCRotateBy o = cls()
        o._create(fDuration, fDeltaAngleX, fDeltaAngleY)
        return o

    def __cinit__(self, fDuration=None, float fDeltaAngleX=0.0, fDeltaAngleY=None):
        if fDuration is not None:
            self._create(fDuration, fDeltaAngleX, fDeltaAngleY)

    cdef _create(self, float fDuration, float fDeltaAngleX, object fDeltaAngleY):
        if fDeltaAngleY is None:
            self._co = <cocoa.CCObject*>actions.CCRotateBy_create(fDuration, fDeltaAngleX)
        else:
            self._co = <cocoa.CCObject*>actions.CCRotateBy_create(fDuration, 
                    fDeltaAngleX, fDeltaAngleY)

    # bool initWithDuration(float fDuration, float fDeltaAngle)
    # bool initWithDuration(float fDuration, float fDeltaAngleX, float fDeltaAngleY)


cdef class CCMoveBy(CCActionInterval):
    @classmethod
    def create(cls, float duration, CCPoint deltaPosition):
        cdef CCMoveBy o = cls()
        o._create(duration, deltaPosition)
        return o

    def __cinit__(self, duration=None, CCPoint deltaPosition=None):
        if duration is not None:
            self._create(duration, deltaPosition)

    cdef _create(self, float duration, CCPoint deltaPosition):
        self._co = <cocoa.CCObject*>actions.CCMoveBy_create(duration, deltaPosition._co)

    # bool initWithDuration(float duration, const CCPoint& deltaPosition)


cdef class CCMoveTo(CCMoveBy):
    @classmethod
    def create(cls, float duration, CCPoint position):
        cdef CCMoveTo o = cls()
        o._create(duration, position)
        return o

    def __cinit__(self, duration=None, CCPoint position=None):
        if duration is not None:
            self._create(duration, position)

    cdef _create(self, float duration, CCPoint position):
        self._co = <cocoa.CCObject*>actions.CCMoveTo_create(duration, position._co)

    # bool initWithDuration(float duration, const CCPoint& position)


cdef class CCSkewTo(CCActionInterval):
    cdef inline actions.CCSkewTo* skewto(self):
        return <actions.CCSkewTo*>self._co

    @classmethod
    def create(cls, float t, float sx, float sy):
        cdef CCSkewTo o = cls()
        o._create(t, sx, sy)
        return o

    def __cinit__(self, t=None, float sx=0.0, float sy=0.0):
        if t is not None:
            self._create(t, sx, sy)

    cdef _create(self, float t, float sx, float sy):
        self._co = <cocoa.CCObject*>actions.CCSkewTo_create(t, sx, sy)

    def new(self):
        self._co = <cocoa.CCObject*>new actions.CCSkewTo()
        self.autorelease()
        return self

    def initWithDuration(self, float t, float sx, float sy):
        return self.skewto().initWithDuration(t, sx, sy)



cdef class CCSkewBy(CCSkewTo):
    @classmethod
    def create(cls, float t, float deltaSkewX, float deltaSkewY):
        cdef CCSkewBy o = cls()
        o._create(t, deltaSkewX, deltaSkewY)
        return o

    def __cinit__(self, t=None, float deltaSkewX=0.0, float deltaSkewY=0.0):
        if t is not None:
            self._create(t, deltaSkewX, deltaSkewY)

    cdef _create(self, float t, float deltaSkewX, float deltaSkewY):
        self._co = <cocoa.CCObject*>actions.CCSkewBy_create(t, deltaSkewX, deltaSkewY)

    # bool initWithDuration(float t, float sx, float sy)


cdef class CCJumpBy(CCActionInterval):
    @classmethod
    def create(cls, float duration, CCPoint position, float height, unsigned int jumps):
        cdef CCJumpBy o = cls()
        o._create(duration, position, height, jumps)
        return o

    def __cinit__(self, duration=None, CCPoint position=None, 
                float height=0.0, unsigned int jumps=0):
        if duration is not None:
            self._create(duration, position, height, jumps)

    cdef _create(self, float duration, CCPoint position, float height, int jumps):
        self._co = <cocoa.CCObject*>actions.CCJumpBy_create(duration, 
                position._co, height, jumps)
    # bool initWithDuration(float duration, const CCPoint& position, float height, unsigned int jumps)


cdef class CCJumpTo(CCJumpBy):
    @classmethod
    def create(cls, float duration, CCPoint position, float height, int jumps):
        cdef CCJumpTo o = cls()
        o._create(duration, position, height, jumps)
        return o

    def __cinit__(self, duration=None, CCPoint position=None, 
                float height=0.0, int jumps=0):
        if duration is not None:
            self._create(duration, position, height, jumps)

    cdef _create(self, float duration, CCPoint position, float height, int jumps):
        self._co = <cocoa.CCObject*>actions.CCJumpTo_create(duration, position._co, 
                height, jumps)


cdef class ccBezierConfig:
    cdef actions.ccBezierConfig _co
    def getendPosition(self):
        o = CCPoint()
        o._co = self._co.endPosition
        return o
    def setendPosition(self, CCPoint var):
        self._co.endPosition = var._co
    endPosition = property(getendPosition, setendPosition)

    def getcontrolPoint_1(self):
        o = CCPoint()
        o._co = self._co.controlPoint_1
        return o
    def setcontrolPoint_1(self, CCPoint var):
        self._co.controlPoint_1 = var._co
    controlPoint_1 = property(getcontrolPoint_1, setcontrolPoint_1)

    def getcontrolPoint_2(self):
        o = CCPoint()
        o._co = self._co.controlPoint_2
        return o
    def setcontrolPoint_2(self, CCPoint var):
        self._co.controlPoint_2 = var._co
    controlPoint_2 = property(getcontrolPoint_2, setcontrolPoint_2)


cdef class CCBezierBy(CCActionInterval):
    @classmethod
    def create(cls, float t, ccBezierConfig c):
        cdef CCBezierBy o = cls()
        o._create(t, c)
        return o

    def __cinit__(self, t=None, ccBezierConfig c=None):
        if t is not None:
            self._create(t, c)

    cdef _create(self, float t, ccBezierConfig c):
        self._co = <cocoa.CCObject*>actions.CCBezierBy_create(t, c._co)
    # bool initWithDuration(float t, const ccBezierConfig& c)


cdef class CCBezierTo(CCBezierBy):
    @classmethod
    def create(cls, float t, ccBezierConfig c):
        cdef CCBezierTo o = cls()
        o._create(t, c)
        return o

    def __cinit__(self, t=None, ccBezierConfig c=None):
        if t is not None:
            self._create(t, c)

    cdef _create(self, float t, ccBezierConfig c):
        self._co = <cocoa.CCObject*>actions.CCBezierTo_create(t, c._co)

    # bool initWithDuration(float t, const ccBezierConfig &c)


cdef class CCScaleTo(CCActionInterval):
    @classmethod
    def create(cls, float duration, float sx, sy=None):
        cdef CCScaleTo o = cls()
        o._create(duration, sx, sy)
        return o

    def __cinit__(self, duration=None, float sx=0.0, sy=None):
        if duration is not None:
            self._create(duration, sx, sy)

    cdef _create(self, float duration, float sx, object sy):
        if sy is None:
            self._co = <cocoa.CCObject*>actions.CCScaleTo_create(duration, sx)
        else:
            self._co = <cocoa.CCObject*>actions.CCScaleTo_create(duration, sx, sy)

    # bool initWithDuration(float duration, float s)
    # bool initWithDuration(float duration, float sx, float sy)


cdef class CCScaleBy(CCScaleTo):
    @classmethod
    def create(cls, float duration, float sx, sy=None):
        cdef CCScaleBy o = cls()
        o._create(duration, sx, sy)
        return o

    def __cinit__(self, duration=None, float sx=0.0, sy=None):
        if duration is not None:
            self._create(duration, sx, sy)

    cdef _create(self, float duration, float sx, object sy):
        if sy is None:
            self._co = <cocoa.CCObject*>actions.CCScaleBy_create(duration, sx)
        else:
            self._co = <cocoa.CCObject*>actions.CCScaleBy_create(duration, sx, sy)


cdef class CCBlink(CCActionInterval):
    @classmethod
    def create(cls, float duration, unsigned int uBlinks):
        cdef CCBlink o = cls()
        o._create(duration, uBlinks)
        return o

    def __cinit__(self, duration=None, unsigned int uBlinks=0):
        if duration  is not None:
            self._create(duration, uBlinks)

    cdef _create(self, float duration, unsigned int uBlinks):
        self._co = <cocoa.CCObject*>actions.CCBlink_create(duration, uBlinks)
    # bool initWithDuration(float duration, unsigned int uBlinks)


cdef class CCFadeIn(CCActionInterval):
    @classmethod
    def create(cls, float d):
        cdef CCFadeIn o = cls()
        o._create(d)
        return o

    def __cinit__(self, d=None):
        if d is not None:
            self._create(d)

    cdef _create(self, float d):
        self._co = <cocoa.CCObject*>actions.CCFadeIn_create(d)


cdef class CCFadeOut(CCActionInterval):
    @classmethod
    def create(cls, float d):
        cdef CCFadeOut o = cls()
        o._create(d)
        return o

    def __cinit__(self, d=None):
        if d is not None:
            self._create(d)

    cdef _create(self, float d):
        self._co = <cocoa.CCObject*>actions.CCFadeOut_create(d)


cdef class CCFadeTo(CCActionInterval):
    # bool initWithDuration(float duration, GLubyte opacity)
    @classmethod
    def create(cls, float duration, shaders.GLubyte opacity):
        cdef CCFadeTo o = cls()
        o._create(duration, opacity)
        return o

    def __cinit__(self, duration=None, shaders.GLubyte opacity=0):
        if duration is not None:
            self._create(duration, opacity)

    cdef _create(self, float duration, shaders.GLubyte opacity):
        self._co = <cocoa.CCObject*>actions.CCFadeTo_create(duration, opacity)


cdef class CCTintTo(CCActionInterval):
    # bool initWithDuration(float duration, GLubyte red, GLubyte green, GLubyte blue)
    @classmethod
    def create(cls, float duration, shaders.GLubyte red, 
            shaders.GLubyte green, shaders.GLubyte blue):
        cdef CCTintTo o = cls()
        o._create(duration, red, green, blue)
        return o

    def __cinit__(self, duration=None, shaders.GLubyte red=0, 
            shaders.GLubyte green=0, shaders.GLubyte blue=0):
        if duration is not None:
            self._create(duration, red, green, blue)

    cdef _create(self, float duration, shaders.GLubyte red, 
            shaders.GLubyte green, shaders.GLubyte blue):
        self._co = <cocoa.CCObject*>actions.CCTintTo_create(duration, red, green, blue)


cdef class CCTintBy(CCActionInterval):
    # bool initWithDuration(float duration, GLshort deltaRed, GLshort deltaGreen, GLshort deltaBlue)
    @classmethod
    def create(cls, float duration, shaders.GLshort deltaRed, 
                shaders.GLshort deltaGreen, shaders.GLshort deltaBlue):
        cdef CCTintBy o = cls()
        o._create(duration, deltaRed, deltaGreen, deltaBlue)
        return o

    def __cinit__(self, duration=None, shaders.GLshort deltaRed=0, 
                shaders.GLshort deltaGreen=0, shaders.GLshort deltaBlue=0):
        if duration is not None:
            self._create(duration, deltaRed, deltaGreen, deltaBlue)

    cdef _create(self, float duration, shaders.GLshort deltaRed, 
                shaders.GLshort deltaGreen, shaders.GLshort deltaBlue):
        self._co = <cocoa.CCObject*>actions.CCTintBy_create(duration, 
                deltaRed, deltaGreen, deltaBlue)


cdef class CCDelayTime(CCActionInterval):
    @classmethod
    def create(cls, d):
        cdef CCDelayTime o = cls()
        o._create(d)
        return o

    def __cinit__(self, d=None):
        if d is not None:
            self._create(d)

    cdef _create(self, float d):
        self._co = <cocoa.CCObject*>actions.CCDelayTime_create(d)


cdef class CCReverseTime(CCActionInterval):
    cdef inline actions.CCReverseTime* time(self):
        return <actions.CCReverseTime*>self._co

    @classmethod
    def create(cls, CCFiniteTimeAction pAction):
        cdef CCReverseTime o = cls()
        o._create(pAction)
        return o

    def __cinit__(self, CCFiniteTimeAction pAction=None):
        if pAction is not None:
            self._create(pAction)

    cdef _create(self, CCFiniteTimeAction pAction):
        self._co = <cocoa.CCObject*>actions.CCReverseTime_create(pAction.fta())

    def new(self):
        self._co = <cocoa.CCObject*>new actions.CCReverseTime()
        self.autorelease()
        return self


    def initWithAction(self, CCFiniteTimeAction pAction):
        return self.time().initWithAction(pAction.fta())



cdef class CCAnimate(CCActionInterval):
    cdef inline actions.CCAnimate* animate(self):
        return <actions.CCAnimate*>self._co

    @classmethod
    def create(cls, CCAnimation pAnimation):
        cdef CCAnimate o = cls()
        o._create(pAnimation)
        return o

    def __cinit__(self, CCAnimation pAnimation=None):
        if pAnimation is not None:
            self._create(pAnimation)

    cdef _create(self, CCAnimation pAnimation):
        self._co = <cocoa.CCObject*>actions.CCAnimate_create(pAnimation.animation())

    def initWithAnimation(self, CCAnimation pAnimation):
        return self.animate().initWithAnimation(pAnimation.animation())

    def new(self):
        self._co = <cocoa.CCObject*>new actions.CCAnimate()
        self.autorelease()
        return self

    #CC_SYNTHESIZE_RETAIN(CCAnimation*, m_pAnimation, Animation)
    def getAnimation(self):
        o = CCAnimation()
        o._co = self.animate().getAnimation()
        return o
    def setAnimation(self, CCAnimation var):
        self.animate().setAnimation(var.animation())
    Animation = property(getAnimation, setAnimation)



cdef class CCTargetedAction(CCActionInterval):
    cdef inline actions.CCTargetedAction* target(self):
        return <actions.CCTargetedAction*>self._co

    @classmethod
    def create(cls, CCNode pTarget, CCFiniteTimeAction pAction):
        cdef CCTargetedAction o = cls()
        o._create(pTarget, pAction)
        return o

    def __cinit__(self, CCNode pTarget=None, CCFiniteTimeAction pAction=None):
        if pTarget is not None:
            self._create(pTarget, pAction)

    cdef _create(self, CCNode pTarget, CCFiniteTimeAction pAction):
        self._co = <cocoa.CCObject*>actions.CCTargetedAction_create(pTarget.node(), 
                pAction.fta())

    def new(self):
        self._co = <cocoa.CCObject*>new actions.CCTargetedAction()
        self.autorelease()
        return self

    #CC_SYNTHESIZE_RETAIN(CCNode*, m_pForcedTarget, ForcedTarget)
    def getForcedTarget(self):
        o = CCNode()
        o._co = <cocoa.CCObject*>self.target().getForcedTarget()
        return o
    def setForcedTarget(self, CCNode var):
        self.target().setForcedTarget(var.node())
    ForcedTarget = property(getForcedTarget, setForcedTarget)       


cdef class CCActionCamera(CCActionInterval):
    cdef inline actions.CCActionCamera* camera(self):
        return <actions.CCActionCamera*>self._co

    def new(self):
        self._co = <cocoa.CCObject*>new actions.CCActionCamera()
        self.autorelease()
        return self


cdef class CCOrbitCamera(CCActionCamera):
    cdef inline actions.CCOrbitCamera* ocamera(self):
        return <actions.CCOrbitCamera*>self._co

    @classmethod
    def create(cls, float t, float radius, float deltaRadius, 
            float angleZ, float deltaAngleZ, float angleX, float deltaAngleX):
        cdef CCOrbitCamera o = cls()
        o._create(t, radius, deltaRadius,
                angleZ, deltaAngleZ, angleX, deltaAngleX)
        return o

    def __cinit__(self, t=None, float radius=0.0, float deltaRadius=0.0, 
            float angleZ=0.0, float deltaAngleZ=0.0, 
            float angleX=0.0, float deltaAngleX=0.0):
        if t is not None:
            self._create(t, radius, deltaRadius,
                    angleZ, deltaAngleZ, angleX, deltaAngleX)

    cdef _create(self, float t, float radius, float deltaRadius, 
            float angleZ, float deltaAngleZ, float angleX, float deltaAngleX):
        self._co = <cocoa.CCObject*>actions.CCOrbitCamera_create(t, radius, deltaRadius,
                angleZ, deltaAngleZ, angleX, deltaAngleX)

    def new(self):
        self._co = <cocoa.CCObject*>new actions.CCOrbitCamera()
        self.autorelease()
        return self

    def initWithDuration(self, float t, float radius, float deltaRadius, 
            float angleZ, float deltaAngleZ, float angleX, float deltaAngleX):
        return self.ocamera().initWithDuration(t, radius, deltaRadius,
                angleZ, deltaAngleZ, angleX, deltaAngleX)

    def sphericalRadius(self):
        cdef float r, zenith, azimuth
        self.ocamera().sphericalRadius(&r, &zenith, &azimuth)
        return r, zenith, azimuth



cdef class CCPointArray(CCObject):
    cdef inline actions.CCPointArray* array(self):
        return <actions.CCPointArray*>self._co

    @classmethod
    def create(cls, unsigned int capacity):
        o = cls()
        o.set_co(<int>actions.CCPointArray_create(capacity))
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new actions.CCPointArray()
        self.autorelease()
        return self

    def initWithCapacity(self, unsigned int capacity):
        return self.array().initWithCapacity(capacity)

    def addControlPoint(self, CCPoint controlPoint):
        self.array().addControlPoint(controlPoint._co)
    
    def insertControlPoint(self, CCPoint controlPoint, unsigned int index):
        self.array().insertControlPoint(controlPoint._co, index)
    
    def replaceControlPoint(self, CCPoint controlPoint, unsigned int index):
        self.array().replaceControlPoint(controlPoint._co, index)
    
    def getControlPointAtIndex(self, unsigned int index):
        o = CCPoint()
        o._co = self.array().getControlPointAtIndex(index)
        return o
    
    def removeControlPointAtIndex(self, unsigned int index):
        self.array().removeControlPointAtIndex(index)
    
    def count(self):
        return self.array().count()
    
    def reverse(self):
        o = CCPointArray()
        o._co = self.array().reverse()
        return o
    
    def reverseInline(self):
        self.array().reverseInline()
    
    # const std::vector<CCPoint*>* getControlPoints()
    # void setControlPoints(std::vector<CCPoint*> *controlPoints)


cdef class CCCardinalSplineTo(CCActionInterval):
    cdef inline actions.CCCardinalSplineTo* lineto(self):
        return <actions.CCCardinalSplineTo*>self._co

    @classmethod
    def create(cls, float duration, CCPointArray points, float tension):
        cdef CCCardinalSplineTo o = cls()
        o._create1(duration, points, tension)
        return o

    def __cinit__(self, duration=None, CCPointArray points=None, float tension=0.0):
        if duration is not None:
            self._create1(duration, points, tension)

    cdef _create1(self, float duration, CCPointArray points, float tension):
        self._co = <cocoa.CCObject*>actions.CCCardinalSplineTo_create(duration, 
                points.array(), tension)

    def new(self):
        self._co = <cocoa.CCObject*>new actions.CCCardinalSplineTo()
        self.autorelease()
        return self

    def initWithDuration(self, float duration, CCPointArray points, float tension):
        return self.lineto().initWithDuration(duration, points.array(), tension)

    def updatePosition(self, CCPoint newPos):
        self.lineto().updatePosition(newPos._co)

    def getPoints(self):
        o = CCPointArray()
        o._co = <cocoa.CCObject*>self.lineto().getPoints()
        return o
    def setPoints(self, CCPointArray points):
        self.lineto().setPoints(points.array())
    Points = property(getPoints, setPoints)


cdef class CCCardinalSplineBy(CCCardinalSplineTo):
    @classmethod
    def create(cls, float duration, CCPointArray points, float tension):
        cdef CCCardinalSplineBy o = cls()
        o._create(duration, points, tension)
        return o

    def __cinit__(self, duration=None, CCPointArray points=None, float tension=0.0):
        if duration is not None:
            self._create(duration, points, tension)

    cdef _create(self, float duration, CCPointArray points, float tension):
        self._co = <cocoa.CCObject*>actions.CCCardinalSplineBy_create(duration, 
                points.array(), tension)
    # CCCardinalSplineBy()


cdef class CCCatmullRomTo(CCCardinalSplineTo):
    @classmethod
    def create(cls, float dt, CCPointArray points):
        cdef CCCatmullRomTo o = cls()
        o._create(dt, points)
        return o

    def __cinit__(self, dt=None, CCPointArray points=None):
        if dt is not None:
            self._create(dt, points)

    cdef _create(self, float dt, CCPointArray points):
        self._co = <cocoa.CCObject*>actions.CCCatmullRomTo_create(dt, points.array())
    # bool initWithDuration(float dt, CCPointArray* points)


cdef class CCCatmullRomBy(CCCatmullRomTo):
    @classmethod
    def create(cls, float dt, CCPointArray points):
        cdef CCCatmullRomBy o = cls()
        o._create(dt, points)
        return o

    def __cinit__(self, dt=None, CCPointArray points=None):
        if dt is not None:
            self._create(dt, points)

    cdef _create(self, float dt, CCPointArray points):
        self._co = <cocoa.CCObject*>actions.CCCatmullRomBy_create(dt, points.array())
    # bool initWithDuration(float dt, CCPointArray* points)


cdef class CCActionEase(CCActionInterval):
    @classmethod
    def create(cls, CCActionInterval pAction):
        cdef CCActionEase o = cls()
        o._create(pAction)
        return o

    def __cinit__(self, CCActionInterval pAction=None):
        if pAction is not None:
            self._create(pAction)

    cdef _create(self, CCActionInterval pAction):
        self._co = <cocoa.CCObject*>actions.CCActionEase_create(pAction.interval())
    # bool initWithAction(CCActionInterval *pAction)


cdef class CCEaseRateAction(CCActionEase):
    cdef inline actions.CCEaseRateAction* era(self):
        return <actions.CCEaseRateAction*>self._co

    @classmethod
    def create(cls, CCActionInterval pAction, float fRate):
        cdef CCEaseRateAction o = cls()
        o._create1(pAction, fRate)
        return o

    def __cinit__(self, CCActionInterval pAction=None, float fRate=0.0):
        if pAction is not None:
            self._create1(pAction, fRate)

    cdef _create1(self, CCActionInterval pAction, float fRate):
        self._co = <cocoa.CCObject*>actions.CCEaseRateAction_create(pAction.interval(), 
                fRate)

    def getRate(self):
        return self.era().getRate()
    def setRate(self, float rate):
        self.era().setRate(rate)
    Rate = property(getRate, setRate)

    # bool initWithAction(CCActionInterval *pAction, float fRate)


cdef class CCEaseIn(CCEaseRateAction):
    @classmethod
    def create(cls, CCActionInterval pAction, float fRate):
        cdef CCEaseIn o = cls()
        o._create1(pAction, fRate)
        return o

    def __cinit__(self, CCActionInterval pAction=None, float fRate=0.0):
        if pAction is not None:
            self._create1(pAction, fRate)

    cdef _create1(self, CCActionInterval pAction, float fRate):
        self._co = <cocoa.CCObject*>actions.CCEaseIn_create(pAction.interval(), 
                fRate)


cdef class CCEaseOut(CCEaseRateAction):
    @classmethod
    def create(cls, CCActionInterval pAction, float fRate):
        cdef CCEaseOut o = cls()
        o._create1(pAction, fRate)
        return o

    def __cinit__(self, CCActionInterval pAction=None, float fRate=0.0):
        if pAction is not None:
            self._create1(pAction, fRate)

    cdef _create1(self, CCActionInterval pAction, float fRate):
        self._co = <cocoa.CCObject*>actions.CCEaseOut_create(pAction.interval(), 
                fRate)


cdef class CCEaseInOut(CCEaseRateAction):
    @classmethod
    def create(cls, CCActionInterval pAction, float fRate):
        cdef CCEaseInOut o = cls()
        o._create1(pAction, fRate)
        return o

    def __cinit__(self, CCActionInterval pAction=None, float fRate=0.0):
        if pAction is not None:
            self._create1(pAction, fRate)

    cdef _create1(self, CCActionInterval pAction, float fRate):
        self._co = <cocoa.CCObject*>actions.CCEaseInOut_create(pAction.interval(), fRate)


cdef class CCEaseExponentialIn(CCActionEase):
    @classmethod
    def create(cls, CCActionInterval pAction):
        cdef CCEaseExponentialIn o = cls()
        o._create(pAction)
        return o

    def __cinit__(self, CCActionInterval pAction=None):
        if pAction is not None:
            self._create(pAction)

    cdef _create(self, CCActionInterval pAction):
        self._co = <cocoa.CCObject*>actions.CCEaseExponentialIn_create(pAction.interval())


cdef class CCEaseExponentialOut(CCActionEase):
    @classmethod
    def create(cls, CCActionInterval pAction):
        cdef CCEaseExponentialOut o = cls()
        o._create(pAction)
        return o

    def __cinit__(self, CCActionInterval pAction=None):
        if pAction is not None:
            self._create(pAction)

    cdef _create(self, CCActionInterval pAction):
        self._co = <cocoa.CCObject*>actions.CCEaseExponentialOut_create(pAction.interval())


cdef class CCEaseExponentialInOut(CCActionEase):
    @classmethod
    def create(cls, CCActionInterval pAction):
        cdef CCEaseExponentialInOut o = cls()
        o._create(pAction)
        return o

    def __cinit__(self, CCActionInterval pAction):
        if pAction is not None:
            self._create(pAction)

    cdef _create(self, CCActionInterval pAction):
        self._co = <cocoa.CCObject*>actions.CCEaseExponentialInOut_create(pAction.interval())


cdef class CCEaseSineIn(CCActionEase):
    @classmethod
    def create(cls, CCActionInterval pAction):
        cdef CCEaseSineIn o = cls()
        o._create(pAction)
        return o

    def __cinit__(self, CCActionInterval pAction=None):
        if pAction is not None:
            self._create(pAction)

    cdef _create(self, CCActionInterval pAction):
        self._co = <cocoa.CCObject*>actions.CCEaseSineIn_create(pAction.interval())

cdef class CCEaseSineOut(CCActionEase):
    @classmethod
    def create(cls, CCActionInterval pAction):
        cdef CCEaseSineOut o = cls()
        o._create(pAction)
        return o

    def __cinit__(self, CCActionInterval pAction=None):
        if pAction is not None:
            self._create(pAction)

    cdef _create(self, CCActionInterval pAction):
        self._co = <cocoa.CCObject*>actions.CCEaseSineOut_create(pAction.interval())

cdef class CCEaseSineInOut(CCActionEase):
    @classmethod
    def create(cls, CCActionInterval pAction):
        cdef CCEaseSineInOut o = cls()
        o._create(pAction)
        return o

    def __cinit__(self, CCActionInterval pAction=None):
        if pAction is not None:
            self._create(pAction)

    cdef _create(self, CCActionInterval pAction):
        self._co = <cocoa.CCObject*>actions.CCEaseSineInOut_create(pAction.interval())


cdef class CCEaseElastic(CCActionEase):
    cdef inline actions.CCEaseElastic* elastic(self):
        return <actions.CCEaseElastic*>self._co

    @classmethod
    def create(cls, CCActionInterval pAction, fPeriod=None):
        cdef CCEaseElastic o = cls()
        o._create1(pAction, fPeriod)
        return o

    def __cinit__(self, CCActionInterval pAction=None, fPeriod=None):
        if pAction is not None:
            self._create1(pAction, fPeriod)

    cdef _create1(self, CCActionInterval pAction, object fPeriod):
        if fPeriod is None:
            self._co = <cocoa.CCObject*>actions.CCEaseElastic_create(pAction.interval())
                 
        else:
            self._co = <cocoa.CCObject*>actions.CCEaseElastic_create(pAction.interval(), 
                    fPeriod)

    def getPeriod(self):
        return self.elastic().getPeriod()
    def setPeriod(self, float fPeriod):
        self.elastic().setPeriod(fPeriod)
    Period = property(getPeriod, setPeriod)
    # bool initWithAction(CCActionInterval *pAction, float fPeriod)# = 0.3)


cdef class CCEaseElasticIn(CCEaseElastic):
    @classmethod
    def create(cls, CCActionInterval pAction, fPeriod=None):
        cdef CCEaseElasticIn o = cls()
        o._create1(pAction, fPeriod)
        return o

    def __cinit__(self, CCActionInterval pAction=None, fPeriod=None):
        if pAction is not None:
            self._create1(pAction, fPeriod)

    cdef _create1(self, CCActionInterval pAction, object fPeriod):
        if fPeriod is None:
            self._co = <cocoa.CCObject*>actions.CCEaseElasticIn_create(
                    pAction.interval())
        else:
            self._co = <cocoa.CCObject*>actions.CCEaseElasticIn_create(
                    pAction.interval(), fPeriod)
        


cdef class CCEaseElasticOut(CCEaseElastic):
    @classmethod
    def create(cls, CCActionInterval pAction, fPeriod=None):
        cdef CCEaseElasticOut o = cls()
        o._create1(pAction, fPeriod)
        return o

    def __cinit__(self, CCActionInterval pAction=None, fPeriod=None):
        if pAction is not None:
            self._create1(pAction, fPeriod)

    cdef _create1(self, CCActionInterval pAction, fPeriod):
        if fPeriod is None:
            self._co = <cocoa.CCObject*>actions.CCEaseElasticOut_create(
                    pAction.interval())
        else:
            self._co = <cocoa.CCObject*>actions.CCEaseElasticOut_create(
                    pAction.interval(), fPeriod)


cdef class CCEaseElasticInOut(CCEaseElastic):
    @classmethod
    def create(cls, CCActionInterval pAction, fPeriod=None):
        cdef CCEaseElasticInOut o = cls()
        o._create1(pAction, fPeriod)
        return o

    def __cinit__(self, CCActionInterval pAction=None, fPeriod=None):
        if pAction is not None:
            self._create1(pAction, fPeriod)

    cdef _create1(self, CCActionInterval pAction, object fPeriod):
        if fPeriod is None:
            self._co = <cocoa.CCObject*>actions.CCEaseElasticInOut_create(
                    pAction.interval())
        else:
            self._co = <cocoa.CCObject*>actions.CCEaseElasticInOut_create(
                    pAction.interval(), fPeriod)


cdef class CCEaseBounce(CCActionEase):
    @classmethod
    def create(cls, CCActionInterval pAction):
        cdef CCEaseBounce o = cls()
        o._create(pAction)
        return o

    def __cinit__(self, CCActionInterval pAction=None):
        if pAction is not None:
            self._create(pAction)

    cdef _create(self, CCActionInterval pAction):
        self._co = <cocoa.CCObject*>actions.CCEaseBounce_create(pAction.interval())


cdef class CCEaseBounceIn(CCEaseBounce):
    @classmethod
    def create(cls, CCActionInterval pAction):
        cdef CCEaseBounceIn o = cls()
        o._create(pAction)
        return o

    def __cinit__(self, CCActionInterval pAction=None):
        if pAction is not None:
            self._create(pAction)

    cdef _create(self, CCActionInterval pAction):
        self._co = <cocoa.CCObject*>actions.CCEaseBounceIn_create(pAction.interval())


cdef class CCEaseBounceOut(CCEaseBounce):
    @classmethod
    def create(cls, CCActionInterval pAction):
        cdef CCEaseBounceOut o = cls()
        o._create(pAction)
        return o

    def __cinit__(self, CCActionInterval pAction=None):
        if pAction is not None:
            self._create(pAction)

    cdef _create(self, CCActionInterval pAction):
        self._co = <cocoa.CCObject*>actions.CCEaseBounceOut_create(pAction.interval())


cdef class CCEaseBounceInOut(CCEaseBounce):
    @classmethod
    def create(cls, CCActionInterval pAction):
        cdef CCEaseBounceInOut o = cls()
        o._create(pAction)
        return o

    def __cinit__(self, CCActionInterval pAction=None):
        if pAction is not None:
            self._create(pAction)

    cdef _create(self, CCActionInterval pAction):
        self._co = <cocoa.CCObject*>actions.CCEaseBounceInOut_create(pAction.interval())


cdef class CCEaseBackIn(CCActionEase):
    @classmethod
    def create(cls, CCActionInterval pAction):
        cdef CCEaseBackIn o = cls()
        o._create1(pAction)
        return o

    def __cinit__(self, CCActionInterval pAction=None):
        if pAction is not None:
            self._create1(pAction)

    cdef _create1(self, CCActionInterval pAction):
        self._co = <cocoa.CCObject*>actions.CCEaseBackIn_create(pAction.interval())


cdef class CCEaseBackOut(CCActionEase):
    @classmethod
    def create(cls, CCActionInterval pAction):
        cdef CCEaseBackOut o = cls()
        o._create(pAction)
        return o

    def __cinit__(self, CCActionInterval pAction=None):
        if pAction is not None:
            self._create(pAction)

    cdef _create(self, CCActionInterval pAction):
        self._co = <cocoa.CCObject*>actions.CCEaseBackOut_create(pAction.interval())


cdef class CCEaseBackInOut(CCActionEase):
    @classmethod
    def create(cls, CCActionInterval pAction):
        cdef CCEaseBackInOut o = cls()
        o._create(pAction)
        return o

    def __cinit__(self, CCActionInterval pAction=None):
        if pAction is not None:
            self._create(pAction)

    cdef _create(self, CCActionInterval pAction):
        self._co = <cocoa.CCObject*>actions.CCEaseBackInOut_create(pAction.interval())


cdef class CCActionInstant(CCFiniteTimeAction):
    def new(self):
        self._co = <cocoa.CCObject*>new actions.CCActionInstant()
        self.autorelease()
        return self


cdef class CCShow(CCActionInstant):
    @classmethod
    def create(cls):
        cdef CCShow o = cls()
        o._co = <cocoa.CCObject*>actions.CCShow_create()
        return o

    def __cinit__(self):
        self._co = <cocoa.CCObject*>actions.CCShow_create()
    # CCShow()


cdef class CCHide(CCActionInstant):
    @classmethod
    def create(cls):
        cdef CCHide o = cls()
        o._co = <cocoa.CCObject*>actions.CCHide_create()
        return o
    # CCHide()

    def __cinit__(self):
        self._co = <cocoa.CCObject*>actions.CCHide_create()


cdef class CCToggleVisibility(CCActionInstant):
    @classmethod
    def create(cls):
        cdef CCToggleVisibility o = cls()
        o._co = <cocoa.CCObject*>actions.CCToggleVisibility_create()
        return o

    def __cinit__(self):
        self._co = <cocoa.CCObject*>actions.CCToggleVisibility_create()

    # CCToggleVisibility()


cdef class CCFlipX(CCActionInstant):
    @classmethod
    def create(cls, bool x):
        cdef CCFlipX o = cls()
        o._co = <cocoa.CCObject*>actions.CCFlipX_create(x)
        return o

    def __cinit__(self, x=None):
        if x is not None:
            self._co = <cocoa.CCObject*>actions.CCFlipX_create(x)

    # CCFlipX()
    # bool initWithFlipX(bool x)


cdef class CCFlipY(CCActionInstant):
    @classmethod
    def create(cls, bool y):
        cdef CCFlipY o = cls()
        o._co = <cocoa.CCObject*>actions.CCFlipY_create(y)
        return o

    def __cinit__(self, y=None):
        if y is not None:
            self._co = <cocoa.CCObject*>actions.CCFlipY_create(y)

    # CCFlipY()
    # bool initWithFlipY(bool y)


cdef class CCPlace(CCActionInstant):
    @classmethod
    def create(cls, CCPoint pos):
        cdef CCPlace o = cls()
        o._co = <cocoa.CCObject*>actions.CCPlace_create(pos._co)
        return o

    def __cinit__(self, CCPoint pos=None):
        if pos is not None:
            self._co = <cocoa.CCObject*>actions.CCPlace_create(pos._co)

    # CCPlace()


cdef class CCCallFunc(CCActionInstant):
    cdef inline actions.CCCallFunc* func(self):
        return <actions.CCCallFunc*>self._co

    @classmethod
    def create(cls, CallBack cb):
        cdef CCCallFunc o = cls()
        o._create(cb)
        return o

    @classmethod
    def createByHandler(cls, int nHandler):
        cdef CCCallFunc o = cls()
        o._co = <cocoa.CCObject*>actions.CCCallFunc_create(nHandler)
        return o

    def __cinit__(self, CallBack cb=None):
        if cb is not None:
            self._create(cb)

    cdef _create(self, CallBack cb):
        self._co = <cocoa.CCObject*>actions.CCCallFunc_create(&cb._co, cb.get_CallFunc())
        # cb.reg(self)

    def new(self):
        self._co = <cocoa.CCObject*>new actions.CCCallFunc()
        self.autorelease()
        return self

    def execute(self):
        self.func().execute()

    def getTargetCallback(self, cls=CCObject):
        cdef CCObject o = cls()
        o._co = <cocoa.CCObject*>self.func().getTargetCallback()
        return o

    def setTargetCallback(self, CCObject pSel):
        self.func().setTargetCallback(pSel._co)

    def getScriptHandler(self):
        return self.func().getScriptHandler()


cdef class CCCallFuncN(CCCallFunc):
    cdef inline actions.CCCallFuncN* funcN(self):
        return <actions.CCCallFuncN*>self._co

    @classmethod
    def createByHandler(cls, int nHandler):
        cdef CCCallFuncN o = cls()
        o._co = <cocoa.CCObject*>actions.CCCallFuncN_create(nHandler)
        return o

    @classmethod
    def create(cls, CallBack cb):
        cdef CCCallFuncN o = cls()
        o._create(cb)
        return o

    def __cinit__(self, CallBack cb=None):
        if cb is not None:
            self._create(cb)

    cdef _create(self, CallBack cb):
        self._co = <cocoa.CCObject*>actions.CCCallFuncN_create(&cb._co, cb.get_CallFuncN())
        # cb.reg(self)

    def new(self):
        self._co = <cocoa.CCObject*>new actions.CCCallFuncN()
        self.autorelease()
        return self

    def getClassTypeInfo(self):
        return self.funcN().getClassTypeInfo()


cdef class CCCallFuncND(CCCallFuncN):
    cdef inline actions.CCCallFuncND* funcND(self):
        return <actions.CCCallFuncND*>self._co

    @classmethod
    def create(cls, CallBack cb, int data=0):
        cdef CCCallFuncND o = cls()
        o._create1(cb, data)
        # cb.reg(o)
        return o
    def __cinit__(self, CallBack cb=None, int data=0):
        if cb is not None:
            self._create1(cb, data)

    cdef _create1(self, CallBack cb, int data):
        cdef void* d = NULL
        if data != 0:
            d = <void*>data
        self._co = <cocoa.CCObject*>actions.CCCallFuncND_create(
                &cb._co, cb.get_CallFuncND(), d)
        # cb.reg(self)

cdef class CCCallFuncO(CCCallFunc):
    cdef inline actions.CCCallFuncO* funcO(self):
        return <actions.CCCallFuncO*>self._co

    @classmethod
    def create(cls, CallBack cb, CCObject obj):
        cdef CCCallFuncO o = cls()
        o._create1(cb, obj)
        return o

    def __cinit__(self, CallBack cb=None, CCObject obj=None):
        if cb is not None:
            self._create1(cb, obj)

    cdef _create1(self, CallBack cb, CCObject obj):
        self._co = <cocoa.CCObject*>actions.CCCallFuncO_create(
                &cb._co, cb.get_CallFuncO(), obj._co)
        # cb.reg(self)

    def new(self):
        self._co = <cocoa.CCObject*>new actions.CCCallFuncO()
        self.autorelease()
        return self

    def getClassTypeInfo(self):
        return self.funcO().getClassTypeInfo()

    def getObject(self, cls=CCObject):
        cdef CCObject o = cls()
        o._co = self.funcO().getObject()
        return o

    def setObject(self, CCObject pObj):
        self.funcO().setObject(pObj._co)




# cdef class CCActionTweenDelegate:
#     cdef actions.CCActionTweenDelegate _co
    # def updateTweenAction(self, float value, str key):
        # self._co.updateTweenAction(value, key)

cdef class CCActionTween(CCActionInterval):
    @classmethod
    def create(cls, float aDuration, str key, float from1, float to):
        cdef CCActionTween o = cls()
        o._create(aDuration, key, from1, to)
        return o

    def __cinit__(self, aDuration=None, str key='', float from1=0.0, float to=0.0):
        if aDuration is not None:
            self._create(aDuration, key, from1, to)

    cdef _create(self, float aDuration, str key, float from1, float to):
        self._co = <cocoa.CCObject*>actions.CCActionTween_create(
                aDuration, key, from1, to)



cdef class CCActionManager(CCObject):
    cdef inline actions.CCActionManager* mgr(self):
        return <actions.CCActionManager*>self._co

    def new(self):
        self._co = <cocoa.CCObject*>new actions.CCActionManager()
        self.autorelease()
        return self

    def addAction(self, CCAction pAction, CCNode pTarget, bool paused):
        self.mgr().addAction(pAction.action(), pTarget.node(), paused)

    def removeAllActions(self):
        self.mgr().removeAllActions()

    def removeAllActionsFromTarget(self, CCObject pTarget):
        self.mgr().removeAllActionsFromTarget(pTarget._co)

    def removeAction(self, CCAction pAction):
        self.mgr().removeAction(pAction.action())

    def removeActionByTag(self, unsigned int tag, CCObject pTarget):
        self.mgr().removeActionByTag(tag, pTarget._co)

    def getActionByTag(self, unsigned int tag, CCObject pTarget):
        o = CCAction()
        o._co = <cocoa.CCObject*>self.mgr().getActionByTag(tag, pTarget._co)
        return o

    def numberOfRunningActionsInTarget(self, CCObject pTarget):
        return self.mgr().numberOfRunningActionsInTarget(pTarget._co)

    def pauseTarget(self, CCObject pTarget):
        self.mgr().pauseTarget(pTarget._co)

    def resumeTarget(self, CCObject pTarget):
        self.mgr().resumeTarget(pTarget._co)
        
    def pauseAllRunningActions(self):
        self.mgr().pauseAllRunningActions()
    
    def resumeTargets(self, CCSet targetsToResume):
        self.mgr().resumeTargets(targetsToResume.set())

        


#----------ccNode.pxd-----------
cdef class CCNode(CCObject):
    cdef inline ccNode.CCNode *node(self):
        return <ccNode.CCNode*> self._co

    def description(self):
        return self.node().description()

    def setZOrder(self, int zOrder):
        self.node().setZOrder(zOrder)

    def getZOrder(self):
        return self.node().getZOrder()

    def setVertexZ(self, float vertexZ):
        self.node().setVertexZ(vertexZ)

    def getVertexZ(self):
        return self.node().getVertexZ()

    def setScaleX(self, float fScaleX):
        self.node().setScaleX(fScaleX)

    def getScaleX(self):
        return self.node().getScaleX()

    def setScaleY(self, float fScaleY):
        self.node().setScaleY(fScaleY)

    def getScaleY(self):
        return self.node().getScaleY()

    def setScale(self, scale):
        self.node().setScale(scale)

    def getScale(self):
        return self.node().getScale()

    def setPosition1(self, CCPoint position):
        self.node().setPosition(position._co)

    def getPosition(self):
        p = CCPoint()
        p._co = self.node().getPosition()
        return p

    def setPosition(self, x, y):
        self.node().setPosition(x, y)

    def getPositionXY(self):
        return self.node().getPositionX(), self.node().getPositionY()

    def setPositionX(self, x):
        self.node().setPositionX(x)

    def getPositionX(self):
        return self.node().getPositionX()

    def setPositionY(self, y):
        self.node().setPositionY(y)

    def getPositionY(self):
        return self.node().getPositionY()

    def setSkewX(self, fSkewX):
        self.node().setSkewX(fSkewX)

    def getSkewX(self):
        return self.node().getSkewX()

    def setSkewY(self, fSkewY):
        self.node().setSkewY(fSkewY)

    def getSkewY(self):
        return self.node().getSkewY()

    def setAnchorPoint(self, x, y):
        cdef cocoa.CCPoint co
        co.setPoint(x, y)
        self.node().setAnchorPoint(co)

    def setAnchorPoint1(self, CCPoint anchorPoint):
        self.node().setAnchorPoint(anchorPoint._co)

    def getAnchorPoint(self):
        p = CCPoint()
        p._co = self.node().getAnchorPoint()
        return p

    def getAnchorPointInPoints(self):
        p = CCPoint()
        p._co = self.node().getAnchorPointInPoints()
        return p

    def setContentSize(self, CCSize contentSize):
        self.node().setContentSize(contentSize._co)

    def getContentSize(self):
        s = CCSize()
        s._co = self.node().getContentSize()
        return s

    def setVisible(self, bool visible):
        self.node().setVisible(visible)

    def isVisible(self):
        return self.node().isVisible()

    def setRotation(self, fRotation):
        self.node().setRotation(fRotation)

    def getRotation(self):
        return self.node().getRotation()

    def setRotationX(self, fRotaionX):
        self.node().setRotationX(fRotaionX)

    def getRotationX(self):
        return self.node().getRotationX()

    def setRotationY(self, fRotationY):
        self.node().setRotationY(fRotationY)

    def getRotationY(self):
        return self.node().getRotationY()


    def setOrderOfArrival(self, unsigned int uOrderOfArrival):
        self.node().setOrderOfArrival(uOrderOfArrival)

    def getOrderOfArrival(self):
        return self.node().getOrderOfArrival()

    def setGLServerState(self, shaders.ccGLServerState glServerState):
        self.node().setGLServerState(glServerState)

    def getGLServerState(self):
        return self.node().getGLServerState()

    def ignoreAnchorPointForPosition(self, bool ignore):
        self.node().ignoreAnchorPointForPosition(ignore)

    def isIgnoreAnchorPointForPosition(self):
        return self.node().isIgnoreAnchorPointForPosition()


    def addChild(self, CCNode child, zOrder=None, tag=None):
        if zOrder is None and tag is None:
            self.node().addChild(child.node())
        elif tag is None:
            self.node().addChild(child.node(), zOrder)
        else:
            self.node().addChild(child.node(), zOrder, tag)

    def getChildByTag(self, int tag):
        n = CCNode()
        n._co = <cocoa.CCObject*>self.node().getChildByTag(tag)
        return n

    def getChildren(self):
        a = CCArray()
        a._co = <cocoa.CCObject*>self.node().getChildren()
        return a

    def getChildrenCount(self):
        return self.node().getChildrenCount()

    def setParent(self, CCNode parent):
        self.node().setParent(parent.node())

    def getParent(self):
        n = CCNode()
        n._co = <cocoa.CCObject*>self.node().getParent()
        return n

    def removeFromParent(self):
        self.node().removeFromParent()

    def removeFromParentAndCleanup(self, bool cleanup):
        self.node().removeFromParentAndCleanup(cleanup)

    def removeChild(self, CCNode child, cleanup=None):
        if cleanup is None:
            self.node().removeChild(child.node())
        else:
            self.node().removeChild(child.node(), cleanup)

    def removeChildByTag(self, int tag, cleanup=None):
        if cleanup is None:
            self.node().removeChildByTag(tag)
        else:
            self.node().removeChildByTag(tag, cleanup)

    def removeAllChildren(self, cleanup=None):
        if cleanup is None:
            self.node().removeAllChildren()
        else:
            self.node().removeAllChildrenWithCleanup(cleanup)

    def removeAllChildrenWithCleanup(self, cleanup):
        self.node().removeAllChildrenWithCleanup(cleanup)

    def reorderChild(self, CCNode child, int zOrder):
        self.node().reorderChild(child.node(), zOrder)

    def sortAllChildren(self):
        self.node().sortAllChildren()


    # CCGridBase* getGrid()
    # void setGrid(CCGridBase *pGrid)

    #/// @name Tag & User data
    def getTag(self):
        return self.node().getTag()

    def setTag(self, int nTag):
        self.node().setTag(nTag)

    def getUserData(self):
        return <object>self.node().getUserData()

    def setUserData(self, object pUserData):
        self.node().setUserData(<void*>pUserData)

    def setUserObject(self, CCObject pUserObject):
        self.node().setUserObject(pUserObject._co)

    #/// @name Shader Program
    # CCGLProgram* getShaderProgram()
    # void setShaderProgram(CCGLProgram *pShaderProgram)

    def getCamera(self):
        c = CCCamera()
        c._co = <cocoa.CCObject*>self.node().getCamera()
        return c

    def isRunning(self):
        return self.node().isRunning()

    #/// @name Script Bindings for lua
    def registerScriptHandler(self, int handler):
        self.node().registerScriptHandler(handler)

    def unregisterScriptHandler(self):
        self.node().unregisterScriptHandler()

    cdef inline int getScriptHandler(self):
        return self.node().getScriptHandler()

    def scheduleUpdateWithPriorityLua(self, int nHandler, int priority):
        self.node().scheduleUpdateWithPriorityLua(nHandler, priority)


        # #/// @name Event Callbacks
        # void onEnter()
        # void onEnterTransitionDidFinish()
        # void onExit()
        # void onExitTransitionDidStart()

    def cleanup(self):
        self.node().cleanup()

    def draw(self):
        self.node().draw()

    def visit(self):
        self.node().visit()

    def boundingBox(self):
        o = CCRect()
        o._co = self.node().boundingBox()
        return o

    #/// @name Actions
    def getActionManager(self):
        o = CCActionManager()
        o._co = <cocoa.CCObject*>self.node().getActionManager()
        return o
    def setActionManager(self, CCActionManager actionManager):
        self.node().setActionManager(actionManager.mgr())
    Manager = property(getActionManager, setActionManager)

    def runAction(self, CCAction action):
        o = CCAction()
        o._co = <cocoa.CCObject*>self.node().runAction(action.action())
        return o

    def stopAllActions(self):
        self.node().stopAllActions()

    def stopAction(self, CCAction action):
        self.node().stopAction(action.action())

    def stopActionByTag(self, int tag):
        self.node().stopActionByTag(tag)

    def getActionByTag(self, int tag):
        o = CCAction()
        o._co = <cocoa.CCObject*>self.node().getActionByTag(tag)
        return o
    def numberOfRunningActions(self):
        return self.node().numberOfRunningActions()

        # #/// @name Scheduler and Timer
    def setScheduler(self, CCScheduler scheduler):
        self.node().setScheduler(scheduler.scheduler())

    def getScheduler(self):
        o = CCScheduler()
        o._co = <cocoa.CCObject*>self.node().getScheduler()
        return o

    # def isScheduled(self, int selector):
    #     return self.node().isScheduled(<cocoa.SEL_SCHEDULE>selector)

    def scheduleUpdate(self):
        self.node().scheduleUpdate()

    def scheduleUpdateWithPriority(self, int priority):
        self.node().scheduleUpdateWithPriority(priority)

    def unscheduleUpdate(self):
        self.node().unscheduleUpdate()

        # void schedule(SEL_SCHEDULE selector, float interval, unsigned int repeat, float delay)
        # void schedule(SEL_SCHEDULE selector, float interval)
        # void scheduleOnce(SEL_SCHEDULE selector, float delay)
        # void schedule(SEL_SCHEDULE selector)
        # void unschedule(SEL_SCHEDULE selector)

    def unscheduleAllSelectors(self):
        self.node().unscheduleAllSelectors()

    def resumeSchedulerAndActions(self):
        self.node().resumeSchedulerAndActions()

    def pauseSchedulerAndActions(self):
        self.node().pauseSchedulerAndActions()


    #/// @name Transformations
    def transform(self):
        self.node().transform()

    def transformAncestors(self):
        self.node().transformAncestors()

    def nodeToParentTransform(self):
        o = CCAffineTransform()
        o._co = self.node().nodeToParentTransform()
        return o
    def parentToNodeTransform(self):
        o = CCAffineTransform()
        o._co = self.node().parentToNodeTransform()
        return o
    def nodeToWorldTransform(self):
        o = CCAffineTransform()
        o._co = self.node().nodeToWorldTransform()
        return o
    def worldToNodeTransform(self):
        o = CCAffineTransform()
        o._co = self.node().worldToNodeTransform()
        return o

    #/// @name Coordinate Converters
    def convertToNodeSpace(self, CCPoint worldPoint):
        o = CCPoint()
        o._co = self.node().convertToNodeSpace(worldPoint._co)
        return o

    def convertToWorldSpace(self, CCPoint nodePoint):
        o = CCPoint()
        o._co = self.node().convertToWorldSpace(nodePoint._co)
        return o

    def convertToNodeSpaceAR(self, CCPoint worldPoint):
        o = CCPoint()
        o._co = self.node().convertToNodeSpaceAR(worldPoint._co)
        return o

    def convertToWorldSpaceAR(self, CCPoint nodePoint):
        o = CCPoint()
        o._co = self.node().convertToWorldSpaceAR(nodePoint._co)
        return o

    def convertTouchToNodeSpace(self, CCTouch touch):
        o = CCPoint()
        o._co = self.node().convertTouchToNodeSpace(touch.touch())
        return o

    def convertTouchToNodeSpaceAR(self, CCTouch touch):
        o = CCPoint()
        o._co = self.node().convertTouchToNodeSpaceAR(touch.touch())
        return o


cdef class CCAtlasNode(CCNode):
    cdef inline ccNode.CCAtlasNode* atlas(self):
        return <ccNode.CCAtlasNode*>self._co

    @classmethod
    def create(cls, str tile,unsigned int tileWidth, 
            unsigned int tileHeight, unsigned int itemsToRender):
        o = cls()
        o.set_co(<int>ccNode.CCAtlasNode_create(tile,
                tileWidth, tileHeight,
                itemsToRender))
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new ccNode.CCAtlasNode()
        self.autorelease()
        return self

    def initWithTileFile(self, str tile, unsigned int tileWidth, 
            unsigned int tileHeight, unsigned int itemsToRender):
        return self.atlas().initWithTileFile(tile, tileWidth,
                tileHeight, itemsToRender)

    def updateAtlasValues(self):
        self.atlas().updateAtlasValues()

    def getTexture(self):
        o = CCTexture2D()
        o._co = <cocoa.CCObject*>self.atlas().getTexture()
        return o
    def setTexture(self, CCTexture2D texture):
        self.atlas().setTexture(texture.texture2d())




cdef class CCCamera(CCObject):
    cdef inline ccCamera.CCCamera* camera(self):
        return <ccCamera.CCCamera*> self._co

    @classmethod
    def getZEye(cls):
        return ccCamera.getZEye()

    def new(self):
        self._co = <cocoa.CCObject*>new ccCamera.CCCamera()
        self.autorelease()
        self.camera().init()
        return self

    def description(self):
        return self.camera().description()

    def setDirty(self, bool bValue):
        self.camera().setDirty(bValue)

    def isDirty(self):
        return self.camera().isDirty()

    def restore(self):
        self.camera().restore()

    def locate(self):
        self.camera().locate()

    def setEyeXYZ(self, fEyeX, fEyeY, fEyeZ):
        self.camera().setEyeXYZ(fEyeX, fEyeY, fEyeZ)

    def setCenterXYZ(self, fCenterX, fCenterY, fCenterZ):
        self.camera().setCenterXYZ(fCenterX, fCenterY, fCenterZ)

    def setUpXYZ(self, fUpX, fUpY, fUpZ):
        self.camera().setUpXYZ(fUpX, fUpY, fUpZ)

    def getEyeXYZ(self):
        cdef float x, y, z
        self.camera().getEyeXYZ(&x, &y, &z)
        return x, y, z

    def getCenterXYZ(self):
        cdef float x, y, z
        self.camera().getCenterXYZ(&x, &y, &z)
        return x, y, z

    def getUpXYZ(self):
        cdef float x, y, z
        self.camera().getUpXYZ(&x, &y, &z)
        return x, y, z


cdef class CCScene(CCNode):
    cdef inline ccScene.CCScene *scene(self):
        return <ccScene.CCScene*> self._co

    @classmethod
    def create(cls):
        cdef CCScene o = cls()
        o._co = <cocoa.CCObject*>ccScene.CCScene_create()
        return o


#--------------transition.pxd---------------
cdef class CCTransitionScene(CCScene):
    cdef inline transition.CCTransitionScene* trans(self):
        return <transition.CCTransitionScene*>self._co

    @classmethod
    def create(cls, t, CCScene scene):
        cdef CCTransitionScene o = cls()
        o._co = <cocoa.CCObject*>transition.CCTransitionScene_create(t, scene.scene())
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionScene()
    # bool initWithDuration(t,CCScene* scene)

    def finish(self):
        self.trans().finish()

    def hideOutShowIn(self):
        self.trans().hideOutShowIn()



cdef class CCTransitionSceneOriented(CCTransitionScene):
    cdef inline transition.CCTransitionSceneOriented* oriented(self):
        return <transition.CCTransitionSceneOriented*>self._co

    @classmethod
    def create(cls, t,CCScene scene, transition.tOrientation orientation):
        cdef CCTransitionSceneOriented o = cls()
        o._co = <cocoa.CCObject*>transition.CCTransitionSceneOriented_create(
                t, scene.scene(), orientation)
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionSceneOriented()

    # bool initWithDuration(float t,CCScene* scene,tOrientation orientation)



cdef class CCTransitionRotoZoom(CCTransitionScene):
    cdef inline transition.CCTransitionRotoZoom* zoom(self):
        return <transition.CCTransitionRotoZoom*>self._co

    @classmethod
    def create(cls, t, CCScene scene):
        cdef CCTransitionRotoZoom o = cls()
        o._co = <cocoa.CCObject*>transition.CCTransitionRotoZoom_create(t, scene.scene())
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionRotoZoom()



cdef class CCTransitionJumpZoom(CCTransitionScene):
    cdef inline transition.CCTransitionJumpZoom* zoom(self):
        return <transition.CCTransitionJumpZoom*>self._co

    @classmethod
    def create(cls, t, CCScene scene):
        cdef CCTransitionJumpZoom o = cls()
        o._co = <cocoa.CCObject*>transition.CCTransitionJumpZoom_create(
                t, scene.scene())
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionJumpZoom()



cdef class CCTransitionMoveInL(CCTransitionScene):
    cdef inline transition.CCTransitionMoveInL* moveInL(self):
        return <transition.CCTransitionMoveInL*>self._co

    @classmethod
    def create(cls, t, CCScene scene):
        cdef CCTransitionMoveInL o = cls()
        o._co = transition.CCTransitionMoveInL_create(t, scene.scene())
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionMoveInL()

    def initScenes(self):
        self.moveInL().initScenes()

    def action(self, cls=CCActionInterval):
        cdef CCActionInterval o = cls()
        o._co = <cocoa.CCObject*>self.moveInL().action()
        return o

    def easeActionWithAction(self, CCActionInterval action, cls=CCActionInterval):
        cdef CCActionInterval o = cls()
        o._co = <cocoa.CCObject*>self.moveInL().easeActionWithAction(action.interval())
        return o



cdef class CCTransitionMoveInR(CCTransitionMoveInL):
    cdef inline transition.CCTransitionMoveInR* moveInR(self):
        return <transition.CCTransitionMoveInR*>self._co

    @classmethod
    def create(cls, t, CCScene scene):
        cdef CCTransitionMoveInR o = cls()
        o._co = <cocoa.CCObject*>transition.CCTransitionMoveInR_create(t, scene.scene())
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionMoveInR()



cdef class CCTransitionMoveInT(CCTransitionMoveInL):
    cdef inline transition.CCTransitionMoveInT* moveInT(self):
        return <transition.CCTransitionMoveInT*>self._co

    @classmethod
    def create(cls, t, CCScene scene):
        cdef CCTransitionMoveInT o = cls()
        o._co = <cocoa.CCObject*>transition.CCTransitionMoveInT_create(t, scene.scene())
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionMoveInT()


cdef class CCTransitionMoveInB(CCTransitionMoveInL):
    cdef inline transition.CCTransitionMoveInB* moveInB(self):
        return <transition.CCTransitionMoveInB*>self._co

    @classmethod
    def create(cls, t, CCScene scene):
        cdef CCTransitionMoveInB o = cls()
        o._co = <cocoa.CCObject*>transition.CCTransitionMoveInB_create(t, scene.scene())
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionMoveInB()



cdef class CCTransitionSlideInL(CCTransitionScene):
    cdef inline transition.CCTransitionSlideInL* slideInL(self):
        return <transition.CCTransitionSlideInL*>self._co

    @classmethod
    def create(cls, t, CCScene scene):
        cdef CCTransitionSlideInL o = cls()
        o._co = <cocoa.CCObject*>transition.CCTransitionSlideInL_create(t, scene.scene())
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionSlideInL()

    def initScenes(self):
        self.slideInL().initScenes()

    def action(self, cls=CCActionInterval):
        cdef CCActionInterval o = cls()
        o._co = <cocoa.CCObject*>self.slideInL().action()
        return o

    def easeActionWithAction(self, CCActionInterval action, cls=CCActionInterval):
        cdef CCActionInterval o = cls()
        o._co = <cocoa.CCObject*>self.slideInL().easeActionWithAction(action.interval())
        return o


cdef class CCTransitionSlideInR(CCTransitionSlideInL):
    cdef inline transition.CCTransitionSlideInR* slideInR(self):
        return <transition.CCTransitionSlideInR*>self._co

    @classmethod
    def create(cls, t, CCScene scene):
        cdef CCTransitionSlideInR o = cls()
        o._co = <cocoa.CCObject*>transition.CCTransitionMoveInR_create(t, scene.scene())
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionSlideInR()


cdef class CCTransitionSlideInB(CCTransitionSlideInL):
    cdef inline transition.CCTransitionSlideInB* slideInB(self):
        return <transition.CCTransitionSlideInB*>self._co

    @classmethod
    def create(cls, t, CCScene scene):
        cdef CCTransitionSlideInB o = cls()
        o._co = <cocoa.CCObject*>transition.CCTransitionSlideInB_create(t, scene.scene())
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionSlideInB()


cdef class CCTransitionSlideInT(CCTransitionSlideInL):
    cdef inline transition.CCTransitionSlideInT* slideInT(self):
        return <transition.CCTransitionSlideInT*>self._co

    @classmethod
    def create(cls, t, CCScene scene):
        cdef CCTransitionSlideInT o = cls()
        o._co = <cocoa.CCObject*>transition.CCTransitionSlideInT_create(t, scene.scene())
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionSlideInT()


cdef class CCTransitionShrinkGrow(CCTransitionScene):
    cdef inline transition.CCTransitionShrinkGrow* grow(self):
        return <transition.CCTransitionShrinkGrow*>self._co

    @classmethod
    def create(cls, t, CCScene scene):
        cdef CCTransitionShrinkGrow o = cls()
        o._co = <cocoa.CCObject*>transition.CCTransitionShrinkGrow_create(t, scene.scene())
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionShrinkGrow()

    def easeActionWithAction(self, CCActionInterval action, cls=CCActionInterval):
        cdef CCActionInterval o = cls()
        o._co = <cocoa.CCObject*>self.grow().easeActionWithAction(action.interval())
        return o



cdef class CCTransitionFlipX(CCTransitionSceneOriented):
    cdef inline transition.CCTransitionFlipX* flipX(self):
        return <transition.CCTransitionFlipX*>self._co

    @classmethod
    def create(cls, t, CCScene s, orientation=None):
        cdef CCTransitionFlipX o = cls()
        if orientation is None:
            o._co = <cocoa.CCObject*>transition.CCTransitionFlipX_create(t, s.scene())
        else:
            o._co = <cocoa.CCObject*>transition.CCTransitionFlipX_create(t, s.scene(), orientation)
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionFlipX()




cdef class CCTransitionFlipY(CCTransitionSceneOriented):
    cdef inline transition.CCTransitionFlipY* flipY(self):
        return <transition.CCTransitionFlipY*>self._co

    @classmethod
    def create(cls, t, CCScene s, orientation=None):
        cdef CCTransitionFlipY o = cls()
        if orientation is None:
            o._co = <cocoa.CCObject*>transition.CCTransitionFlipY_create(t, s.scene())
        else:
            o._co = <cocoa.CCObject*>transition.CCTransitionFlipY_create(t, s.scene(), orientation)
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionFlipY()



cdef class CCTransitionFlipAngular(CCTransitionSceneOriented):
    cdef inline transition.CCTransitionFlipAngular* lar(self):
        return <transition.CCTransitionFlipAngular*>self._co

    @classmethod
    def create(cls, t, CCScene s, orientation=None):
        cdef CCTransitionFlipAngular o = cls()
        if orientation is None:
            o._co = <cocoa.CCObject*>transition.CCTransitionFlipAngular_create(t, s.scene())
        else:
            o._co = <cocoa.CCObject*>transition.CCTransitionFlipAngular_create(t, s.scene(), orientation)
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionFlipAngular()

    

cdef class CCTransitionZoomFlipX(CCTransitionSceneOriented):
    cdef inline transition.CCTransitionZoomFlipX* flipX(self):
        return <transition.CCTransitionZoomFlipX*>self._co

    @classmethod
    def create(cls, t, CCScene s, orientation=None):
        cdef CCTransitionZoomFlipX o = cls()
        if orientation is None:
            o._co = <cocoa.CCObject*>transition.CCTransitionZoomFlipX_create(t, s.scene())
        else:
            o._co = <cocoa.CCObject*>transition.CCTransitionZoomFlipX_create(t, s.scene(), orientation)

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionZoomFlipX()



cdef class CCTransitionZoomFlipY(CCTransitionSceneOriented):
    cdef inline transition.CCTransitionZoomFlipY* flipY(self):
        return <transition.CCTransitionZoomFlipY*>self._co

    @classmethod
    def create(cls, t, CCScene s, orientation=None):
        cdef CCTransitionZoomFlipY o = cls()
        if orientation is None:
            o._co = <cocoa.CCObject*>transition.CCTransitionZoomFlipY_create(t, s.scene())
        else:
            o._co = <cocoa.CCObject*>transition.CCTransitionZoomFlipY_create(t, s.scene(), orientation)

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionZoomFlipY()



cdef class CCTransitionZoomFlipAngular(CCTransitionSceneOriented):
    cdef inline transition.CCTransitionZoomFlipAngular* lar(self):
        return <transition.CCTransitionZoomFlipAngular*>self._co

    @classmethod
    def create(cls, t, CCScene s, orientation=None):
        cdef CCTransitionZoomFlipAngular o = cls()
        if orientation is None:
            o._co = <cocoa.CCObject*>transition.CCTransitionZoomFlipAngular_create(t, 
                    s.scene())
        else:
            o._co = <cocoa.CCObject*>transition.CCTransitionZoomFlipAngular_create(t, 
                    s.scene(), orientation)
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionZoomFlipAngular()




cdef class CCTransitionFade(CCTransitionScene):
    cdef inline transition.CCTransitionFade* fade(self):
        return <transition.CCTransitionFade*>self._co

    @classmethod
    def create(cls, duration, CCScene scene, ccColor3B color=None):
        cdef CCTransitionFade o = cls()
        if ccColor3B is None:
            o._co = <cocoa.CCObject*>transition.CCTransitionFade_create(duration, 
                    scene.scene())
        else:
            o._co = <cocoa.CCObject*>transition.CCTransitionFade_create(duration, 
                    scene.scene(), color._co)
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionFade()

    # bool initWithDuration(t, CCScene*scene ,const ccColor3B& color)
    # bool initWithDuration(t,CCScene* scene) 
    # void onEnter()
    # void onExit()


cdef class CCTransitionCrossFade(CCTransitionScene):
    cdef inline transition.CCTransitionCrossFade* cfade(self):
        return <transition.CCTransitionCrossFade*>self._co

    @classmethod
    def create(cls, t, CCScene scene):
        cdef CCTransitionCrossFade o = cls()
        o._co = <cocoa.CCObject*>transition.CCTransitionCrossFade_create(t, scene.scene())
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionCrossFade()

    # void draw()
    # void onEnter()
    # void onExit()




cdef class CCTransitionTurnOffTiles(CCTransitionScene):
    cdef inline transition.CCTransitionTurnOffTiles* tiles(self):
        return <transition.CCTransitionTurnOffTiles*>self._co

    @classmethod
    def create(cls, t, CCScene scene):
        cdef CCTransitionTurnOffTiles o = cls()
        o._co = <cocoa.CCObject*>transition.CCTransitionTurnOffTiles_create(t, 
                scene.scene())
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionTurnOffTiles()

    # void onEnter()
    def easeActionWithAction(self, CCActionInterval action):
        cdef CCActionInterval o = CCActionInterval()
        o._co = <cocoa.CCObject*>self.tiles().easeActionWithAction(action.interval())
        return o



cdef class CCTransitionSplitCols(CCTransitionScene):
    cdef inline transition.CCTransitionSplitCols* cols(self):
        return <transition.CCTransitionSplitCols*>self._co

    @classmethod
    def create(cls, t, CCScene scene):
        cdef CCTransitionSplitCols o = cls()
        o._co = <cocoa.CCObject*>transition.CCTransitionSplitCols_create(t,
                scene.scene())
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionSplitCols()

    def action(self, cls=CCActionInterval):
        cdef CCActionInterval o = cls()
        o._co = <cocoa.CCObject*>self.cols().action()
        return o

    # void onEnter()
    def easeActionWithAction(self, CCActionInterval action):
        cdef CCActionInterval o = CCActionInterval()
        o._co = <cocoa.CCObject*>self.cols().easeActionWithAction(action.interval())
        return o



cdef class CCTransitionSplitRows(CCTransitionSplitCols):
    cdef inline transition.CCTransitionSplitRows* rows(self):
        return <transition.CCTransitionSplitRows*>self._co

    @classmethod
    def create(cls, t, CCScene scene):
        cdef CCTransitionSplitRows o = cls()
        o._co = <cocoa.CCObject*>transition.CCTransitionSplitRows_create(t,
                scene.scene())
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionSplitRows()



cdef class CCTransitionFadeTR(CCTransitionScene):
    cdef inline transition.CCTransitionFadeTR* tr(self):
        return <transition.CCTransitionFadeTR*>self._co

    @classmethod
    def create(cls, t, CCScene scene):
        cdef CCTransitionFadeTR o = cls()
        o._co = <cocoa.CCObject*>transition.CCTransitionFadeTR_create(t,
                scene.scene())
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionFadeTR()

    def actionWithSize(self, CCSize size, cls=CCActionInterval):
        cdef CCActionInterval o = cls()
        o._co = <cocoa.CCObject*>self.tr().actionWithSize(size._co)
        return o

    def easeActionWithAction(self, CCActionInterval action):
        cdef CCActionInterval o = CCActionInterval()
        o._co = <cocoa.CCObject*>self.tr().easeActionWithAction(action.interval())
        return o



cdef class CCTransitionFadeBL(CCTransitionFadeTR):
    cdef inline transition.CCTransitionFadeBL* bl(self):
        return <transition.CCTransitionFadeBL*>self._co

    @classmethod
    def create(cls, t, CCScene scene):
        cdef CCTransitionFadeBL o = cls()
        o._co = <cocoa.CCObject*>transition.CCTransitionFadeBL_create(t,
                scene.scene())
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionFadeBL()




cdef class CCTransitionFadeUp(CCTransitionFadeTR):
    cdef inline transition.CCTransitionFadeUp* up(self):
        return <transition.CCTransitionFadeUp*>self._co

    @classmethod
    def create(cls, t, CCScene scene):
        cdef CCTransitionFadeUp o = cls()
        o._co = <cocoa.CCObject*>transition.CCTransitionFadeUp_create(t,
                scene.scene())
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionFadeTR()



cdef class CCTransitionFadeDown(CCTransitionFadeTR):
    cdef inline transition.CCTransitionFadeDown* down(self):
        return <transition.CCTransitionFadeDown*>self._co

    @classmethod
    def create(cls, t, CCScene scene):
        cdef CCTransitionFadeDown o = cls()
        o._co = <cocoa.CCObject*>transition.CCTransitionFadeDown_create(t,
                scene.scene())
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionFadeDown()



cdef class CCTransitionPageTurn(CCTransitionScene):
    cdef inline transition.CCTransitionPageTurn* turn(self):
        return <transition.CCTransitionPageTurn*>self._co

    @classmethod
    def create(cls, t, CCScene scene, bool backwards):
        cdef CCTransitionPageTurn o = cls()
        o._co = <cocoa.CCObject*>transition.CCTransitionPageTurn_create(t,
                scene.scene(), backwards)
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionPageTurn()

    # bool initWithDuration(float t,CCScene* scene,bool backwards)
    def actionWithSize(self, CCSize size, cls=CCActionInterval):
        cdef CCActionInterval o = cls()
        o._co = <cocoa.CCObject*>self.turn().actionWithSize(size._co)
        return o




cdef class CCTransitionProgress(CCTransitionScene):
    cdef inline transition.CCTransitionProgress* progress(self):
        return <transition.CCTransitionProgress*>self._co

    @classmethod
    def create(cls, t, CCScene scene):
        cdef CCTransitionProgress o = cls()
        o._co = <cocoa.CCObject*>transition.CCTransitionProgress_create(t,
                scene.scene())
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new transition.CCTransitionProgress()



# cppclass CCTransitionProgressRadialCCW(CCTransitionProgress):
#     pass
# CCTransitionProgressRadialCCW* CCTransitionProgressRadialCCW_create"cocos2d::CCTransitionProgressRadialCCW::create"(float t, CCScene* scene)


# cppclass CCTransitionProgressRadialCW(CCTransitionProgress):
#     pass
# CCTransitionProgressRadialCW* CCTransitionProgressRadialCW_create"cocos2d::CCTransitionProgressRadialCW::create"(float t, CCScene* scene)


# cppclass CCTransitionProgressHorizontal(CCTransitionProgress):
#     pass
# CCTransitionProgressHorizontal* CCTransitionProgressHorizontal_create"cocos2d::CCTransitionProgressHorizontal::create"(float t, CCScene* scene)


# cppclass CCTransitionProgressVertical(CCTransitionProgress):
#     pass
# CCTransitionProgressVertical* CCTransitionProgressVertical_create"cocos2d::CCTransitionProgressVertical::create"(float t, CCScene* scene)


# cppclass CCTransitionProgressInOut(CCTransitionProgress):
#     pass
# CCTransitionProgressInOut* CCTransitionProgressInOut_create"cocos2d::CCTransitionProgressInOut::create"(float t, CCScene* scene)


# cppclass CCTransitionProgressOutIn(CCTransitionProgress):
#     pass
# CCTransitionProgressOutIn* CCTransitionProgressOutIn_create"cocos2d::CCTransitionProgressOutIn::create"(float t, CCScene* scene)







    


cdef class CCLayer(CCNode):
    cdef inline ccLayer.CCLayer *layer(self):
        return <ccLayer.CCLayer*> self._co

    @classmethod
    def create(cls):
        cdef CCLayer o = cls()
        o._co = <cocoa.CCObject*>ccLayer.CCLayer_create()
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new ccLayer.CCLayer()
        self.autorelease()
        return self

    def init(self):
        return self.layer().init()

    # def onEnter()
    # void onExit()
    # void onEnterTransitionDidFinish()

    #     # default implements are used to call script callback if exist
    #     bool ccTouchBegan(CCTouch *pTouch, CCEvent *pEvent)
    #     void ccTouchMoved(CCTouch *pTouch, CCEvent *pEvent)
    #     void ccTouchEnded(CCTouch *pTouch, CCEvent *pEvent)
    #     void ccTouchCancelled(CCTouch *pTouch, CCEvent *pEvent)
    
    #     # default implements are used to call script callback if exist
    #     void ccTouchesBegan(CCSet *pTouches, CCEvent *pEvent)
    #     void ccTouchesMoved(CCSet *pTouches, CCEvent *pEvent)
    #     void ccTouchesEnded(CCSet *pTouches, CCEvent *pEvent)
    #     void ccTouchesCancelled(CCSet *pTouches, CCEvent *pEvent)
    
    #     void didAccelerate(CCAcceleration* pAccelerationValue)
    def registerScriptAccelerateHandler(self, int nHandler):
        self.layer().registerScriptAccelerateHandler(nHandler)

    def unregisterScriptAccelerateHandler(self):
        self.layer().unregisterScriptAccelerateHandler()

    def registerWithTouchDispatcher(self):
        self.layer().registerWithTouchDispatcher()

    def registerScriptTouchHandler(self, int nHandler, 
            bool bIsMultiTouches = False, int nPriority = INT_MIN, 
            bool bSwallowsTouches = False):
        self.layer().registerScriptTouchHandler(nHandler, bIsMultiTouches,
                nPriority, bSwallowsTouches)

    def unregisterScriptTouchHandler(self):
        self.layer().unregisterScriptHandler()

    def isTouchEnabled(self):
        return self.layer().isTouchEnabled()
    def setTouchEnabled(self, bool value):
        self.layer().setTouchEnabled(value)

    def setTouchMode(self, ccLayer.ccTouchesMode mode):
        self.layer().setTouchMode(mode)
    def getTouchMode(self):
        return self.getTouchMode()

    def setTouchPriority(self, int priority):
        self.layer().setTouchPriority(priority)
    def getTouchPriority(self):
        return self.layer().getTouchPriority()

    def isAccelerometerEnabled(self):
        return self.layer().isAccelerometerEnabled()
    def setAccelerometerEnabled(self, bool value):
        self.layer().setAccelerometerEnabled(value)

    def setAccelerometerInterval(self,double interval):
        self.layer().setAccelerometerInterval(interval)

    def isKeypadEnabled(self):
        return self.layer().isKeypadEnabled()
    def setKeypadEnabled(self, bool value):
        self.layer().setKeypadEnabled(value)

    def registerScriptKeypadHandler(self, int nHandler):
        self.layer().registerScriptKeypadHandler(nHandler)
    def unregisterScriptKeypadHandler(self):
        self.layer().unregisterScriptKeypadHandler()

    def keyBackClicked(self):
        self.layer().keyBackClicked()
    def keyMenuClicked(self):
        self.layer().keyMenuClicked()

    # inline CCTouchScriptHandlerEntry* getScriptTouchHandlerEntry()
    # inline CCScriptHandlerEntry* getScriptKeypadHandlerEntry()
    # inline CCScriptHandlerEntry* getScriptAccelerateHandlerEntry()


cdef class CCLayerColor(CCLayer):
    cdef inline ccLayer.CCLayerColor* color(self):
        return <ccLayer.CCLayerColor*>self._co

    @classmethod
    def create_node(cls):
        cdef CCLayerColor o = cls()
        o._co = <cocoa.CCObject*>ccLayer.CCLayerColor_node()
        return o

    @classmethod
    def create(cls, ccColor4B color=None, width=None, height=None):
        cdef CCLayerColor o = cls()
        if color is None:
            o._co = <cocoa.CCObject*>ccLayer.CCLayerColor_create()
        elif width is None:
            o._co = <cocoa.CCObject*>ccLayer.CCLayerColor_create(color._co)
        else:
            o._co = <cocoa.CCObject*>ccLayer.CCLayerColor_create(color._co,
                    width, height)
        return o

    def initWithColor(self, ccColor4B color, width=None, height=None):
        if width is None:
            return self.color().initWithColor(color._co)
        else:
            return self.color().initWithColor(color._co,
                    width, height)


    def changeWidth(self, w):
        self.color().changeWidth(w)

    def changeHeight(self, h):
        self.color().changeHeight(h)

    def changeWidthAndHeight(self, w, h):
        self.color().changeWidthAndHeight(w, h)

    def setOpacityModifyRGB(self, bValue):
        self.color().setOpacityModifyRGB(bValue)

    def isOpacityModifyRGB(self):
        return self.color().isOpacityModifyRGB()




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


cdef class CCDirectorDelegate:
    cdef include_h.CCDirectorDelegate* _co
    def updateProjection(self):
        self._co.updateProjection()


#---------------tilemap.pxd---------------
cdef class CCParallaxNode(CCNode):
    cdef inline tilemap.CCParallaxNode* pnode(self):
        return <tilemap.CCParallaxNode*>self._co

    @classmethod
    def create(cls):
        cdef CCParallaxNode o = cls()
        o._co = <cocoa.CCObject*>tilemap.CCParallaxNode_create()
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new tilemap.CCParallaxNode()

    def addChild1(self, CCNode child, int z, 
            CCPoint parallaxRatio, CCPoint positionOffset):
        self.pnode().addChild(child.node(), z,
                parallaxRatio._co, positionOffset._co)




cdef class CCTileMapAtlas(CCAtlasNode):
    # CC_PROPERTY(struct sImageTGA*, m_pTGAInfo, TGAInfo)
    cdef inline tilemap.CCTileMapAtlas* tmatlas(self):
        return <tilemap.CCTileMapAtlas*>self._co

    @classmethod
    def create(cls, tile, mapFile, tileWidth, tileHeight):
        cdef CCTileMapAtlas o = cls()
        o._co = <cocoa.CCObject*>tilemap.CCTileMapAtlas_create(tile,
                mapFile, tileWidth, tileHeight)
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new tilemap.CCTileMapAtlas()
   
    # bool initWithTileFile(const char *tile, const char *mapFile, int tileWidth, int tileHeight)

    def tileAt(self, CCPoint position):
        cdef ccColor3B o = ccColor3B()
        o._co = self.tmatlas().tileAt(position._co)
        return o

    def setTile(self, ccColor3B tile, CCPoint position):
        self.tmatlas().setTile(tile._co, position._co)

    def releaseMap(self):
        self.tmatlas().releaseMap()




cdef class CCTMXObjectGroup(CCObject):
    cdef inline tilemap.CCTMXObjectGroup* group(self):
        return <tilemap.CCTMXObjectGroup*>self._co

    # /** offset position of child objects */
    # CC_SYNTHESIZE_PASS_BY_REF(CCPoint, m_tPositionOffset, PositionOffset)
    # /** list of properties stored in a dictionary */
    # CC_PROPERTY(CCDictionary*, m_pProperties, Properties)
    # /** array of the objects */
    # CC_PROPERTY(CCArray*, m_pObjects, Objects)
    def new(self):
        self._co = <cocoa.CCObject*>new tilemap.CCTMXObjectGroup()

    def getGroupName(self):
        return self.group().getGroupName()

    def setGroupName(self, groupName):
        self.group().setGroupName(groupName)

    # CCString *propertyNamed(const char* propertyName)
    # CCDictionary* objectNamed(const char *objectName)


cdef class CCTMXLayerInfo(CCObject):
    cdef inline tilemap.CCTMXLayerInfo* info(self):
        return <tilemap.CCTMXLayerInfo*>self._co

    # CC_PROPERTY(CCDictionary*, m_pProperties, Properties)
    def new(self):
        self._co = <cocoa.CCObject*>new tilemap.CCTMXLayerInfo()

    # virtual ~CCTMXLayerInfo()


cdef class CCTMXTilesetInfo(CCObject):
    cdef inline tilemap.CCTMXTilesetInfo* info(self):
        return <tilemap.CCTMXTilesetInfo*>self._co

    def new(self):
        self._co = <cocoa.CCObject*>new tilemap.CCTMXTilesetInfo()

    # virtual ~CCTMXTilesetInfo()
    def rectForGID(self, gid):
        cdef CCRect o = CCRect()
        o._co = self.info().rectForGID(gid)
        return o


cdef class CCTMXMapInfo(CCObject):#, public CCSAXDelegator
    cdef inline tilemap.CCTMXMapInfo* info(self):
        return <tilemap.CCTMXMapInfo*>self._co

    @classmethod
    def formatWithTMXFile(cls, tmxFile):
        cdef CCTMXMapInfo o = cls()
        o._co = <cocoa.CCObject*>tilemap.CCTMXMapInfo_formatWithTMXFile(tmxFile)
        return o 

    @classmethod
    def formatWithXML(cls, tmxString, resourcePath):
        cdef CCTMXMapInfo o = cls()
        o._co = <cocoa.CCObject*>tilemap.CCTMXMapInfo_formatWithXML(tmxString, 
                resourcePath)
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new tilemap.CCTMXMapInfo()

    # virtual ~CCTMXMapInfo()
    # bool initWithTMXFile(const char *tmxFile)
    # bool initWithXML(const char* tmxString, const char* resourcePath)

    def parseXMLFile(self, xmlFilename):
        return self.info().parseXMLFile(xmlFilename)

    def parseXMLString(self, xmlString):
        return self.info().parseXMLString(xmlString)

    def getTileProperties(self):
        cdef CCDictionary o = CCDictionary()
        o._co = <cocoa.CCObject*>self.info().getTileProperties()
        return o

    def setTileProperties(self, CCDictionary tileProperties):
        self.info().setTileProperties(tileProperties.dict())

    # def startElement(self, void *ctx, const char *name, const char **atts)
    # void endElement(void *ctx, const char *name)
    # void textHandler(void *ctx, const char *ch, int len)
    
    def getCurrentString(self):
        return self.info().getCurrentString()

    def setCurrentString(self, currentString):
        self.info().setCurrentString(currentString)

    def getTMXFileName(self):
        return self.info().getTMXFileName()

    def setTMXFileName(self, fileName):
        self.info().setTMXFileName(fileName)



cdef class CCTMXLayer(CCSpriteBatchNode):
    cdef inline tilemap.CCTMXLayer* layer(self):
        return <tilemap.CCTMXLayer*>self._co

    @classmethod
    def create(cls, CCTMXTilesetInfo tilesetInfo, 
            CCTMXLayerInfo layerInfo, 
            CCTMXMapInfo mapInfo):
        cdef CCTMXLayer o = cls()
        o._co = <cocoa.CCObject*>tilemap.CCTMXLayer_create(
                tilesetInfo.info(),
                layerInfo.info(),
                mapInfo.info(),
                )
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new tilemap.CCTMXLayer()
    # virtual ~CCTMXLayer()
  
    # bool initWithTilesetInfo(CCTMXTilesetInfo *tilesetInfo, CCTMXLayerInfo *layerInfo, CCTMXMapInfo *mapInfo)

    def releaseMap(self):
        self.layer().releaseMap()

    def tileAt(self, CCPoint tileCoordinate):
        cdef CCSprite o = CCSprite()
        o._co = <cocoa.CCObject*>self.layer().tileAt(tileCoordinate._co)
        return o

    def tileGIDAt(self, CCPoint tileCoordinate, flags=None):
        cdef tilemap.ccTMXTileFlags fg
        if flags is None:
            return self.layer().tileGIDAt(tileCoordinate._co)
        fg = flags
        return self.layer().tileGIDAt(tileCoordinate._co, &fg)


    def setTileGID(self, gid, CCPoint tileCoordinate, flags=None):
        if flags is None:
            self.layer().setTileGID(gid, tileCoordinate._co)
        else:
            self.layer().setTileGID(gid, tileCoordinate._co, flags)

    def removeTileAt(self, CCPoint tileCoordinate):
        self.layer().removeTileAt(tileCoordinate._co)

    def positionAt(self, CCPoint tileCoordinate):
        cdef CCPoint o = CCPoint()
        o._co = self.layer().positionAt(tileCoordinate._co)
        return o

    # CCString *propertyNamed(const char *propertyName)
    def setupTiles(self):
        self.layer().setupTiles()

    def getLayerName(self):
        return self.layer().getLayerName()
    def setLayerName(self, layerName):
        self.layer().setLayerName(layerName)

    

cdef class CCTMXTiledMap(CCNode):
    cdef inline tilemap.CCTMXTiledMap* map(self):
        return <tilemap.CCTMXTiledMap*>self._co

    @classmethod
    def create(cls, tmxFile):
        cdef CCTMXTiledMap o = cls()
        o._co = <cocoa.CCObject*>tilemap.CCTMXTiledMap_create(tmxFile)
        return o

    @classmethod
    def createWithXML(cls, tmxString, resourcePath):
        cdef CCTMXTiledMap o = cls()
        o._co = <cocoa.CCObject*>tilemap.CCTMXTiledMap_createWithXML(
                tmxString, resourcePath)
        return o


    def getMapSize(self):
        o = CCSize()
        o._co = self.map().getMapSize()
        return o
    def setMapSize(self, CCSize var):
        self.map().setMapSize(var._co)

    def getTileSize(self):
        o = CCSize()
        o._co = self.map().getTileSize()
        return o
    def setTileSize(self, CCSize var):
        self.map().setTileSize(var._co)

    def getMapOrientation(self):
        return self.map().getMapOrientation()
    def setMapOrientation(self, var):
        self.map().setMapOrientation(var)

    def getObjectGroups(self):
        o = CCArray()
        o._co = <cocoa.CCObject*>self.map().getObjectGroups()
        return o
    def setObjectGroups(self, CCArray var):
        self.map().setObjectGroups(var.array())

    def getProperties(self):
        o = CCDictionary()
        o._co = <cocoa.CCObject*>self.map().getProperties()
        return o
    def setProperties(self, CCDictionary var):
        self.map().setProperties(var.dict())

    def layerNamed(self, layerName):
        cdef CCTMXLayer o = CCTMXLayer()
        o._co = <cocoa.CCObject*>self.map().layerNamed(layerName)
        return o

    def objectGroupNamed(self, groupName):
        cdef CCTMXObjectGroup o = CCTMXObjectGroup()
        o._co = <cocoa.CCObject*>self.map().objectGroupNamed(groupName)
        return o 

    # CCString *propertyNamed(const char *propertyName)
    def propertiesForGID(self, GID):
        cdef CCDictionary o = CCDictionary()
        o._co = <cocoa.CCObject*>self.map().propertiesForGID(GID)
        return o



#-------------ccScheduler.pxd--------------
cdef class CCTimer(CCObject):
    cdef ccScheduler.CCTimer* timer(self):
        return <ccScheduler.CCTimer*> self._co

    @classmethod
    def timerWithTarget(cls, CallBack cb, fSeconds=None):
        cdef CCTimer o = cls()
        if fSeconds is None:
            o._co = <cocoa.CCObject*>ccScheduler.CCTimer_timerWithTarget(&cb._co, 
                    cb.get_Schedule())
        else:
            o._co = <cocoa.CCObject*>ccScheduler.CCTimer_timerWithTarget(&cb._co, 
                    cb.get_Schedule(), fSeconds)
        return o

    @classmethod
    def timerWithScriptHandler(cls, int nHandler, float fSeconds):
        o = cls()
        o.set_co(<int>ccScheduler.CCTimer_timerWithScriptHandler(nHandler, fSeconds))
        return o

    def new(self):
        self._co = <cocoa.CCObject*>new ccScheduler.CCTimer()
        self.autorelease()
        return self

    def getInterval(self):
        return self.timer().getInterval()
    def setInterval(self, float fInterval):
        self.timer().setInterval(fInterval)
    Interval = property(getInterval, setInterval)

    # def getSelector(self):
    #     return <int>self.timer().getSelector()

    def initWithTarget(self, CallBack cb):
        return self.timer().initWithTarget(&cb._co, cb.get_Schedule())

    def initWithTarget(self, CallBack cb, 
            fSeconds=None, unsigned int nRepeat=0, float fDelay=0.0):
        if fSeconds is None:
            return self.timer().initWithTarget(&cb._co, cb.get_Schedule())
        return self.timer().initWithTarget(&cb._co, cb.get_Schedule(),
                fSeconds, nRepeat, fDelay)

    def initWithScriptHandler(self, int nHandler, float fSeconds):
        return self.timer().initWithScriptHandler(nHandler, fSeconds)

    def getScriptHandler(self):
        return self.timer().getScriptHandler()


cdef class CCScheduler(CCObject):
    cdef inline ccScheduler.CCScheduler* scheduler(self):
        return <ccScheduler.CCScheduler*>self._co

    def getTimeScale(self):
        return self.scheduler().getTimeScale()
    def setTimeScale(self, float fTimeScale):
        self.scheduler().setTimeScale(fTimeScale)
    TimeScale = property(getTimeScale, setTimeScale)

    def scheduleSelector(self, CallBack cb,
        float fInterval, repeat=None, delay=0.0, bool bPaused=False):
        if repeat is None:
            self.scheduler().scheduleSelector(cb.get_Schedule(), &cb._co,
                    fInterval, bPaused)
        else:
            self.scheduler().scheduleSelector(cb.get_Schedule(), &cb._co,
                    fInterval, repeat, delay, bPaused)

    def scheduleUpdateForTarget(self, CallBack cb, int nPriority, bool bPaused):
        self.scheduler().scheduleUpdateForTarget(&cb._co, nPriority, bPaused)

    def unscheduleSelector(self, CallBack cb):
        self.scheduler().unscheduleSelector(cb.get_Schedule(), &cb._co)

    def unscheduleUpdateForTarget(self, CCObject pTarget):
        self.scheduler().unscheduleUpdateForTarget(pTarget._co)

    def unscheduleAllForTarget(self, CCObject pTarget):
        self.scheduler().unscheduleAllForTarget(pTarget._co)

    def unscheduleAll(self):
        self.scheduler().unscheduleAll()
    
    def unscheduleAllWithMinPriority(self, int nMinPriority):
        self.scheduler().unscheduleAllWithMinPriority(nMinPriority)

    def scheduleScriptFunc(self, unsigned int nHandler, float fInterval, bool bPaused):
        return self.scheduler().scheduleScriptFunc(nHandler, fInterval, bPaused)
    
    def unscheduleScriptEntry(self, unsigned int uScheduleScriptEntryID):
        self.scheduler().unscheduleScriptEntry(uScheduleScriptEntryID)

    def pauseTarget(self, CCObject pTarget):
        self.scheduler().pauseTarget(pTarget._co)

    def resumeTarget(self, CCObject pTarget):
        self.scheduler().resumeTarget(pTarget._co)

    def isTargetPaused(self, CCObject pTarget):
        return self.scheduler().isTargetPaused(pTarget._co)

    def pauseAllTargets(self):
        o = CCSet()
        o._co = self.scheduler().pauseAllTargets()
        return o

    def pauseAllTargetsWithMinPriority(self, int nMinPriority):
        o = CCSet()
        o._co = self.scheduler().pauseAllTargetsWithMinPriority(nMinPriority)
        return o

    def resumeTargets(self, CCSet targetsToResume):
        self.scheduler().resumeTargets(targetsToResume.set())


cdef class CCDirector(CCObject):
    cdef inline ccDirector.CCDirector* director(self):
        return <ccDirector.CCDirector*> self._co

    @classmethod
    def sharedDirector(cls):
        o = cls()
        o.set_co(<int>ccDirector.sharedDirector())
        return o

    def init(self):
        return self.director().init()

    def getClassTypeInfo(self):
        return self.director().getClassTypeInfo()

    def getRunningScene(self):
        # return create_by(self.director().getRunningScene())
        cdef ccScene.CCScene* s = self.director().getRunningScene()
        if s == NULL:
            return
        o = CCScene()
        o._co = <cocoa.CCObject*>s
        return o

    def getAnimationInterval(self):
        return self.director().getAnimationInterval()
    def setAnimationInterval(self, double dValue):
        self.director().setAnimationInterval(dValue)
    AnimationInterval = property(getAnimationInterval, setAnimationInterval)

    def isDisplayStats(self):
        return self.director().isDisplayStats()
    def setDisplayStats(self, bool bDisplayStats):
        self.director().setDisplayStats(bDisplayStats)
    DisplayStats = property(isDisplayStats, setDisplayStats)

    def getSecondsPerFrame(self):
        return self.director().getSecondsPerFrame()

    def getOpenGLView(self):
        o = CCEGLView()
        o._co = self.director().getOpenGLView()
        return o
    def setOpenGLView(self, CCEGLView pobOpenGLView):
        self.director().setOpenGLView(pobOpenGLView._co)
    OpenGLView = property(getOpenGLView, setOpenGLView)

    def isNextDeltaTimeZero(self):
        return self.director().isNextDeltaTimeZero()
    def setNextDeltaTimeZero(self, bool bNextDeltaTimeZero):
        self.director().setNextDeltaTimeZero(bNextDeltaTimeZero)
    NextDeltaTimeZero = property(isNextDeltaTimeZero, setNextDeltaTimeZero)

    def isPaused(self):
        return self.director().isPaused()

    def getTotalFrames(self):
        return self.director().getTotalFrames()

    def getProjection(self):
        return self.director().getProjection()
    def setProjection(self, ccDirector.ccDirectorProjection kProjection):
        self.director().setProjection(kProjection)
    Projection = property(getProjection, setProjection)

    def isSendCleanupToScene(self):
        return self.director().isSendCleanupToScene()

    def getNotificationNode(self):
        o = CCNode()
        o._co = <cocoa.CCObject*>self.director().getNotificationNode()
        return o
    def setNotificationNode(self, CCNode node):
        self.director().setNotificationNode(node.node())
    NotificationNode = property(getNotificationNode, setNotificationNode)

    def getDelegate(self):
        o = CCDirectorDelegate()
        o._co = self.director().getDelegate()
        return o
    def setDelegate(self, CCDirectorDelegate pDelegate):
        self.director().setDelegate(pDelegate._co)
    Delegate = property(getDelegate, setDelegate)

    def getWinSize(self):
        o = CCSize()
        o._co = self.director().getWinSize()
        return o

    def getWinSizeInPixels(self):
        o = CCSize()
        o._co = self.director().getWinSizeInPixels()
        return o

    def getVisibleSize(self):
        o = CCSize()
        o._co = self.director().getVisibleSize()
        return o

    def getVisibleOrigin(self):
        o = CCPoint()
        o._co = self.director().getVisibleOrigin()
        return o

    def convertToGL(self, CCPoint obPoint):
        o = CCPoint()
        o._co = self.director().convertToGL(obPoint._co)
        return o

    def convertToUI(self, CCPoint obPoint):
        o = CCPoint()
        o._co = self.director().convertToUI(obPoint._co)
        return o

    def getZEye(self):
        return self.director().getZEye()

    def runWithScene(self, CCScene pScene):
        self.director().runWithScene(pScene.scene())

    def pushScene(self, CCScene pScene):
        self.director().pushScene(pScene.scene())

    def popScene(self):
        self.director().popScene()

    def popToRootScene(self):
        self.director().popToRootScene()

    def replaceScene(self, CCScene pScene):
        self.director().replaceScene(pScene.scene())

    def end(self):
        self.director().end()

    def pause(self):
        self.director().pause()

    def resume(self):
        self.director().resume()

    def stopAnimation(self):
        self.director().stopAnimation()

    def startAnimation(self):
        self.director().startAnimation()

    def drawScene(self):
        self.director().drawScene()

    def purgeCachedData(self):
        self.director().purgeCachedData()

    def setGLDefaultValues(self):
        self.director().setGLDefaultValues()

    def setAlphaBlending(self, bool bOn):
        self.director().setAlphaBlending(bOn)

    def setDepthTest(self, bool bOn):
        self.director().setDepthTest(bOn)

    def mainLoop(self):
        self.director().mainLoop()

    def getContentScaleFactor(self):
        return self.director().getContentScaleFactor()
    def setContentScaleFactor(self, float scaleFactor):
        self.director().setContentScaleFactor(scaleFactor)
    ContentScaleFactor = property(getContentScaleFactor, setContentScaleFactor)


    """ #CC_PROPERTY(CCScheduler*, m_pScheduler, Scheduler); """
    def getScheduler(self):
        o = CCScheduler()
        o._co = <cocoa.CCObject*>self.director().getScheduler()
        return o
    def setScheduler(self, CCScheduler var):
        self.director().setScheduler(var.scheduler())
    Scheduler = property(getScheduler, setScheduler)

    # #CC_PROPERTY(CCActionManager*, m_pActionManager, ActionManager);
    def getActionManager(self):
        o = CCActionManager()
        o._co = <cocoa.CCObject*>self.director().getActionManager()
        return o
    def setActionManager(self, CCActionManager var):
        self.director().setActionManager(var.mgr())
    ActionManager = property(getActionManager, setActionManager)

    # #CC_PROPERTY(CCTouchDispatcher*, m_pTouchDispatcher, TouchDispatcher);
    def getTouchDispatcher(self):
        o = CCTouchDispatcher()
        o._co = <cocoa.CCObject*>self.director().getTouchDispatcher()
        return o
    def setTouchDispatcher(self, CCTouchDispatcher var):
        self.director().setTouchDispatcher(var.disp())
    TouchDispatcher = property(getTouchDispatcher, setTouchDispatcher)

    # #CC_PROPERTY(CCKeypadDispatcher*, m_pKeypadDispatcher, KeypadDispatcher);
    def getKeypadDispatcher(self):
        o = CCKeypadDispatcher()
        o._co = <cocoa.CCObject*>self.director().getKeypadDispatcher()
    def setKeypadDispatcher(self, CCKeypadDispatcher var):
        self.director().setKeypadDispatcher(var.disp())
    KeypadDispatcher = property(getKeypadDispatcher, setKeypadDispatcher)

        # #CC_PROPERTY(CCAccelerometer*, m_pAccelerometer, Accelerometer);
        # CCAccelerometer* getAccelerometer()
        # void setAccelerometer(CCAccelerometer* var)


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
                    &cb._co, cb.get_MenuHandler()))
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
                    &cb._co, cb.get_MenuHandler(),
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
                    &cb._co, cb.get_MenuHandler(),
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
                    disabledImage, &cb._co, cb.get_MenuHandler()))
        elif disabledImage:
            o.set_co(<int>menu_nodes.CCMenuItemImage_create(normalImage, selectedImage,
                    disabledImage))
        elif cb:
            o.set_co(<int>menu_nodes.CCMenuItemImage_create(normalImage, selectedImage,
                    &cb._co, cb.get_MenuHandler()))
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
                    &cb._co, cb.get_MenuHandler(),
                    item.item(), 
                    NULL)
        elif l == 1:
            co = menu_nodes.CCMenuItemToggle_createWithTarget(
                    &cb._co, cb.get_MenuHandler(),
                    item.item(), 
                    (<CCObject>args[0])._co, 
                    NULL)
        elif l == 2:
            co = menu_nodes.CCMenuItemToggle_createWithTarget(
                    &cb._co, cb.get_MenuHandler(),
                    item.item(), 
                    (<CCObject>args[0])._co, 
                    (<CCObject>args[1])._co, 
                    NULL)
        elif l == 3:
            co = menu_nodes.CCMenuItemToggle_createWithTarget(
                    &cb._co, cb.get_MenuHandler(),
                    item.item(), 
                    (<CCObject>args[0])._co, 
                    (<CCObject>args[1])._co, 
                    (<CCObject>args[2])._co, 
                    NULL)
        elif l == 4:
            co = menu_nodes.CCMenuItemToggle_createWithTarget(
                    &cb._co, cb.get_MenuHandler(),
                    item.item(), 
                    (<CCObject>args[0])._co, 
                    (<CCObject>args[1])._co, 
                    (<CCObject>args[2])._co, 
                    (<CCObject>args[3])._co, 
                    NULL)
        elif l == 5:
            co = menu_nodes.CCMenuItemToggle_createWithTarget(
                    &cb._co, cb.get_MenuHandler(),
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

    def updateString(self, bool fromUpdate):
        self.font().updateString(fromUpdate)

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
    def TTFNode(cls):
        o = cls()
        o.set_co(<int>label_nodes.CCLabelTTF_node())
        return o

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


cdef void _call_back(void* data, int t, cocoa.CCObject* var1, 
            void* var2, float var3):
    cdef CallBack cb_obj = <CallBack>data
    cb_obj._call_back(t, var1, var2, var3)


cdef class CallBack:
    cdef CCPyFunc _co
    cdef object caches, obj

    # cdef inline CCPyFunc* func(self):
    #     return <CCPyFunc*>self._co
    def __cinit__(self, obj=None):
        self.init(obj)

    cdef init(self, object obj):
        self.caches = PyDict_New()
        self._co.init(<void*>self, <call_back_func>&_call_back)
        self.obj = obj

    def reg(self, CCObject obj):
        PyDict_SetItem(self.caches, <int>obj._co, obj)

    def unreg(self, CCObject obj):
        PyDict_DelItem(self.caches, <int>obj._co)

    cdef inline _new_obj(self, cocoa.CCObject* co, cls):
        cdef CCObject o = cls()
        o._co = co
        return o

    cdef object _get_obj(self, cocoa.CCObject* co, cls=CCObject):
        cdef PyObject* obj = PyDict_GetItem(self.caches, <int>co)
        if obj != NULL:
            return <object>obj
        return self._new_obj(co, cls)

    cdef inline _call_obj(self, int t, cocoa.CCObject* var1, 
            void* var2, float var3):
        try:
            #use switch
            if t == 0:#CB_SCHEDULE:
                self.obj(var3)
            elif t == 1:#CB_CallFunc:
                self.obj()
            elif t == 2:
                self.obj(self._get_obj(var1, CCNode))
            elif t == 3:#CB_CallFuncND
                self.obj(self._get_obj(var1), <int>var2)
            elif t in (4, 5, 7):#CB_CallFuncN:
                self.obj(self._get_obj(var1))
            elif t == 6:
                self.obj(self._get_obj(var1, CCEvent))
            return -1
        except:
            traceback.print_exc()

    cdef inline _call_self(self, int t, cocoa.CCObject* var1,
            void* var2, float var3):
        if t == 0:
            self.Schedule(var3)
        elif t == 1:
            self.CallFunc()
        elif t == 2:
            self.CallFuncN(self._get_obj(var1, CCNode))
        elif t == 3:
            self.CallFuncND(self._get_obj(var1, CCNode), <int>var2)
        elif t == 4:
            self.CallFuncO(self._get_obj(var1))
        elif t == 5:
            self.MenuHandler(self._get_obj(var1))
        elif t == 6:
            self.EventHandler(self._get_obj(var1, CCEvent))
        elif t == 7:
            self.Compare(self._get_obj(var1))
        return -1


    cdef inline _call_back(self, int t, cocoa.CCObject* var1, 
            void* var2, float var3):
        if self.obj is not None:
            self._call_obj(t, var1, var2, var3)

    cdef inline cocoa.SEL_SCHEDULE get_Schedule(self):
        return self._co.get_Schedule()

    cdef inline cocoa.SEL_CallFunc get_CallFunc(self):
        return self._co.get_CallFunc()

    cdef inline cocoa.SEL_CallFuncN get_CallFuncN(self):
        return self._co.get_CallFuncN()

    cdef inline cocoa.SEL_CallFuncND get_CallFuncND(self):
        return self._co.get_CallFuncND()

    cdef inline cocoa.SEL_CallFuncO get_CallFuncO(self):
        return self._co.get_CallFuncO()

    cdef inline cocoa.SEL_MenuHandler get_MenuHandler(self):
        return self._co.get_MenuHandler()

    cdef inline cocoa.SEL_EventHandler get_EventHandler(self):
        return self._co.get_EventHandler()

    cdef inline cocoa.SEL_Compare get_Compare(self):
        return self._co.get_Compare()



cdef int _touch(void* data, int t, touch.CCTouch* pTouch, touch.CCEvent* pEvent):
    cdef PyxDelegate pyobj = <PyxDelegate>data
    return pyobj._touch(t, pTouch, pEvent)

cdef void _touchs(void* data, int t, cocoa.CCSet* pTouchs, touch.CCEvent* pEvent):
    cdef PyxDelegate pyobj = <PyxDelegate>data
    pyobj._touchs(t, pTouchs, pEvent)

cdef class PyxDelegate:
    cdef CCPyDelegate _co
    def __cinit__(self):
        self.init()

    def init(self):
        self._co.init(<void*>self, <touch_func>&_touch, <touchs_func>&_touchs)

    cdef _touch(self, int t, touch.CCTouch* pTouch, touch.CCEvent* pEvent):
        cdef CCTouch th = CCTouch()
        cdef CCEvent e = CCEvent()
        th._co = <cocoa.CCObject*>pTouch
        e._co = <cocoa.CCObject*>pEvent
        if t == 0:
            return self.Began(th, e)
        elif t == 1:
            self.Moved(th, e)
        elif t == 2:
            self.Ended(th, e)
        elif t == 3:
            self.Cancelled(th, e)
        return -1

    cdef _touchs(self, int t, cocoa.CCSet* pTouchs, touch.CCEvent* pEvent):
        cdef CCSet th = CCSet()
        cdef CCEvent e = CCEvent()
        th._co = <cocoa.CCObject*>pTouchs
        e._co = <cocoa.CCObject*>pEvent
        if t == 4:
            self.sBegan(th, e)
        elif t == 5:
            self.sMoved(th, e)
        elif t == 6:
            self.sEnded(th, e)
        elif t == 7:
            self.sCancelled(th, e)


def get_typeof(CCObject obj):
    return typeof(obj._co)

def type_name(CCObject obj):
    return cc_type_name(obj._co)

# cdef object create_by(pointer _co):
#     if typeof(_co) == typeof(ccScene.CCScene*):
#         return CCScene()._set_co(_co)


def ccpClamp(CCPoint p, CCPoint min_inclusive, CCPoint max_inclusive):
    o = CCPoint()
    o._co = support.ccpClamp(p._co, min_inclusive._co, max_inclusive._co)
    return o

#---------------------
#---------------------
#---------------------
