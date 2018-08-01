package lumps.m;

import haxe.ds.Vector;

/**
 * ...
 * @author kevansevans
 */
enum abstract Order(Int) from Int {
	public var cluster:Int;
	public var episode:Int;
}
class Mapinfo extends LumpBase
{
	var definitions:Vector<Null<DefinitionBase>> = new Vector(11);
	
	var cluster:Cluster;
	var episode:Episode;
	
	public function new() 
	{
		super();
	}
	public function new_cluster() {
		cluster = new Cluster();
		
		definitions[Order.cluster] = cluster;
	}
	public function new_episode() {
		episode = new Episode();
		
		definitions[Order.episode] = episode;
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
		blockstring += '}';
		return (blockstring);
	}
	
}
class Episode extends DefinitionBase {
	public var clearepisodes:Bool = false;
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
		if (clearepisodes) blockstring += 'clearepisodes\n';
		if (episode != null) {
			if (blockstring != '') blockstring += '\n';
			blockstring += 'episode $episode\n{\n'
		} else {
			return ("//ZSDK Error: This episode lump is incomplete");
		}
		if (ep_name != null) blockstring += '\tname = \"$ep_name\"\n';
		if (lookup != null) blockstring += '\tlookup = \"$lookup\"\n';
		if (picname != null) blockstring += '\tpicname = \"$picname\"\n';
		if (key != null) blockstring += '\tkey = \"$key\"\n';
		if (remove) blockstring += '\t$remove\n';
		if (noskillmenu) blockstring += '\t$noskillmenu\n';
		if (optional) blockstring += '\t$optional\n';
		if (extended) blockstring += '\t$extended\n';
		blockstring += '}';
		return (blockstring);
	}
	
}
class Map extends DefinitionBase {
	
	public function new() {
		super();
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