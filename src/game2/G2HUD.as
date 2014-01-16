package game2 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Galen Koehne
	 */
	public class G2HUD extends FlxGroup
	{
		private var HUDscore:FlxText;
		private var HUDgroupSize:FlxText;
		private var HUDlives:FlxText;
		private var HUDbulletsLoaded:FlxText;
		private var HUDbullets:FlxText;
		
		public function G2HUD() 
		{
			super();
			
			HUDscore = new FlxText(0, FlxG.height - 12, FlxG.width, "score " + G2Registry.score);
			HUDscore.alignment = "left";
			HUDscore.scrollFactor.x = HUDscore.scrollFactor.y = 0;

			HUDbulletsLoaded = new FlxText(0, 0, FlxG.width, "");
			HUDbulletsLoaded.alignment = "right";
			HUDbulletsLoaded.color = 0xffE9FE50;
			HUDbulletsLoaded.scrollFactor.x = HUDbulletsLoaded.scrollFactor.y = 0;
			
			HUDbullets = new FlxText(0, 12, FlxG.width, "" + G2Registry.bullets);
			HUDbullets.alignment = "right";
			HUDbullets.color = 0xffE9FE50;
			HUDbullets.scrollFactor.x = HUDbullets.scrollFactor.y = 0;
			
			HUDgroupSize = new FlxText(0, 0, FlxG.width, "group ");
			HUDgroupSize.alignment = "left";
			HUDgroupSize.scrollFactor.x = HUDgroupSize.scrollFactor.y = 0;
			
			add(HUDscore);
			add(HUDbulletsLoaded);
			add(HUDbullets);
			add(HUDgroupSize);
		}
		
		override public function update():void
		{
			super.update();
			
			HUDbulletsLoaded.text = "";
			for (var i:uint = 0; i < G2Registry.bulletsLoaded; i++)
			{
				HUDbulletsLoaded.text += "I";
			}
			
			HUDgroupSize.text = "group " + G2Registry.group;
			HUDbullets.text = "" + G2Registry.bullets;
			HUDscore.text = "score " + G2Registry.score;
		}
		
	}

}