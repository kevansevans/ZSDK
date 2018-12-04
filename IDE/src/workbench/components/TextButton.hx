package workbench.components;

import openfl.Assets;
import openfl.display.Sprite;
import openfl.display.Shape;
import openfl.display.SimpleButton;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;

/**
 * ...
 * @author kevansevans
 */
class TextButton extends Sprite 
{
	private var font:TextFormat = new TextFormat(Assets.getFont("fonts/Verdana Bold.ttf").fontName, 14, 0, null, null, null, null, null, TextFormatAlign.CENTER, 8);
	var b_width:Null<Int>;
	var b_height:Null<Int> = 30;
	var text(default, set):String;
	var field:TextField;
	var button:SimpleButton;
	public function new(_text:String, ?_width:Int, ?_height:Int) 
	{
		super();
		
		if (_width != null) b_width = _width;
		if (_height != null) b_height = _height;
		
		button = new SimpleButton();
		addChild(button);
		
		field = new TextField();
		addChild(field);
		field.setTextFormat(font);
		field.selectable = false;
		field.mouseEnabled = false;
		
		text = _text;
		
		render();
	}
	public function render() {
		if (b_width == null) b_width = field.textWidth >= 150 ? Std.int(field.textWidth + 20) : 150;
		
		for (a in 0...4) {
			var rect:Sprite = new Sprite();
			rect.graphics.clear();
			rect.graphics.lineStyle(2, 0);
			switch (a) {
				case 0:
					rect.graphics.beginFill(0xFFFFFF, 1);
				case 1:
					rect.graphics.beginFill(0xDDDDDD, 1);
				case 2:
					rect.graphics.beginFill(0xBBBBBB, 1);
				case 3:
					rect.graphics.beginFill(0, 1);
			}
			rect.graphics.moveTo(0, 0);
			rect.graphics.lineTo(b_width, 0);
			rect.graphics.lineTo(b_width, b_height);
			rect.graphics.lineTo(0, b_height);
			rect.graphics.lineTo(0, 0);
			switch (a) {
				case 0:
					button.upState = rect;
				case 1:
					button.overState = rect;
				case 2:
					button.downState = rect;
				case 3:
					button.hitTestState = rect;
			}
		}
		
		field.width = b_width;
		field.height = b_height;
		field.y = (this.height / 2) - (field.height / 2.1);
	}
	function set_text(_v:String):String {
		field.text = _v;
		return(text = _v);
	}
}