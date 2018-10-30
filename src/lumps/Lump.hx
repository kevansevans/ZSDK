package lumps;

import haxe.CallStack;
import sys.FileSystem;


/**
 * ...
 * @author kevansevans
 */
class Lump 
{
	public var lumpname:String;
	public var directory:String;
	public var filename:String;
	public var fileloc:String;
	public var haschanged:Bool = true; //simple check so compiler doesn't have to remake every file
	public function new(_lumpname:String, _directory:String = "") 
	{
		lumpname = _lumpname;
		directory = _directory;
		#if debug
		haschanged = true; //set to true so under testing environments, this will always export
		#end
	}
	public function retrieve():String
	{
		return("//Fixme!" + CallStack);
	}
	public function compile() {
		if (!haschanged) return;
	}
	public function export() {
		if (!FileSystem.isDirectory(fileloc)) FileSystem.createDirectory(fileloc);
		if (FileSystem.exists(filename)) FileSystem.deleteFile(filename);
	}
	public function save() {
		
	}
}