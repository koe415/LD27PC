package game2 
{
	import org.flixel.*;
	import game2.entities.*;
	/**
	 * ...
	 * @author Galen Koehne
	 */
	public class G2Registry 
	{
		public static const MAPS:Array = ["template", "template", "g2_2", "g2_3", "g2_4"];
		
		public static var score:int;
		public static var bullets:uint; // bullets not loaded
		public static var bulletsLoaded:uint; // bullets ready to fire
		
		public static var targets:uint;
		public static var group:String;
		public static var lives:uint;
		public static var currentLevel:uint;
		
		public static var bulletsFired:FlxGroup; // Bullets already fired
		public static var itemPickups:FlxGroup;
		
		public static var beings:FlxGroup;
		public static var zombies:FlxGroup;
		public static var vips:FlxGroup;
		
		public static var evac:G2Evac;
		
		public static var objective:String;
		public static var objectiveCompleted:Boolean;
		
		public function G2Registry() 
		{
			
		}
		
		// Called once on starting a brand new game
		public static function newGame():void
		{
			bulletsFired = new FlxGroup();
			itemPickups = new FlxGroup();
			beings = new FlxGroup();
			zombies = new FlxGroup();
			vips = new FlxGroup();
			
			score = 0;
			lives = 3;
			currentLevel = 0;
		}
		
		// Called at start of initializing a level (everytime a map is reset or loaded)
		public static function resetMap():void
		{
			bulletsFired = null;
			itemPickups = null;
			beings = null;
			zombies = null;
			vips = null;
			
			bulletsFired = new FlxGroup();
			itemPickups = new FlxGroup();
			beings = new FlxGroup();
			zombies = new FlxGroup();
			vips = new FlxGroup();
			//targets = 3; // map dependent
			group = "";
			objectiveCompleted = false;
		}
	}

}