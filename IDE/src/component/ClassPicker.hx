package component;

import haxe.ui.components.DropDown;
import haxe.ui.data.ArrayDataSource;

/**
 * ...
 * @author Kaelan
 */
class ClassPicker extends DropDown 
{

	var data:ArrayDataSource<String>;
	
	public function new(_items:Dynamic) 
	{
		super();
		
		data = new ArrayDataSource();
		
		var items:Array<String> = cast(_items.listData);
		
		for (thing in items) {
			data.add(thing);
		}
		
		this.dataSource = data;
		
	}
	
}