package lumps;

import haxe.CallStack;

/**
 * ...
 * @author kevansevans
 */
class DefinitionBase 
{
	var data:Object;
	public var id:Int; //If a lump allows for multiple definitions, IE custer 1, cluster 2, cluster 3, this var is for tracking that value
	public var name:String; //If a lump allows for multiple definitions, IE actor_a, actor_b, actor_c, this var is for tracking that value
	public var haschanged:Bool = false; //simple check so compiler doesn't have to remake every file
	public function new() 
	{
		
	}
	public function get_info():String {
		return("//I Have no info set! " + CallStack);
	}
}