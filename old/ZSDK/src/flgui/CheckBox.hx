package components;

import openfl.Assets;
import openfl.display.DisplayObjectContainer;
import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import openfl.events.MouseEvent;
import openfl.utils.Function;

/**
 * ...
 * @author Kaelan Evans
 * 
 * Comments will not be provided for components, as modifying them is not recommended.
 * 
 */
#if flash
class CheckBox extends Sprite
#else
class CheckBox extends DisplayObjectContainer
#end
{
	private var checkBG:Sprite;
	private var checkGreen:DisplayObjectContainer;
	private var font:TextFormat = new TextFormat(Assets.getFont("fonts/Verdana.ttf").fontName, 14, 0, null, null, null, null, null, TextFormatAlign.LEFT);
	public var label:TextField;
	public var onChange:Function;
	public var value:Bool;
	
	public function new(_name:String, _bool:Bool) 
	{
		super();
		
		this.mouseEnabled = false;
		
		this.checkBG = Assets.getMovieClip("assets:CheckBG");
		this.checkGreen = Assets.getMovieClip("assets:CheckGreen");
		
		this.addChild(this.checkBG);
		this.addChild(this.checkGreen);
		
		this.checkGreen.x = this.checkGreen.y = 2.5;
		this.checkGreen.mouseEnabled = false;
		
		this.checkBG.addEventListener(MouseEvent.CLICK, this.toggle);
		this.checkBG.buttonMode = true;
		this.update(_bool);
		this.value = _bool;
		
		this.label = new TextField();
		this.addChild(this.label);
		this.label.x = 17;
		this.label.y = -3;
		this.label.setTextFormat(this.font);
		this.label.text = _name;
		this.label.selectable = false;
		this.label.height = this.label.textHeight + 2;
		this.label.width = this.label.textWidth + 4;
	}
	function toggle(e:MouseEvent) {
		this.value = value == true ? false : true;
		this.update(this.value);
		if (this.onChange != null) {
			this.onChange();
		}
	}
	function update(_bool:Bool) {
		if (_bool) {
			this.checkGreen.visible = true;
		} else {
			this.checkGreen.visible = false;
		}
	}
	public function set(_bool:Bool) {
		this.value = _bool;
		this.checkGreen.visible = _bool;
	}
}