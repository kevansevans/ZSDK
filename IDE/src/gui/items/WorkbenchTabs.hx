package gui.items;

import gui.items.tabs.*;

import haxe.ui.containers.TabView;

/**
 * ...
 * @author Kaelan
 */
class WorkbenchTabs extends TabView
{
	//One Time tabs
	public var main:MainMenu;
	public var readme:ReadmeTab;
	
	public function new() 
	{
		super();
		
		#if sys
		
		#else
		main = new MainMenu();
		addComponent(main);
		readme = new ReadmeTab();
		addComponent(readme);
		#end
	}
}