package components;


import openfl.Assets;
import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import openfl.events.MouseEvent;

#if (air)
	import flash.filesystem.File;
#elseif js
		
#elseif sys
	import sys.io.File;
	import sys.FileSystem;
	import lime.system.System;
	import sys.FileStat;
#end

import components.IconButton;
import global.Common;
import lr.menus.LoaderMenu;

/**
 * ...
 * @author Kaelan Evans
 */
@:enum abstract SaveType(Int) from Int {
	public var none:Int = -1;
	public var json:Int = 0;
	public var trk:Int = 1;
	public var sol:Int = 2;
	public var dir:Int = 3;
}
class FileList  extends Sprite
{
	public var iconList:Array<FileInfoIcon>;
	var directory:String;
	var listcontainer:Sprite;
	var listmask:Sprite;
	
	public function new(_dir:String) 
	{
		super();
		
		this.listcontainer = new Sprite();
		this.listcontainer.mouseEnabled = false;
		this.addChild(this.listcontainer);
		
		this.listmask = new Sprite();
		this.listmask.mouseEnabled = false;
		this.listmask.graphics.clear();
		this.listmask.graphics.beginFill(0, 1);
		this.listmask.graphics.lineTo(310, 0);
		this.listmask.graphics.lineTo(310, 360);
		this.listmask.graphics.lineTo(0, 360);
		this.listmask.graphics.lineTo(0, 0);
		this.addChild(this.listmask);
		
		this.mask = this.listmask;
		
		this.graphics.clear();
		this.graphics.lineStyle(2, 0, 1);
		
		this.iconList = new Array();
		
		#if (air)
			var _locFile = File.documentsDirectory.resolvePath(_dir);
			var _locDir:Array<File> = _locFile.getDirectoryListing();
			var _locIcon:FileInfoIcon = new FileInfoIcon(SaveType.none, "you dun goofed!");
			var iteration:Int = 0;
			for (a in _locDir) {
				if (a.isDirectory) {
					_locIcon = new FileInfoIcon(SaveType.dir, a);
				} else {
					var extension:String = a.name.substr(a.name.length - 4, a.name.length);
					if (extension == ".sol") {
						_locIcon = new FileInfoIcon(SaveType.json, a.name, null);
					} else if (extension == ".trk") {
						_locIcon = new FileInfoIcon(SaveType.json, a.name, null);
					} else {
						extension = a.name.substr(a.name.length - 5, a.name.length);
						if (extension == ".json") {
							_locIcon = new FileInfoIcon(SaveType.json, a.name, null);
						}
					}
				}
				this.iconList.push(_locIcon);
				this.listcontainer.addChild(_locIcon);
				_locIcon.y = (30 * iteration);
				++iteration;
			}
		#elseif js
		
		#elseif sys
			var _locDir:Array<String> = FileSystem.readDirectory(_dir);
			var _locIcon:FileInfoIcon = new FileInfoIcon("you dun goofed!");
			var iteration:Int = 0;
			for (a in _locDir) {
				if (FileSystem.isDirectory(_dir + "/" + a)) {
					_locIcon = new FileInfoIcon("[DIR] " + a, a);
				} else {
					var extension:String = a.substr(a.length - 4, a.length);
					if (extension == ".sol") {
						_locIcon = new FileInfoIcon("[FLASH] " + a, a);
					} else if (extension == ".trk") {
						_locIcon = new FileInfoIcon("[LRA] " + a, a);
					} else {
						extension = a.substr(a.length - 5, a.length);
						if (extension == ".json") {
							_locIcon = new FileInfoIcon("[JSON] " + a, a);
						}
					}
				}
				this.iconList.push(_locIcon);
				this.listcontainer.addChild(_locIcon);
				_locIcon.y = (30 * iteration);
				_locIcon.addEventListener(MouseEvent.CLICK, update_selected);
				++iteration;
			}
			
			
		#end
	}
	
	function update_selected(e:MouseEvent):Void 
	{
		LoaderMenu.current.update(e.currentTarget);
	}
	
	public function scrolllist(e:MouseEvent):Void 
	{
		var platDelta:Float;
		#if (cpp || flash)
			platDelta = e.delta;
		#elseif (js)
			platDelta = e.delta / 100;
		#else
			trace("Unsupported platform, accomodate: ", e.delta);
			return;
		#end
		if (platDelta < 0) {
			if (this.listcontainer.y <= 0 - (this.listcontainer.height) + (62 * 5) + 20){
				this.listcontainer.y = 0 - (this.listcontainer.height) + (62 * 5) + 20;
				return;
			}
		} else if (platDelta > 0) {
			if (this.listcontainer.y >= 0) {
				this.listcontainer.y = 0;
				return;
			}
		}
		this.listcontainer.y += platDelta * 15;
	}
	
}
class FileInfoIcon extends Sprite
{
	private var fontA:TextFormat = new TextFormat(Assets.getFont("fonts/Verdana.ttf").fontName, 12, 0, null, null, null, null, null, TextFormatAlign.LEFT);
	public var type:Int;
	public var info:Dynamic;
	public var bg:IconButton;
	public var fname:String;
	#if sys
	public var stat:FileStat;
	#end
	var icon:Sprite;
	var text:TextField;
	#if sys
	public function new(_name:Null<String> = null, _locationInfo:Null<String> = null)
	#else
	public function new(_name:Null<String> = null, _locationInfo:Null<Dynamic> = null)
	#end
	{
		super();
		
		this.info = _locationInfo;
		this.fname = _name;
		
		this.bg = new IconButton(Icon.filebox);
		this.bg.func_up = function(e:MouseEvent) {
			Common.gLoadMenu.update_item(this);
		}
		
		this.addChild(this.bg);
		
		this.text = new TextField();
		this.addChild(this.text);
		this.text.mouseEnabled = false;
		this.text.x = 5;
		this.text.width = 290;
		this.text.height = 60;
		this.text.defaultTextFormat = this.fontA;
		
		this.text.text += this.fname + "\n";
	}
	public function update(_file:FileInfoIcon) {
		this.text.text = _file.fname;
		this.fname = _file.fname;
		this.info = _file.info;
	}
}