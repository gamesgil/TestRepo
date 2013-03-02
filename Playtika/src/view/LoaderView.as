package view 
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	/**
	 * ...
	 * @author Gil Steiner
	 */
	public class LoaderView extends Sprite 
	{
		private var loader:Loader;
		private var targetHeight:uint;
		private var fullPicUrl:String;
		
		public function LoaderView($url:String, $fullPicUrl:String, $height:uint) 
		{
			fullPicUrl = $fullPicUrl;
			
			loader = new Loader();
			
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loaded);
			addChild(loader);
			
			targetHeight = $height;
			
			loader.load(new URLRequest($url));
		}
		
		private function loaded(e:Event):void 
		{
			var proportion:Number = width / height;
			
			buttonMode = true;
			
			height = targetHeight;
			width = targetHeight * proportion;
			
			dispatchEvent(new Event(Event.COMPLETE));
		}
		
		public function get _fullPicUrl():String
		{
			return fullPicUrl;
		}
	}

}