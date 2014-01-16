package objects 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Galen Koehne
	 */
	public class EndGame extends FlxGroup
	{
		private var pos:FlxPoint;
		private var size:FlxPoint;
		private var keyNeeded:int;

		public function EndGame(x:int, y:int,width:int,height:int, k:int) 
		{
			pos = new FlxPoint(x, y);
			size = new FlxPoint(width, height);
			keyNeeded = k;
		}
		
		public function contains(p:FlxSprite):Boolean
		{
			var pt:FlxPoint = p.getMidpoint();
			
			if (pt.x < pos.x * 8 || pt.x > (pos.x + size.x) * 8)
				return false;
			if (pt.y < pos.y * 8 || pt.y > (pos.y + size.y) * 8)
				return false;
			return true;
			
		}
		
		public function hasCorrectKey(k:int):Boolean
		{
			return (k == keyNeeded);
		}
		
	}

}