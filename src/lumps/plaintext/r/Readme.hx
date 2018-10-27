package lumps.plaintext.r;

import haxe.CallStack;
import lumps.base.Plaintext;
import bench.Project;

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
	
	public var block_a:Bool = false;
	public var block_b:Bool = false;
	public var block_c:Bool = false;
	
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
	public var level_count:Null<Int>;
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
	public var editors:Null<String> = "";
	public var bugs:Null<String>;
	public var wont_run:Null<String>;
	public var tested:Null<String>;
	override public function compile() 
	{
		super.compile();
		if (block_a) {
			blocktext += txt_break;
			if (archive_msg != null) blocktext += 'Archive Maintainer      : ' + parse(archive_msg) + "\n";
			if (update_to != null) blocktext += 'Archive Maintainer      : ' + parse(update_to) + "\n";
			blocktext += 'Advanced engine needed  : ' + (advanced_engine == true ? "Yes" : "No") + "\n";
			blocktext += 'Primary purpose         : ' + primary_purpose + "\n";
			blocktext += txt_break;
		}
		if (block_b) {
			if (title != null) blocktext += 'Title                   : ' + title + "\n";
			if (wadfilename != null) {
				blocktext += 'Filename                : ' + wadfilename + ".pk3" + "\n";
				Project.export_name = wadfilename;
			}
			blocktext += 'Release date            : ' + Date.now() + "\n";
			if (author != null) blocktext += 'Author                  : ' + author + "\n";
			if (email != null) blocktext += 'Email Address           : ' + email + "\n";
			if (other != null) blocktext += 'Other Files By Author   : ' + other + "\n";
			if (misc != null) blocktext += 'Misc. Author Info       : ' + misc + "\n";
			blocktext +=  "\n";
			if (description != null) blocktext += 'Description             : ' + parse(description) + "\n";
			blocktext +=  "\n";
			if (credits != null) blocktext += 'Description             : ' + credits + "\n";
			blocktext += txt_break;
		}
		if (block_c) {
			blocktext += '* What is included *\n\n';
			if (level_count != null) blocktext += 'New levels              : ' + level_count + "\n";
			blocktext += 'Sounds                  : ' + (sounds == true ? "Yes" : "No") + "\n";
			blocktext += 'Music                   : ' + (music == true ? "Yes" : "No") + "\n";
			blocktext += 'Graphics                : ' + (graphics == true ? "Yes" : "No") + "\n";
			blocktext += 'Dehacked/BEX Patch      : ' + (dehacked == true ? "Yes" : "No") + "\n";
			blocktext += 'Demos                   : ' + (demos == true ? "Yes" : "No") + "\n";
			if (other_b != null) blocktext += 'Other                   : ' + other_b + "\n";
			else blocktext += 'Other                   : No\n';
			if (other_c != null) blocktext += 'Other                   : ' + other_c + "\n";
			else blocktext += 'Other files required    : No\n\n\n';
			blocktext += '* Play Information *n\n';
			if (game != null) blocktext += 'Game                    : ' + game + "\n";
			if (map != null) blocktext += 'Map #                   : ' + map + "\n";
			if (single_player != null) blocktext += 'Single Player           : ' + single_player + "\n";
			if (cooperative != null) blocktext += 'Cooperative 2-4 Player  : ' + cooperative + "\n";
			if (deathmatch != null) blocktext += 'Deathmatch 2-4 Player   : ' + deathmatch + "\n";
			if (other_game != null) blocktext += 'Other game styles       : ' + other_game + "\n";
			blocktext += 'Difficulty Settings     : ' + (difficulty == true ? "Yes" : "No") + "\n\n\n";
			blocktext += '* Construction *\n\n';
			if (base != null) blocktext += 'Base                    : ' + base + "\n";
			if (buildtime != null) blocktext += 'Build Time              : ' + buildtime + "\n";
			blocktext += 'Editor(s) used          : ' + editors + ", ZSDK" + "\n";
			if (bugs != null) blocktext += 'Known Bugs              : ' + bugs + "\n";
			if (wont_run != null) blocktext += 'May Not Run With        : ' + wont_run + "\n";
			if (tested != null) blocktext += 'Tested With             : ' + tested + "\n";
		}
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