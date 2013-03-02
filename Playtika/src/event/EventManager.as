package event 
{
	import flash.events.EventDispatcher;
	import flash.events.Event;
	/**
	* ...
	* @author Gil Steiner
	*/
	public class EventManager extends EventDispatcher
	{
		static public const NAVIGATE:String = "navigate";
		
		private static var instance:EventManager;
		
		public function EventManager(sl:Singleton) 
		{
		}
		
		public static function get _instance():EventManager
		{
			if (instance == null)
			{
				instance = new EventManager(new Singleton());
			}
				
			return instance;
		}
		
		public function send(str:String, data:* = null):void
		{
			dispatchEvent(new ComplexEvent(str, data));
		}
	}
	
}

class Singleton{}