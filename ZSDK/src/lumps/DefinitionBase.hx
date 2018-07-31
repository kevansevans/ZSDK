package lumps;

import haxe.CallStack;

import openfl.utils.Object;

/**
 * ...
 * @author kevansevans
 */
class DefinitionBase 
{
	var data:Object;
	public function new() 
	{
		
	}
	public function get_info():String {
		return("//I Have no info set! " + CallStack);
	}
}