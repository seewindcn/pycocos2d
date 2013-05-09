# distutils: language = c++

from libcpp cimport bool
from touch cimport *
from cocoa cimport *
from ccNode cimport *
from platform cimport *
from sprite cimport *



cdef extern from "cocos2d.h" namespace "cocos2d":
    cppclass CCParallaxNode(CCNode):
        # /** array that holds the offset / ratio of the children */
        # CC_SYNTHESIZE(struct _ccArray *, m_pParallaxArray, ParallaxArray)

        # /** Adds a child to the container with a z-order, a parallax ratio and a position offset
        # It returns self, so you can chain several addChilds.
        # @since v0.8
        # */
        CCParallaxNode()

        void addChild(CCNode * child, unsigned int z, const CCPoint& parallaxRatio, const CCPoint& positionOffset)
        # // super methods
        void addChild(CCNode * child, unsigned int zOrder, int tag)
        void removeChild(CCNode* child, bool cleanup)
        void removeAllChildrenWithCleanup(bool cleanup)
        void visit()
    CCParallaxNode * CCParallaxNode_create"cocos2d::CCParallaxNode::create"()


    cppclass CCTileMapAtlas(CCAtlasNode):
        # /** TileMap info */
        # CC_PROPERTY(struct sImageTGA*, m_pTGAInfo, TGAInfo)

        CCTileMapAtlas()
       
        bool initWithTileFile(const char *tile, const char *mapFile, int tileWidth, int tileHeight)
        ccColor3B tileAt(const CCPoint& position)
        void setTile(const ccColor3B& tile, const CCPoint& position)
        void releaseMap()
    # /** creates a CCTileMap with a tile file (atlas) with a map file and the width and height of each tile in points.
    # The tile file will be loaded using the TextureMgr.
    # */
    CCTileMapAtlas * CCTileMapAtlas_create"cocos2d::CCTileMapAtlas::create"(const char *tile, const char *mapFile, int tileWidth, int tileHeight)



    cppclass CCTMXObjectGroup(CCObject):
        # /** offset position of child objects */
        # CC_SYNTHESIZE_PASS_BY_REF(CCPoint, m_tPositionOffset, PositionOffset)
        # /** list of properties stored in a dictionary */
        # CC_PROPERTY(CCDictionary*, m_pProperties, Properties)
        # /** array of the objects */
        # CC_PROPERTY(CCArray*, m_pObjects, Objects)
        CCTMXObjectGroup()
        # virtual ~CCTMXObjectGroup()

        const char* getGroupName()
        void setGroupName(const char *groupName)

        CCString *propertyNamed(const char* propertyName)
        CCDictionary* objectNamed(const char *objectName)


    ctypedef enum:
        TMXLayerAttribNone
        TMXLayerAttribBase64
        TMXLayerAttribGzip
        TMXLayerAttribZlib

    ctypedef enum:
        TMXPropertyNone,
        TMXPropertyMap,
        TMXPropertyLayer,
        TMXPropertyObjectGroup,
        TMXPropertyObject,
        TMXPropertyTile

    ctypedef enum ccTMXTileFlags:
        kCCTMXTileHorizontalFlag
        kCCTMXTileVerticalFlag
        kCCTMXTileDiagonalFlag
        kCCFlipedAll
        kCCFlippedMask



    cppclass CCTMXLayerInfo(CCObject):
        # CC_PROPERTY(CCDictionary*, m_pProperties, Properties)
        CCTMXLayerInfo()
        # virtual ~CCTMXLayerInfo()


    cppclass CCTMXTilesetInfo(CCObject):
        CCTMXTilesetInfo()
        # virtual ~CCTMXTilesetInfo()
        CCRect rectForGID(unsigned int gid)


    cppclass CCTMXMapInfo(CCObject):#, public CCSAXDelegator
        # /// map orientation
        # CC_SYNTHESIZE(int,    m_nOrientation, Orientation)
        # /// map width & height
        # CC_SYNTHESIZE_PASS_BY_REF(CCSize, m_tMapSize, MapSize)
        # /// tiles width & height
        # CC_SYNTHESIZE_PASS_BY_REF(CCSize, m_tTileSize, TileSize)
        # /// Layers
        # CC_PROPERTY(CCArray*, m_pLayers, Layers)
        # /// tilesets
        # CC_PROPERTY(CCArray*, m_pTilesets, Tilesets)
        # /// ObjectGroups
        # CC_PROPERTY(CCArray*, m_pObjectGroups, ObjectGroups)
        # /// parent element
        # CC_SYNTHESIZE(int, m_nParentElement, ParentElement)
        # /// parent GID
        # CC_SYNTHESIZE(unsigned int, m_uParentGID, ParentGID)
        # /// layer attribs
        # CC_SYNTHESIZE(int, m_nLayerAttribs, LayerAttribs)
        # /// is storing characters?
        # CC_SYNTHESIZE(bool, m_bStoringCharacters, StoringCharacters)
        # /// properties
        # CC_PROPERTY(CCDictionary*, m_pProperties, Properties)
        CCTMXMapInfo()
        # virtual ~CCTMXMapInfo()
        bool initWithTMXFile(const char *tmxFile)
        bool initWithXML(const char* tmxString, const char* resourcePath)
        bool parseXMLFile(const char *xmlFilename)
        bool parseXMLString(const char *xmlString)

        CCDictionary* getTileProperties()
        void setTileProperties(CCDictionary* tileProperties)

        void startElement(void *ctx, const char *name, const char **atts)
        void endElement(void *ctx, const char *name)
        void textHandler(void *ctx, const char *ch, int len)
        
        const char* getCurrentString()
        void setCurrentString(const char *currentString)
        const char* getTMXFileName()
        void setTMXFileName(const char *fileName)

    CCTMXMapInfo * CCTMXMapInfo_formatWithTMXFile"cocos2d::CCTMXMapInfo::formatWithTMXFile"(const char *tmxFile)
    CCTMXMapInfo * CCTMXMapInfo_formatWithXML"cocos2d::CCTMXMapInfo::formatWithXML"(const char* tmxString, const char* resourcePath)



    cppclass CCTMXLayer(CCSpriteBatchNode):
        # /** size of the layer in tiles */
        # CC_SYNTHESIZE_PASS_BY_REF(CCSize, m_tLayerSize, LayerSize)
        # /** size of the map's tile (could be different from the tile's size) */
        # CC_SYNTHESIZE_PASS_BY_REF(CCSize, m_tMapTileSize, MapTileSize)
        # /** pointer to the map of tiles */
        # CC_SYNTHESIZE(unsigned int*, m_pTiles, Tiles)
        # /** Tileset information for the layer */
        # CC_PROPERTY(CCTMXTilesetInfo*, m_pTileSet, TileSet)
        # /** Layer orientation, which is the same as the map orientation */
        # CC_SYNTHESIZE(unsigned int, m_uLayerOrientation, LayerOrientation)
        # /** properties from the layer. They can be added using Tiled */
        # CC_PROPERTY(CCDictionary*, m_pProperties, Properties)

        CCTMXLayer()
        # virtual ~CCTMXLayer()
      

        bool initWithTilesetInfo(CCTMXTilesetInfo *tilesetInfo, CCTMXLayerInfo *layerInfo, CCTMXMapInfo *mapInfo)

        void releaseMap()

        CCSprite* tileAt(const CCPoint& tileCoordinate)

        unsigned int  tileGIDAt(const CCPoint& tileCoordinate)

        unsigned int tileGIDAt(const CCPoint& tileCoordinate, ccTMXTileFlags* flags)

        void setTileGID(unsigned int gid, const CCPoint& tileCoordinate)

        void setTileGID(unsigned int gid, const CCPoint& tileCoordinate, ccTMXTileFlags flags)

        void removeTileAt(const CCPoint& tileCoordinate)

        CCPoint positionAt(const CCPoint& tileCoordinate)

        CCString *propertyNamed(const char *propertyName)

        void setupTiles()

        const char* getLayerName()
        void setLayerName(const char *layerName)

    CCTMXLayer * CCTMXLayer_create"cocos2d::CCTMXLayer::create"(CCTMXTilesetInfo *tilesetInfo, CCTMXLayerInfo *layerInfo, CCTMXMapInfo *mapInfo)


    ctypedef enum:
        CCTMXOrientationOrtho,
        CCTMXOrientationHex,
        CCTMXOrientationIso,


    cppclass CCTMXTiledMap(CCNode):
        # /** the map's size property measured in tiles */
        # CC_SYNTHESIZE_PASS_BY_REF(CCSize, m_tMapSize, MapSize)
        CCSize getMapSize()
        void setMapSize(CCSize)
        # /** the tiles's size property measured in pixels */
        # CC_SYNTHESIZE_PASS_BY_REF(CCSize, m_tTileSize, TileSize)
        CCSize getTileSize()
        void setTileSize(CCSize)
        # /** map orientation */
        # CC_SYNTHESIZE(int, m_nMapOrientation, MapOrientation)
        int getMapOrientation()
        void setMapOrientation(int var)
        # /** object groups */
        # CC_PROPERTY(CCArray*, m_pObjectGroups, ObjectGroups)
        CCArray* getObjectGroups()
        void setObjectGroups(CCArray*)
        # /** properties */
        # CC_PROPERTY(CCDictionary*, m_pProperties, Properties)
        CCDictionary* getProperties()
        void setProperties(CCDictionary*)

        CCTMXTiledMap()
        # virtual ~CCTMXTiledMap()

        bool initWithTMXFile(const char *tmxFile)

        bool initWithXML(const char* tmxString, const char* resourcePath)

        CCTMXLayer* layerNamed(const char *layerName)

        CCTMXObjectGroup* objectGroupNamed(const char *groupName)

        CCString *propertyNamed(const char *propertyName)

        CCDictionary* propertiesForGID(int GID)

    CCTMXTiledMap* CCTMXTiledMap_create"cocos2d::CCTMXTiledMap::create"(const char *tmxFile)
    CCTMXTiledMap* CCTMXTiledMap_createWithXML"cocos2d::CCTMXTiledMap::createWithXML"(const char* tmxString, const char* resourcePath)








