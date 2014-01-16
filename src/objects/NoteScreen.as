package objects 
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Galen Koehne
	 */
	public class NoteScreen extends FlxGroup
	{
		private var dialogueBG:FlxSprite;
		private var dialogueText:FlxText;
		
		public function NoteScreen() 
		{
			dialogueBG = new FlxSprite(0, 0);
			dialogueBG.makeGraphic(FlxG.width, FlxG.height, 0xff333333);
			dialogueBG.alpha = 0.75;
			dialogueBG.scrollFactor.x = 0;
			dialogueBG.scrollFactor.y = 0;
			add(dialogueBG);
			
			dialogueText = new FlxText(0, 0, FlxG.width, "");
			dialogueText.scrollFactor.x = 0;
			dialogueText.scrollFactor.y = 0;
			//dialogueText.size = 8;
			add(dialogueText);
			
			super.visible = false;
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