package objects 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Galen Koehne
	 */
	public class KeyHUD extends FlxGroup
	{
		private var visual0:FlxSprite;
		private var visual1:FlxSprite;
		private var visual2:FlxSprite;
		private var visual3:FlxSprite;
		
		[Embed(source = "../../data/curKeys0.png")] private var img0:Class;
		[Embed(source = "../../data/curKeys1.png")] private var img1:Class;
		[Embed(source = "../../data/curKeys2.png")] private var img2:Class;
		[Embed(source = "../../data/curKeys3.png")] private var img3:Class;
		
		public function KeyHUD()
		{
			visual0 = new FlxSprite(2, 2);
			visual0.loadGraphic(img0);
			visual0.scrollFactor.x = 0;
			visual0.scrollFactor.y = 0;
			add(visual0);
			
			visual1 = new FlxSprite(2, 2);
			visual1.loadGraphic(img1);
			visual1.scrollFactor.x = 0;
			visual1.scrollFactor.y = 0;
			add(visual1);
			
			visual2 = new FlxSprite(2, 2);
			visual2.loadGraphic(img2);
			visual2.scrollFactor.x = 0;
			visual2.scrollFactor.y = 0;
			add(visual2);
			
			visual3 = new FlxSprite(2, 2);
			visual3.loadGraphic(img3);
			visual3.scrollFactor.x = 0;
			visual3.scrollFactor.y = 0;
			add(visual3);
			
			visual1.visible = false;
			visual2.visible = false;
			visual3.visible = false;
		}
		
		public function setLevel(l:int):void
		{
			visual0.visible = false;
			visual1.visible = false;
			visual2.visible = false;
			visual3.visible = false;
			
			switch(l)
			{
				case 0: 
					visual0.visible = true;
					break;
				case 1:
					visual1.visible = true;
					break;
				case 2:
					visual2.visible = true;
					break;
				case 3:
					visual3.visible = true;
					break;
				default:
					visual3.visible = true;
					break;
			}

		}
		
	}

}