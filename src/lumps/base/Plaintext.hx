package lumps.base;

import sys.FileSystem;
import sys.io.File;

import bench.Project;

/**
 * ...
 * @author kevansevans
 */
class Plaintext extends Lump
{
	public var blocktext:String = "//Lump generated with ZSDK\n";
	public var id:Int; //If a lump allows for multiple definitions, IE custer 1, cluster 2, cluster 3, this var is for tracking that value
	public var name:String; //If a lump allows for multiple definitions, IE actor_a, actor_b, actor_c, this var is for tracking that value
	public function new(_lumpname:String, _directory:String = "") 
	{
		super(_lumpname, _directory);
		filename = Project.working_dir + "/src/" + directory + "/" + lumpname + ".txt";
		fileloc = Project.working_dir + "/src/" + directory + "/";
	}
	override public function export() 
	{
		super.export();
		
		if (blocktext == "//Lump generated with ZSDK\n") {
			
		}
		
		try {
			var out = File.append(filename, true);
			out.writeString(blocktext);
			out.close();
		} catch (e:String) {
			
		}
	}
}