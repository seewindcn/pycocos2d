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
