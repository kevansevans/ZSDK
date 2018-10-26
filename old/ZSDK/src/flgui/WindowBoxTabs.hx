package components;

import openfl.display.DisplayObject;
import openfl.display.DisplayObjectContainer;

import components.WindowBox.WindowItem;

/**
 * ...
 * @author kevansevans
 */
class WindowBoxTabs extends WindowBox 
{
	public var bar_item:WindowItem;
	public var tool_bar:IconBar;
	public var groups:Array<Array<WindowItem>>;
	public var temp_group:Int = 0;
	public var iGroup:Int = 0;
	public function new(_title:String, _type:Int, _width:Int=255, _height:Int=255) 
	{
		super(_title, _type, _width, _height);
		
		this.groups = new Array();
		
		this.tool_bar = new IconBar();
		this.bar_item = new WindowItem(this.tool_bar);
		this.bar_item.post_return = true;
		
		groups[0] = new Array();
		groups[0][0] = this.bar_item;
	}
	public function add_item_to_group(_item:DisplayObjectContainer, _group:Int, _return:Bool = false, _returnAgain:Bool = false, _ovx:Int = 0, _ovy:Int = 0, ?_posOverride:Int) {
		if (groups[_group] == null) {
			groups[_group] = new Array();
			groups[_group][0] = this.bar_item;
		}
		var item = new WindowItem(_item);
		item.pre_return = _return;
		item.post_return = _returnAgain;
		item.override_x = _ovx;
		item.override_y = _ovy;
		if (_posOverride != null) groups[_group].insert(_posOverride, item);
		else groups[_group].push(item);
	}
	override public function add_item(_item:DisplayObjectContainer, _return:Bool = false, _returnAgain:Bool = false, _ovx:Int = 0, _ovy:Int = 0, ?_posOverride:Int) 
	{
		super.add_item(_item, _return, _returnAgain, _ovx, _ovy, _posOverride);
	}
	public function add_tool_icon(_item:IconButton, ?_place:Int) {
		this.tool_bar.add_icon(_item, _place);
		this.tool_bar.update();
		this.bar_item.update();
	}
	public function update_group(_v:Int) {
		if (groups[_v] == null) return;
		for (a in itemList) {
			if (this.contains(a.item)) this.removeChild(a.item);
		}
		itemList = groups[_v];
		iGroup = _v;
		displayItems();
	}
}