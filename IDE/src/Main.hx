package;

import common.ClassLists;
import haxe.Json;
import haxe.ui.containers.TabView;
import items.ClassBuilder;

import openfl.display.Sprite;
import openfl.Assets;
import openfl.events.Event;

import haxe.ui.Toolkit;
import haxe.ui.containers.menus.MenuBar;
import haxe.ui.containers.menus.Menu;


/**
 * ...
 * @author kevansevans
 */
class Main extends Sprite 
{
	
	public static var assetBar:TabView;
	
	var toolbar:MenuBar;
	
	var file:Menu;
	
	var testclass:ClassBuilder;
	
	public function new() {
		
		super();
		
		new ClassLists();
		
		Toolkit.init();
		
		toolbar = new MenuBar();
		addChild(toolbar);
		
		assetBar = new TabView();
		addChild(assetBar);
		
		file = new Menu();
		file.text = "File";
		toolbar.addComponent(file);
		
		testclass = new ClassBuilder("MyCustomClass", 0);
		assetBar.addComponent(testclass);
		assetBar.getPage(0).text = testclass.fileName;
		
		resize();
		
	}
	
	public function resize(?_event:Event) {
		
		toolbar.width = stage.stageWidth;
		
		testclass.resize();
		
	}

}
