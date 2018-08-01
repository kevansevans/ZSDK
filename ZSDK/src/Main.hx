package;

import lumps.g.Gameinfo;
import openfl.display.Sprite;
import lime.system.System;
import sys.FileSystem;

import src.common.LocalStorage;
import export.GZDWad;

import haxe.ui.Toolkit;
import haxe.ui.components.Button;
import haxe.ui.components.Label;

/**
 * ...
 * @author kevansevans
 */
class Main extends Sprite 
{
	var startup_data:LocalStorage;
	public function new() 
	{
		super();
				
		startup_data = new LocalStorage();
		startup_data.load_local();
		
		check_directories();
		
		Toolkit.init();
		
		var gameinfo = new Gameinfo();
	}
	function check_directories() 
	{
		if (!FileSystem.isDirectory(System.documentsDirectory + "/ZSDK")) FileSystem.createDirectory(System.documentsDirectory + "/ZSDK");
	}
}
