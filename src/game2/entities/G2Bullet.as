package game2.entities 
{
	import com.Utils.FlxTilemapExt;
	import org.flixel.*;
	/**
	 * ...
	 * @author Galen Koehne
	 */
	public class G2Bullet extends FlxSprite
	{
		private const WIDTH:uint = 1;
		private const HEIGHT:uint = 4;
		
		public var speed:Number;
		
		public function G2Bullet() 
		{
			super();
			makeGraphic(WIDTH, HEIGHT, 0xffE9FE50);
			speed = 200;
		}
		
		override public function update():void
		{
			if (!alive)
			{
				exists = false;
			}
			else if (touching || !onScreen())
				kill();
		}
		
		override public function kill():void
		{
			if (!alive)
				return;
			velocity.x = 0;
			velocity.y = 0;
			
			//FlxG.play(HIT);
			alive = false;
			solid = false;
		}
		
		public function shoot(Location:FlxPoint, Aim:uint):void
		{
			//FlxG.play(SndShoot);
			super.reset(Location.x, Location.y);
			solid = true;
			switch(Aim)
			{
				case UP:
					makeGraphic(WIDTH, HEIGHT, 0xffE9FE50);
					velocity.y = -speed;
					break;
				case DOWN:
					makeGraphic(WIDTH, HEIGHT, 0xffE9FE50);
					velocity.y = speed;
					break;
				case LEFT:
					makeGraphic(HEIGHT, WIDTH, 0xffE9FE50);
					velocity.x = -speed;
					break;
				case RIGHT:
					makeGraphic(HEIGHT, WIDTH, 0xffE9FE50);
					velocity.x = speed;
					break;
				default:
					break;	
			}
		}
		
	}

}