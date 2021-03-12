package common;

import haxe.Json;
import openfl.Assets;

/**
 * ...
 * @author Kaelan
 */
class ClassLists 
{

	public static var doomMonsters:Dynamic;
	
	public function new() 
	{
		doomMonsters = Json.parse(Assets.getText("lists/doom/Monsters.json"));
	}
	
}