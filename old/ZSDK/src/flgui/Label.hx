package components;

import haxe.PosInfos;
import openfl.Assets;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.FocusEvent;
import openfl.events.KeyboardEvent;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import openfl.text.TextFieldType;
import openfl.text.TextField;
import openfl.utils.Function;

/**
 * ...
 * @author Kaelan Evans
 * 
 * Comments will not be provided for components, as modifying them is not recommended.
 * 
 */
@:enum abstract LabelType(Int) from Int {
	public var DYNAMIC:Int = 1;
	public var INPUT:Int = 2;
	public var INPUT_BOX:Int = 3;
	public var PASSWORD:Int = 4;
}
class Label extends Sprite
{
	private var font:TextFormat = new TextFormat(Assets.getFont("fonts/Verdana.ttf").fontName, 14, 0, null, null, null, null, null, TextFormatAlign.LEFT);
	public var field:TextField;
	public var onChange:Null<Function>;
	public var onFocusShift:Null<Function>;
	public var value(default, set):String;
	public function new(_type:Int = LabelType.DYNAMIC, _msg:String = "", _width:Int = 255, _height:Int = 30, ?pos:PosInfos) 
	{
		super();
		
		this.field = new TextField();
		this.addChild(this.field);
		this.field.setTextFormat(this.font);
		this.field.text = _msg;
		this.field.width = _width;
		this.field.height = _height + 3;
		
		this.value = _msg;
		
		switch(_type) {
			case LabelType.DYNAMIC :
				this.field.selectable = false;
				this.field.type = TextFieldType.DYNAMIC;
				this.field.wordWrap = true;
			case LabelType.INPUT :
				this.field.y = 2;
				this.field.selectable = true;
				this.field.type = TextFieldType.INPUT;
				this.render();
				this.addEventListener(Event.CHANGE, this.send_event);
				this.addEventListener(FocusEvent.FOCUS_IN, this.setFocus);
				this.addEventListener(FocusEvent.FOCUS_OUT, this.setFocus);
			case LabelType.INPUT_BOX :
				this.field.y = 2;
				this.field.selectable = true;
				this.field.type = TextFieldType.INPUT;
				this.field.wordWrap = true;
				this.render();
				this.addEventListener(Event.CHANGE, this.send_event);
				this.addEventListener(FocusEvent.FOCUS_IN, this.setFocus);
				this.addEventListener(FocusEvent.FOCUS_OUT, this.setFocus);
			case LabelType.PASSWORD :
				this.field.y = 2;
				this.field.selectable = true;
				this.field.type = TextFieldType.INPUT;
				this.field.displayAsPassword = true;
				this.render();
				this.addEventListener(Event.CHANGE, this.send_event);
				this.addEventListener(FocusEvent.FOCUS_IN, this.setFocus);
				this.addEventListener(FocusEvent.FOCUS_OUT, this.setFocus);
		}
	}
	public function render() {
		this.graphics.clear();
		this.graphics.lineStyle(1, 0xDDDDDD);
		this.graphics.beginFill(0xFFFFFF, 1);
		this.graphics.moveTo(0, 0);
		this.graphics.lineTo(this.field.width + 3, 0);
		this.graphics.lineTo(this.field.width + 3, this.field.height);
		this.graphics.lineTo(0, this.field.height);
		this.graphics.lineTo(0, 0);
	}
	private function send_event(e:KeyboardEvent) {
		this.value = this.field.text;
		if (this.onChange != null) this.onChange();
	}
	private function set_value(_v:String) {
		this.field.text = _v;
		return this.value = _v;
	}
	public function set(_s:String, _a:Bool = false) {
		var _caretEnd:Bool = this.field.caretIndex == this.field.length ? true : false;
		this.field.text = _s;
		if (_caretEnd) {
			this.field.setSelection(this.field.length, this.field.length);
		}
		if (_a && this.onChange != null) this.onChange();
	}
	function setFocus(e:FocusEvent):Void 
	{
		if (this.onFocusShift != null) {
			this.onFocusShift(e);
		}
	}
}