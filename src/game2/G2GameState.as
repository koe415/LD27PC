package game2 
{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import game2.entities.*;
	import org.flixel.*;
	/**
	 * ...
	 * @author Galen Koehne
	 */
	public class G2GameState extends FlxState
	{
		[Embed(source = '../../data/g2/tiles.png')] private var tilesPNG:Class;
		
		
		private var currentMap:int = 0;
		
		private var player:G2Player;
		private var hud:G2HUD;
		private var map:FlxTilemap;

		override public function create():void
		{
			// Needs to be specified to have overlap function work properly
			FlxG.camera.setBounds( -100, -100, 1200, 1200, true);
			
			G2Registry.resetMap();
			
			hud = new G2HUD();

			var CSVLoader:URLLoader = new URLLoader();
			CSVLoader.load(new URLRequest("../data/g2/" + G2Registry.MAPS[currentMap] + ".csv"));
			CSVLoader.addEventListener(Event.COMPLETE, processCSV);
			
			var myXMLLoader:URLLoader = new URLLoader();
			myXMLLoader.load(new URLRequest("../data/g2/" + G2Registry.MAPS[currentMap] + ".xml"));
			myXMLLoader.addEventListener(Event.COMPLETE, processXML);
		}
		
		private function processCSV(e:Event):void {
			var myString:String = new String(e.target.data);
			map = new FlxTilemap();
			map.loadMap(myString, tilesPNG, 8, 8);
			add(map);
			trace("done processing csv!");
		}
		
		private function processXML(e:Event):void {
			var mapXML:XML = new XML(e.target.data);
			//trace(mapXML.*);
			
			if (mapXML.Player.length() != 1) trace("ERROR: Incorrect Player spawns given (provided " + mapXML.Player.length() + ")");
			if (mapXML.Map.length() != 1) trace("ERROR: Incorrect Map properties given (provided " + mapXML.Map.length() + ")");
			
			player = new G2Player(mapXML.Player[0].@x,mapXML.Player[0].@y);
			FlxG.camera.follow(player);
			
			var i:int;
			for (i = 0; i < mapXML.Zombie.length(); i++)
			{
				var zombie:G2Being = new G2Being(mapXML.Zombie[i].@x, mapXML.Zombie[i].@y, 1, player);
				add(zombie);
			}
			
			for (i = 0; i < mapXML.Dead.length(); i++)
			{
				var dead:G2Being = new G2Being(mapXML.Dead[i].@x, mapXML.Dead[i].@y, 4, player);
				add(dead);
			}
			
			for (i = 0; i < mapXML.FakeDead.length(); i++)
			{
				var fakedead:G2Being = new G2Being(mapXML.FakeDead[i].@x, mapXML.FakeDead[i].@y, 3, player);
				add(fakedead);
			}
			
			for (i = 0; i < mapXML.Citizen.length(); i++)
			{
				var citizen:G2Being = new G2Being(mapXML.Citizen[i].@x, mapXML.Citizen[i].@y, 0, player);
				add(citizen);
			}
			
			for (i = 0; i < mapXML.VIP.length(); i++)
			{
				var vip:G2Being = new G2Being(mapXML.VIP[i].@x, mapXML.VIP[i].@y, 2, player);
				add(vip);
			}
			
			for (i = 0; i < mapXML.Evac.length(); i++)
			{
				G2Registry.evac = new G2Evac(mapXML.Evac[i].@x, mapXML.Evac[i].@y);
				add(G2Registry.evac);
			}
			
			for (i = 0; i < mapXML.Bullets.length(); i++)
			{
				var bullets:G2Pickup = new G2Pickup(mapXML.Bullets[i].@x, mapXML.Bullets[i].@y);
				add(bullets);
			}
			
			for (i = 0; i < mapXML.Door.length(); i++)
			{
				//TODO: Implement doors!
			}
			
			if (mapXML.Map.@startBullets > player.MAGAZINESIZE)
			{
				G2Registry.bulletsLoaded = player.MAGAZINESIZE;
				G2Registry.bullets = mapXML.Map.@startBullets - player.MAGAZINESIZE;
			}
			else
			{
				G2Registry.bulletsLoaded = mapXML.Map.@startBullets
				G2Registry.bullets = 0;
			}
			
			//set objective to mapXML.Map.@objective;
			G2Registry.objective = mapXML.Map.@objective;
			
			// add elements ontop of map and entities
			add(G2Registry.bulletsFired);
			add(player);
			add(hud);
			
			trace("done processing xml!");
		}

		override public function update():void
		{
			super.update();
			
			FlxG.collide(player, map);
			FlxG.collide(G2Registry.beings, map);
			FlxG.collide(G2Registry.bulletsFired, map, bulletsCollideMap);
			
			//FlxG.collide(G2Registry.bulletsFired, map, overlapped);
			
			FlxG.overlap(player, G2Registry.zombies, playerOverlapsZombie);
			FlxG.overlap(player, G2Registry.itemPickups, playerOverlapsItem);
			FlxG.overlap(G2Registry.bulletsFired, G2Registry.beings, bulletsOverlapBeings);
			
			
			if (FlxG.keys.justPressed("ESCAPE"))
			{
				FlxG.switchState(new G2BootState());
			}
		}
		
		private function onVictory():void
		{
			FlxG.switchState(new G2PostState());
		}
		
		protected function bulletsCollideMap(bullet:G2Bullet, m:FlxTilemap):void
		{
			bullet.kill();
		}
		
		protected function playerOverlapsZombie(player:G2Player, zombie:G2Being):void
		{
			// handle life loss
			G2Registry.lives--;
			if (G2Registry.lives >= 0) FlxG.switchState(new G2GameState());
			else FlxG.switchState(new G2BootState());
		}
		
		protected function playerOverlapsItem(player:G2Player, pickup:G2Pickup):void
		{
			pickup.handlePickup();
		}
		
		protected function bulletsOverlapBeings(bullet:G2Bullet, being:G2Being):void
		{
			bullet.kill();
			being.handleBullet();
		}
	}

}