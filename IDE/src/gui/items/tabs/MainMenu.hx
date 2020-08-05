package gui.items.tabs;
import haxe.ui.components.TextArea;
import haxe.ui.containers.Box;

/**
 * ...
 * @author Kaelan
 */
class MainMenu extends MenuBase
{
	var textbox:TextArea;
	public function new() 
	{
		super();
		
		this.text = "Main";
		
		textbox = new TextArea();
		addComponent(textbox);
		
		textbox.text = " Welcome to ZSDK! An unofficial ZDoom SDK! Right now this program is in super early alpha, so all we have is the tabs above.\n\n Currently we're in the \"Quick Editor\". The online version of ZSDK will offer the ability to quickly make needed assets and download them.\n\n Please be sure to check out the About tab to see more info on ZSDK and HxDoom!";
	}
	
	override public function resize(_width:Int, _height:Int) 
	{
		super.resize(_width, _height);
		
		textbox.width = this.width - 40;
		textbox.height = this.height - 40;
	}
}