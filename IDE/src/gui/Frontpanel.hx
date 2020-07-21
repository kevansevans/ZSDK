package gui;

import haxe.ui.containers.menus.Menu;
import haxe.ui.containers.menus.MenuBar;
import haxe.ui.containers.menus.MenuItem;
import haxe.ui.events.UIEvent;
import openfl.display.Sprite;
import openfl.Lib;
import openfl.display.Stage;
import openfl.events.Event;

import handlers.Project;

/**
 * ...
 * @author Kaelan
 */
class Frontpanel extends Sprite
{
	var toolbar:MenuBar;
	var stageroot:Stage;
	public function new() 
	{
		super();
		
		toolbar = new MenuBar();
		addChild(toolbar);
		
		stageroot = Lib.current.stage;
		stageroot.addEventListener(Event.RESIZE, resize);
		
		build_toolbar();
	}
	
	var file:Menu;
		var file_new:Menu;
			var file_new_quick:MenuItem;
			var file_new_scratch:MenuItem;
			var file_new_import:MenuItem;
		var file_save:Menu;
		var file_saveas:Menu;
		var file_load:Menu;
		
	function build_toolbar() 
	{
		file = new Menu();
		file.text = "File";
		toolbar.addComponent(file);
		
			file_new = new Menu();
			file_new.text = "New";
			file.addComponent(file_new);
			
				file_new_quick = new MenuItem();
				file_new_quick.text = "Quick Editor";
				file_new.addComponent(file_new_quick);
			
				file_new_scratch = new MenuItem();
				file_new_scratch.text = "New Project";
				file_new.addComponent(file_new_scratch);
				file_new_scratch.onClick = function(e:UIEvent) {
					Project.NEW_SCRATCH();
				}
	}
	
	function resize(?e:Event):Void 
	{
		toolbar.width = stageroot.stageWidth;
	}
	
}