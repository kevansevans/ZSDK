package workbench;

import lime.system.System;
import openfl.Lib;
import openfl.events.Event;
import workbench.components.DirParser;
import workbench.panels.Control;

import lumps.plaintext.r.Readme;

import workbench.components.TextBox;

/**
 * ...
 * @author kevansevans
 */
class Project 
{
	public static var menu:Panel;
	public static var items:Panel;
	public static var lump:Panel;
	public static var preview:Panel;
	
	var readme:Readme;
	
	public static var project_name:String;
	public static var working_dir:String;
	
	//These are passed as arguments into the panels, so there's reduced need having to track everything.
	var menu_text:TextBox;
	var items_text:TextBox;
	var lump_text:TextBox;
	var preview_text:TextBox;
	
	var control:Control;
	var item_parse:DirParser;
	
	public function new(_name:String, _load:Bool, _a:Panel, _b:Panel, _c:Panel, _d:Panel) 
	{
		menu = _a;
		items = _b;
		lump = _c;
		preview = _d;
		
		project_name = _name;
		working_dir = System.documentsDirectory + "/ZSDK/projects/" + project_name +"/src/";
		menu.title = "Home: " + project_name;
		
		control = new Control();
		menu.container.addChild(control);
		
		item_parse = new DirParser();
		item_parse.get_list();
		
		items_text = new TextBox(Std.int(items.width - 20), Std.int(items.height - 120), Highlight.line_select);
		
		set_items_mode();
		
		items_text.field.text = item_parse.blocktext;
	}
	function set_preview_plaintext() {
		preview.set_mode_plaintext(preview_text);
	}
	function set_items_mode() {
		items.set_mode_plaintext(items_text);
	}
}