package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Galen Koehne
	 */
	public class Player extends FlxSprite
	{
		
		public var flyMode:Boolean;
		public var inJump:Boolean;
		public var inInteraction:Boolean;
		public var jumpHeldDur:Number = 0;
		
		public function Player(inX:Number=0, inY:Number=0, inDir:uint=FlxObject.RIGHT)
		{
			super();
			
			loadGraphic(Resource.imgPLAYER, true, true, 16, 40);
			addAnimation("idle", [0,0,0,0,0,0,0,0,0,0,0, 1,2,2,2, 1], 5, true);
			addAnimation("walk", [8, 9, 10, 11, 12, 13, 14, 15], 10, true);
			addAnimation("interact", [16, 17, 18, 17, 16], 20);
			addAnimation("prejump", [19, 20, 21], 40);
			addAnimation("jump", [22], 1, true);
			addAnimation("postjump", [21, 20, 19], 40);
			
			addAnimation("idlewcat", [32], 5, true);
			addAnimation("walkwcat", [24, 25, 26, 27, 28, 29, 30, 31], 10, true);
			addAnimation("prejumpwcat", [35, 36, 37], 40);
			addAnimation("jumpwcat", [38], 1, true);
			addAnimation("postjumpwcat", [37, 36, 35], 40);
			
			maxVelocity.x = 90;
			maxVelocity.y = 220;
			drag.x = this.maxVelocity.x * 8;
			
			inJump = false;
			inInteraction = false;
			
			setPos(inX, inY, inDir);
		}
		
		public function setPos(inX:Number=0, inY:Number=0, inDir:uint=FlxObject.RIGHT):void
		{
			x = inX;
			y = inY;
			facing = inDir;
			
			acceleration.x = 0;
			if (!flyMode) acceleration.y = 300;
			
			velocity.x = 0;
			velocity.y = 0;
			
			inJump = false;
			inInteraction = false;
		}
		
		override public function update():void
		{
			 if (flyMode) {
				acceleration.x = 0;
				acceleration.y = 0;
				
				if (FlxG.keys.LEFT)
					velocity.x = -200;
				else if (FlxG.keys.RIGHT)
					velocity.x = 200;
				else velocity.x = 0;
				
				if (FlxG.keys.DOWN)
					velocity.y = 200;
				else if (FlxG.keys.UP)
					velocity.y = -200;
				else velocity.y = 0;
				
			} else {
				acceleration.x = 0;
				
				if (FlxG.keys.SHIFT) {
					if (isTouching(FlxObject.FLOOR))
						maxVelocity.x = 140;
				} else {
					maxVelocity.x = 90;
				}
				
				if (FlxG.keys.LEFT)
					acceleration.x = -maxVelocity.x * 4;
				else if (FlxG.keys.RIGHT)
					acceleration.x = maxVelocity.x * 4;
				
				if (FlxG.keys.justPressed("X"))
				{
					if ((FlxG.state as PlayState).playerHoldingCat)
					{
						(FlxG.state as PlayState).playerHoldingCat = false;
						(FlxG.state as PlayState).cat.visible = true;
					}
					else 
					{
						
						var catX:Number = (FlxG.state as PlayState).cat.x;
						var distfromcat:Number = catX - x;
						if (distfromcat < 0) distfromcat *= -1;
						
						if (distfromcat < 12)
						{
							(FlxG.state as PlayState).playerHoldingCat = true;
							(FlxG.state as PlayState).cat.visible = false;
						}
					}
				}
				
				// Jump Handle
				if (FlxG.keys.UP) {
					if (FlxG.keys.justPressed("UP") && isTouching(FlxObject.FLOOR)) {
						FlxG.play(Resource.sndJUMP, 0.5);
						jumpHeldDur = 0;
					}
					jumpHeldDur += FlxG.elapsed;
					if (jumpHeldDur < 0.3) {
						if (isTouching(FlxObject.CEILING)) {
							velocity.y = -60;
							jumpHeldDur = 9999;
						} else {
							velocity.y = -130;
						}
					}
				}  else if (FlxG.keys.justReleased("UP")) {
					if (velocity.y < -30) velocity.y = -30;
					jumpHeldDur = 9999;
				}
			}
			
			if (acceleration.x < 0 && facing != FlxObject.LEFT)
			{
				facing = FlxObject.LEFT;
			} else if (acceleration.x > 0 && facing != FlxObject.RIGHT)
			{
				facing = FlxObject.RIGHT;
			}

			if (!isTouching(FlxObject.FLOOR))
			{
				if (!inJump)
				{
					if ((FlxG.state as PlayState).playerHoldingCat) play("prejumpwcat");
					else play("prejump");
					inJump = true;
				}
				else if (finished)
				{
					if ((FlxG.state as PlayState).playerHoldingCat) play("jumpwcat");
					else play("jump");
				}
			}
			else if (justTouched(FlxObject.FLOOR))
			{
				if ((FlxG.state as PlayState).playerHoldingCat) play("postjumpwcat");
				else play("postjump");
			}
			else if (inJump)
			{
				//if (FlxG.keys.justPressed("X")) {
				//	trace("play jump");
				//	play("jump");
				//}
				if (finished)
					inJump = false;
			}
			else if (this.velocity.x != 0)
			{
				if ((FlxG.state as PlayState).playerHoldingCat) play("walkwcat");
				else play("walk");
			}
			else if (FlxG.keys.justPressed("X"))
			{
				inInteraction = true;
				
				if ((FlxG.state as PlayState).playerHoldingCat) play("idlewcat");
				else play("interact");
				
			}
			else if (inInteraction)
			{
				if (finished) inInteraction = false;
			}
			else
			{
				if ((FlxG.state as PlayState).playerHoldingCat) play("idlewcat");
				else play("idle");
			}
			
			super.update();
		}
	}
}