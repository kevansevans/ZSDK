package;

import openfl.display.DisplayObject;

import export.GZDWad;
import src.common.SVar;
import common.Log;

/**
 * ...
 * @author kevansevans
 */
class Project extends DisplayObject
{
	private var export:GZDWad;
	public function new(_name:String, _load:Bool = false) 
	{
		super();
		
		SVar.projectName = _name;
		Log.event("Init project: " + _name + ", Loaded = " + _load);
	}
	
}