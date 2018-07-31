package src.common;

import openfl.net.SharedObject;

import src.common.SVar;

/**
 * ...
 * @author kevansevans
 */
enum abstract StorageNamespace(String) from String {
	public var general:String = "ZSDK_0";
}
class LocalStorage 
{

	public function new() 
	{
		
	}
	public function load_local() { //loads in remembered data
		var ZSDK_sol_0:SharedObject = SharedObject.getLocal(StorageNamespace.general, "/");
		if (ZSDK_sol_0.data != null) SVar.general = ZSDK_sol_0.data;
	}
}