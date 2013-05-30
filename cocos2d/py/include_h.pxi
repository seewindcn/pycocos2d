
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


cdef class CCDirectorDelegate:
    cdef include_h.CCDirectorDelegate* _co
    def updateProjection(self):
        self._co.updateProjection()





