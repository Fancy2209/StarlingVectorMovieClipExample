package  
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	import starling.core.Starling;
	
	[SWF( width="1366", height="768", backgroundColor="#232323", frameRate="14" )]
	public class Main extends Sprite 
	{
		private var starling: Starling;
		
		public function Main() 
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			starling = new Starling( StarlingAnim, stage );
			starling.supportHighResolutions = true;
			starling.antiAliasing = 16;
			starling.start();
		}
		
	}
	
}