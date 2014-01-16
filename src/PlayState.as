package  
{
	import flash.display.*;
	import objects.*;
	import org.flixel.*;
	import flash.filters.*;
	import com.Utils.*;
	import flash.utils.*;

	public class PlayState extends FlxState
	{
		public var flyModeText:FlxText;
		public var flyEnabled:Boolean;
		
		public var player:Player;
		public var cat:Cat;
		public var hitTilemaps:FlxGroup = new FlxGroup;
		public var triggersGroup:FlxGroup = new FlxGroup;
		
		private var previousRoom:String = "";
		private var currentRoom:String = "A";
		
		public var darkness:FlxSprite;
		public var light:Light;
		
		public var emitter:FlxEmitter;
		public var playerHoldingCat:Boolean;
		public var redGlow:FlxSprite;
		public var redGlowAlpha:Number;
		
		override public function create():void
		{
			ImageBank.Initialize();
			
			FlxG.bgColor = 0xff000000;
			FlxG.worldBounds.width = 200 * 8;
			FlxG.worldBounds.height = 200 * 8;

			player = new Player();
			player.setPos(10, 10, FlxObject.RIGHT);
			
			cat = new Cat();
			cat.setPos(10, 10, FlxObject.RIGHT);
			
			playerHoldingCat = false;
			
			FlxG.camera.follow(player);
			//FlxG.camera.setBounds(0, 0, levelFG.width, levelFG.height);
			
			flyEnabled = true;
			player.flyMode = false;
			flyModeText = new FlxText(0, 10, 100, "FLY");
			flyModeText.scrollFactor.x = 0;
			flyModeText.scrollFactor.y = 0;
			add(flyModeText);
			flyModeText.visible = false;

			LoadMap(currentRoom);
			
			darkness = new FlxSprite(0, 0);
			darkness.makeGraphic(FlxG.width, FlxG.height, 0xff666666);
			darkness.scrollFactor.x = darkness.scrollFactor.y = 0;
			darkness.blend = "multiply";
			
			/*redGlow = new FlxSprite(0, 0);
			redGlow.makeGraphic(FlxG.width, FlxG.height, 0x88ff0000); // hot/alarm state
			//redGlow.makeGraphic(FlxG.width, FlxG.height, 0x9995ADFF); // cold state
			redGlow.scrollFactor.x = redGlow.scrollFactor.y = 0;
			redGlowAlpha = 0.0;
			//redGlow.blend = "multiply";*/

			light = new Light(player.x, player.y, darkness);
		}
		
		// @param shortFilename - Path and extention is added.
		// ie. "A" turns to "map/Level_A.xml"
		public function LoadMap(shortFilename:String):void
		{
			hitTilemaps.clear();
			triggersGroup.clear();
			
			var longFilename:String = "map/Level_" + shortFilename + ".xml";
			FileLoader.LoadFile(longFilename, xmlLoaded, XML);
		}
		
		private function xmlLoaded(filename:String, xml:XML, callbackData:Object):void
		{
			var onAddCallback:Function = callbackData as Function;
			var name:String = "Level_" + String(xml.@name);
			//trace(name);
			var boundsMin:FlxPoint = new FlxPoint(xml.@minx, xml.@miny);
			var boundsMax:FlxPoint = new FlxPoint(xml.@maxx, xml.@maxy);
			var bgColor:uint = uint(xml.@bgColor);
			
			//trace("" + boundsMax.x + "," + boundsMax.y + " with bg color:" + bgColor);
			
			var pathLinks:Dictionary = new Dictionary;
			
			for each( var layerXML:XML in xml.layer )
			{
				var layer:LayerData = new LayerData(layerXML.@name, layerXML.@xScroll, layerXML.@yScroll);
				var properties:Array = GetPropertiesFromXML(layerXML);
				//trace(layerXML);
				
				//trace("layer name: " + layerXML.@name);
				
				for each( var mapXML:XML in layerXML.map )
				{
					var file:String = mapXML.@tiles;
					var callbackData:Object = { bmp:null, csv:null, mapXML:mapXML, layer:layer, onAddCallback:onAddCallback, properties:properties };
					ImageBank.LoadImage("tiles.png", tilemapLoaded, callbackData );
					FileLoader.LoadFile(mapXML.@csv, csvLoaded, String, callbackData, null);
				}
				
				for each( var shapeXML:XML in layerXML.shape )
				{
					//trace("trigger added!");
					var t:Trigger = new Trigger(shapeXML.@x, shapeXML.@y, shapeXML.@wid, shapeXML.@ht);
					var p:Array = GetPropertiesFromXML(shapeXML);
					
					if (p[0].name == "target")
						t.target = p[0].value;					
					triggersGroup.add(t);
				}
				add(layer);
			}
			
			add(player);
			add(cat);
			add(light);
			//add(redGlow);
			
			emitter = new FlxEmitter(9, 9); //x and y of the emitter
			emitter.setXSpeed(0, 0);
			emitter.setYSpeed(5, 10);
			emitter.width = 64;
			var particles:int = 50;
			 
			for(var i:int = 0; i < particles; i++)
			{
				var particle:FlxParticle = new FlxParticle();
				particle.makeGraphic(1, 1, 0xffffffff);
				particle.exists = false;
				emitter.add(particle);
			}
			 
			add(emitter);
			emitter.start(false, 10, 5, 0);
			
			add(darkness);
			
			for each (var trig2:Trigger in triggersGroup.members)
			{
				//trace("comparing:" + trig2.target + " with " + previousRoom);
				if (trig2.target == previousRoom)
				{
					//trace("found spawn pt");
					player.x = trig2.x;
					player.y = trig2.y;
					
					player.velocity.y = 0;
					if (player.velocity.x < 0)
						player.x -= 20; // 16(min) - 4(buffer)
					else player.x += 12; // 8(min) + 4(buffer)
					
					cat.x = player.x;
					cat.y = player.y;
					break;
				}
			}
			
			var notes:NoteOverlay = new NoteOverlay();
			add(notes);
			var n21:String = "\n---------------\nREQUESTING UPDATE.\nSTANDBY PLEASE.\n---------------\n\ncaptain....?\nare you still out there?\ncaptain...\nwhere are you";
			notes.display(n21);
			//notes.endScreen();
		}
		
		private function GetPropertiesFromXML(xml:XML ):Array
		{
			var properties:Array = [];
			if ( xml.hasOwnProperty("properties") )
			{
				for each( var propXML:XML in xml.properties.prop )
				{
					properties.push( { name:String(propXML.@name), value:String(propXML.@value) } );
				}
			}
			return properties;
		}
		
		private function csvLoaded( filename:String, data:Object, callbackData:Object ):void
		{
			callbackData.csv = data as String;
			if ( callbackData.bmp )
				createTilemap(callbackData);
		}
		
		private function tilemapLoaded( bmp:Bitmap, filename:String, callbackData:Object ):void
		{
			callbackData.bmp = bmp.bitmapData;
			if ( callbackData.csv )
				createTilemap(callbackData);
		}
		
		private function createTilemap(data:Object):void
		{
			var csvData:String = data.csv;
			var bmpData:BitmapData = data.bmp.clone();
			var mapXML:XML = data.mapXML;
			var layer:LayerData = data.layer;
			var map:FlxTilemapExt = new FlxTilemapExt;
			map.loadMapExt( csvData, null, mapXML.@tileWidth, mapXML.@tileHeight, FlxTilemap.OFF, 0, mapXML.@drawIdx, mapXML.@collIdx, bmpData);
			map.x = mapXML.@x;
			map.y = mapXML.@y;
			map.scrollFactor.x = layer.xScroll;
			map.scrollFactor.y = layer.yScroll;
			if ( mapXML.hasHits )
			{
				hitTilemaps.add(map);
			}
			
			layer.add(map);
		}
		
		override public function update():void
		{
			if (flyEnabled && FlxG.keys.justPressed("Q"))
			{
				player.flyMode = !player.flyMode;
				flyModeText.visible = player.flyMode;
				if (player.flyMode) player.acceleration.y = 0;
				else player.acceleration.y = 300;
			}
			
			super.update();
			
			if (!player.flyMode)
			{
				FlxG.overlap(player, triggersGroup, PlayerOverlap);
				FlxG.collide(hitTilemaps, player);
			}
			
			FlxG.collide(cat, hitTilemaps);
			FlxG.collide(emitter, hitTilemaps);
			
			light.x = player.x + player.width/2;
			light.y = player.y + player.height / 2;
			
			/*redGlowAlpha += 0.005;
			if (redGlowAlpha >= 1.00)
				redGlowAlpha = -1.00;
			if (redGlowAlpha <= 0.00)
				redGlow.alpha = - redGlowAlpha;
			else redGlow.alpha = redGlowAlpha;*/
			
			if (FlxG.keys.justPressed("R"))
			{
				FlxG.switchState(new IntroState());
			}
			else if (FlxG.keys.justPressed("ESCAPE"))
			{
				FlxG.switchState(new PlayState());
			}
		}
		
		private function PlayerOverlap( plr:FlxSprite, obj:FlxSprite):void
		{
			if ( player == plr)
			{
				if ( obj is Trigger )
				{
					TriggerEntered( plr, obj as Trigger );
				}
			}
		}
		
		private function TriggerEntered( plr:FlxSprite, trigger:Trigger):void
		{			
			//trace("triggered new map");
			if ( plr == player)	{
				for each( var tilemap:FlxTilemapExt in hitTilemaps.members )
				{
					remove(tilemap);
					
					tilemap.visible = false;
					
					hitTilemaps.remove(tilemap);
				}
				
				for each (var trig:Trigger in triggersGroup.members)
				{
					remove(trig);
					triggersGroup.remove(trig);
				}
				
				remove(player);
				remove(cat);
				remove(light);
				//remove(redGlow);
				remove(darkness);
				
				LoadMap(trigger.target);
				previousRoom = currentRoom;
				currentRoom = trigger.target;
			}
		}
		
		override public function draw():void
		{
			//darkness.fill(0xff333333);
			//darkness.fill(0x44111111); // works well with cold state
			darkness.fill(0xcc111111); // default no power
			//darkness.fill(0xffff1111);
			super.draw();
		}
	}
}
