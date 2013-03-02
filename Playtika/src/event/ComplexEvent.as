package event 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Gil Steiner
	 */
	public class ComplexEvent extends Event 
	{
		public var data:*;
		
		public function ComplexEvent($type:String, $data:*) 
		{
			super($type);
			
			data = $data;
		}
		
		override public function clone():Event 
		{
			return new ComplexEvent(type, data);
		}
		
		override public function toString():String 
		{
			return formatToString("ComplexEvent", "params", "type", "bubbles", "cancelable");
		}
		
	}

}