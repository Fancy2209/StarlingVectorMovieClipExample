package
{
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.display.Canvas;
	import flash.utils.getTimer;

	public class StarlingAnim extends starling.display.Sprite
	{
		[Embed(source='../starling-flight.swf', symbol='starling_flight')]
		public var starlingFlightClass:Class;
		private var starlingFlightHW:MovieClipVector

		public function StarlingAnim()
		{
			super();
			var start:uint = getTimer()

			// Get the frames
			var animFrames:Vector.<Canvas> = new <Canvas>[];
			var starlingFlight:flash.display.MovieClip = new starlingFlightClass()
			var container:flash.display.Sprite = new flash.display.Sprite();
			container.addChild(starlingFlight);
			var startTess:uint = getTimer()
			for(var i:uint = 0; i < starlingFlight.totalFrames; i++)
			{
				starlingFlight.gotoAndStop(i);
				animFrames.push(new Canvas());
				animFrames[i].drawGraphicsData(starlingFlight.graphics.readGraphicsData());
			}
			trace("Took", getTimer()-startTess, "to tesselate")

			// Display original
			container.removeChild(starlingFlight);
			starlingFlight.x = 100*8
			starlingFlight.y = 100*2
			starlingFlight.scaleX = starlingFlight.scaleY = 0.5
			starlingFlight.gotoAndStop(0)
			Starling.current.nativeStage.addChild(starlingFlight)

			// Display tesselated
			starlingFlightHW = new MovieClipVector(animFrames, 14);
			starlingFlightHW.x = 100
			starlingFlightHW.y = 100*2
			starlingFlightHW.scale = 0.5
			starlingFlightHW.stop();
			
			addChild(starlingFlightHW)
			Starling.juggler.add(starlingFlightHW);
			
			starlingFlight.play()
			starlingFlightHW.play()
			trace("StarlingAnim() took", getTimer()-start)
		}

	}
}
