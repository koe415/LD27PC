package  
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Galen Koehne
	 */
	public class NoteOverlay extends FlxGroup
	{
		private var dialogueBG:FlxSprite;
		private var dialogueText:FlxText;
		
		public function NoteOverlay() 
		{
			
			dialogueBG = new FlxSprite(40, 0);
			dialogueBG.makeGraphic(FlxG.width - 80, FlxG.height, 0xff004F27); //0xff333333, 0xff006633
			dialogueBG.alpha = 0.75;
			dialogueBG.scrollFactor.x = 0;
			dialogueBG.scrollFactor.y = 0;
			add(dialogueBG);
			
			dialogueText = new FlxText(64, 0, FlxG.width - 128, "");
			dialogueText.scrollFactor.x = 0;
			dialogueText.scrollFactor.y = 0;
			dialogueText.color = 0xFFFF00;//0xBFBFFF,0xFFFF00
			//dialogueText.size = 8;
			add(dialogueText);
			
			//super.visible = false;
		}
		
		public function display(str:String):void
		{
			dialogueText.text = str;
			
			super.visible = true;
		}
		
		public function isActive():Boolean
		{
			return super.visible;
		}
		
		public function endScreen():void
		{
			super.visible = false;
		}
		
	}

}