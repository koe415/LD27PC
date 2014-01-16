package game2 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Galen Koehne
	 */
	public class G2PreState extends FlxState
	{
		private var preDuration:int = 180;
		
		override public function create():void
		{
			trace("----");
			// stage, lives, score, high score
			var stage:FlxText = new FlxText(0, 12, FlxG.width, "STAGE " + (G2Registry.currentLevel + 1));
			stage.alignment = "center";
			add(stage);
			
			var lives:FlxText = new FlxText(0, 24, FlxG.width, "LIVES " + G2Registry.lives);
			lives.alignment = "center";
			add(lives);
			
			var targets:FlxText = new FlxText(0, 72, FlxG.width, "2 TARGETS LOCATED");
			targets.alignment = "center";
			add(targets);
			
			var score:FlxText = new FlxText(0, FlxG.height - 36, FlxG.width, "SCORE......" + G2Registry.score);
			score.alignment = "center";
			add(score);
			
			var hiscore:FlxText = new FlxText(0, FlxG.height - 24, FlxG.width, "HISCORE.......148000000");
			hiscore.alignment = "center";
			add(hiscore);
		}
		
		override public function update():void
		{
			if (FlxG.keys.justPressed("ESCAPE"))
			{
				FlxG.switchState(new G2BootState());
			} else if (FlxG.keys.justPressed("X") || (--preDuration == 0))
			{
				FlxG.switchState(new G2GameState());
			}
		}
	}

}