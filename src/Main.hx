package;

import openfl.display.Sprite;
import openfl.Lib;
import openfl.events.Event;
import openfl.events.MouseEvent;
import workbench.Project;

/**
 * ...
 * @author kevansevans
 */
class Main extends Sprite 
{
	var ctrl_panel:Panel;
	var dir_panel:Panel;
	var lump_panel:Panel;
	var prev_panel:Panel;
	var project:Project;
	public function new() 
	{
		super();
		
		editor_mode();
	}
	function editor_mode() {
		ctrl_panel = new Panel(300, "Start");
		addChild(ctrl_panel);
		
		dir_panel = new Panel(300, "Item List");
		addChild(dir_panel);
		
		lump_panel = new Panel(600, "Current Lump");
		addChild(lump_panel);
		
		prev_panel = new Panel(600, "Lump preview");
		addChild(prev_panel);
		
		Lib.current.stage.addEventListener(Event.RESIZE, resize);
		resize();
		
		ctrl_panel.toggle_collapse.addEventListener(MouseEvent.CLICK, function(e:MouseEvent) {
			update_panel(ctrl_panel);
		});
		dir_panel.toggle_collapse.addEventListener(MouseEvent.CLICK, function(e:MouseEvent) {
			update_panel(dir_panel);
		});
		lump_panel.toggle_collapse.addEventListener(MouseEvent.CLICK, function(e:MouseEvent) {
			update_panel(lump_panel);
		});
		prev_panel.toggle_collapse.addEventListener(MouseEvent.CLICK, function(e:MouseEvent) {
			update_panel(prev_panel);
		});
		
		project = new Project("Test Project", false, ctrl_panel, dir_panel, lump_panel, prev_panel);
	}
	public function resize(?e:Event) {
		ctrl_panel.update();
		dir_panel.update();
		lump_panel.update();
		prev_panel.update();
		
		align();
	}
	public function align() {
		ctrl_panel.x = 20;
		ctrl_panel.y = 50;
		
		dir_panel.x = ctrl_panel.x + ctrl_panel.width + 5;
		dir_panel.y = 50;
		
		lump_panel.x = dir_panel.x + dir_panel.width + 5;
		lump_panel.y = 50;
		
		prev_panel.x = lump_panel.x + lump_panel.width + 5;
		prev_panel.y = 50;
	}
	function update_panel(_panel:Panel) {
		_panel.collapsed = _panel.collapsed == true ? false : true;
		_panel.update();
		align();
	}
}