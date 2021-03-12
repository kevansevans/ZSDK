package component;

import haxe.ui.components.Label;
import haxe.ui.containers.Box;
import haxe.ui.containers.Grid;
import haxe.ui.util.Color;

/**
 * ...
 * @author Kaelan
 */
class LineContainer extends Grid 
{

	public var line:Label;
	public var lineNumber(default, set):Int;
	public var lineNumLabel:Label;
	public var lineNumBox:Box;
	public var lineContBox:Box;
	
	public function new(_lineNumber:Int, _msg:String) 
	{
		super();
		
		this.columns = 2;
		
		lineNumBox = new Box();
		this.addComponent(lineNumBox);
		lineNumLabel = new Label();
		lineNumBox.addComponent(lineNumLabel);
		
		lineNumber = _lineNumber;
		
		lineContBox = new Box();
		this.addComponent(lineContBox);
		line = new Label();
		line.text = _msg;
		lineContBox.addComponent(line);
	}
	
	function set_lineNumber(value:Int):Int 
	{
		if (value % 2 == 0){
			lineNumBox.backgroundColor = Color.fromString("0xFF0000");
			this.backgroundColor = Color.fromString("0xEEEEEE");
		}
		else {
			lineNumBox.backgroundColor = Color.fromString("0xFF00");
			this.backgroundColor = Color.fromString("0xDDDDDD");
		}
		
		lineNumLabel.text = value + "";
		
		return lineNumber = value;
	}
	
	public function resize(_width:Float) {
		lineContBox.width = _width - 30;
	}
	
}