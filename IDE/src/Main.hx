package;

import gui.Frontpanel;
import haxe.ui.containers.Box;
import openfl.display.Sprite;
import openfl.Lib;
import haxe.ui.Toolkit;
import lime.system.System;
import sys.FileSystem;
import sys.io.File;

import handlers.Project;
import handlers.Common;

/**
 * ...
 * @author kevansevans
 */
class Main extends Sprite 
{
	
	//gui stuff
	var frontpanel:Frontpanel;
	
	public function new() 
	{
		super();
		
		Project.NEW_SCRATCH = new_project_scratch;
		Project.NEW_QUICK = new_quick_project;
		
		Toolkit.init();
		
		frontpanel = new Frontpanel();
		addChild(frontpanel);
		
		create_new_directories("test_project");
	}
	
	function new_project_scratch() {
		
		var new_box:Box = new Box();
		addChild(new_box);
		new_box.x = 10;
		new_box.y = 50;
		new_box.backgroundColor = 0xBBBBBB;
		new_box.width = 400;
		new_box.height = 250;
	}
	
	function new_quick_project() {
		
	}
	
	function create_new_directories(_path:String) {
		Common.SETTINGS.name = _path;
		
		FileSystem.createDirectory(System.applicationStorageDirectory + "/ZSDK/" + _path);
		FileSystem.createDirectory(System.documentsDirectory + "/ZSDK/" + _path);
	}
}