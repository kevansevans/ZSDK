package lumps.plaintext.g;

import haxe.ds.Vector;

import lumps.base.Plaintext;

/**
 * ...
 * @author kevansevans
 */
enum abstract IWAD(String) from String {
	public var doom_one:String = "doom.wad";
	public var doom_two:String = "doom2.wad";
	public var doom_twof:String = "doom2f.wad";
	public var doom_tnt:String = "tnt.wad";
	public var doom_plutonia:String = "plutonia.wad";
	public var heretic:String = "heretic.wad";
	public var hexen:String = "hexen.wad";
	public var hexen_dd:String = "hexdd.wad";
	public var strife:String = "strife1.wad";
	public var strife_ve:String = "sve.wad";
	public var chexquest:String = "chex.wad";
}
enum abstract FTP_IWAD(String) from String {
	public var doom:String = "doom1.wad";
	public var heretic:String = "heretic1.wad";
	public var hexen:String = "hexen.wad";
	public var strife:String = "strife0.wad";
	public var freedoom_1:String = "freedoom1.wad";
	public var freedoom_2:String = "freedoom2.wad";
	public var freeDM:String = "freedm.wad";
	public var blasphemer:String = "heretic.wad";
	public var chexquest3:String = "chex3.wad";
	public var actiondoom2:String = "action2.wad";
	public var harmony:String = "harm1.wad";
	public var hacx:String = "hacx.wad";
	public var advOfSqr:String = "square1.pk3";
	public var delaweare:String = "delaweare.wad";
}
enum abstract Startup(String) from String {
	public var Doom:String;
	public var Heretic:String;
	public var Strife:String;
}
class Gameinfo extends Plaintext 
{
	public var iwad:Null<String>;
	public var load:Array<String>;
	public var nospriterename:Bool = false;
	public var startuptitle:Null<String>;
	public var startupcolors:Vector<Null<Int>> = new Vector(2);
	public var startuptype:Null<String>;
	public var startupsong:Null<String>;
	public function new(_lumpname:String, _directory:String="") 
	{
		super(_lumpname, _directory);
	}
	public function add_load(_file:String) {
		if (load == null) {
			load = new Array();
		}
		load.push(_file);
	}
	/*
	public function set_color_enum(_enum:StartupColors) {
		startupcolors[0] = _enum[0];
		startupcolors[1] = _enum[1];
	}
	public function set_color_custom(_fore:Int, _back:Int) {
		startupcolors[0] = _fore;
		startupcolors[1] = _back;
	}*/
	override public function compile() 
	{
		super.compile();
		
		if (iwad != null) blocktext += 'IWAD = \"$iwad\"\n'; 
		if (load != null) {
			blocktext += 'LOAD = ';
			for (a in load) {
				blocktext += '\"$a",';
			}
			blocktext = blocktext.substring(blocktext.length -1, blocktext.length); //simple way to remove the last comma in the string;
			blocktext += '\n';
		}
		if (nospriterename == true) blocktext += 'NOSPRITERENAME\n';
		if (startupcolors[0] != null && startupcolors[1] != null) blocktext += 'STARTUPCOLORS = \"$startupcolors[0]\", \"$startupcolors[1]\"\n';
		if (startuptype != null) blocktext += 'STARTUPTYPE = \"$startuptype\"\n';
		if (startuptype != null) blocktext += 'STARTUPSONG = \"$startupsong\"\n';
	}
}