package lumps.plaintext.r;

import lumps.base.Plaintext;

/**
 * ...
 * @author kevansevans
 */
class Readme extends Plaintext 
{
	var txt_break:String = "===========================================================================\n";
	var txt_space:String = "\n                          ";
	public function new(_lumpname:String, _directory:String="") 
	{
		super(_lumpname, _directory);
	}
	public var archive_msg:Null<String>;
	public var update_to:Null<String>;
	public var advanced_engine:Bool = false;
	public var primary_purpose:Null<String> = "Single play"; //this can't be null to begin with but w/e
	public var title:Null<String>;
	public var wadfilename:Null<String>;
	override public function compile() 
	{
		super.compile();
		trace("compiling!");
		blocktext += txt_break;
		if (archive_msg != null) blocktext += 'Archive Maintainer      : ' + parse(archive_msg) + "\n";
		if (update_to != null) blocktext += 'Archive Maintainer      : ' + parse(update_to) + "\n";
		blocktext += 'Advanced engine needed  : ' + (advanced_engine == true ? "yes" : "no") + "\n";
		blocktext += 'Primary purpose         : ' + primary_purpose + "\n";
		blocktext += txt_break;
		if (title != null) blocktext += 'Title                   : ' + title;
		if (wadfilename != null) blocktext += 'Filename                : ' + wadfilename + ".pk3";
		blocktext += 'Release date            : ' + Date.now();
	}
	function parse(_message:String):String { //returns a formatted string for the readme.txt file that's typically shipped with id Games' hosted mods.
		var _locString:String = "";
		var b = 0;
		for (a in 0..._message.length) {
			++b;
			_locString += _message.charAt(a);
			if (b >= 50) {
				if (_message.charAt(a) != " ") continue;
				else {
					_locString += txt_space;
					b = 0;
				}
			}
		}
		return _locString;
	}
}