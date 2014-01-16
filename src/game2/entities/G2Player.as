package game2.entities 
{
	import org.flixel.*;
	import game2.*;
	/**
	 * ...
	 * @author Galen Koehne
	 */
	public class G2Player extends FlxSprite
	{
		private const MOVESPEED:Number = 1.0;
		private const RELOADTIME:uint = 60;
		public const MAGAZINESIZE:uint = 6;
		private const FIREDELAY:uint = 15;
		
		private var reloadTimeLeft:uint;
		private var shootHeldDown:uint;
		
		public function G2Player(x:uint=0, y:uint=0) 
		{
			super(x,y);
			
			makeGraphic(7, 7, 0xffffffff);
			facing = FlxObject.UP;
		}
		
		override public function update():void
		{
			if (FlxG.keys.LEFT)
			{
				x -= MOVESPEED;
				if (!FlxG.keys.X) facing = FlxObject.LEFT;
			}
			else if (FlxG.keys.RIGHT)
			{
				x += MOVESPEED;
				if (!FlxG.keys.X) facing = FlxObject.RIGHT;
			}
			
			if (FlxG.keys.DOWN)
			{
				y += MOVESPEED;
				if (!FlxG.keys.X) facing = FlxObject.DOWN;
			}
			else if (FlxG.keys.UP)
			{
				y -= MOVESPEED;
				if (!FlxG.keys.X) facing = FlxObject.UP;
			}
			
			if (reloadTimeLeft > 0) 
			{
				reloadTimeLeft--;
				if (reloadTimeLeft == 0)
				{
					shootHeldDown = 0;
					if (G2Registry.bullets >= MAGAZINESIZE)
					{
						G2Registry.bullets -= MAGAZINESIZE;
						G2Registry.bulletsLoaded = MAGAZINESIZE;
					}
					else
					{
						G2Registry.bulletsLoaded = G2Registry.bullets;
						G2Registry.bullets = 0;
					}
				}
			}
			
			// Hold to fire multiple times
			if (FlxG.keys.X) shootHeldDown++;
			
			// Shoot
			if (FlxG.keys.justPressed("X") || (shootHeldDown==FIREDELAY))
			{
				if (reloadTimeLeft > 0)
				{
					//trace("reloading gun");
				}
				else if (reloadTimeLeft==0 && G2Registry.bulletsLoaded >= 1)
				{
					shootHeldDown = 0;
					(G2Registry.bulletsFired.recycle(G2Bullet) as G2Bullet).shoot(getMidpoint(), facing);
					
					G2Registry.bulletsLoaded--;
					if (G2Registry.bulletsLoaded == 0 && G2Registry.bullets != 0)
					{
						reloadTimeLeft = RELOADTIME;
					}
				}
				else if (G2Registry.bulletsLoaded==0 && G2Registry.bullets>0 && reloadTimeLeft == 0)
				{
					reloadTimeLeft = RELOADTIME;
				}
				else
				{
					//trace("No bullets left");
				}
			}
			
			// Use
			if (FlxG.keys.justPressed("C"))
			{
				//trace("registered just pressed C");
				// Check Evac Zone
				FlxG.overlap(this, G2Registry.evac, useZone);
				// Check VIPS / Citizens
				FlxG.overlap(this, G2Registry.beings, useBeing);
				// Check Doors

			}
			
			super.update();
		}
		
		protected function useZone(Sprite1:FlxSprite, Sprite2:FlxSprite):void
		{
			//trace("Calling zone handle");
			(Sprite2 as G2Evac).handleUse();
			
			if (G2Registry.objective == "Escape")
			{
				trace("level beat by escaping!");
				G2Registry.objectiveCompleted = true;
			}
			else if (G2Registry.objective == "Rescue VIPs" && G2Registry.vips.length == 0)
			{
				trace("level beat by rescuing all vips!");
				G2Registry.objectiveCompleted = true;
			}
		}
		
		protected function useBeing(Sprite1:FlxSprite, Sprite2:FlxSprite):void
		{
			(Sprite2 as G2Being).handleUse();
		}
	}

}