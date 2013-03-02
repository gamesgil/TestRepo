package data 
{
	import event.EventManager;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	/**
	 * ...
	 * @author Gil Steiner
	 */
	public class DataLoader 
	{
		static public const COMPLETE:String = "dataComplete";
		static private var instance:DataLoader;
		
		public function DataLoader($locker:Locker) { }
		
		static public function get _instance():DataLoader
		{
			if (!instance)
			{
				instance = new DataLoader(new Locker());
			}
			
			return instance;
		}
		
		public function load($url:String):void
		{
			var loader:URLLoader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, loaded);
			loader.load(new URLRequest($url));
		}
		
		private function loaded(e:Event):void 
		{
			var xml:XML = XML(e.currentTarget.data);

			EventManager._instance.send(COMPLETE, xml);
		}
		
	}

}

internal class Locker{}