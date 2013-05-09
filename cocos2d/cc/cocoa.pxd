# distutils: language = c++

from libcpp cimport bool
from libcpp.string cimport string
from libcpp.set cimport set
from shaders cimport *


cdef extern from "stdarg.h":
    ctypedef struct va_list:
        pass
    ctypedef struct fake_type:
        pass
    void va_start(va_list, void* arg)
    void* va_arg(va_list, fake_type)
    void va_end(va_list)
    fake_type int_type "int"




cdef extern from "cocos2d.h" namespace "cocos2d":
    #------------CCAffineTransform.h------------
    ctypedef struct CCAffineTransform:
      float a, b, c, d
      float tx, ty

    CCAffineTransform __CCAffineTransformMake(float a, float b, float c, float d, float tx, float ty)
    #define CCAffineTransformMake __CCAffineTransformMake

    CCPoint __CCPointApplyAffineTransform(const CCPoint& point, const CCAffineTransform& t)
    #define CCPointApplyAffineTransform __CCPointApplyAffineTransform

    CCSize __CCSizeApplyAffineTransform(const CCSize& size, const CCAffineTransform& t)
    #define CCSizeApplyAffineTransform __CCSizeApplyAffineTransform

    CCAffineTransform CCAffineTransformMakeIdentity()
    CCRect CCRectApplyAffineTransform(const CCRect& rect, const CCAffineTransform& anAffineTransform)

    CCAffineTransform CCAffineTransformTranslate(const CCAffineTransform& t, float tx, float ty)
    CCAffineTransform CCAffineTransformRotate(const CCAffineTransform& aTransform, float anAngle)
    CCAffineTransform CCAffineTransformScale(const CCAffineTransform& t, float sx, float sy)
    CCAffineTransform CCAffineTransformConcat(const CCAffineTransform& t1, const CCAffineTransform& t2)
    bool CCAffineTransformEqualToTransform(const CCAffineTransform& t1, const CCAffineTransform& t2)
    CCAffineTransform CCAffineTransformInvert(const CCAffineTransform& t)

    const CCAffineTransform CCAffineTransformIdentity




    #-------------CCZone.h-------------
    cppclass CCZone:
        CCObject *m_pCopyObject
        CCZone(CCObject *pObject = NULL)

    cppclass CCCopying:
        CCObject* copyWithZone(CCZone* pZone)

    cppclass CCObject(CCCopying):
        unsigned int m_uID
        int m_nLuaID
        CCObject() except +
        void release()
        void retain()
        CCObject* autorelease()
        CCObject* copy()
        bool isSingleReference()
        unsigned int retainCount()
        bool isEqual(CCObject* pObject)
        void update(float dt)

#    ctypedef void (CCObject::*SEL_SCHEDULE)(float)
    ctypedef int SEL_SCHEDULE
    ctypedef int SEL_CallFunc
    ctypedef int SEL_CallFuncN
    ctypedef int SEL_CallFuncND
    ctypedef int SEL_CallFuncO
    ctypedef int SEL_MenuHandler
    ctypedef int SEL_EventHandler
    ctypedef int SEL_Compare
    #define schedule_selector(_SELECTOR) (SEL_SCHEDULE)(&_SELECTOR)
    SEL_SCHEDULE schedule_selector(void *p)
    #define callfunc_selector(_SELECTOR) (SEL_CallFunc)(&_SELECTOR)
    #define callfuncN_selector(_SELECTOR) (SEL_CallFuncN)(&_SELECTOR)
    #define callfuncND_selector(_SELECTOR) (SEL_CallFuncND)(&_SELECTOR)
    #define callfuncO_selector(_SELECTOR) (SEL_CallFuncO)(&_SELECTOR)
    #define menu_selector(_SELECTOR) (SEL_MenuHandler)(&_SELECTOR)
    #define event_selector(_SELECTOR) (SEL_EventHandler)(&_SELECTOR)
    #define compare_selector(_SELECTOR) (SEL_Compare)(&_SELECTOR)

    #-----------CCInteger.h---------------
    cppclass CCInteger(CCObject):
        CCInteger(int v)
        int getValue() const
    CCInteger* CCInteger_create "cocos2d::CCInteger::create"(int v)


    #-----------CCDouble.h-------------------
    cppclass CCDouble(CCObject):
        CCDouble(double v)
        double getValue() const
    CCDouble* CCDouble_create "cocos2d::CCDouble::create"(double v)

    #----------CCFloat.h-------------------
    cppclass CCFloat(CCObject):
        CCFloat(float v)
        float getValue() const

    CCFloat* CCFloat_create "cocos2d::CCFloat::create" (float v)

    #------------CCBool.h---------------
    cppclass CCBool(CCObject):
        CCBool(bool v)
        bool getValue()
    CCBool* CCBool_create "cocos2d::CCBool::create"(bool v)



    #---------------CCGeometry.h----------------
    cppclass CCPoint:
        float x, y
        CCPoint() except +
        CCPoint(float x, float y) except +
        CCPoint(CCPoint& other) except +
        void setPoint(float x, float y)
        bool equals(CCPoint& target)

    cppclass CCSize:
        float width, height
        CCSize() except +
        CCSize(float width, float height) except +
        CCSize(CCSize& other) except +
        void setSize(float width, float height)
        bool equals(CCSize& target)

    cppclass CCRect:
        CCPoint origin
        CCSize size
        CCRect() except +
        CCRect(float x, float y, float width, float height) except +
        CCRect(CCRect& other) except +
        void setRect(float x, float y, float width, float height)
        float getMinX()
        float getMidX()
        float getMaxX()
        float getMinY()
        float getMidY()
        float getMaxY()
        bool equals(CCRect& rect)
        bool containsPoint(CCPoint& point)
        bool intersectsRect(CCRect& rect)

    CCPoint CCPointZero
    CCSize CCSizeZero
    CCRect CCRectZero

    #--------------CCNS.h----------------
    CCRect CCRectFromString(const char* pszContent)
    CCPoint CCPointFromString(const char* pszContent)
    CCSize CCSizeFromString(const char* pszContent)


    #------------CCString.h--------------
    cppclass CCString(CCObject):
        string m_sString
        CCString()
        CCString(const char* str)
        CCString(const string& str)
        CCString(const CCString& str)
        #CCString& operator= (const CCString& other)
        bool initWithFormat(const char* format, ...)
        int intValue() const
        unsigned int uintValue() const
        float floatValue() const
        double doubleValue() const
        bool boolValue() const
        const char* getCString() const
        unsigned int length() const
        int compare(const char *) const

    ctypedef struct CCStringCompare

    CCString* CCString_create "cocos2d::CCString::create"(const string& str)
    CCString* CCString_createWithFormat "cocos2d::CCString::createWithFormat"(const char* format, ...)
    CCString* CCString_createWithData "cocos2d::CCString::createWithData"(const unsigned char* pData, unsigned long nLen)
    CCString* CCString_createWithContentsOfFile "cocos2d::CCString::createWithContentsOfFile"(const char* pszFileName)



    #-----------CCSet.h----------------
    ctypedef set[CCObject*].iterator CCSetIterator
    #CCSetIteratorStruct:fix iterator 定义成类的错误, 
    ctypedef struct CCSetIteratorStruct"cocos2d::CCSetIterator":
        pass

    cppclass CCSet(CCObject):
        CCSet() nogil except +
        CCSet(const CCSet &rSetObject) nogil except +
        CCSet* copy()
        CCSet* mutableCopy()
        int count()
        void addObject(CCObject *pObject)
        void removeObject(CCObject *pObject)
        void removeAllObjects()
        bool containsObject(CCObject *pObject)
        CCSetIterator begin()
        CCSetIterator end()
        CCObject* anyObject()


    #------------CCArray.h-----------
    cppclass CCArray(CCObject):
        CCArray* data
        CCArray() except +
        CCArray(unsigned int capacity) except +
        bool init()
        bool initWithObject(CCObject* pObject)
        bool initWithObjects(CCObject* pObject, ...)
        bool initWithCapacity(unsigned int capacity)
        bool initWithArray(CCArray* otherArray)
        unsigned int count()
        unsigned int capacity()
        unsigned int indexOfObject(CCObject* object)
        CCObject* objectAtIndex(unsigned int index)
        CCObject* lastObject()
        CCObject* randomObject()
        bool containsObject(CCObject* object)
        bool isEqualToArray(CCArray* pOtherArray)
        void addObject(CCObject* object)
        void addObjectsFromArray(CCArray* otherArray)
        void insertObject(CCObject* object, unsigned int index)
        void removeLastObject(bool bReleaseObj)
        void removeObject(CCObject* object, bool bReleaseObj)
        void removeObjectAtIndex(unsigned int index, bool bReleaseObj)
        void removeObjectsInArray(CCArray* otherArray)
        void removeAllObjects()
        void fastRemoveObject(CCObject* object)
        void fastRemoveObjectAtIndex(unsigned int index)
        void exchangeObject(CCObject* object1, CCObject* object2)
        void exchangeObjectAtIndex(unsigned int index1, unsigned int index2)
        void replaceObjectAtIndex(unsigned int uIndex, CCObject* pObject, bool bReleaseObject = true)
        void reverseObjects()
        void reduceMemoryFootprint()

    CCArray* CCArray_create "cocos2d::CCArray::create"()
    CCArray* CCArray_create "cocos2d::CCArray::create"(CCObject* pObject, ...)
    CCArray* CCArray_createWithObject "cocos2d::CCArray::createWithObject"(CCObject* pObject)
    CCArray* CCArray_createWithCapacity "cocos2d::CCArray::createWithCapacity"(unsigned int capacity)
    CCArray* CCArray_createWithArray "cocos2d::CCArray::createWithArray"(CCArray* otherArray)
    CCArray* CCArray_createWithContentsOfFile "cocos2d::CCArray::createWithContentsOfFile"(const char* pFileName)
    CCArray* CCArray_createWithContentsOfFileThreadSafe "cocos2d::CCArray::createWithContentsOfFileThreadSafe"(const char* pFileName)



    ctypedef void* intptr_t
    ctypedef struct UT_hash_handle:
        pass

    #------------CCDictionary.h---------------
    cppclass CCDictElement:
        UT_hash_handle hh
        inline const char* getStrKey()
        inline intptr_t getIntKey()
        inline CCObject* getObject()

    cppclass CCDictionary(CCObject):
        CCDictElement* m_pElements
        CCDictionary() nogil except +
        unsigned int count()
        CCArray* allKeys()
        CCArray* allKeysForObject(CCObject* object)
        CCObject* objectForKey(const string& key)
        CCObject* objectForKey(int key)
        const CCString* valueForKey(const string& key)
        const CCString* valueForKey(int key)
        void setObject(CCObject* pObject, const string& key)
        void setObject_int"cocos2d::CCDictionary::setObject"(CCObject* pObject, int key)
        void removeObjectForKey(const string& key)
        void removeObjectForKey(int key)
        void removeObjectsForKeys(CCArray* pKeyArray)
        void removeAllObjects()
        CCObject* randomObject()

    CCDictionary* CCDictionary_create "cocos2d::CCDictionary::create"()
    CCDictionary* CCDictionary_createWithDictionary "cocos2d::CCDictionary::createWithDictionary"(CCDictionary* srcDict)
    CCDictionary* CCDictionary_createWithContentsOfFile "cocos2d::CCDictionary::createWithContentsOfFile"(const char *pFileName)
    CCDictionary* CCDictionary_createWithContentsOfFileThreadSafe "cocos2d::CCDictionary::createWithContentsOfFileThreadSafe"(const char *pFileName)



    #------------CCAutoreleasePool.h-----------
    cppclass CCAutoreleasePool(CCObject):
        CCArray*    m_pManagedObjectArray
        CCAutoreleasePool()
        void addObject(CCObject *pObject)
        void removeObject(CCObject *pObject)
        void clear()

    cppclass CCPoolManager:
        CCArray*    m_pReleasePoolStack
        CCAutoreleasePool*                    m_pCurReleasePool
        CCAutoreleasePool* getCurReleasePool()
        CCPoolManager()
        void finalize()
        void push()
        void pop()
        void removeObject(CCObject* pObject)
        void addObject(CCObject* pObject)

    CCPoolManager* CCPoolManager_sharedPoolManager "cocos2d::CCPoolManager::sharedPoolManager"()
    void CCPoolManager_purgePoolManager "cocos2d::CCPoolManager::purgePoolManager"()












