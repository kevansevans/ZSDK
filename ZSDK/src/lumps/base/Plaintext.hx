package lumps.base;

import sys.FileSystem;
import lime.system.System;
import sys.io.File;

import src.common.SVar;
import common.Log;

/**
 * ...
 * @author kevansevans
 */
class Plaintext extends Lump
{
	public var blocktext:String = "//Lump generated with ZSDK";
	public var id:Int; //If a lump allows for multiple definitions, IE custer 1, cluster 2, cluster 3, this var is for tracking that value
	public var name:String; //If a lump allows for multiple definitions, IE actor_a, actor_b, actor_c, this var is for tracking that value
	public function new(_lumpname:String, _directory:String = "") 
	{
		super(_lumpname, _directory);
		filename = System.documentsDirectory + "ZSDK/projects/" + SVar.projectName + "/src/" + directory + "/" + lumpname + ".txt";
	}
	override public function export() 
	{
		super.export();
		
		if (FileSystem.exists(filename)) FileSystem.deleteFile(filename);
		var out = File.append(filename, true);
		out.writeString(blocktext);
		out.close();
		Log.event("Exported lump: " + lumpname);
	}
}