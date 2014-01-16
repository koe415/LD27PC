package 
{
	import org.flixel.*;
	[SWF(width = "900", height = "480", backgroundColor = "#000000")]
	
	/**
	 * ...
	 * @author Galen Koehne
	 */
	public class LD27_PostComp extends FlxGame
	{
		
		public function LD27_PostComp ()
		{
			super(300, 160, MenuState, 3);
			forceDebugger = true;
		}
		
		override protected function update():void
		{
			super.update();
		}
		
	}
	
}