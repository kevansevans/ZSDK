package;

import lime.system.System;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.Lib;
import sys.FileSystem;
import sys.io.File;

import src.common.LocalStorage;
import src.common.SVar;

import haxe.ui.Toolkit;
import haxe.ui.components.Button;
import haxe.ui.components.TextField;
import haxe.ui.components.Column;
import haxe.ui.core.MouseEvent;

/**
 * ...
 * @author kevansevans
 */
class Main extends Sprite 
{
	var startup_data:LocalStorage;
	var project_title:TextField;
	var load_field:Column;
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
		
		#if (debug)
			clear_home();
			start_new_project("Debug Project Template");
			project = new Project("Debug Project Template");
			addChild(project);
			project.align(Lib.current.stage.stageWidth, Lib.current.stage.stageHeight);
		#end
	}
	function check_directories() 
	{
		if (!FileSystem.isDirectory(System.documentsDirectory + "/ZSDK")) FileSystem.createDirectory(System.documentsDirectory + "/ZSDK");
		if (!FileSystem.isDirectory(System.documentsDirectory + "/ZSDK/projects")) FileSystem.createDirectory(System.documentsDirectory + "/ZSDK/projects");
	}
	function check_if_valid(_name:String):Bool {
		return(FileSystem.isDirectory(System.documentsDirectory + "/ZSDK/projects/" + _name));
	}
	function start_new_project(_name:String) 
	{
		FileSystem.createDirectory(System.documentsDirectory + "/ZSDK/projects/" + _name);
		FileSystem.createDirectory(System.documentsDirectory + "/ZSDK/projects/" + _name + "/src"); //where the assets are stored akin to a slade project
		FileSystem.createDirectory(System.documentsDirectory + "/ZSDK/projects/" + _name + "/bin"); //output directory to minimize conflicting compiles
		FileSystem.createDirectory(System.documentsDirectory + "/ZSDK/projects/" + _name + "/data");//Stored needed to be remembered data
		FileSystem.createDirectory(System.documentsDirectory + "/ZSDK/projects/" + _name + "/log"); //Debugging purposes
		
		var out = File.append(System.documentsDirectory + "/ZSDK/projects/" + _name + "/data/#README - DON'T DELETE THESE FILES.txt");
		out.writeString(SVar.data_readme);
		out.close();
		
		clear_home();
		
		project = new Project(_name);
		addChild(project);
	}
	function load_project(_name:String) {
		if (!FileSystem.isDirectory(System.documentsDirectory + "/ZSDK/projects/" + _name)) return;
		
		clear_home();
		
		project = new Project(_name, true);
		addChild(project);
	}
	function clear_home() {
		removeChild(start_new);
		removeChild(project_title);
		removeChild(load_field);
	}
	function resize_stage(e:Event) {
		project.align(Lib.current.stage.stageWidth, Lib.current.stage.stageHeight);
	}
}
