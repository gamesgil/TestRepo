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
	public class PicView extends Sprite 
	{
		private var loader:Loader;
		private var maxWidth:uint;
		private var maxHeight:uint;
		
		public function PicView($maxWidth:uint, $maxHeight:uint) 
		{ 
			maxWidth = $maxWidth;
			maxHeight = $maxHeight;
			
			graphics.lineStyle(2);
			graphics.beginFill(0xffffff);
			graphics.drawRect(0, 0, maxWidth, maxHeight);
			graphics.endFill();
		}
		
		public function show($url:String):void
		{
			if (loader)
			{
				loader.unload();
			}
			
			loader = new Loader();
			addChild(loader);
			loader.alpha = 0;
			
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loaded, false, 0, true);
			
			loader.load(new URLRequest($url));
		}
		
		private function loaded(e:Event):void 
		{
			var proportion:Number = loader.width / loader.height;
			var targetWidth:uint;
			var targetHeight:uint;
			
			if (proportion >= (maxWidth / maxHeight))
			{
				targetWidth = Math.min(loader.width, maxWidth);
				targetHeight = targetWidth / proportion;
			}
			else
			{
				targetHeight = Math.min(loader.height, maxHeight);
				targetWidth = targetHeight * proportion;
			}
			
			loader.width = targetWidth;
			loader.height = targetHeight;
			
			loader.x = (maxWidth - loader.width) / 2;
			loader.y = (maxHeight - loader.height) / 2;
			
			loader.alpha = 1;
		}
		
	}

}