package gui;

import haxe.ui.containers.menus.Menu;
import haxe.ui.containers.menus.MenuBar;
import haxe.ui.containers.menus.MenuItem;
import haxe.ui.containers.menus.MenuSeparator;
import haxe.ui.events.UIEvent;
import openfl.display.Sprite;
import openfl.Lib;
import openfl.net.URLRequest;
import openfl.display.Stage;
import openfl.events.Event;

import handlers.Project;

/**
 * ...
 * @author Kaelan
 */
class FileBar extends Sprite
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
		
	var about:Menu;
		var about_zsdk:MenuItem;
		var about_hxdoom:MenuItem;
		var about_separator:MenuSeparator;
		var about_download:MenuItem;
		
	function build_toolbar() 
	{
		#if sys
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
		#end
		
		about = new Menu();
		about.text = "About";
		toolbar.addComponent(about);
			
			about_zsdk = new MenuItem();
			about_zsdk.text = "ZSDK Project";
			about_zsdk.onClick = function(e:UIEvent) {
				Lib.navigateToURL(new URLRequest("https://github.com/kevansevans/ZSDK"), "_blank");
			}
			about.addComponent(about_zsdk);
			
			about_hxdoom = new MenuItem();
			about_hxdoom.text = "HxDoom Project";
			about_hxdoom.onClick = function(e:UIEvent) {
				Lib.navigateToURL(new URLRequest("https://github.com/kevansevans/HxDoom"), "_blank");
			}
			about.addComponent(about_hxdoom);
			
			#if !sys
			about_separator = new MenuSeparator();
			about.addComponent(about_separator);
			
			about_download = new MenuItem();
			about_download.text = "Download ZSDK!";
			about_download.onClick = function(e:UIEvent) {
				Lib.navigateToURL(new URLRequest("https://github.com/kevansevans/ZSDK/releases/latest"), "_blank");
			}
			about.addComponent(about_download);
			#end
	}
	
	function resize(?e:Event):Void 
	{
		toolbar.width = stageroot.stageWidth;
	}
	
}