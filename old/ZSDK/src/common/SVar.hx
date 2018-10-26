package src.common;

import openfl.utils.Object;
import openfl.text.TextFormat;

/**
 * ...
 * @author kevansevans
 */
class SVar 
{
	public static var general:Object = {
		
	};
	public static var projectName:String = "Untitled";
	public static var backup_limit:Int = 5;
	public static var log_session:Null<String>;
	public static inline var data_readme:String = "These files are used to quickly reload the project without having to rescan every file.\nThey are in the .json format for your convinience, but it is not recomended you alter them unless you know what you are doing.\nIf you are looking for a more powerful editor, please check out Slade http://slade.mancubus.net/";
	public function new() 
	{
		
	}
	public static inline function GZD_Sys_Font(_color:Int):TextFormat {
		return (new TextFormat(null, 12, _color, true));
	}
}