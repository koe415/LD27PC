package zombie
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Galen Koehne
	 */
	public class ZombieSimState extends FlxState
	{
		private var beings:Array = new Array();
		
		override public function create():void
		{
			var instructions2:FlxText = new FlxText(0, FlxG.height - 12, FlxG.width, "ZOMBIES!");
			instructions2.alignment = "right";
			instructions2.color = 0xff00ff00;
			add(instructions2);
			
			for (var i:int = 0; i < 100; i++) 
			{
				var b:Being = new Being();
				beings.push(b);
				add(b);
			}
			
			beings[0].setType(2);
		}
		
		override public function update():void
		{
			for ( var i:int = 0; i < beings.length; i++)
			{
				if (beings[i].type == 2)
				{
					for ( var j:int = 0; j < beings.length; j++)
					{
						if (beings[j].type == 2) continue;
						if (beings[i].x > beings[j].x - 1 && beings[i].x < beings[j].x + 1)
						if (beings[i].y > beings[j].y - 1 && beings[i].y < beings[j].y + 1)
						//if (beings[i].x == beings[j].x || beings[i].y == beings[j].y)
						{
							//trace("found a victem!");
							beings[j].setType(2);
						}
					}
				}
			}
			super.update();
		}
		
	}

}