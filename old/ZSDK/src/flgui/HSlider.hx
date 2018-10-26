package components;

import openfl.Assets;
import openfl.Lib;
import openfl.display.Sprite;
import openfl.events.MouseEvent;
import openfl.utils.Function;
import openfl.geom.ColorTransform;

/**
 * ...
 * @author Kaelan Evans
 * 
 * Comments will not be provided for components, as modifying them is not recommended.
 * 
 */

@:enum abstract RoundMode(Int) from Int {
	public var NONE:Int = 0;
	public var ROUND:Int = 1;
	public var FLOOR:Int = 2;
	public var CEIL:Int = 3;
}

class HSlider extends Sprite
{
	private var head:Sprite;
	private var headOutline:Sprite;
	private var bar:Sprite;
	private var barFill:Sprite;
	
	private var round:Int = RoundMode.ROUND;
	
	private var max:Float = 255;
	private var min:Float = 0;
	private var range:Float = 255;
	private var snap:Bool = true;
	private var snapRatio:Int = 1;
	private var lastPos:Float;
	
	public var onChange:Function;
	public var value:Float = 0;
	
	public function new(_min:Float = 0, _max:Float = 255, _value:Float = 0, _round = RoundMode.ROUND) 
	{
		super();
		
		this.bar = Assets.getMovieClip("assets:Bar");
		this.barFill = Assets.getMovieClip("assets:FillBar");
		this.head = Assets.getMovieClip("assets:Head");
		this.headOutline = Assets.getMovieClip("assets:HeadOutline");
		
		this.addChild(this.bar);
		this.addChild(this.barFill);
		this.addChild(this.head);
		this.addChild(this.headOutline);
		
		this.barFill.mouseEnabled = false;
		this.head.buttonMode = true;
		this.buttonMode = true;
		
		this.addEventListener(MouseEvent.MOUSE_DOWN, this.startDragHead);
		this.addEventListener(MouseEvent.MOUSE_UP, this.releaseHead);
		Lib.current.stage.addEventListener(MouseEvent.MOUSE_UP, this.releaseHead);
		
		this.min = _min;
		this.max = _max;
		this.range = Math.abs(this.min - this.max);
		this.value = _value;
		
		var _locRatio = this.value / this.range;
		this.head.x = 255 * _locRatio;
		this.headOutline.x = 255 * _locRatio;
		this.barFill.width = this.head.x;
		
		this.round = _round;
		
		this.barFill.width = this.head.x;
		
		this.setColors();
	}
	public function setColors(_fill:Int = 0x0099FF, _head:Int = 0xFFFFFF, _outline:Int = 0) {
		this.barFill.transform.colorTransform = new ColorTransform(((_fill >> 16) & 0xff) / 255, ((_fill >> 8) & 0xff) / 255, ((_fill & 0xff) / 255));
		this.head.transform.colorTransform = new ColorTransform(((_head >> 16) & 0xff) / 255, ((_head >> 8) & 0xff) / 255, ((_head & 0xff) / 255));
		this.headOutline.transform.colorTransform = new ColorTransform(((_outline >> 16) & 0xff) / 255, ((_outline >> 8) & 0xff) / 255, ((_outline & 0xff) / 255));
	}
	function dragHead(e:MouseEvent) {
		this.update();
	}
	function startDragHead(e:MouseEvent):Void 
	{
		this.lastPos = this.head.x;
		this.head.x = this.mouseX;
		this.headOutline.x = this.mouseX;
		this.update();
		Lib.current.stage.addEventListener(MouseEvent.MOUSE_MOVE, this.dragHead);
	}
	function releaseHead(e:MouseEvent):Void 
	{
		Lib.current.stage.removeEventListener(MouseEvent.MOUSE_MOVE, this.dragHead);
	}
	public function update() {
		this.head.x = this.mouseX;
		this.headOutline.x = this.mouseX;
		
		var _locRatio = this.head.x / 255;
		var _locValue = (_locRatio * this.range) + this.min;
		
		if (snap) {
			if (Math.round(_locValue) % this.snapRatio == 0) {
				this.head.x = this.mouseX;
				this.headOutline.x = this.mouseX;
				this.lastPos = this.head.x;
				_locRatio = this.head.x / 255;
				_locValue = (_locRatio * this.range) + this.min;
			} else {
				this.head.x = this.lastPos;
				this.headOutline.x = this.lastPos;
				_locRatio = this.head.x / 255;
				_locValue = (_locRatio * this.range) + this.min;
			}
		}
		
		if (this.mouseX <= 0) {
			this.head.x = 0;
			this.headOutline.x = 0;
			_locRatio = this.head.x / 255;
			_locValue = (_locRatio * this.range) + this.min;
		} else if (this.mouseX >= 255) {
			this.head.x = 255;
			this.headOutline.x = 255;
			_locRatio = this.head.x / 255;
			_locValue = (_locRatio * this.range) + this.min;
		}
		
		this.barFill.width = this.head.x;
		
		switch (round) {
			case RoundMode.NONE :
				this.value = _locValue;
			case RoundMode.ROUND :
				this.value = Math.round(_locValue);
			case RoundMode.FLOOR :
				this.value = Math.floor(_locValue);
			case RoundMode.CEIL :
				this.value = Math.ceil(_locValue);
		}
		
		if (this.onChange != null) {
			this.onChange();
		}
	}
	public function set(_value:Float) {
		this.value = _value;
		
		var _locRatio = this.value / this.range;
		this.head.x = 255 * _locRatio;
		this.headOutline.x = 255 * _locRatio;
		this.barFill.width = this.head.x;
	}
}