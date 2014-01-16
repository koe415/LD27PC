package objects 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Galen Koehne
	 */
	public class GravThingy extends FlxGroup
	{
		private var hasPlayerPickedUp:Boolean;
		private var pos:FlxPoint;
		
		[Embed(source = "../../data/glow.png")] private var img:Class;
		
		public function GravThingy(x:int, y:int) 
		{
			hasPlayerPickedUp = false;
			pos = new FlxPoint(x, y);
			
			var visual:FlxSprite = new FlxSprite(x * 8, y * 8);
			visual.loadGraphic(img);
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
		
		public function isPickedUp():Boolean
		{
			return hasPlayerPickedUp;
		}
		
		public function pickUp():void
		{
			super.visible = false;
			hasPlayerPickedUp = true;
		}
	}

}