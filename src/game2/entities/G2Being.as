package game2.entities 
{
	import org.flixel.*;
	import game2.*;
	/**
	 * Encompasses every being type:
	 * 0 Citizen
	 * 1 Zombie
	 * 2 VIP
	 * 3 Dead (Zombie)
	 * 4 Dead (For real!)
	 * @author Galen Koehne
	 */
	public class G2Being extends FlxSprite
	{
		private const MAXGROUPSIZE:uint = 5;
		private const BEINGSIZE:uint = 8;
		
		private var _player:G2Player;
		
		public var type:uint;
		public var movespeed:Number;
		
		private var waiting:uint;
		
		public function G2Being(x:uint=0, y:uint=0, t:uint=0, p:G2Player=null) 
		{
			super(x, y);
			
			setType(t);
			G2Registry.beings.add(this);
			
			_player = p;
		}
		
		public function setType(t:uint):void
		{
			type = t;
			switch(type)
			{
				case 0: // Citizen
					makeGraphic(BEINGSIZE, BEINGSIZE, 0xffffffff);
					movespeed = 0.3;
					break;
				case 1: // Zombie
					makeGraphic(BEINGSIZE, BEINGSIZE, 0xff00ff00);
					facing = FlxObject.NONE;
					movespeed = 0.1;
					G2Registry.zombies.add(this);
					break;
				case 2: // VIP
					makeGraphic(BEINGSIZE, BEINGSIZE, 0xff0000ff);
					movespeed = 0;
					G2Registry.vips.add(this);
					break;
				case 3: // Dead (Zombie)
					makeGraphic(BEINGSIZE, BEINGSIZE, 0xffff0000);
					movespeed = 0;
					break;
				case 4: // Dead (For real!)
					makeGraphic(BEINGSIZE, BEINGSIZE, 0xffff0000);
					movespeed = 0;
					break;
				default:
					trace("Issue setting type for being");
					break;
			}
		}
		
		override public function update():void
		{
			switch(type)
			{
				case 0: // Citizen
					if (waiting == 0) 
					{
						waiting = 100;
						var randomDir:int = Math.random() * 5;
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
							case 4:
								facing = FlxObject.NONE;
								break;
						}
					}
					waiting--;
					
					break;
				case 1: // Zombie
					
					break;
				case 2: // VIP
					
					break;
				case 3: // Fake Dead (Zombie)
					// if player/citizen is close enough, transform to zombie
					if (FlxU.getDistance(_player.getMidpoint(), getMidpoint()) < 20)
					{
						setType(1);
						G2Registry.zombies.add(this);
					}
					break;
				case 4: // Dead (For real!)
					
					break;
				default:
					trace("Issue updating being");
					break;
			}

			switch (facing)
			{
				case FlxObject.RIGHT:
					x += movespeed;
					break;
				case FlxObject.DOWN:
					y += movespeed;
					break;
				case FlxObject.LEFT:
					x -= movespeed;
					break;
				case FlxObject.UP:
					y -= movespeed;
					break;
			}
			
			// May not be necessary
			if (x < 0) x = 0;
			if (y < 0) y = 0;
		}
		
		public function handleBullet():void
		{
			switch(type)
			{
				case 0: // Citizen
					G2Registry.score -= 1000;
					break;
				case 1: // Zombie
					G2Registry.score += 100;
					G2Registry.zombies.remove(this, true);
					
					trace("zombies left=", G2Registry.zombies.length);
					if (G2Registry.objective == "Kill Everything" && G2Registry.zombies.length == 0) 
					{
						trace("level beat by killing all zombies!");
						G2Registry.objectiveCompleted = true;
					}
					break;
				case 2: // VIP
					//G2Registry.score -= 10000;
					
					// level failed! need to rescue all vips!
					break;
				case 3: // Dead (Zombie)
					G2Registry.score += 100;
					break;
				case 4: // Dead (For real!)
					
					break;
				default:
					trace("Issue handling bullet");
					break;
			}
			
			super.kill();
		}
		
		public function handleUse():void
		{
			if (G2Registry.group.length == MAXGROUPSIZE) return;
			
			switch(type)
			{
				case 0: // Citizen
					G2Registry.score += 1000;
					G2Registry.group += "i";
					super.kill();
					break;
				case 1: // Zombie
					break;
				case 2: // VIP
					G2Registry.score += 10000;
					G2Registry.group += "|";
					G2Registry.vips.remove(this,true);
					super.kill();
					break;
				case 3: // Dead (Zombie)
					break;
				case 4: // Dead (For real!)
					break;
				default:
					trace("Issue handling use");
					break;
			}
		}
		
		/*override public function kill():void
		{
			switch(type)
			{
				case 0: // Citizen
					G2Registry.score -= 1000;
					break;
				case 1: // Zombie
					G2Registry.score += 100;
					break;
				case 2: // VIP
					G2Registry.score -= 10000;
					break;
				case 3: // Dead (Zombie)
					G2Registry.score += 100;
					break;
				case 4: // Dead (For real!)
					
					break;
				default:
					trace("Issue killing being");
					break;
			}
			super.kill();
		}*/
		
	}

}