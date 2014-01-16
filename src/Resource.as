package  
{
	/**
	 * ...
	 * @author Galen Koehne
	 */
	public class Resource 
	{
		[Embed(source = "../data/snd/song1.mp3")] 	public static var sndSNG1:Class;
		[Embed(source = "../data/snd/song2.mp3")] 	public static var sndSNG2:Class;
		
		[Embed(source = "../data/snd/jump1.mp3")] public static var sndJUMP:Class;
		[Embed(source = "../data/snd/pickup.mp3")] public static var sndPICKUP:Class;
		[Embed(source = "../data/snd/select1.mp3")] public static var sndSELECT:Class;
		[Embed(source = "../data/snd/select2.mp3")] public static var sndSELECT2:Class;
		[Embed(source = "../data/snd/doordeny.mp3")] public static var sndDOORDENY:Class;
		[Embed(source = "../data/snd/dooraccess_single.mp3")] public static var sndDOORACCESS:Class;
		[Embed(source = "../data/snd/missedselect3.mp3")] public static var sndMISSEDSELECT:Class;
		[Embed(source = "../data/snd/gravoff.mp3")] public static var sndGRAVOFF:Class;
		[Embed(source = "../data/snd/gravon.mp3")] public static var sndGRAVON:Class;
		[Embed(source = "../data/snd/step3.mp3")] public static var sndSTEP3:Class;
		[Embed(source = "../data/snd/step4.mp3")] public static var sndSTEP4:Class;
		
		[Embed(source = "../data/player_sheet_lg.png")] public static var imgPLAYER:Class;
		
		//[Embed(source = "../data/maps/level_1.csv", mimeType = "application/octet-stream")] private var level_1csv:Class;
		
		public function Resource() 
		{
			
		}
		
	}

}