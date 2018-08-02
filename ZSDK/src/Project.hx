package;

import openfl.display.DisplayObject;

import export.GZDWad;
import src.common.SVar;

/**
 * ...
 * @author kevansevans
 */
class Project extends DisplayObject
{
	private var export:GZDWad;
	public function new(_name:String) 
	{
		SVar.projectName = _name;
		super();
	}
	
}