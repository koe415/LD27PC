package  
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Galen Koehne
	 */
	public class Light extends FlxSprite
	{
		[Embed(source = "/../data/light.png")]
		private var LightImageClass:Class;
		
		private var darkness:FlxSprite;
		public function Light(x:Number, y:Number, darkness:FlxSprite):void 
		{
			super(x, y, LightImageClass);
			
			this.darkness = darkness;
			this.scale.x = 5;
			this.scale.y = 5;
			this.blend = "screen";
			this.alpha = 1.0;
		}
		
		override public function draw():void
		{
			var screenXY:FlxPoint = getScreenXY();
			
			darkness.stamp(this,
			screenXY.x - this.width / 2,
			screenXY.y - this.height / 2);
		}
		
	}

}