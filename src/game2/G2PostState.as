package game2 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Galen Koehne
	 */
	public class G2PostState extends FlxState
	{
		override public function create():void
		{
			var t:FlxTimer = new FlxTimer();
			t.start(1, 1, onEndWait);
			
			var tempText:FlxText = new FlxText(FlxG.width / 2, FlxG.height / 2, FlxG.width, "Post Game Text");
			add(tempText);
		}
		
		public function onEndWait():void
		{
			G2Registry.currentLevel++;
			if (G2Registry.currentLevel > G2Registry.MAPS.length)
			{
				FlxG.switchState(new G2HiscoreState());
			}
			else
			{
				FlxG.switchState(new G2PreState());
			}
		}
		
	}

}