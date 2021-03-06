package openfl.display;


#if !openfl_debug
@:fileXml('tags="haxe,release"')
@:noDebug
#end


class TileGroup extends Tile {
	
	
	public var numTiles (get, never):Int;
	
	private var __tiles:Array<Tile>;
	
	
	#if openfljs
	private static function __init__ () {
		
		untyped Object.defineProperty (TileGroup.prototype, "numTiles", { get: untyped __js__ ("function () { return this.get_numTiles (); }") });
		
	}
	#end
	
	
	public function new (x:Float = 0, y:Float = 0, scaleX:Float = 1, scaleY:Float = 1, rotation:Float = 0, originX:Float = 0, originY:Float = 0) {
		
		super (-1, x, y, scaleX, scaleY, rotation, originX, originY);
		
		__tiles = new Array ();
		__length = 0;
		
	}
	
	
	public function addTile (tile:Tile):Tile {
		
		if (tile == null) return null;
		
		if (tile.parent == this) {
			
			__tiles.remove (tile);
			__length--;
			
		}
		
		__tiles[numTiles] = tile;
		tile.parent = this;
		__length++;
		
		__setRenderDirty ();
		
		return tile;
		
	}
	
	
	public function addTileAt (tile:Tile, index:Int):Tile {
		
		if (tile == null) return null;
		
		if (tile.parent == this) {
			
			var cacheLength = __tiles.length;
			
			__tiles.remove (tile);
			__length--;
			
			if (cacheLength > __tiles.length) {
				index--;
			}
			
		}
		
		__tiles.insert (index, tile);
		tile.parent = this;
		__length++;
		
		__setRenderDirty ();
		
		return tile;
		
	}
	
	
	public function addTiles (tiles:Array<Tile>):Array<Tile> {
		
		for (tile in tiles) {
			addTile (tile);
		}
		
		return tiles;
		
	}
	
	
	public override function clone ():TileGroup {
		
		var group = new TileGroup ();
		for (tile in __tiles) {
			group.addTile (tile.clone ());
		}
		return group;
		
	}
	
	
	public function contains (tile:Tile):Bool {
		
		return (__tiles.indexOf (tile) > -1);
		
	}
	
	
	public function copyFrom (other:TileGroup):Void {
		
		__tiles = other.__tiles.copy ();
		__setRenderDirty ();
		
	}
	
	
	public function getTileAt (index:Int):Tile {
		
		if (index >= 0 && index < numTiles) {
			
			return __tiles[index];
			
		}
		
		return null;
		
	}
	
	
	public function getTileIndex (tile:Tile):Int {
		
		for (i in 0...__tiles.length) {
			if (__tiles[i] == tile) return i;
		}
		
		return -1;
		
	}
	
	
	public function removeTile (tile:Tile):Tile {
		
		if (tile != null && tile.parent == this) {
			
			tile.parent = null;
			__tiles.remove (tile);
			__length--;
			__setRenderDirty ();
			
		}
		
		return tile;
		
	}
	
	
	public function removeTileAt (index:Int):Tile {
		
		if (index >= 0 && index < numTiles) {
			return removeTile (__tiles[index]);
		}
		
		return null;
		
	}
	
	
	public function removeTiles (beginIndex:Int = 0, endIndex:Int = 0x7fffffff):Void {
		
		if (beginIndex < 0) beginIndex = 0;
		if (endIndex > __tiles.length - 1) endIndex = __tiles.length - 1;
		
		var removed = __tiles.splice (beginIndex, endIndex - beginIndex + 1);
		for (tile in removed) {
			tile.parent = null;
		}
		__length = __tiles.length;
		
		__setRenderDirty ();
		
	}
	
	
	
	
	// Event Handlers
	
	
	
	
	private function get_numTiles ():Int {
		
		return __length;
		
	}
	
	
}