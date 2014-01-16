package game2 
{
	import org.flixel.*;
	/**
	 * Main Menu on boot
	 * Contains menu options for:
		 * Starting a new game
		 * About
	 * 
	 * Potentially need:
		 * Controls
		 * Password entry
	 * 
	 * @author Galen Koehne
	 */
	public class G2BootState extends FlxState
	{
		private var playerSelect:FlxText;
		private var playerSelect2:FlxText;
		private var bottomCredits1:FlxText;
		private var bottomCredits2:FlxText;
		private var titleCredits:FlxText;
		
		private var about:FlxText;
		
		private var startGameSelected:Boolean = true;
		
		override public function create():void
		{
			FlxG.bgColor = 0xff7255F9;
			
			/*var title:FlxSprite = new FlxSprite((FlxG.width / 4.0), 10);
			title.makeGraphic(150, 50, 0xffffffff);
			add(title);*/
			
			var titleText:FlxText = new FlxText(0, 10, FlxG.width, "DAYS");
			titleText.alignment = "center";
			titleText.size = 40;
			titleText.color = 0xff1F1F1F;
			add(titleText);
			
			titleCredits = new FlxText(0, 60, FlxG.width, "BY WHAT YOU LEFT");
			titleCredits.alignment = "center";
			add(titleCredits);
			
			playerSelect = new FlxText(0, FlxG.height / 2 - 6 + 20, FlxG.width, ">START");
			playerSelect.alignment = "center";
			add(playerSelect);
			
			playerSelect2 = new FlxText(0, FlxG.height / 2 + 6 + 20, FlxG.width, "  ABOUT");
			playerSelect2.alignment = "center";
			add(playerSelect2);
			
			bottomCredits1 = new FlxText(0, FlxG.height - 24, FlxG.width, "COPYRIGHT 2362 WUL ENT");
			bottomCredits1.alignment = "center";
			add(bottomCredits1);
			
			bottomCredits2 = new FlxText(0, FlxG.height - 12, FlxG.width, "LICENSED BY SOMETHING OUT OF THIS WORLD/ACO FUS");
			bottomCredits2.alignment = "center";
			add(bottomCredits2);
			
			about = new FlxText(0, 72, FlxG.width, "THE YEAR IS 2398 AND THE BELT IS SPREAD THIN. THE WORLD IS IN TURMOIL. RUMORS OF A MASS PANDEMIC RUN THROUGH THE ZONES LIKE WILDFIRE. YOUR STATION HAS JUST RECEIVED NEW ORDERS. 'MASS INFECTION CONFIRMED. RESPONSE NOT SUFFICIENT. SPILLOVER INTO YOUR ZONE IMMINENT. 100% FATAL ON CONTACT. SPREAD UNCONTAINED. ABANDON POST! SECURE MARKED OFFICIALS AND FLEE TO DESIGNATED SAFE ZONES. GODSPEED!'");
			about.alignment = "left";
			about.visible = false;
			add(about);
		}
		
		override public function update():void
		{
			if (FlxG.keys.justPressed("ESCAPE"))
			{
				FlxG.switchState(new MenuState());
			} else if ((FlxG.keys.justPressed("UP") || FlxG.keys.justPressed("DOWN"))
				&& !about.visible)
			{
				startGameSelected = !startGameSelected;
				if (startGameSelected)
				{
					playerSelect.text =  ">START";
					playerSelect2.text = "  ABOUT";
				} else {
					playerSelect.text =  "  START";
					playerSelect2.text = "> ABOUT";
				}
			}
			else if (FlxG.keys.justPressed("X") && startGameSelected)
			{
				G2Registry.newGame();
				FlxG.bgColor = 0xff000000;
				FlxG.switchState(new G2PreState());
			}
			else if (FlxG.keys.justPressed("X") && !startGameSelected)
			{
				titleCredits.visible = playerSelect.visible = playerSelect2.visible = bottomCredits1.visible = bottomCredits2.visible = !playerSelect.visible;
				about.visible = !about.visible;
			}
			
			super.update();
		}
	}

}