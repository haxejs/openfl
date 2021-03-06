package openfl.display;


@:jsRequire("openfl/display/Tilemap", "default")

extern class Tilemap extends DisplayObject {
	
	
	public var numTiles (get, never):Int;
	public var smoothing:Bool;
	public var tileAlphaEnabled:Bool;
	public var tileColorTransformEnabled:Bool;
	public var tileset (get, set):Tileset;
	
	public function new (width:Int, height:Int, tileset:Tileset = null, smoothing:Bool = true);
	
	public function addTile (tile:Tile):Tile;
	public function addTiles (tiles:Array<Tile>):Array<Tile>;
	public function addTileAt (tile:Tile, index:Int):Tile;
	public function contains (tile:Tile):Bool;
	public function getTileAt (index:Int):Tile;
	public function getTileIndex (tile:Tile):Int;
	public function getTiles ():TileGroup;
	public function removeTile (tile:Tile):Tile;
	public function removeTileAt (index:Int):Tile;
	public function removeTiles (beginIndex:Int = 0, endIndex:Int = 0x7fffffff):Void;
	public function setTiles (group:TileGroup):Void;
	
	
}