package component;

import component.LineContainer;
import haxe.ui.containers.ListView;
import haxe.ui.containers.ScrollView;
import haxe.ui.containers.VBox;
import haxe.ui.data.ArrayDataSource;

/**
 * ...
 * @author Kaelan
 */
class CodeView extends ScrollView
{
	
	var lineTrackerArray:Array<LineContainer>;
	
	public function new() 
	{
		super();
		
		this.paddingBottom = -5;
		
		lineTrackerArray = new Array();
		lineTrackerArray.push(new LineContainer(1, "Class MyCustomClass : DoomImp replaces DoomImp"));
		lineTrackerArray.push(new LineContainer(2, "{"));
		lineTrackerArray.push(new LineContainer(3, ""));
		lineTrackerArray.push(new LineContainer(4, "}"));
		
		for (line in lineTrackerArray) {
			addComponent(line);
		}
	}
	
	public function resize() {
		for (line in lineTrackerArray) {
			line.resize(this.width);
		}
	}
	
}
