package gui.items.comp;

import haxe.ui.components.Label;
import haxe.ui.containers.HBox;
import haxe.ui.core.Component;

/**
 * ...
 * @author Kaelan
 */
class FieldBox extends HBox
{
	var label:Label;
	var component:Component;
	
	public function new(_fieldName:String, _component:Component) 
	{
		super();
		
		label = new Label();
		addComponent(label);
		label.text = _fieldName;
		
		component = _component;
		addComponent(component);
	}
	
	public function resize(_width:Float, _height:Float, ?_compWidth:Int, ?_compHeight:Int) {
		
		this.width = _width;
		this.height = _height;
		
		label.width = width / 3;
		label.height = _height;
		
		if (_compWidth == null) component.width = (_width / 3) * 2 - 10;
		else component.width = _compWidth;

		if (_compHeight == null) component.height = _height;
		else component.height = _compHeight;
	}
}