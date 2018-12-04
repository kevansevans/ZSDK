package workbench.panels;

import openfl.display.Sprite;
import workbench.components.TextButton;

/**
 * ...
 * @author kevansevans
 */
class Control extends Sprite 
{
	var pt_button:TextButton;
	var gp_button:TextButton;
	var delete:TextButton;
	
	var add_asset:TextButton;
	
	var refresh:TextButton;
	var compile:TextButton;
	var pack_prj:TextButton;
	var test_prj:TextButton;
	
	
	public function new() 
	{
		super();
		
		pt_button = new TextButton("Add new plaintext lump");
		addChild(pt_button);
		
		gp_button = new TextButton("Add new graphic lump", Std.int(pt_button.width - 2));
		addChild(gp_button);
		gp_button.y = pt_button.y + pt_button.height + 5;
		
		delete = new TextButton("Delete current lump", Std.int(gp_button.width - 2));
		addChild(delete);
		delete.y = gp_button.y + gp_button.height + 5;
	}
}