package lumps;

import haxe.CallStack;
import sys.FileSystem;
import lime.system.System;
import sys.io.File;

import common.Log;
import src.common.SVar;

/**
 * ...
 * @author kevansevans
 */
class LumpBase 
{
	public var lumpname:String;
	public var directory:String;
	public var filename:String;
	public var blocktext:String = "//Lump generated with ZSDK";
	public var id:Int; //If a lump allows for multiple definitions, IE custer 1, cluster 2, cluster 3, this var is for tracking that value
	public var name:String; //If a lump allows for multiple definitions, IE actor_a, actor_b, actor_c, this var is for tracking that value
	public var haschanged:Bool = false; //simple check so compiler doesn't have to remake every file
	public function new(_lumpname:String, _directory:String = "") 
	{
		lumpname = _lumpname;
		directory = _directory;
		filename = System.documentsDirectory + "ZSDK/projects/" + SVar.projectName + "/src/" + directory + "/" + lumpname + ".txt";
	}
	public function retrieve():String
	{
		return("//Fixme!" + CallStack);
	}
	public function compile() {
		if (!haschanged) return;
		Log.event("Compiling lump: " + lumpname);
	}
	public function export() {
		Log.event("Exporting lump: " + lumpname);
		if (FileSystem.exists(filename)) FileSystem.deleteFile(filename);
		var out = File.append(filename, true);
		out.writeString(blocktext);
		out.close();
		Log.event("Exported lump: " + lumpname);
	}
	public function save() {
		Log.event("Saving to JSON: " + lumpname);
	}
}