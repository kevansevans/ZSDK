package lumps.game;
import flash.Vector;

/**
 * ...
 * @author kevansevans
 */
enum abstract Order(Int) from Int {
	
}
class Gameinfo extends LumpBase
{
	var definitions:Vector<Null<DefinitionBase>>;
	public function new() 
	{
		super();
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