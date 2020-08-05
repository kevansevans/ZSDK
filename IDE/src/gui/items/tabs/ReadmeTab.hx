package gui.items.tabs;
import gui.items.comp.FieldBox;
import haxe.ui.components.CheckBox;
import haxe.ui.components.DropDown;
import haxe.ui.components.Stepper;
import haxe.ui.components.TextArea;
import haxe.ui.components.TextField;
import haxe.ui.containers.Box;
import haxe.ui.components.VerticalScroll;
import haxe.ui.containers.HBox;
import haxe.ui.containers.VBox;
import haxe.ui.components.Spacer;
import haxe.ui.data.ArrayDataSource;
import js.html.Text;
import lumps.plaintext.r.Readme;
import haxe.ui.util.Color;

/**
 * ...
 * @author Kaelan
 */
class ReadmeTab extends MenuBase
{
	var lump:Readme;
	
	var rootbox:HBox;
	
	var mainbox:VBox;
		var block_a:VBox;
			var archive:FieldBox;
			var update_to:FieldBox;
			var advanced:FieldBox;
			var purpose:FieldBox;
		var block_b:VBox;
			var title:FieldBox;
			var wadname:FieldBox;
			var author:FieldBox;
			var email:FieldBox;
			var other:FieldBox;
			var misc:FieldBox;
			var description:FieldBox;
			var credits:FieldBox;
		var block_c:VBox;
			var level_count:FieldBox;
			var sounds:FieldBox;
			var music:FieldBox;
			var newgraphics:FieldBox;
			var dehacked:FieldBox;
			var demos:FieldBox;
			var other_b:FieldBox;
			var other_c:FieldBox;
			var game:FieldBox;
			var mapnum:FieldBox;
			var singleplayer:FieldBox;
			var cooperative:FieldBox;
			var deathmatch:FieldBox;
			var othermode:FieldBox;
			var difficulty:FieldBox;
			var base:FieldBox;
			var buildtime:FieldBox;
			var editors:FieldBox;
			var bugs:FieldBox;
			var wontrun:FieldBox;
			var tested:FieldBox;
		
	var preview:VBox;
		var prevText:TextArea;
	
	public function new() 
	{
		super();
		
		this.text = "Readme";
		
		lump = new Readme("Readme");
		
		rootbox = new HBox();
		addComponent(rootbox);
		
		mainbox = new VBox();
		rootbox.addComponent(mainbox);
		
		block_a = new VBox();
		block_a.backgroundColor = Color.fromComponents(0xAA, 0xAA, 0xAA, 0xFF);
		mainbox.addComponent(block_a);
		
		block_a.addComponent(new Spacer());
		
		archive = new FieldBox("Message to archiver:", new TextArea());
		block_a.addComponent(archive);
		
		update_to = new FieldBox("Update to:", new TextField());
		block_a.addComponent(update_to);
		
		advanced = new FieldBox("Advanced engine needed:", new TextField());
		block_a.addComponent(advanced);
		
		var pur_dropdown:DropDown = new DropDown();
		var pur_data:ArrayDataSource<String> = new ArrayDataSource();
		pur_data.add("Single Play");
		pur_data.add("Single Play + Coop Play");
		pur_data.add("Coop Play");
		pur_data.add("Deathmatch");
		pur_data.add("Other Multiplayer");
		pur_data.add("No Levels Included");
		pur_dropdown.dataSource = pur_data;
		purpose = new FieldBox("Primary purpose:", pur_dropdown);
		block_a.addComponent(purpose);
		
		block_a.addComponent(new Spacer());
		
		mainbox.addComponent(new Spacer());
		
		block_b = new VBox();
		block_b.backgroundColor = Color.fromComponents(0xAA, 0xAA, 0xAA, 0xFF);
		mainbox.addComponent(block_b);
		
		block_b.addComponent(new Spacer());
		
		title = new FieldBox("Title:", new TextField());
		block_b.addComponent(title);
		
		wadname = new FieldBox("Wad File Name:", new TextField());
		block_b.addComponent(wadname);
		
		author = new FieldBox("Author:", new TextField());
		block_b.addComponent(author);
		
		email = new FieldBox("Contact Email:", new TextField());
		block_b.addComponent(email);
		
		other = new FieldBox("Other files made by Author:", new TextArea());
		block_b.addComponent(other);
		
		misc = new FieldBox("Misc. Author Info:", new TextArea());
		block_b.addComponent(misc);
		
		description = new FieldBox("Description:", new TextArea());
		block_b.addComponent(description);
		
		credits = new FieldBox("Credits:", new TextArea());
		block_b.addComponent(credits);
		
		block_b.addComponent(new Spacer());
		
		mainbox.addComponent(new Spacer());
		
		block_c = new VBox();
		block_c.backgroundColor = Color.fromComponents(0xAA, 0xAA, 0xAA, 0xFF);
		mainbox.addComponent(block_c);
		
		block_c.addComponent(new Spacer());
		
		level_count = new FieldBox("Level Count:", new Stepper());
		block_c.addComponent(level_count);
		
		sounds = new FieldBox("Sounds:", new CheckBox());
		block_c.addComponent(sounds);
		
		music = new FieldBox("Music:", new CheckBox());
		block_c.addComponent(music);
		
		newgraphics = new FieldBox("Graphics:", new CheckBox());
		block_c.addComponent(newgraphics);
		
		dehacked = new FieldBox("Dehacked:", new CheckBox());
		block_c.addComponent(dehacked);
		
		demos = new FieldBox("Demos:", new CheckBox());
		block_c.addComponent(demos);
		
		other_b = new FieldBox("Other:", new TextField());
		block_c.addComponent(other_b);
		
		other_c = new FieldBox("Other Files Needed:", new TextArea());
		block_c.addComponent(other_c);
		
		var drop_game:DropDown = new DropDown();
		var data_game:ArrayDataSource<String> = new ArrayDataSource();
		data_game.add("Doom 2");
		data_game.add("Doom");
		data_game.add("Final Doom");
		data_game.add("Heretic");
		data_game.add("Hexen");
		data_game.add("Strife");
		data_game.add("Chex Quest");
		drop_game.dataSource = data_game;
		game = new FieldBox("Game:", drop_game);
		block_c.addComponent(game);
		
		mapnum = new FieldBox("Map #:", new TextArea());
		block_c.addComponent(mapnum);
		
		preview = new VBox();
		preview.backgroundColor = Color.fromComponents(0xAA, 0xAA, 0xAA, 0xFF);
		rootbox.addComponent(preview);
		
		prevText = new TextArea();
		preview.addComponent(prevText);
	}
	
	override public function resize(_width:Int, _height:Int) 
	{
		super.resize(_width, _height);
		
		this.width = _width;
		this.height = _height;
		
		mainbox.width = 740;
		mainbox.height = this.height;
		
		block_a.width = mainbox.width;
		
		archive.resize(block_a.width, 75);
		update_to.resize(block_a.width, 25, 175);
		advanced.resize(block_a.width, 25, 175);
		purpose.resize(block_a.width, 25, 150);
		
		block_b.width = mainbox.width;
		title.resize(block_b.width, 25, 175);
		wadname.resize(block_b.width, 25, 175);
		author.resize(block_b.width, 25, 175);
		email.resize(block_b.width, 25, 175);
		other.resize(block_b.width, 75);
		misc.resize(block_b.width, 75);
		description.resize(block_b.width, 75);
		credits.resize(block_b.width, 75);
		
		block_c.width = mainbox.width;
		level_count.resize(block_c.width, 25, 25);
		sounds.resize(block_c.width, 25, 25);
		
		preview.width = (this.width) - mainbox.width;
		preview.height = (this.height) - 30;
		
		prevText.width = preview.width;
		prevText.height = preview.height;
	}
	
}