package  
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxU;
	
	/**
	 * ...
	 * @author Galen Koehne
	 */
	public class Cat extends FlxSprite 
	{
		[Embed(source = "../data/cat.png")] private var imgCat:Class;
		
		private var state:CatState;
		private var playercomfortzone:Number;
		private var playercomfortzonenear:Number;
		private var walkDur:Number;
		private var consecJumps:Number;
		
		private var idleAnims:Array;
		
		public function Cat() 
		{
			super();
			
			loadGraphic(imgCat, true, true, 16, 10);
			
			idleAnims = new Array("idle0","idle1","idle2","idle3","idle4","idle5","idle6","idle7","idle8");
			// bored cat!
			addAnimation(idleAnims[0], [0], 0.5); // idle 
			addAnimation(idleAnims[1], [0], 2); // idle longer
			addAnimation(idleAnims[2], [13], 0.5); //look up
			addAnimation(idleAnims[3], [8], 0.5); // look towards screen
			addAnimation(idleAnims[4], [9], 0.5); // look away from screen
			addAnimation(idleAnims[5], [10,11,11,11,11,11,10], 2); // sniff ground
			addAnimation(idleAnims[6], [1, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2, 1], 5); // sit
			addAnimation(idleAnims[7], [1, 2, 3, 16, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 16, 3, 2, 1], 5); // laydown
			addAnimation(idleAnims[8], [1, 2, 3, 16, 17, 17, 17, 17, 17, 18, 19, 18, 17, 18, 19, 18, 17, 17, 17, 17, 17, 17, 16, 3, 2, 1], 5); // laydown and wag tail
			
			
			
			addAnimation("walk", [4, 5], 5, true);
			addAnimation("run", [4, 5], 20, true);
			
			addAnimation("falling", [12], 1, true);
			
			addAnimation("beingHeld", [16], 1, true);
			
			maxVelocity.x = 70;
			maxVelocity.y = 220;
			drag.x = this.maxVelocity.x * 8;
			facing = FlxObject.RIGHT;
			state = CatState.IDLE;
			consecJumps = 0;
			
			play("idle1");
		}
		
		public function setPos(inX:Number=0, inY:Number=0, inDir:uint=FlxObject.RIGHT):void
		{
			x = inX;
			y = inY;
			facing = inDir;
			
			acceleration.x = 0;
			acceleration.y = 300;
			
			velocity.x = 0;
			velocity.y = 0;
			state = CatState.IDLE;
			playercomfortzone = 30;
			playercomfortzonenear = 10;
			consecJumps = 0;
			
			play("idle1");
		}
		
		override public function update():void
		{
			if ((FlxG.state as PlayState).playerHoldingCat)
			{
				//play("beingHeld");
				velocity.x = 0;
				velocity.y = -50;
				x = (FlxG.state as PlayState).player.x;
				y = (FlxG.state as PlayState).player.y + 8;
				facing = (FlxG.state as PlayState).player.facing;
				acceleration.x = (FlxG.state as PlayState).player.acceleration.x;
				return;
			}
			
			if (!isTouching(FlxObject.FLOOR))
			{
				play("falling");
				return;
			}
			else if (justTouched(FlxObject.FLOOR))
			{
				play(idleAnims[0]);
			}
			
			var playerX:Number = (FlxG.state as PlayState).player.x;
			var distfromplayer:Number = playerX - x;
			if (distfromplayer < 0) distfromplayer *= -1;
			
			//trace("currently " + distfromplayer + " pixels from player!");
			
			switch (state)
			{
				case CatState.IDLE:
					// called every frame?
					acceleration.x = 0;
					if (walkDur > 0)
					{
						play("walk");
						walkDur -= 1;
						
						if (facing == FlxObject.LEFT) velocity.x = -20;
						else velocity.x = 20;
						break;
					}
					
					if (distfromplayer > playercomfortzone)
					{
						state = CatState.CHASE;
						playercomfortzone = 20 + Math.random() * 100;
						playercomfortzonenear = Math.random() * 100;
						consecJumps = 0;
					}

					if (finished)
					{
						var randAnim:int = Math.random() * (idleAnims.length + 2);
						trace("playing anim " + randAnim + " for el gato!");
						
						if (randAnim == idleAnims.length)
						{
							if (facing == FlxObject.LEFT) facing = FlxObject.RIGHT;
							else facing = FlxObject.LEFT;
						}
						else if (randAnim == idleAnims.length + 1)
						{
							walkDur = 60 * (5 * Math.random());
						}
						else
						{
							play(idleAnims[randAnim]);
						}
					}
					
					break;
				case CatState.CHASE:
					if (distfromplayer < playercomfortzonenear)
					{
						state = CatState.IDLE;
						acceleration.x = 0;
						play("idle1");
					}
					else if (consecJumps<3)
					{
						if(isTouching(FlxObject.RIGHT) && isTouching(FlxObject.FLOOR) && facing == FlxObject.RIGHT)
						{
							consecJumps++;
							trace("CAT JUMP TO THE RIGHT");
							if (consecJumps==1)
								velocity.y = -70;
							else velocity.y = -100;
						}
						else if (isTouching(FlxObject.LEFT) && isTouching(FlxObject.FLOOR) && facing == FlxObject.LEFT)
						{
							consecJumps++;
							trace("CAT JUMP TO THE LEFT");
							if (consecJumps==1)
								velocity.y = -70;
							else velocity.y = -100;
						}
						else if (isTouching(FlxObject.FLOOR))
						{
							consecJumps = 0;
							if (playerX - x < 0)
							{
								acceleration.x = -maxVelocity.x * 4;
							}
							else
							{
								acceleration.x = maxVelocity.x * 4;
							}
							
							play("walk");
						}
					}
					break;
			}
			
			if (acceleration.x < 0 && facing != FlxObject.LEFT)
			{
				facing = FlxObject.LEFT;
			} else if (acceleration.x > 0 && facing != FlxObject.RIGHT)
			{
				facing = FlxObject.RIGHT;
			}
			
			super.update();
		}
	}
}