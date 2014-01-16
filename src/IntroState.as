package  
{
	import flash.utils.Timer;
	import org.flixel.*;
	/**
	 * ...
	 * @author Galen Koehne
	 */
	public class IntroState extends FlxState
	{
		[Embed(source = "../data/intro_name.png")] private var imgMyName:Class;
		
		override public function create():void
		{
			var backgroundColor:FlxSprite = new FlxSprite(0, 0);
			backgroundColor.makeGraphic(FlxG.width, FlxG.height, 0xffff4d01);
			add(backgroundColor);
			
			var myName:FlxSprite = new FlxSprite(FlxG.width / 2 - 65, FlxG.height / 2 - 15);
			myName.loadGraphic(imgMyName);
			add(myName);
			
			FlxG.flash(0xffff4d01, 1, onFlash);
		}
		
		private function onFlash():void
		{
			var timer:FlxTimer = new FlxTimer();
			timer.start(2, 1, onNameDone);
		}
		
		private function onNameDone(b:Number):void
		{
			FlxG.fade(0xffff4d01, 1, onFade);
		}
		
		private function onFade():void
		{
			FlxG.switchState(new MenuState());
		}
		
	}

}