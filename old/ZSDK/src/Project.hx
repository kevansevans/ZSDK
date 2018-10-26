package;


import flgui.TabBar;
import lumps.base.Bitmap;
import openfl.display.Sprite;
import openfl.events.Event;

import src.common.SVar;
import common.Log;
import lumps.Lump;
import lumps.ui.h.Home;
import lumps.ui.r.Readme;

/**
 * ...
 * @author kevansevans
 */
enum abstract MenuIndex(Int) from Int { //sorted alphabetically
	public var Gameinfo:Int;
	public var Homeinfo:Int;
	public var Mapinfo:Int;
	public var Playpal:Int;
	public var Readme:Int;
}
class Project extends Sprite
{
	var tabs:TabBar;
	var lump_list:Array<Lump>;
	
	var home_box:Home;
	
	//Textlumps UI

	var readme:Readme;
	
	public function new(_name:String, _load:Bool = false) 
	{
		super();
		
		SVar.projectName = _name;
		Log.event("Init project: " + _name + ", Loaded = " + _load);
		
		this.x = 10;
		this.y = 60;
	}
	public function align(_w:Int, _h:Int) {
		this.x = 10;
		this.y = 40;
	}
}