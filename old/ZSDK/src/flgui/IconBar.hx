package components;

import components.IconButton;
import openfl.display.Sprite;

/**
 * ...
 * @author Kaelan Evans
 */
class IconBar extends Sprite 
{
	public var iconList:Array<IconButton>;
	public function new() 
	{
		super();
		
		this.iconList = new Array();
		this.mouseEnabled = false;
	}
	public function add_icon(_icon:IconButton, _loc:Null<Int> = null) {
		if (_loc == null) {
			this.iconList.push(_icon);
		} else {
			this.iconList.insert(_loc, _icon);
		}
	}
	public function remove_icon(_icon:IconButton) {
		this.iconList.remove(_icon);
	}
	public function update() {
		for (a in iconList) {
			if (this.contains(a)) this.removeChild(a);
		}
		var x_offset:Int = 0;
		for (b in iconList) {
			this.addChild(b);
			b.x = (32 * x_offset);
			++x_offset;
		}
	}
}