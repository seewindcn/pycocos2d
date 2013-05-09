from libcpp cimport bool
from cocoa cimport *

cdef extern from "cocos2d.h" namespace "cocos2d":
    cppclass CCCamera(CCObject):
        CCCamera() nogil except +
        void init()
        const char* description()

        #/** sets the dirty value */
        inline void setDirty(bool bValue)
        #/** get the dirty value */
        inline bool isDirty()

        #/** sets the camera in the default position */
        void restore()
        #/** Sets the camera using gluLookAt using its eye, center and up_vector */
        void locate()
        #/** sets the eye values in points */
        void setEyeXYZ(float fEyeX, float fEyeY, float fEyeZ)
        #/** sets the center values in points */
        void setCenterXYZ(float fCenterX, float fCenterY, float fCenterZ)
        #/** sets the up values */
        void setUpXYZ(float fUpX, float fUpY, float fUpZ)

        #/** get the eye vector values in points */
        void getEyeXYZ(float *pEyeX, float *pEyeY, float *pEyeZ)
        #/** get the center vector values int points */
        void getCenterXYZ(float *pCenterX, float *pCenterY, float *pCenterZ)
        #/** get the up vector values */
        void getUpXYZ(float *pUpX, float *pUpY, float *pUpZ)


cdef extern from "cocos2d.h" namespace "cocos2d::CCCamera":
    float getZEye()

