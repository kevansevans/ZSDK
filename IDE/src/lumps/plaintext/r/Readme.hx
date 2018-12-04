package lumps.plaintext.r;

import haxe.CallStack;
import lumps.base.Plaintext;

/**
 * ...
 * @author kevansevans
 */
class Readme extends Plaintext 
{
	var txt_break:String = "===========================================================================\r\n";
	var txt_space:String = "\r\n                          ";
	public function new(_lumpname:String, _directory:String="") 
	{
		super(_lumpname, _directory);
	}
	
	//block a
	public var archive_msg:Null<String>;
	public var update_to:Null<String>;
	public var advanced_engine:Bool = false;
	public var primary_purpose:Null<String> = "Single play"; //this can't be null to begin with but w/e
	//block b
	public var title:Null<String>;
	public var wadfilename:Null<String>;
	public var author:Null<String>;
	public var email:Null<String>;
	public var other:Null<String>;
	public var misc:Null<String>;
	public var description:Null<String>;
	public var credits:Null<String>;
	//block c
	public var level_count:Null<String>;
	public var sounds:Bool = false;
	public var music:Bool = false;
	public var graphics:Bool = false;
	public var dehacked:Bool = false;
	public var demos:Bool = false;
	public var other_b:Null<String>;
	public var other_c:Null<String>;
	public var game:Null<String>;
	public var map:Null<String>;
	public var single_player:Null<String> = "Designed for";
	public var cooperative:Null<String> = "Designed for";
	public var deathmatch:Null<String> = "Designed for";
	public var other_game:Null<String> = "None";
	public var difficulty:Bool = false;
	public var base:Null<String>;
	public var buildtime:Null<String>;
	public var editors:Null<String>;
	public var bugs:Null<String>;
	public var wont_run:Null<String>;
	public var tested:Null<String>;
	override public function compile() 
	{
		super.compile();
		blocktext += txt_break;
		if (archive_msg != null) blocktext += 'Archive Maintainer      : ' + parse(archive_msg) + "\r\n";
		if (update_to != null) blocktext += 'Archive Maintainer      : ' + parse(update_to) + "\r\n";
		blocktext += 'Advanced engine needed  : ' + (advanced_engine == true ? "Yes" : "No") + "\r\n";
		blocktext += 'Primary purpose         : ' + parse(primary_purpose) + "\r\n";
		blocktext += txt_break;
		if (title != null) blocktext += 'Title                   : ' + parse(title) + "\r\n";
		if (wadfilename != null) {
			blocktext += 'Filename                : ' + parse(wadfilename) + ".pk3" + "\r\n";
			//Project.export_name = wadfilename;
		}
		blocktext += 'Release date            : ' + Date.now() + "\r\n";
		if (author != null) blocktext += 'Author                  : ' + parse(author) + "\r\n";
		if (email != null) blocktext += 'Email Address           : ' + parse(email) + "\r\n";
		if (other != null) blocktext += 'Other Files By Author   : ' + parse(other) + "\r\n";
		if (misc != null) blocktext += 'Misc. Author Info       : ' + parse(misc) + "\r\n";
		blocktext +=  "\r\n";
		if (description != null) blocktext += 'Description             : ' + parse(description) + "\r\n";
		blocktext +=  "\r\n";
		if (credits != null) blocktext += 'Additional Credits to   : ' + parse(credits) + "\r\n";
		blocktext += txt_break;
		blocktext += '* What is included *\r\n\r\n';
		if (level_count != null) blocktext += 'New levels              : ' + parse(level_count) + "\r\n";
		blocktext += 'Sounds                  : ' + (sounds == true ? "Yes" : "No") + "\r\n";
		blocktext += 'Music                   : ' + (music == true ? "Yes" : "No") + "\r\n";
		blocktext += 'Graphics                : ' + (graphics == true ? "Yes" : "No") + "\r\n";
		blocktext += 'Dehacked/BEX Patch      : ' + (dehacked == true ? "Yes" : "No") + "\r\n";
		blocktext += 'Demos                   : ' + (demos == true ? "Yes" : "No") + "\r\n";
		if (other_b != null) blocktext += 'Other                   : ' + parse(other_b) + "\r\n";
		else blocktext += 'Other                   : No\r\n';
		if (other_c != null) blocktext += 'Other                   : ' + parse(other_c) + "\r\n";
		else blocktext += 'Other files required    : No\r\n\r\n\r\n';
		blocktext += '* Play Information *\r\n';
		if (game != null) blocktext += 'Game                    : ' + parse(game) + "\r\n";
		if (map != null) blocktext += 'Map #                   : ' + parse(map) + "\r\n";
		if (single_player != null) blocktext += 'Single Player           : ' + parse(single_player) + "\r\n";
		if (cooperative != null) blocktext += 'Cooperative 2-4 Player  : ' + parse(cooperative) + "\r\n";
		if (deathmatch != null) blocktext += 'Deathmatch 2-4 Player   : ' + parse(deathmatch) + "\r\n";
		if (other_game != null) blocktext += 'Other game styles       : ' + parse(other_game) + "\r\n";
		blocktext += 'Difficulty Settings     : ' + (difficulty == true ? "Yes" : "No") + "\r\n\r\n\r\n";
		blocktext += '* Construction *\r\n\r\n';
		if (base != null) blocktext += 'Base                    : ' + parse(base) + "\r\n";
		if (buildtime != null) blocktext += 'Build Time              : ' + parse(buildtime) + "\r\n";
		if (editors != null) blocktext += 'Editor(s) used          : ' + parse(editors) + ", ZSDK" + "\r\n";
		else blocktext += 'Editor(s) used          : ZSDK' + "\r\n";
		if (bugs != null) blocktext += 'Known Bugs              : ' + parse(bugs) + "\r\n";
		if (wont_run != null) blocktext += 'May Not Run With        : ' + parse(wont_run) + "\r\n";
		if (tested != null) blocktext += 'Tested With             : ' + parse(tested) + "\r\n";
	}
	function parse(_message:Null<String>):String { //returns a formatted string for the readme.txt file that's typically shipped with id Games' hosted mods.
		if (_message == null) return null;
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