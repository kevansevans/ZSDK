package workbench.components;

import workbench.Project;
import sys.FileSystem;

/**
 * ...
 * @author kevansevans
 */
class DirParser 
{
	public var blocktext:String = "";
	public function new() 
	{
		
	}
	public function get_list() {
		get_files(Project.working_dir);
	}
	function get_files(_path:String) {
		var str_array:Array<String> = new Array();
		if (!FileSystem.exists(_path)) {
			trace("Failed to parse," + _path + " Does not exist");
			return;
		};
		if (FileSystem.isDirectory(_path)) {
			for (a in FileSystem.readDirectory(_path)) {
				get_files(_path + "/" + a);
			}
		} else {
			str_array.push(_path.substring(Project.working_dir.length + 1));
		}
		str_array.sort(function(a:String, b:String):Int
		{
			a = a.toLowerCase();
			b = b.toLowerCase();
			if (a < b) return -1;
			if (a > b) return 1;
			return 0;
		} );
		for (a in str_array) {
			blocktext += a + "\r\n";
		}
	}
}