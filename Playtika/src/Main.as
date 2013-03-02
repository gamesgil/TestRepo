package 
{
	import data.DataLoader;
	import event.ComplexEvent;
	import event.EventManager;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import view.LoaderView;
	import view.PicView;
	import view.ThumbContainerView;
	
	/**
	 * ...
	 * @author Gil Steiner
	 */
	public class Main extends Sprite 
	{
		static private const THUMBNAIL_HEIGHT:Number = 50;
		static private const PIC_WIDTH:Number = 320;
		static private const PIC_HEIGHT:Number = 200;
		
		private var thumbContainer:ThumbContainerView;
		private var picContainer:PicView;
		private var images:XML;
		private var imagesLoaded:uint;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			EventManager._instance.addEventListener(DataLoader.COMPLETE, dataLoaded);
			
			thumbContainer = new ThumbContainerView();
			thumbContainer.y = stage.stageHeight - THUMBNAIL_HEIGHT;
			addChild(thumbContainer);
			
			picContainer = new PicView(PIC_WIDTH, PIC_HEIGHT);
			picContainer.x = (stage.stageWidth - PIC_WIDTH) / 2;
			picContainer.y = (stage.stageHeight - PIC_HEIGHT) / 2 - THUMBNAIL_HEIGHT;
			
			addChild(picContainer);
			
			var dataPath:String = (loaderInfo.parameters.dataPath != undefined) ? loaderInfo.parameters.dataPath : "data.xml";
			DataLoader._instance.load(dataPath);
		}
		
		private function dataLoaded(e:ComplexEvent):void 
		{
			images = XML(e.data);
			imagesLoaded = 0;
			
			loadNext();
		}
		
		private function loadNext():void 
		{
			var loader:LoaderView;
			
			loader = new LoaderView(images.@thumb_path + images.image[imagesLoaded].@thumb, images.@base_path + images.image[imagesLoaded].@url, THUMBNAIL_HEIGHT);
			loader.addEventListener(Event.COMPLETE, positionImage, false, 0, true);
		}
		
		private function positionImage(e:Event):void
		{
			var numOfImages:uint = images.image.length();
			imagesLoaded++;
			
			thumbContainer.addThumb(LoaderView(e.currentTarget));
			LoaderView(e.currentTarget).addEventListener(MouseEvent.CLICK, showPic, false, 0, true);
			
			if (imagesLoaded < numOfImages)
			{
				loadNext();
			}
		}
		
		private function showPic(e:MouseEvent):void 
		{
			picContainer.show(LoaderView(e.currentTarget)._fullPicUrl);
		}
		
	}
	
}