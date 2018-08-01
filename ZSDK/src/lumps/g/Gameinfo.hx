package lumps.g;
import flash.Vector;

/**
 * ...
 * @author kevansevans
 */
enum abstract Order(Int) from Int {
	public var cluster:Int;
	public var episode:Int;
}
class Gameinfo extends LumpBase
{
	var definitions:Vector<Null<DefinitionBase>> = new Vector(11);
	
	var cluster:Cluster;
	
	public function new() 
	{
		super();
	}
	public function new_cluster() {
		cluster = new Cluster();
		
		definitions[Order.cluster] = cluster;
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
	
	public function new() {
		super();
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