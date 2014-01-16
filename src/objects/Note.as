package objects 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Galen Koehne
	 */
	public class Note extends FlxGroup
	{
		private var pos:FlxPoint;
		private var content:String;
		
		[Embed(source = "../../data/glow.png")] private var img:Class;
		
		public function Note(x:int, y:int, c:String) 
		{
			pos = new FlxPoint(x, y);
			content = c;
			
			var visual:FlxSprite = new FlxSprite(x * 8 - 4, y * 8 - 2);
			visual.loadGraphic(img);
			//visual.alpha = 0.9;
			//visual.makeGraphic(8, 8, 0xffFFFFFF);
			visual.immovable = true;
			add(visual);
		}
		
		public function contains(p:FlxSprite):Boolean
		{
			var pt:FlxPoint = p.getMidpoint();
			
			if (pt.x < pos.x * 8 || pt.x > (pos.x + 1) * 8)
				return false;
			if (pt.y < pos.y * 8 || pt.y > (pos.y + 1) * 8)
				return false;
			return true;
			
		}
		
		public function getContents():String
		{
			return content;
		}
		
	}

}