package zombie 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Galen Koehne
	 */
	public class Being extends FlxSprite
	{
		public const DEFAULT_MOVESPEED_PED: Number = 0.3;
		public const DEFAULT_MOVESPEED_ZOM: Number = 0.6;
		public const SIDEBORDERS: Number = 80;
		public const HEIGHTBORDERS: Number = 40;
		
		public var randomDirectionChange:int;
		public var currentMoveSpeed:Number;
		public var type:int;
		//-1 - dead
		// 0 - calm ped
		// 1 - paniced ped
		// 2 - zombie
		
		public function Being() 
		{
			super();
			makeGraphic(1, 2, 0xffffffff);
			type = 0;
			currentMoveSpeed = DEFAULT_MOVESPEED_PED;
			x = SIDEBORDERS + Math.random() * (FlxG.width - 2 * SIDEBORDERS);
			y = HEIGHTBORDERS + Math.random() * (FlxG.height - 2 * HEIGHTBORDERS);
		}
		
		public function setType(t:int):void
		{
			//trace("type being set");
			type = t;
			switch (type)
				{
					case -1:
						currentMoveSpeed = 0;
						//makeGraphic(1, 1, 0xff555555);
						color = 0xff555555;
						break;
					case 0:
						currentMoveSpeed = DEFAULT_MOVESPEED_PED;
						//makeGraphic(1, 1, 0xffffffff);
						color = 0xffffffff;
						break;
					case 1:
						currentMoveSpeed = DEFAULT_MOVESPEED_PED;
						//makeGraphic(1, 1, 0xffffffff);
						color = 0xffffffff;
						break;
					case 2:
						currentMoveSpeed = DEFAULT_MOVESPEED_ZOM;
						//makeGraphic(1, 1, 0xff00ff00);
						color = 0xff00ff00;
						break;
				}
		}
		
		override public function update():void
		{
			if (--randomDirectionChange <= 0)
			{
				var randomDir:int = Math.random() * 4;
				switch (randomDir)
				{
					case 0:
						facing = FlxObject.RIGHT;
						break;
					case 1:
						facing = FlxObject.DOWN;
						break;
					case 2:
						facing = FlxObject.LEFT;
						break;
					case 3:
						facing = FlxObject.UP;
						break;
				}
				randomDirectionChange = 15;
			}
			
			switch (facing)
			{
				case FlxObject.RIGHT:
					x += currentMoveSpeed;
					break;
				case FlxObject.DOWN:
					y += currentMoveSpeed;
					break;
				case FlxObject.LEFT:
					x -= currentMoveSpeed;
					break;
				case FlxObject.UP:
					y -= currentMoveSpeed;
					break;
			}
			
			if (x >= FlxG.width - SIDEBORDERS) facing = FlxObject.LEFT;
			else if (x <= SIDEBORDERS) facing = FlxObject.RIGHT;
			
			if (y >= FlxG.height - HEIGHTBORDERS) facing = FlxObject.UP;
			else if (y <= HEIGHTBORDERS) facing = FlxObject.DOWN;
			
			super.update();
		}
	}

}