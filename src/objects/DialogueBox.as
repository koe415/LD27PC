package objects 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Galen Koehne
	 */
	public class DialogueBox extends FlxGroup
	{
		private var dialogueBG:FlxSprite;
		private var dialogueText:FlxText;
		private var currentStr:Array;
		
		// Max text size:
		// "INITED1INITED2INITED3INITED4INITED5INITED6INITED7INITED8INITED9INITED10INITED11INITED12INITED13INITED14INITED"
		
		public function DialogueBox()
		{
			dialogueBG = new FlxSprite(0, FlxG.height - 42);
			dialogueBG.makeGraphic(FlxG.width, 42, 0xff333333);
			dialogueBG.alpha = 0.75;
			dialogueBG.scrollFactor.x = 0;
			dialogueBG.scrollFactor.y = 0;
			add(dialogueBG);
			
			dialogueText = new FlxText(5, FlxG.height - 42, FlxG.width - 10, "");
			dialogueText.scrollFactor.x = 0;
			dialogueText.scrollFactor.y = 0;
			add(dialogueText);
			
			super.visible = false;
		}
		
		public function display(str:Array):void
		{
			if (str.length == 0) return;
			currentStr = str.reverse();
			
			//trace(currentStr[currentStr.length - 1]);
			if (typeof currentStr[currentStr.length - 1] == "number")
			{
				dialogueText.color = currentStr.pop();
			}
			else
			{
				dialogueText.color = 0xffffff;
			}
			
			dialogueText.text = currentStr.pop();
			
			super.visible = true;
		}
		
		public function showNext():void
		{
			if (currentStr.length == 0)
				super.visible = false;
			else
			{
				if (typeof currentStr[currentStr.length - 1] == "number")
				{
					dialogueText.color = currentStr.pop();
				}
				
				dialogueText.text = currentStr.pop();
				}
		}
		
		public function isActive():Boolean
		{
			return super.visible;
		}
	}

}