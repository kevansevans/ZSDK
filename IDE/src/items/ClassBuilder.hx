package items;

import common.ClassLists;
import component.CodeView;

import openfl.Lib;

import haxe.ui.containers.Box;
import haxe.ui.containers.HBox;
import haxe.ui.containers.VBox;
import haxe.ui.components.Label;
import haxe.ui.components.TextField;
import haxe.ui.containers.Box;
import haxe.ui.containers.Grid;
import haxe.ui.containers.ListView;
import haxe.ui.util.Color;
import haxe.ui.events.UIEvent;

import component.ClassPicker;

/**
 * ...
 * @author Kaelan
 */
class ClassBuilder extends HBox 
{
	
	public var fileName:String;
	
	var itemIndex:Int;
	
	var rightbox:VBox;
	var leftBox:VBox;
	var classBox:HBox;
	
	public function new(_name:String, _item:Int) 
	{
		super();
		
		this.name = fileName = _name;
		if (_name.substr(_name.length - 4, 4) != ".zsc") {
			fileName += ".zsc";
		}
		
		itemIndex = _item;
		
		leftBox = new VBox();
		this.addComponent(leftBox);
		
		rightbox = new VBox();
		rightbox.padding = 5;
		this.addComponent(rightbox);
		
		classBox = new HBox();
		leftBox.addComponent(classBox);
		
		classBuilderUI();
		classOutputPreviewUI();
		
		resize();
	}
	
	var lineView:CodeView;
	
	public function classOutputPreviewUI() {
		
		lineView = new CodeView();
		rightbox.addComponent(lineView);
		
	}
	
	var classBuilderLeft:VBox;
	
		var classNameLabel:Label;
		var classNameField:TextField;
		
		var classInheritanceLabel:Label;
		var classInheritanceField:TextField;
		var classInheritancePicker:ClassPicker;
		
		var classReplaceLabel:Label;
		var classReplaceField:TextField;
		var classReplacePicker:ClassPicker;
		
	public function classBuilderUI() {
		
		classBuilderLeft = new VBox();
		classBox.addComponent(classBuilderLeft);
		classBox.padding = 5;
		
		var leftgrid:Grid = new Grid();
		leftgrid.columns = 3;
		classBox.addComponent(leftgrid);
		
		classNameLabel = new Label();
		classNameLabel.text = "Class Name:";
		leftgrid.addComponent(classNameLabel);
		
		classNameField = new TextField();
		leftgrid.addComponent(classNameField);
		leftgrid.addComponent(new HBox());
		classNameField.text = name;
		classNameField.addEventListener(UIEvent.CHANGE, function(_event:UIEvent) {
			this.name = classNameField.text;
			Main.assetBar.getPage(itemIndex).text = this.name + ".zsc";
		});
		
		classInheritanceLabel = new Label();
		classInheritanceLabel.text = "Inherits from:";
		leftgrid.addComponent(classInheritanceLabel);
		
		classInheritanceField = new TextField();
		leftgrid.addComponent(classInheritanceField);
		
		classInheritancePicker = new ClassPicker(ClassLists.doomMonsters);
		classInheritancePicker.text = "(NONE/CUSTOM)";
		classInheritancePicker.width = 150;
		leftgrid.addComponent(classInheritancePicker);
		
		classReplaceLabel = new Label();
		classReplaceLabel.text = "Replaces:";
		leftgrid.addComponent(classReplaceLabel);
		
		classReplaceField = new TextField();
		leftgrid.addComponent(classReplaceField);
		
		classReplacePicker = new ClassPicker(ClassLists.doomMonsters);
		classReplacePicker.text = "(NONE/CUSTOM)";
		classReplacePicker.width = 150;
		leftgrid.addComponent(classReplacePicker);
	}
	
	public function resize() {
		
		this.x = 5;
		this.y = 40;
		this.width = Lib.current.stage.stageWidth - 10;
		this.height = Lib.current.stage.stageHeight - 45;
		this.backgroundColor = Color.fromString("0xAAAAAA");
		this.padding = 5;
		
		leftBox.width = (this.width / 3) - 10;
		leftBox.height = this.height - 10;
		leftBox.backgroundColor = Color.fromString("0xCCCCCC");
		leftBox.padding = 5;
		
		classBox.width = leftBox.width - 10;
		classBox.height = leftBox.height / 3;
		classBox.backgroundColor = Color.fromString("0xAAAAAA");
		
		rightbox.width = ((this.width / 3) * 2) - 10;
		rightbox.height = this.height - 10;
		rightbox.backgroundColor = Color.fromString("0xCCCCCC");
		
		lineView.width = rightbox.width - 10;
		lineView.height = rightbox.height - 10;
		lineView.resize();
	}
	
}