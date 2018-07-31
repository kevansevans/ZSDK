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
	public function new(_type:String) 
	{
		var dir = System.documentsDirectory + "/ZSDK/" + SVar.projectName;
		
		zipEntries = new List<Entry>();
		
		if (FileSystem.exists(dir + "/" + SVar.projectName + "." + _type + ".backup_3")) {
			FileSystem.deleteFile(dir + "/" + SVar.projectName + "." + _type + ".backup_3");
		}
		if (FileSystem.exists(dir + "/" + SVar.projectName + "." + _type + ".backup_2")) {
			FileSystem.rename(dir + "/" + SVar.projectName + "." + _type + ".backup_2", dir + "/" + SVar.projectName + "." + _type + ".backup_3");
		}
		if (FileSystem.exists(dir + "/" + SVar.projectName + "." + _type + ".backup_1")) {
			FileSystem.rename(dir + "/" + SVar.projectName + "." + _type + ".backup_1", dir + "/" + SVar.projectName + "." + _type + ".backup_2");
		}
		if (FileSystem.exists(dir + "/" + SVar.projectName + "." + _type + ".backup_0")) {
			FileSystem.rename(dir + "/" + SVar.projectName + "." + _type + ".backup_0", dir + "/" + SVar.projectName + "." + _type + ".backup_1");
		}
		if (FileSystem.exists(dir + "/" + SVar.projectName + "." + _type)) {
			FileSystem.rename(dir + "/" + SVar.projectName + "." + _type, dir + "/" + SVar.projectName + "." + _type + ".backup_0");
		}
		
		add_files(dir, "");
		
		var out = File.write(dir + "/" + SVar.projectName + "." + _type, true);
		var writer = new Writer(out);
        writer.write(zipEntries);
        out.close();
	}
	function add_files(_path:String, _target:String) {
		if (!FileSystem.exists(_path)) throw '$_path does not exist';
		var _backupCheck = _path.substring(_path.length - 9, _path.length);
		if (FileSystem.isDirectory(_path)) {
			for (a in FileSystem.readDirectory(_path)) {
				if (_backupCheck == ".backup_0" || _backupCheck == ".backup_1" || _backupCheck == ".backup_2" || _backupCheck == ".backup_3") continue;
				add_files(_path + "/" + a, _target + "/" + a);
			}
		} else {
			if (_backupCheck != ".backup_0" && _backupCheck != ".backup_1" && _backupCheck != ".backup_2" && _backupCheck != ".backup_3") {
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
	}
}