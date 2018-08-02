package export;

import haxe.crypto.Crc32;
import haxe.zip.Compress;
import haxe.zip.Entry;
import haxe.zip.Tools;
import haxe.zip.Writer;
import lime.system.System;
import sys.io.File;
import sys.FileSystem;

import src.common.SVar;

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
	public function new(_type:String) 
	{
		source_path = System.documentsDirectory + "/ZSDK/" + SVar.projectName +"/src";
		export_path = System.documentsDirectory + "/ZSDK/" + SVar.projectName +"/bin";
		
		backup_old(_type);
		
		zipEntries = new List();

		add_files(source_path, "");
		
		var out = File.write(export_path + '/' + SVar.projectName + '.' + _type, true);
		var writer = new Writer(out);
        writer.write(zipEntries);
        out.close();
	}
	function add_files(_path:String, _target:String) {
		if (!FileSystem.exists(_path)) throw '$_path does not exist';
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
		}
	}
	function backup_old(_type:String) 
	{
		var backup:Int = SVar.backup_limit - 1;
		if (FileSystem.exists(export_path + "/" + SVar.projectName + "." + _type + ".backup_" + SVar.backup_limit)) FileSystem.deleteFile(export_path + "/" + SVar.projectName + "." + _type + ".backup_" + SVar.backup_limit);
		for (a in 0...SVar.backup_limit) {
			var old_name = export_path + "/" + SVar.projectName + "." + _type + ".backup_" + backup;
			var new_name = export_path + "/" + SVar.projectName + "." + _type + ".backup_" + (backup + 1);
			trace(old_name, new_name);
			if (FileSystem.exists(old_name)) {
				FileSystem.rename(old_name, new_name);
			}
			--backup;
		}
		if (FileSystem.exists(export_path + "/" + SVar.projectName + "." + _type)) {
			FileSystem.rename(export_path + "/" + SVar.projectName + "." + _type, export_path + "/" + SVar.projectName + "." + _type + ".backup_0");
		}
	}
}