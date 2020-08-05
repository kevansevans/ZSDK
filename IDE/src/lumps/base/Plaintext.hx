package lumps.base;

#if sys
import sys.FileSystem;
import sys.io.File;
#end

/**
 * ...
 * @author kevansevans
 */
class Plaintext extends Lump
{
	public var blocktext:String = "//Lump generated with ZSDK https://github.com/kevansevans/ZSDK\r\n";
	public var id:Int; //If a lump allows for multiple definitions, IE custer 1, cluster 2, cluster 3, this var is for tracking that value
	public var name:String; //If a lump allows for multiple definitions, IE actor_a, actor_b, actor_c, this var is for tracking that value
	public function new(_lumpname:String, _directory:String = "") 
	{
		super(_lumpname, _directory);
		#if sys
		filename = Project.project_name + "/src/" + directory + "/" + lumpname + ".txt";
		fileloc = Project.project_name + "/src/" + directory + "/";
		#end
	}
	#if sys
	override public function export() 
	{
		super.export();
		
		if (blocktext == "//Lump generated with ZSDK https://github.com/kevansevans/ZSDK\r\n") {
			trace("Lump " + lumpname + " skipped due to missing information");
			return;
		}
		
		try {
			var out = File.append(filename, true);
			out.writeString(blocktext);
			out.close();
		} catch (e:String) {
			
		}
	}
	#end
}