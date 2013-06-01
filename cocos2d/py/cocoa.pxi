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
        o.init(capacity=capacity)
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

    def __cinit__(self, alist=None):
        if alist is not None:
            cap = len(alist)
            self.init(capacity=cap)
            for i in alist:
                self.addObject(i)

    def init(self, capacity=None):
        if capacity is None:
            self._co = <cocoa.CCObject*>cocoa.CCArray_create()
        else:
            self._co = <cocoa.CCObject*>cocoa.CCArray_createWithCapacity(capacity)

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
