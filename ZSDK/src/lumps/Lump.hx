package lumps;

import haxe.CallStack;

import common.Log;
import src.common.SVar;

/**
 * ...
 * @author kevansevans
 */
class Lump 
{
	public var lumpname:String;
	public var directory:String;
	public var filename:String;
	public var haschanged:Bool = false; //simple check so compiler doesn't have to remake every file
	public function new(_lumpname:String, _directory:String = "") 
	{
		lumpname = _lumpname;
		directory = _directory;
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
	}
	public function save() {
		Log.event("Saving to JSON: " + lumpname);
	}
}