package game2.entities 
{
	import org.flixel.*;
	import game2.*;
	/**
	 * ...
	 * @author Galen Koehne
	 */
	public class G2Pickup extends FlxSprite
	{
		private const ITEMSIZE:uint = 4;
		private const AMMOPICKUPSIZE:uint = 6;
		
		private var type:uint;
		
		public function G2Pickup(x:uint=0, y:uint=0, t:uint=0) 
		{
			super(x, y);
			setType(t);
			G2Registry.itemPickups.add(this);
		}
		
		public function setType(t:uint):void
		{
			type = t;
			switch(type)
			{
				case 0: // Ammo Pickup
					makeGraphic(ITEMSIZE, ITEMSIZE, 0xFF829E47);
					break;
				case 1: // +1 Life
					makeGraphic(ITEMSIZE, ITEMSIZE, 0xFF64FFFF);
					break;
				default:
					trace("Issue setting type for item");
					break;
			}
		}
		
		public function handlePickup():void
		{
			switch(type)
			{
				case 0: // Ammo Pickup
					G2Registry.bullets += AMMOPICKUPSIZE;
					break;
				case 1: // +1 Life
					G2Registry.lives++;
					break;
				default:
					trace("Issue handling collide for item");
					break;
			}
			
			kill();
		}
		
	}

}