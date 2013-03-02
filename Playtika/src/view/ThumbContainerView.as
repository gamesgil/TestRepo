package view 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Gil Steiner
	 */
	public class ThumbContainerView extends Sprite 
	{
		static private const OFFSET:uint = 10;
		
		public function ThumbContainerView() { }
		
		public function addThumb(thumb:DisplayObject):void
		{
			thumb.x = width;
			
			if (numChildren)
			{
				thumb.x += OFFSET;
			}
			
			addChild(thumb);
		}
		
	}

}