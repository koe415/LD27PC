package game2.entities 
{
	import org.flixel.*;
	import game2.*;
	/**
	 * ...
	 * @author Galen Koehne
	 */
	public class G2Evac extends FlxSprite
	{
		public function G2Evac(x:uint, y:uint) 
		{
			super(x,y);
			
			makeGraphic(14, 14, 0xFFFFFF9D);
		}
		
		// Empty group out
		public function handleUse():void
		{
			//trace("calling evac handle?");
			G2Registry.group = "";
		}
		
	}

}