package;

import openfl.Lib;
import openfl.Assets;
import openfl.display.Shape;
import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import workbench.components.TextBox;

/**
 * ...
 * @author kevansevans
 */
class Panel extends Sprite
{
	static inline var clps_width:Int = 40;
	
	private var fontA:TextFormat = new TextFormat(Assets.getFont("fonts/Verdana Bold.ttf").fontName, 14, 0xFFFFFF, null, null, null, null, null, TextFormatAlign.LEFT);
	
	public var collapsed(default, set):Bool = false;
	public var container:Sprite;
	public var toggle_collapse:Sprite;
	
	public var title(default, set):String;
	var title_bar:Sprite;
	var title_text:TextField;
	var monoTextBox:TextBox;
	var container_mask:Sprite;
	public var w_width:Int;
	var w_height:Int = 0;
	public function new(_width:Int, _title:String) 
	{
		super();
		w_width = _width;
		
		toggle_collapse = new Sprite();
		toggle_collapse.graphics.clear();
		toggle_collapse.graphics.lineStyle(2, 0);
		toggle_collapse.graphics.beginFill(0xFFFFFF);
		toggle_collapse.graphics.moveTo(0, 0);
		toggle_collapse.graphics.lineTo(30, 0);
		toggle_collapse.graphics.lineTo(30, 30);
		toggle_collapse.graphics.lineTo(0, 30);
		toggle_collapse.graphics.lineTo(0, 0);
		
		addChild(toggle_collapse);
		toggle_collapse.x = toggle_collapse.y = 5;
		
		title_bar = new Sprite();
		addChild(title_bar);
		title_bar.x = 40;
		title_bar.y = 5;
		
		title_text = new TextField();
		title_text.selectable = false;
		title_text.setTextFormat(fontA);
		title_bar.addChild(title_text);
		title_text.x = title_text.y = 2;
		title = _title;
		
		container = new Sprite();
		addChild(container);
		container.x = 5;
		container.y = 40;
		
		update();
	}
	public function update() {
		w_height = Std.int(Lib.current.stage.stageHeight - 50 - this.y);
		graphics.clear();
		graphics.lineStyle(2, 0xAAAAAA);
		graphics.beginFill(0xfcfcea);
		graphics.moveTo(0, 0);
		if (!collapsed) graphics.lineTo(w_width, 0);
		else graphics.lineTo(clps_width, 0);
		if (!collapsed) graphics.lineTo(w_width, w_height);
		else graphics.lineTo(clps_width, w_height);
		graphics.lineTo(0, w_height);
		graphics.lineTo(0, 0);
		
		if (!collapsed) {
			if (!this.contains(title_bar)) addChild(title_bar);
			if (!this.contains(container)) addChild(container);
			title_bar.graphics.clear();
			title_bar.graphics.beginFill(0x000066);
			title_bar.graphics.lineTo(this.width - 50, 0);
			title_bar.graphics.lineTo(this.width - 50, 25);
			title_bar.graphics.lineTo(0, 25);
			title_bar.graphics.lineTo(0, 0);
			
			title_text.width = title_bar.width - 4;
			title_text.height = title_bar.height - 4;
			
			if (container.contains(monoTextBox)) monoTextBox.render();
			
		} else {
			if (this.contains(title_bar)) removeChild(title_bar);
			if (this.contains(container)) removeChild(container);
		}

	}
	public function set_mode_plaintext(_box:TextBox) {
		monoTextBox = _box;
		container.addChild(monoTextBox);
	}
	function set_title(_v:String):String {
		title_text.text = _v;
		return(title = _v);
	}
	function set_collapsed(_v:Bool):Bool {
		return(collapsed = _v);
	}
}