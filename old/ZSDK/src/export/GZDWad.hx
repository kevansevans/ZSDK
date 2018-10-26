package export;

import haxe.crypto.Crc32;
import haxe.zip.Entry;
import haxe.zip.Tools;
import haxe.zip.Writer;
import lime.system.System;
import sys.io.File;
import sys.FileSystem;

import src.common.SVar;
import common.Log;

/**
 * ...
 * @author kevansevans
 */
enum abstract WadType(String) from String {
	public var wad:String;
	public var pk3:String;
	public var iwad:String;
	public var ipk3:String;
}
class GZDWad 
{
	var zipEntries:List<Entry>;
	var source_path:String;
	var export_path:String;
	public function new(_type:String, _launch:Bool = false) 
	{
		Log.event("Started compile: " + SVar.projectName);
		source_path = System.documentsDirectory + "/ZSDK/projects/" + SVar.projectName +"/src";
		export_path = System.documentsDirectory + "/ZSDK/projects/" + SVar.projectName +"/bin";
		Log.event("Source directory: " + source_path);
		Log.event("Export directory: " + export_path);
		
		backup_old(_type);
		
		zipEntries = new List();
		Log.event("Declared new list");

		add_files(source_path, "");
		
		var out = File.write(export_path + '/' + SVar.projectName + '.' + _type, true);
		var writer = new Writer(out);
        writer.write(zipEntries);
        out.close();
		Log.event("Successfully compiled " + _type);
		
		if (_launch) {
			System.openFile(export_path + '/' + SVar.projectName + '.' + _type);
			Log.event("Instructed system to open file");
		}
	}
	function add_files(_path:String, _target:String) {
		if (!FileSystem.exists(_path)) {
			Log.event("Failed to compile," + _path + " Does not exist");
			return;
		};
		if (FileSystem.isDirectory(_path)) {
			for (a in FileSystem.readDirectory(_path)) {
				add_files(_path + "/" + a, _target + "/" + a);
			}
		} else {
			var bytes = File.getBytes(_path);
			var entry:Entry = {
				fileName: _target.substr(1, _target.length),
				fileSize: bytes.length,
				fileTime: FileSystem.stat(_path).mtime,
				compressed: false,
				dataSize: 0,
				data: bytes,
				crc32: Crc32.make(bytes),
			}
			Tools.compress(entry, 9);
			zipEntries.add(entry);
			Log.event("Added file to compile: " + entry.fileName);
		}
	}
	function backup_old(_type:String) 
	{
		var backup:Int = SVar.backup_limit - 1;
		if (FileSystem.exists(export_path + "/" + SVar.projectName + "." + _type + ".backup_" + SVar.backup_limit)) {
			FileSystem.deleteFile(export_path + "/" + SVar.projectName + "." + _type + ".backup_" + SVar.backup_limit);
			Log.event("Removed oldest backup: " + SVar.backup_limit);
		}
		for (a in 0...SVar.backup_limit) {
			var old_name = export_path + "/" + SVar.projectName + "." + _type + ".backup_" + backup;
			var new_name = export_path + "/" + SVar.projectName + "." + _type + ".backup_" + (backup + 1);
			if (FileSystem.exists(old_name)) {
				FileSystem.rename(old_name, new_name);
				Log.event("Renamed backup: " + backup + " to " + (backup + 1));
			}
			--backup;
		}
		if (FileSystem.exists(export_path + "/" + SVar.projectName + "." + _type)) {
			FileSystem.rename(export_path + "/" + SVar.projectName + "." + _type, export_path + "/" + SVar.projectName + "." + _type + ".backup_0");
			Log.event("Renamed latest compile to backup");
		}
	}
}