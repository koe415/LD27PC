package objects
{
	import org.flixel.*;
	
	public class Trigger extends FlxSprite
	{
		public var target:String = "";
		
		public function Trigger( X:Number, Y:Number, Width:uint, Height:uint ) 
		{
			super(X, Y);
			width = Width;
			height = Height;
			visible = false;
		}
		
		public function ParseProperties( properties:Array):void
		{
			if ( properties )
			{
				var i:int = properties.length;
				while(i--)
				{
					if ( properties[i].name == "target" )
					{
						target = properties[i].value;
					}
				}
			}
		}
		
	}

}



/*package objects 
{
	import org.flixel.*;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;

	public class Trigger extends FlxGroup
	{
		private var pos:FlxPoint;
		private var size:FlxPoint;
		private var ranalive:Boolean;
		private var dialogue:Array;
		private var keyNeededToTrig:int;
		
		public function Trigger(x:int,y:int,sizeX:int,sizeY:int,d:Array,k:int) 
		{
			ranalive = true;
			pos = new FlxPoint(x, y);
			size = new FlxPoint(sizeX, sizeY);
			dialogue = d;
			keyNeededToTrig = k;
		}
		
		public function hasRightKey(k:int):Boolean
		{
			if (keyNeededToTrig == 0) return true;
			return (k == keyNeededToTrig);
		}
		
		public function contains(spr:FlxSprite):Boolean
		{
			var pt:FlxPoint = spr.getMidpoint();
			if (pt.x < pos.x * 8 || pt.x > (pos.x + size.x) * 8)
				return false;
			if (pt.y < pos.y * 8 || pt.y > (pos.y + size.y) * 8)
				return false;
			return true;
		}
		
		public function isActive():Boolean
		{
			return ranalive;
		}
		
		public function getDialogue():Array
		{
			ranalive = false;
			return dialogue;
		}
		
	}

}*/