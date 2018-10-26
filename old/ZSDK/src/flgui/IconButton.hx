package components;

import openfl.Assets;
import openfl.display.SimpleButton;
import openfl.display.Sprite;
import openfl.events.MouseEvent;
import openfl.events.Event;

/**
 * ...
 * @author Kaelan Evans
 * 
 */
class IconButton extends Sprite
{
	public var enabled(default, set):Bool = true;
	private var iconButton:SimpleButton;
	private var icon:Sprite;
	
	public var func_up(default, set):Dynamic -> Void;
	public var func_alt(default, set):Dynamic -> Void;
	public var func_over(default, set):Dynamic -> Void;
	public var func_out(default, set):Dynamic -> Void;
	
	public function new(_path:String = "null") 
	{
		super();
		
		if (_path == "null") trace ("My icon is not set"); 
		
		this.iconButton = new SimpleButton();
		
		this.iconButton.upState = Assets.getMovieClip("assets:up_" + _path); 
		this.iconButton.hitTestState = Assets.getMovieClip("assets:up_" + _path); 
		this.iconButton.overState = Assets.getMovieClip("assets:over_" + _path); 
		this.iconButton.downState = Assets.getMovieClip("assets:down_" + _path); 
		
		this.addChild(this.iconButton);
		
		this.addEventListener(Event.ADDED_TO_STAGE, this.add);
	}
	
	function set_enabled(_v:Bool):Bool {
		this.iconButton.enabled = _v;
		return (this.enabled = _v);
	}
	
	function add(e:Event):Void 
	{
		if (func_up != null) this.iconButton.addEventListener(MouseEvent.MOUSE_UP, this.callUp);
		if (func_alt != null) this.iconButton.addEventListener(MouseEvent.RIGHT_MOUSE_UP, this.callAlt);
		if (func_over != null) this.iconButton.addEventListener(MouseEvent.MOUSE_OVER, this.callOver);
		if (func_out != null) this.iconButton.addEventListener(MouseEvent.MOUSE_OUT, this.callOut);
		removeEventListener(Event.ADDED_TO_STAGE, add);
		addEventListener(Event.REMOVED_FROM_STAGE, this.remove);
	}
	function remove(e:Event):Void 
	{
		if (func_up != null) this.iconButton.removeEventListener(MouseEvent.MOUSE_UP, this.callUp);
		if (func_alt != null) this.iconButton.removeEventListener(MouseEvent.RIGHT_MOUSE_UP, this.callAlt);
		if (func_over != null) this.iconButton.removeEventListener(MouseEvent.MOUSE_OVER, this.callOver);
		if (func_out != null) this.iconButton.removeEventListener(MouseEvent.MOUSE_OUT, this.callOut);
		removeEventListener(Event.REMOVED_FROM_STAGE, remove);
	}
	
	function set_func_up(_v:Dynamic -> Void):Dynamic -> Void
	{
		if (_v == null) this.iconButton.removeEventListener(MouseEvent.MOUSE_UP, this.callUp);
		else if (!this.iconButton.hasEventListener(MouseEvent.MOUSE_UP) || !this.hasEventListener(Event.ADDED_TO_STAGE)) this.iconButton.addEventListener(MouseEvent.MOUSE_UP, this.callUp);
		return (func_up = _v);
	}
	function set_func_alt(_v:Dynamic -> Void):Dynamic -> Void
	{
		if (_v == null) this.iconButton.removeEventListener(MouseEvent.RIGHT_MOUSE_UP, this.callAlt);
		else if (!this.iconButton.hasEventListener(MouseEvent.RIGHT_MOUSE_UP) || !this.hasEventListener(Event.ADDED_TO_STAGE)) this.iconButton.addEventListener(MouseEvent.RIGHT_MOUSE_UP, this.callAlt);
		return (func_alt = _v);
	}
	function set_func_over(_v:Dynamic -> Void):Dynamic -> Void
	{
		if (_v == null) this.iconButton.removeEventListener(MouseEvent.MOUSE_OVER, this.callOver);
		else if (!this.iconButton.hasEventListener(MouseEvent.MOUSE_OVER) || !this.hasEventListener(Event.ADDED_TO_STAGE)) this.iconButton.addEventListener(MouseEvent.MOUSE_OVER, this.callOver);
		return (func_over = _v);
	}
	function set_func_out(_v:Dynamic -> Void):Dynamic -> Void
	{
		if (_v == null) this.iconButton.removeEventListener(MouseEvent.MOUSE_OUT, this.callOut);
		else if (!this.iconButton.hasEventListener(MouseEvent.MOUSE_OUT) || !this.hasEventListener(Event.ADDED_TO_STAGE)) this.iconButton.addEventListener(MouseEvent.MOUSE_OUT, this.callOut);
		return (func_out = _v);
	}
	
	function callUp(e:MouseEvent):Void 
	{
		if (this.func_up != null) this.func_up(e);
	}
	function callAlt(e:MouseEvent):Void 
	{
		if (this.func_alt != null) this.func_alt(e);
	}
	function callOut(e:MouseEvent):Void 
	{
		if (this.func_out != null) this.func_out(e);
	}
	function callOver(e:MouseEvent):Void 
	{
		if (this.func_over != null) this.func_over(e);
	}
	
	public function select() {
		this.graphics.clear();
		this.graphics.lineStyle(4, 0, 1);
		this.graphics.moveTo(this.iconButton.x, this.iconButton.y);
		this.graphics.lineTo(this.iconButton.width, this.iconButton.y);
		this.graphics.lineTo(this.iconButton.width, this.iconButton.height);
		this.graphics.lineTo(this.iconButton.x, this.iconButton.height);
		this.graphics.lineTo(this.iconButton.x, this.iconButton.y);
	}
	public function deselect() {
		this.graphics.clear();
	}
}