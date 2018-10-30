package workbench;

import lumps.plaintext.r.Readme;
import openfl.Lib;
import openfl.events.Event;

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
	
	//These are passed as arguments into the panels, so there's reduced need having to track everything.
	var menu_text:TextBox;
	var items_text:TextBox;
	var lump_text:TextBox;
	var preview_text:TextBox;
	
	public function new(_name:String, _load:Bool, _a:Panel, _b:Panel, _c:Panel, _d:Panel) 
	{
		menu = _a;
		items = _b;
		lump = _c;
		preview = _d;
		
		project_name = _name;
		menu.title = "Home: " + project_name;
	}
	function set_preview_plaintext() {
		preview.set_mode_plaintext(preview_text);
	}
}