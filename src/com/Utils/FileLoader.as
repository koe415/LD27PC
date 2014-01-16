package com.Utils 
{
	import flash.events.Event;
	import flash.events.HTTPStatusEvent;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.events.SecurityErrorEvent;
	import flash.utils.setInterval;
	import flash.utils.clearInterval;
	
	/**
	 * ...
	 * Can be problems with loading in flash. Either command line: -use-network=false
	 * or possibly:
	 * flash.system.Security.allowDomain(“http://www.yourwebsite.com”);
     * flash.system.Security.allowInsecureDomain(“http://www.yourwebsite.com”);
	 * @author ...
	 */
	public class FileLoader 
	{
		public function FileLoader()
		{
		}
		
		static public function LoadFile( filename:String, onLoaded:Function, returnTypeClass:Class, callbackData:Object = null, onLoadFailed:Function = null):void 
		{
			filename = Misc.GetStandardFileString(filename);
			
			var urlRequest:URLRequest = new URLRequest(filename);
			var urlLoader:URLLoader = new URLLoader();
			urlLoader.dataFormat = URLLoaderDataFormat.TEXT; // default
			urlLoader.addEventListener(Event.COMPLETE, loaded,false,0,true);
			urlLoader.load(urlRequest);
			
			trace( "load " + filename);
			//// Hack to prevent the loader doing nothing occasionally. Having the interval seems to fix it.
			//function continueLoading( ):void
			//{
				//trace(urlLoader.bytesLoaded);
			//}
			
			function loaded(event:Event ):void
			{
				try
				{
					//clearInterval(intervalId);
					//trace( "finished load ");
					onLoaded(filename, returnTypeClass(urlLoader.data), callbackData);
					urlLoader.close();
				}
				catch(error:Error)
				{
					//XmlState.text.text = "Failed to parse file: " + error;
					//trace("Failed to parse file: " + error);
					urlLoader.close();
					if( onLoadFailed != null )
						onLoadFailed( filename );
				}
			}
			
			//function httpStatusUpdate(event:HTTPStatusEvent):void
			//{
				//XmlState.text.text = "HTTPStatus: " + event.status;
				//trace("HTTPStatus: " + event.status);
			//}
			
			//function loadFailedIO(event:IOErrorEvent ):void
			//{
				//XmlState.text.text = "IO Error: Failed to load file: " + filename + " == " + event.text;
				//trace("IO Error: Failed to load file: " + event.text);
				//if( onLoadFailed != null )
				//	onLoadFailed( filename );
			//}
			
			//function loadFailedSecurity(event:SecurityErrorEvent ):void
			//{
				//XmlState.text.text = "Security Error: Failed to load file:"  + filename + " == " + event.text;
				//trace("Security Error: Failed to load file:"  + event.text);
				//if( onLoadFailed != null )
				//	onLoadFailed( filename );
			//}
		}
	}
}