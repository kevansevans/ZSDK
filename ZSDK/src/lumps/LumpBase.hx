package lumps;

import haxe.CallStack;

/**
 * ...
 * @author kevansevans
 */
class LumpBase 
{
	public var id:Int; //If a lump allows for multiple definitions, IE custer 1, cluster 2, cluster 3, this var is for tracking that value
	public var name:String; //If a lump allows for multiple definitions, IE actor_a, actor_b, actor_c, this var is for tracking that value
	public function new() 
	{
		
	}
	public function retrieve():String
	{
		return("//Fixme!" + CallStack);
	}
	public function export() {
		
	}
}