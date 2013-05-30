

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
