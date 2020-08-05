package gui.items.tabs;

import haxe.ui.containers.Box;

/**
 * ...
 * @author Kaelan
 */
class MenuBase extends Box 
{

	public function new() 
	{
		super();
	}
	
	public function resize(_width:Int, _height:Int) {
		this.width = _width;
		this.height = _height;
	}
}