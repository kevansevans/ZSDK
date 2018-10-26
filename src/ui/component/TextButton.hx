package ui.component;
import h2d.Interactive;
import hxd.Event;
import hxd.res.DefaultFont;
import h2d.Font;
import h2d.Graphics;
import h2d.Object;
import h2d.Text;

/**
 * ...
 * @author kevansevans
 */
class TextButton extends Object
{
	var box:Graphics;
	var d_font:Font;
	var text:Text;
	public var boxColor_up:Int = 0xFFFFFF;
	public var boxColor_over:Int = 0xDDDDDD;
	public var boxColor_down:Int = 0xBBBBBB;
	var active_box_color:Int;
	public var b_width:Int;
	public var b_height:Int;
	public var msg:String;
	public var inter:Interactive;
	public function new(_width:Int, _height:Int, _msg:String) 
	{
		super();
		
		b_width = _width;
		b_height = _height;
		
		d_font = DefaultFont.get();
		d_font.resizeTo(14);
		
		box = new Graphics(this);
		text = new Text(d_font, this);
		
		text.text = msg = _msg;
		text.textColor = 0;
		
		render();
		
		inter = new Interactive(b_width, b_height, this);
	}
	function render() {
		box.clear();
		box.beginFill(boxColor_up);
		box.drawRect(0, 0, b_width, b_height);
		
		text.text = msg;
		text.x = (b_width / 2) - (text.textWidth / 2);
		text.y = (b_height / 2) - (text.textHeight / 2);
	}
}