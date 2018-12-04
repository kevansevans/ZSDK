package lumps.plaintext.m;

import lumps.base.Plaintext;

/**
 * ...
 * @author kevansevans
 */
class Mapinfo extends Plaintext
{
	var clusters:Array<Cluster>;
	var episodes:Array<Episode>;
	var maps:Array<Mapdef>;
	
	var cluster_count:Int = 0;
	var episode_count:Int = 0;
	var map_count:Int = 0;
	
	public function new() 
	{
		super("Mapinfo");
	}
	public function new_cluster() {
		clusters = new Array();
		clusters[cluster_count] = new Cluster();
	}
	public function add_cluster() {
		++cluster_count;
		clusters[cluster_count] = new Cluster();
	}
	public function new_episode() {
		episodes = new Array();
		episodes[episode_count] = new Episode(episode_count);
	}
	public function add_episode() {
		++episode_count;
		episodes[episode_count] = new Episode(episode_count);
	}
	public function new_map() {
		maps = new Array();
		maps[map_count] = new Mapdef(map_count);
	}
	public function add_map() {
		++map_count;
		maps[map_count] = new Mapdef(map_count);
	}
	override public function compile() {
		
		super.compile();
		
		if (clusters != null) {
			for (a in clusters) {
				blocktext += a;
			}
		}
		if (Episode.clearepisodes) 
		{
			if (episodes != null && episodes.length > 0) {
				blocktext += 'clearepisodes';
				for (b in episodes) {
					blocktext += b;
				}
			} else {
				blocktext += "//ZSDK error: Can not compile Episode definitions. Clearepisodes used without defining new episodes";
			}
		} else {
			for (b in episodes) {
				blocktext += b;
			}
		}
		
		export();
		
	}
}
class Cluster extends DefinitionBase {
	public var entertext:Null<String>;
	public var exittext:Null<String>;
	public var exittextislump:Bool = false;
	public var music:Null<String>;
	public var flat:Null<String>;
	public var pic:Null<String>;
	public var hub:Bool = false;
	public var allowintermission:Bool = false;
	public function new(_id:Int = 0) {
		super();
		id = _id;
	}
	override public function get_info():String 
	{
		var blockstring = 'cluster $id \n{\n';
		if (entertext != null) blockstring += '\tentertext = \"$entertext\"\n';
		if (exittext != null) blockstring += '\texittext = \"$exittext\"\n';
		if (exittextislump == true) blockstring += '\texittextislump\n';
		if (music != null) blockstring += '\t$music\n';
		if (flat != null) blockstring += '\t$flat\n';
		if (pic != null) blockstring += '\t$pic\n';
		if (hub == true) blockstring += '\thub\n';
		if (allowintermission == true) blockstring += '\tallowintermission\n';
		blockstring += '}/n';
		return (blockstring);
	}
	
}
class Episode extends DefinitionBase {
	public static var clearepisodes:Bool = false;
	public var episode:Null<String>;
	public var ep_name:Null<String>;
	public var lookup:Null<String>;
	public var picname:Null<String>;
	public var key:Null<String>;
	public var remove:Bool = false;
	public var noskillmenu:Bool = false;
	public var optional:Bool = false;
	public var extended:Bool = false;
	public function new(_id:Int = 0) {
		super();
		id = _id;
	}
	override public function get_info():String 
	{
		var blockstring = '';
		blockstring += 'episode $episode\n{\n';
		if (ep_name != null) blockstring += '\tname = \"$ep_name\"\n';
		if (lookup != null) blockstring += '\tlookup = \"$lookup\"\n';
		if (picname != null) blockstring += '\tpicname = \"$picname\"\n';
		if (key != null) blockstring += '\tkey = \"$key\"\n';
		if (remove) blockstring += '\t$remove\n';
		if (noskillmenu) blockstring += '\t$noskillmenu\n';
		if (optional) blockstring += '\t$optional\n';
		if (extended) blockstring += '\t$extended\n';
		blockstring += '}/n';
		return (blockstring);
	}
}
class Mapdef extends DefinitionBase {
	public var maplump:Null<String>;
	public var mapname:Null<String>;
	public var lookup:Bool = false;
	//map properties
	
	public function new(_id:Int = 0) {
		super();
		id = _id;
	}
	
}
class Skill extends DefinitionBase {
	
	public function new() {
		super();
	}
	
}
class GameInfoDef extends DefinitionBase {
	
	public function new() {
		super();
	}
	
}
class Intermission extends DefinitionBase {
	
	public function new() {
		super();
	}
	
}
class Automap extends DefinitionBase {
	
	public function new() {
		super();
	}
	
}
class EditorNumber extends DefinitionBase {
	
	public function new() {
		super();
	}
	
}
class SpawnNumber extends DefinitionBase {
	
	public function new() {
		super();
	}
	
}
class ConversationNumber extends DefinitionBase {
	
	public function new() {
		super();
	}
	
}
class DamageType extends DefinitionBase {
	
	public function new() {
		super();
	}
	
}