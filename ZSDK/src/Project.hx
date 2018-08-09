package;


import haxe.ui.components.Button;
import haxe.ui.containers.Box;
import openfl.display.Sprite;
import openfl.events.Event;

import src.common.SVar;
import common.Log;
import lumps.Lump;
import lumps.plaintext.m.Mapinfo;

import haxe.ui.components.TabBar;
import haxe.ui.containers.TabView;
import haxe.ui.components.Label;

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
	var lump_list:Array<Lump>;
	
	var root_tabview:TabView;
	var menus:Array<Label>;
	
	public function new(_name:String, _load:Bool = false) 
	{
		super();
		
		SVar.projectName = _name;
		Log.event("Init project: " + _name + ", Loaded = " + _load);
		
		this.x = 10;
		this.y = 60;
		
		root_tabview = new TabView();
		root_tabview.width = 1920 - 60;
		root_tabview.height = 1080 - 120;
		
		menus = new Array();
		menus[MenuIndex.Homeinfo] = new Label();
		menus[MenuIndex.Homeinfo].text = "Home";
		menus[MenuIndex.Homeinfo].addComponent(new Button());
		
		menus[MenuIndex.Readme] = new Label();
		menus[MenuIndex.Readme].text = "Readme";
		
		root_tabview.addComponent(menus[MenuIndex.Homeinfo]);
		root_tabview.addComponent(menus[MenuIndex.Readme]);
		
		addChild(root_tabview);
	}
	public function align(_w:Int, _h:Int) {
		this.x = 10;
		this.y = 40;
		root_tabview.width = _w - 60;
		root_tabview.height = _h - 80;
	}
}