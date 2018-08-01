package;

import openfl.display.DisplayObject;
import src.common.SVar;

/**
 * ...
 * @author kevansevans
 */
class Project extends DisplayObject
{
	public function new(_name:String) 
	{
		SVar.projectName = _name;
	}
	
}