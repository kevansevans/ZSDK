package com;

import sys.FileSystem;

import hxd.Save;

/**
 * ...
 * @author kevansevans
 */
class UserData 
{
	static var primary = {
		"version" : 0,
		"patch" : 0,
		"hotfix" : 0
	};
	static public var i_version(get, never):String;
	public function new() 
	{
		if (FileSystem.exists("./data/primary.sav")) Save.load(primary, "./data/primary");
		else Save.save(primary, "./data/primary");
	}
	static function get_i_version():String {
		return (primary.version + "." + primary.patch + "." + primary.hotfix);
	}
	
	
}