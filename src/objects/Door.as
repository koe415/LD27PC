package objects 
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxSave;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Galen Koehne
	 */
	public class Door extends FlxGroup
	{
		private var isDoorOpen:Boolean;
		private var doorLevel:int;
		private var visual:FlxSprite;
		[Embed(source = "../../data/door0.png")] private var img0:Class;
		[Embed(source = "../../data/door1.png")] private var img1:Class;
		[Embed(source = "../../data/door2.png")] private var img2:Class;
		[Embed(source = "../../data/door3.png")] private var img3:Class;
		
		
		public function Door(x:int, y:int, keyLevel:int) 
		{
			doorLevel = keyLevel;
			isDoorOpen = false;
			
		switch(keyLevel) {
			case 0: // white-ish
				visual = new FlxSprite(x * 8, y * 8);
				visual.loadGraphic(img0);
				visual.immovable = true;
				add(visual);
			break;
			case 1: // blue!
				visual = new FlxSprite(x * 8, y * 8);
				visual.loadGraphic(img1);
				visual.immovable = true;
				add(visual);
			break;
			case 2: // red!
				visual = new FlxSprite(x * 8, y * 8);
				visual.loadGraphic(img2);
				visual.immovable = true;
				add(visual);
			break;
			case 3: // hello yellow!
				visual = new FlxSprite(x * 8, y * 8);
				visual.loadGraphic(img3);
				visual.immovable = true;
				add(visual);
			break;
			case 4: // Final key, not used
				visual = new FlxSprite(x * 8, y * 8);
				visual.makeGraphic(8, 16, 0xff400040);
				visual.immovable = true;
				add(visual);
			break;
		}
		
		//player = new FlxSprite(48,48);
			//player.makeGraphic(8, 12, 0xffaa1111);
			//add(player);
		}
		
		public function isWithinRange(p:FlxSprite):Boolean
		{
			//trace(doorLevel);
			var d:Number =  Math.sqrt(Math.pow(p.x - visual.x, 2)
			+ Math.pow(p.y - visual.y, 2));
			
			if (d < 16) return true;
			else return false;
		}
		
		public function open(keyLevel:int):Boolean
		{
			if (keyLevel < doorLevel) return false;
			
			visual.visible = false;
			isDoorOpen = true;
			return true;
		}
		
		public function isOpen():Boolean
		{
			return isDoorOpen;
		}
		
		public function getVisual():FlxSprite
		{
			return visual;
		}
		
		override public function update():void
		{
			super.update();
		}
		
	}

}