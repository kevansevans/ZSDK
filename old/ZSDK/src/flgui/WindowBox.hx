package components;

import openfl.Assets;
import openfl.display.DisplayObjectContainer;
import openfl.display.Sprite;
import openfl.events.MouseEvent;
import openfl.Lib;
import openfl.geom.Rectangle;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import openfl.text.TextFieldAutoSize;

import components.IconButton;

/**
 * ...
 * @author Kaelan Evans
 * 
 * Comments will not be provided for components, as modifying them is not recommended.
 * 
 */
@:enum abstract WindowMode(Int) from Int {
	public var CONFIRM:Int = 0;
	public var ACKNOWLEDGE:Int = 1;
	public var ERROR:Int = 2;
	public var MENU:Int = 3;
	public var CUSTOM:Int = 4;
	public var PROGRESS:Int = 5;
}
class WindowBox extends Sprite
{
	private var fontA:TextFormat = new TextFormat(Assets.getFont("fonts/Verdana Bold.ttf").fontName, 14, 0xFFFFFF, null, null, null, null, null, TextFormatAlign.LEFT);
	private var fontB:TextFormat = new TextFormat(null, 16, 0, null, null, null, null, null, TextFormatAlign.LEFT);
	
	private var type:Int = -1;
	
	public var itemList:Array<WindowItem>;
	private var windowBar:Sprite;
	private var barLabel:TextField;
	public var title(default, set):String;
	public var positive:IconButton;
	public var negative:IconButton;
	public var frowny:IconButton;
	
	private var wWidth:Int;
	private var wHeight:Int;
	private var fill:Int = 0xEEEEEE;
	
	var widthTracker:Float = 10;
	var heightTracker:Float = 40;
	
	private var message:TextField;
	
	public var drag(default, set):Bool = false;
	
	public function new(_title:String, _type:Int, _width:Int = 255, _height:Int = 255) 
	{
		super();
		
		this.wWidth = _width;
		this.wHeight = _height;
		this.type = _type;
		
		this.windowBar =Assets.getMovieClip("assets:WindowBar");
		this.addChild(this.windowBar);
		this.windowBar.width = _width;
		
		this.itemList = new Array();
		
		this.barLabel = new TextField();
		this.barLabel.setTextFormat(this.fontA);
		this.addChild(this.barLabel);
		this.barLabel.x = 2;
		this.barLabel.y = -1;
		this.barLabel.width = this.windowBar.width - 30;
		this.barLabel.text = _title;
		this.barLabel.selectable = false;
		this.barLabel.mouseEnabled = false;
		
		switch(_type) {
			case WindowMode.CONFIRM :
				this.set_confirm();
			case WindowMode.ACKNOWLEDGE :
				this.set_acknowledge();
			case WindowMode.ERROR :
				this.set_error();
			case WindowMode.MENU :
				this.set_menu();
		}
		
		this.graphics.clear();
		this.graphics.beginFill(this.fill, 1);
		this.graphics.moveTo(0, 20);
		this.graphics.lineTo(0, _height + 20);
		this.graphics.lineTo(_width, _height + 20);
		this.graphics.lineTo(_width, 20);
		this.graphics.lineTo(0, 20);
	}
	function set_error() 
	{
		this.fill = 0xFFAAAA;
		
		this.frowny = new IconButton("error");
		
		this.addChild(this.frowny);
		
		this.frowny.y = this.wHeight - 15;
		this.frowny.x = (this.wWidth / 2) - (this.frowny.width / 2);
		
		this.enable_message();
		
		this.message.selectable = true;
	}
	function set_acknowledge() 
	{
		this.fill = 0xFFFF99;
		
		this.positive = new IconButton("yes");
		
		this.addChild(this.positive);
		
		this.positive.y = this.wHeight - 40;
		this.positive.x = (this.wWidth / 2) - (this.positive.width / 2);
		
		this.enable_message();
	}
	function set_confirm() 
	{
		this.positive = new IconButton("yes");
		this.negative = new IconButton("no");
		
		this.addChild(this.positive);
		this.addChild(this.negative);
		
		this.positive.y = this.wHeight - 40;
		this.positive.x = (this.wWidth / 2) - 40;
		
		this.negative.y = this.wHeight - 40;
		this.negative.x = (this.wWidth / 2) + 10;
		
		this.enable_message();
	}
	function set_menu() {
		this.negative = new IconButton("no");
		
		this.addChild(this.negative);
		
		this.negative.x = this.wWidth - 32;
	}
	function enable_message() 
	{
		this.message = new TextField();
		this.message.setTextFormat(this.fontB);
		this.addChild(this.message);
		this.message.x = 2;
		this.message.y = 32;
		this.message.width = this.wWidth - 2;
		this.message.height = this.wHeight - 50;
		this.message.selectable = false;
		this.message.wordWrap = true;
		this.message.autoSize = TextFieldAutoSize.LEFT;
	}
	public function set_message_string(_input:String, _resizeBox:Bool = false) {
		if (this.message == null) this.enable_message();
		
		this.message.text = _input;
		
		this.message.height = this.message.textHeight;
		
		this.heightTracker += this.message.textHeight + 15;
		
		if (_resizeBox) {
			this.wHeight = Std.int(this.message.textHeight + 105);
			this.render();
		}
	}
	function set_drag(_bool) {
		if (_bool) {
			this.windowBar.addEventListener(MouseEvent.MOUSE_DOWN, this.drag_window);
			this.windowBar.addEventListener(MouseEvent.MOUSE_UP, this.stop_drag);
			Lib.current.stage.addEventListener(MouseEvent.MOUSE_UP, this.stop_drag);
		} else {
			this.windowBar.removeEventListener(MouseEvent.MOUSE_DOWN, this.drag_window);
			this.windowBar.removeEventListener(MouseEvent.MOUSE_UP, this.stop_drag);
			Lib.current.stage.removeEventListener(MouseEvent.MOUSE_UP, this.stop_drag);
		}
		return this.drag = _bool;
	}
	function set_title(_v:String):String {
		this.barLabel.text = _v;
		return title = _v;
	}
	function render() {
		this.windowBar.width = this.wWidth;
		
		this.graphics.clear();
		this.graphics.lineStyle(1, 0xDDDDDD);
		this.graphics.beginFill(this.fill, 1);
		this.graphics.moveTo(0, 20);
		this.graphics.lineTo(0, this.wHeight + 20);
		this.graphics.lineTo(this.wWidth, this.wHeight + 20);
		this.graphics.lineTo(this.wWidth, 20);
		this.graphics.lineTo(0, 20);
		
		switch (this.type) {
			case WindowMode.ACKNOWLEDGE :
				this.positive.y = this.wHeight - 15;
				this.positive.x = (this.wWidth / 2) - (this.positive.width / 2);
			case WindowMode.CONFIRM :
				this.positive.y = this.wHeight - 40;
				this.positive.x = (this.wWidth / 2) - 40;
				this.negative.y = this.wHeight - 40;
				this.negative.x = (this.wWidth / 2) + 10;
			case WindowMode.ERROR :
				this.frowny.y = this.wHeight - 15;
				this.frowny.x = (this.wWidth / 2) - (this.frowny.width / 2);
			case WindowMode.MENU :
				this.negative.x = this.wWidth - 32;
				this.negative.y = 2;
			default :
				return;
		}
	}
	function stop_drag(e:MouseEvent):Void 
	{
		this.stopDrag();
		if (this.x + this.wWidth < 0) {
			this.x = (this.wWidth * -1) + 50;
		} else if (this.x > Lib.current.stage.stageWidth) {
			this.x = Lib.current.stage.stageWidth - 50;
		}
		if (this.y < 35) {
			this.y = 35;
		} else if (this.y > Lib.current.stage.stageHeight) {
			this.y = Lib.current.stage.stageHeight - 95;
		}
	}
	function drag_window(e:MouseEvent):Void 
	{
		this.startDrag();
	}
	var hasToReturnB:Bool = false;
	public function add_item(_item:DisplayObjectContainer, _return:Bool = false, _returnAgain:Bool = false, _ovx:Int = 0, _ovy:Int = 0, ?_posOverride:Int) {
		var _itemindex:WindowItem = new WindowItem(_item);
		_itemindex.pre_return = _return;
		_itemindex.post_return = _returnAgain;
		_itemindex.override_x = _ovx;
		_itemindex.override_y = _ovy;
		if (_posOverride != null) itemList.insert(_posOverride, _itemindex);
		else itemList.push(_itemindex);
	}
	public function displayItems() {
		if (itemList == null) return;
		widthTracker = 10;
		heightTracker = this.contains(this.message) ? this.message.height + 5 : 40;
		for (a in itemList) {
			if (this.contains(a.item)) this.removeChild(a.item);
		}
		var lastItem:Null<WindowItem> = null;
		var hasToResize:Bool = false;
		var hasToReturn:Bool = false;
		for (index in itemList) {
			addChild(index.item);
			if (lastItem == null) {
				index.item.x = 10;
				index.item.y = this.contains(this.message) ? this.message.height + 40 : 40;
				if (index.post_return) {
					hasToReturn = true;
				} else {
					widthTracker += index.width + 5;
				}
				if (index.width + index.item.x > this.wWidth) {
					hasToResize = true;
					this.wWidth = Std.int(index.width + index.item.x + 30);
				}
				lastItem = index;
				continue;
			}
			
			if (widthTracker > this.wWidth || widthTracker + index.width + lastItem.width > this.wWidth) hasToReturn = true;
			
			if (index.pre_return || hasToReturn) {
				widthTracker = 10;
				heightTracker += lastItem.height + 5;
				hasToReturn = false;
			} else {
				widthTracker = (lastItem.width + lastItem.item.x) + 10;
			}
			if (index.width + index.item.x > this.wWidth) {
				hasToResize = true;
				this.wWidth = Std.int(index.width + index.item.x + 30);
			}
			
			if (index.post_return) hasToReturn = true;
			
			widthTracker += index.override_x;
			heightTracker += index.override_y;
			
			index.item.x = widthTracker;
			index.item.y = heightTracker;
			
			lastItem = index;
		}
		this.wHeight = Std.int(lastItem.item.y + lastItem.height + 10);
		this.render();
	}
}
class WindowItem
{
	public var item:DisplayObjectContainer;
	public var width:Float = 0;
	public var height:Float = 0;
	public var pre_return:Bool = false;
	public var post_return:Bool = false;
	public var override_x:Float = 0;
	public var override_y:Float = 0;
	public function new(?_item:DisplayObjectContainer) {
		if (_item == null) return;
		item = _item;
		if (item.mask != null) {
			var bounds = _item.mask.getBounds(item);
			width = bounds.width;
			height = bounds.height;
		}
		else {
			width = item.width;
			height = item.height;
		}
	}
	public function update() {
		if (item.mask != null) {
			var bounds = item.mask.getBounds(item);
			width = bounds.width;
			height = bounds.height;
		}
		else {
			width = item.width;
			height = item.height;
		}
	}
}