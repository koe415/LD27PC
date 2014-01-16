package  
{
	import org.flixel.*;
	import zombie.*;
	import game2.*;
	
	/**
	 * ...
	 * @author Galen Koehne
	 */
	public class MenuState extends FlxState
	{
		[Embed(source = "../data/snd/select1.mp3")] private var soundSelect:Class;
		[Embed(source = "../data/snd/julie_theme_2_f.mp3")] 	public static var sng3:Class;
		[Embed(source = "../data/snd/Seen.mp3")] 	public static var sng4:Class;
		
		override public function create():void
		{
			var title:FlxText;
			title = new FlxText(0, 10, FlxG.width, "Captain Robert");
			title.size = 16;
			title.alignment = "center";
			add(title);
			
			var collar:FlxSprite;
			collar = new FlxSprite(FlxG.width / 2, FlxG.height / 2);
			collar.makeGraphic(50, 50, 0xffffffff);
			collar.angularVelocity = 10;
			add(collar);
			
			
			var instructions:FlxText;
			instructions = new FlxText(0, FlxG.height - 12, FlxG.width, "Press \'x'\ to start.");
			instructions.alignment = "right";
			add(instructions);
			
			var instructions2:FlxText;
			instructions2 = new FlxText(0, FlxG.height - 24, FlxG.width, "Press \'z'\ for zombies!");
			instructions2.alignment = "right";
			add(instructions2);
			
			/*var credit:FlxText;
			credit = new FlxText(0, FlxG.height - 12 , FlxG.width, "By Galen Koehne");
			credit.alignment = "center";
			add(credit);*/
			
			FlxG.flash(0xffff4d01, 1);
			//FlxG.playMusic(sng3, 0.7);
			//FlxG.playMusic(sng4, 0.7);
		}
		
		override public function update():void
		{
			super.update();
			if (FlxG.keys.justPressed("X"))
			{
				FlxG.play(soundSelect, 1.0);
				FlxG.switchState(new PlayState());
			} else if (FlxG.keys.justPressed("Z"))
			{
				FlxG.play(soundSelect, 1.0);
				FlxG.switchState(new ZombieSimState());
			} else if (FlxG.keys.justPressed("A"))
			{
				FlxG.play(soundSelect, 1.0);
				FlxG.switchState(new G2BootState());
			}
		}
		
	}

}