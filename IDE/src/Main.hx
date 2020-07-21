package;

import gui.FileBar;
import gui.items.WorkbenchTabs;
import haxe.ui.containers.Box;
import openfl.display.Sprite;
import openfl.Lib;
import haxe.ui.Toolkit;
import lime.system.System;

#if sys
import sys.FileSystem;
import sys.io.File;
#end

import handlers.Project;
import handlers.Common;

/**
 * ...
 * @author kevansevans
 */
class Main extends Sprite 
{
	
	//gui stuff
	var filebar:FileBar;
	var workbench:WorkbenchTabs;
	
	public function new() 
	{
		super();
		
		Toolkit.init();
		
		filebar = new FileBar();
		addChild(filebar);
		
		#if sys //targets that cannot access sys will always boot into quick mode
		Project.NEW_SCRATCH = new_project_scratch;
		Project.NEW_QUICK = new_quick_project;
		#else
		new_quick_project();
		#end
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
		
		workbench = new WorkbenchTabs();
		addChild(workbench);
		workbench.x = 10;
		workbench.y = 50;
		workbench.width = Lib.current.stage.stageWidth - 20;
	}
	
	#if sys
	function create_new_directories(_path:String) {
		Common.SETTINGS.name = _path;
		
		FileSystem.createDirectory(System.applicationStorageDirectory + "/ZSDK/" + _path);
		FileSystem.createDirectory(System.documentsDirectory + "/ZSDK/" + _path);
	}
	#end
}