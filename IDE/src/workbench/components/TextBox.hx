package workbench.components;

import openfl.Assets;
import openfl.display.Shape;
import openfl.display.Sprite;
import openfl.geom.Point;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import openfl.events.MouseEvent;

/**
 * ...
 * @author kevansevans
 */
enum abstract Highlight(Int) from Int {
	var none:Int;
	var line:Int;
	var keyword:Int;
	var multiple:Int;
	var line_select:Int;
}
class TextBox extends Sprite 
{
	public static inline var spacer:Int = 13;
	public static inline var lead:Int = 7;
	private var font:TextFormat = new TextFormat(Assets.getFont("fonts/Anonymous_Pro.ttf").fontName, 12, 0, null, null, null, null, null, TextFormatAlign.LEFT, null, null, null, -8);
	public var field:TextField;
	var box:Sprite;
	var hl_box:Shape;
	var highlight_array:Array<Shape>;
	var w_height:Int;
	var w_width:Int;
	var mono_height:Int;
	var mono_width:Int;
	var highlight_mode:Int;
	public function new(_width:Int, _height:Int, ?_mode:Int) 
	{
		super();
		
		w_width = _width;
		w_height = _height;
		
		if (_mode != null) highlight_mode = _mode;
		else highlight_mode = Highlight.none;
		
		box = new Sprite();
		addChild(box);
		
		hl_box = new Shape();
		hl_box.y = 2;
		addChild(hl_box);
		
		box.graphics.clear();
		box.graphics.lineStyle(2, 0);
		box.graphics.beginFill(0xFFFFFF);
		box.graphics.moveTo(0, 0);
		box.graphics.lineTo(_width, 0);
		box.graphics.lineTo(_width, _height);
		box.graphics.lineTo(0, _height);
		box.graphics.lineTo(0, 0);
		
		mono_height = Std.int(Math.floor(_height / spacer));
		mono_width = Std.int(Math.floor(_width / spacer));
		
		field = new TextField();
		field.wordWrap = false;
		addChild(field);
		field.mouseEnabled = false;
		field.defaultTextFormat = font;
		field.width = box.width;
		field.height = box.height;
		field.selectable = false;
		field.y -= 2;
		
		this.addEventListener(MouseEvent.MOUSE_OVER, function(e:MouseEvent) {
			this.addEventListener(MouseEvent.MOUSE_MOVE, hightlight);
		});
		this.addEventListener(MouseEvent.MOUSE_OUT, function(e:MouseEvent) {
			this.removeEventListener(MouseEvent.MOUSE_MOVE, hightlight);
			hl_box.graphics.clear();
		});
		this.addEventListener(MouseEvent.CLICK, function(e:MouseEvent) {
			this.getMonoIndex(e);
		});
	}
	
	function getMonoIndex(e:MouseEvent):Void 
	{
		var mono_loc:Point = get_mono_mouse_pos(this.mouseX, this.mouseY);
		trace(Std.int(mono_loc.y / 12));
	}
	function hightlight(e:MouseEvent):Void 
	{
		var mono_loc:Point = get_mono_mouse_pos(this.mouseX, this.mouseY);
		switch (highlight_mode) {
			case Highlight.none :
				return;
			case Highlight.line | Highlight.line_select :
				line_highlight(mono_loc, 0x00FF00);
		}
	}
	
	function line_highlight(_pos:Point, _color:Int) 
	{
		hl_box.graphics.clear();
		hl_box.graphics.beginFill(_color);
		hl_box.graphics.moveTo(1, _pos.y);
		hl_box.graphics.lineTo(w_width - 1, _pos.y);
		hl_box.graphics.lineTo(w_width - 1, _pos.y + spacer);
		hl_box.graphics.lineTo(1, _pos.y + spacer);
	}
	public function render() {
		box.graphics.clear();
		box.graphics.lineStyle(2, 0);
		box.graphics.beginFill(0xFFFFFF);
		box.graphics.moveTo(0, 0);
		box.graphics.lineTo(w_width, 0);
		box.graphics.lineTo(w_width, w_height);
		box.graphics.lineTo(0, w_height);
		box.graphics.lineTo(0, 0);
	}
	public function get_mono_mouse_pos(_x:Float, _y:Float):Point {
		var a = Std.int(Math.floor(_x / spacer) * spacer);
		var b = Std.int(Math.floor(_y / spacer) * spacer);
		return(new Point(a, b));
	}
}