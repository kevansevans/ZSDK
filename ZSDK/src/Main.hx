package;

import haxe.ui.core.MouseEvent;
import openfl.display.Sprite;
import lime.system.System;
import sys.FileSystem;

import src.common.LocalStorage;

import haxe.ui.Toolkit;
import haxe.ui.components.Button;
import haxe.ui.components.TextField;

/**
 * ...
 * @author kevansevans
 */
class Main extends Sprite 
{
	var startup_data:LocalStorage;
	var project_title:TextField;
	var start_new:Button;
	var project:Project;
	
	public function new() 
	{
		super();
				
		startup_data = new LocalStorage();
		startup_data.load_local();
		
		check_directories();
		
		Toolkit.init();
		
		project_title = new TextField();
		addChild(project_title);
		project_title.width = 200;
		project_title.x = 20;
		project_title.y = 20;
		project_title.text = "Untitled ZSDK project";
		
		start_new = new Button();
		start_new.text = "Create new project";
		addChild(start_new);
		start_new.y = 20;
		start_new.x = 20 + project_title.width + 10;
		start_new.onClick = function(e:MouseEvent) {
			if (!check_if_valid(project_title.text)) {
				start_new_project(project_title.text);
			} else {
				trace("Folder exists");
			}
		}
	}
	function check_directories() 
	{
		if (!FileSystem.isDirectory(System.documentsDirectory + "/ZSDK")) FileSystem.createDirectory(System.documentsDirectory + "/ZSDK");
	}
	function check_if_valid(_name:String):Bool {
		return(FileSystem.isDirectory(System.documentsDirectory + "/ZSDK/" + _name));
	}
	function start_new_project(_name:String) 
	{
		FileSystem.createDirectory(System.documentsDirectory + "/ZSDK/" + _name);
		FileSystem.createDirectory(System.documentsDirectory + "/ZSDK/" + _name + "/src"); //where the assets are stored akin to a slade project
		FileSystem.createDirectory(System.documentsDirectory + "/ZSDK/" + _name + "/bin"); //output directory to minimize conflicting compiles
		FileSystem.createDirectory(System.documentsDirectory + "/ZSDK/" + _name + "/data");//Stored needed to be remembered data
		FileSystem.createDirectory(System.documentsDirectory + "/ZSDK/" + _name + "/log"); //Debugging purposes
		
		removeChild(start_new);
		removeChild(project_title);
		
		project = new Project(_name);
		addChild(project);
	}
}
