package common;

import lime.system.System;
import sys.io.File;

import src.common.SVar;

/**
 * ...
 * @author kevansevans
 */
class Log 
{

	public function new() 
	{
		
	}
	public static inline function event(_message:String = "Null log pushed") {
		if (SVar.log_session == null) SVar.log_session = System.documentsDirectory + "/ZSDK/projects/" + SVar.projectName + "/log/" + SVar.projectName + "_" + Date.now().getDate() + "_" + Date.now().getTime() + ".txt";
		var out = File.append(SVar.log_session, true);
		out.writeString(Date.now().getTime() + ":" + _message + "\n");
		out.close();
	}
	
}