package bench;

import h2d.Object;
import lumps.Lump;

import lumps.plaintext.r.Readme;

/**
 * ...
 * @author kevansevans
 */
enum abstract WadType(String) from String {
	var wad:String;
	var pk3:String;
	var iwad:String;
	var ipk3:String;
}
enum abstract LumpIndex(Int) from Int {
	var README:Int;
}
class Project extends Object 
{
	public var lumps:Array<Lump>;
	public static var working_dir(get, never):String;
	public static var prj_name:String = "Untitled";
	public var readme:Readme;
	public function new(_name:String, ?parent:Object) 
	{
		super(parent);
		
		prj_name = _name;
		
		lumps = new Array();
		
		lumps[LumpIndex.README] = new Readme(prj_name);
		
		compile();
		export();
	}
	static function get_working_dir():String {
		return("./data/projects/" + prj_name);
	}
	public function compile() {
		for (a in lumps) {
			a.compile();
		}
	}
	public function export() {
		for (a in lumps) {
			a.export();
		}
	}
	public function package_wad() {
		
	}
}