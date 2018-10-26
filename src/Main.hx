package;


import bench.Project;
import h2d.Dropdown;
import h2d.TextInput;
import hxd.Event;
import sys.FileSystem;
import ui.component.TextButton;

import h2d.Font;
import h2d.Text;
import hxd.App;
import hxd.res.DefaultFont;

import com.UserData;

/**
 * ...
 * @author kevansevans
 */
class Main extends App
{
	
	static function main() 
	{
		new Main();
	}
	var d_font:Font;
	var title:Text;
	var new_project:TextButton;
	var new_project_name:TextInput;
	var load_project:TextButton;
	var dir_dropdown:Dropdown;
	var dir_list:Array<String>;
	var root_project:Project;
	override function init() 
	{
		engine.backgroundColor = 0xCCCCCC;
		
		if (!FileSystem.isDirectory("./data/projects")) FileSystem.createDirectory("./data/projects");
		
		var data = new UserData();
		
		d_font = DefaultFont.get();
		title = new Text(d_font);
		
		s2d.addChild(title);
		
		title.textColor = 0;
		title.text = "ZSDK v" + UserData.i_version;
		
		new_project = new TextButton(100, 30, "New Project");
		s2d.addChild(new_project);
		new_project.x = 5;
		new_project.y = 20;
		new_project.inter.onClick = function(e:Event) {
			check_if_valid();
		}
		
		new_project_name = new TextInput(d_font, s2d);
		new_project_name.text = "Untitled";
		new_project_name.x = 120;
		new_project_name.y = 20;
		new_project_name.inputWidth = 300;
		new_project_name.backgroundColor = 0xAAAAAA;
		
		load_project = new TextButton(100, 30, "Load Project");
		s2d.addChild(load_project);
		load_project.x = 5;
		load_project.y = 60;
		
		scan_saves();
		
		dir_dropdown = new Dropdown();
		
		if (dir_list.length != 0) {
			s2d.addChild(dir_dropdown);
			dir_dropdown.x = 120;
			dir_dropdown.y = 60;
			for (a in dir_list) {
				var _text:Text = new Text(d_font);
				_text.text = a;
				dir_dropdown.addItem(_text);
			}
		}
		
		#if (debug)
		new_project_name.text = "Debug Test Project";
		check_if_valid();
		new_project_start();
		#end
	}
	function scan_saves() {
		var dirs = FileSystem.readDirectory("./data/projects");
		dir_list = dirs;
		if (dirs.length == 0) {
			s2d.removeChild(load_project);
			return;
		}
	}
	function check_if_valid() {
		if (FileSystem.isDirectory("./data/projects/" + new_project_name.text)) return;
		else {
			FileSystem.createDirectory("./data/projects/" + new_project_name.text);
			new_project_start();
		}
	}
	function new_project_start() {
		s2d.removeChild(new_project);
		s2d.removeChild(new_project_name);
		s2d.removeChild(load_project);
		s2d.removeChild(dir_dropdown);
		
		root_project = new Project(new_project_name.text, s2d);
	}
}