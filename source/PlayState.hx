package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxTimer;

class PlayState extends FlxState
{
	public var TICK:Int = 0;
	public var TPS:Float = 0;

	public var ticktext:FlxText;

	override public function create()
	{
		ticktext = new FlxText(8,8,0,"TICK: 0\nTPS: 0", 16);
		add(ticktext);

		TPS_Timer();

		super.create();
	}

	override public function update(elapsed:Float)
	{
		TICK++;

		ticktext.text = 'TICK: $TICK\nTPS: $TPS';

		super.update(elapsed);
	}

	public function TPS_Timer()
	{
		var originalTick:Int = TICK;
		FlxTimer.wait(1, () -> {
			TPS = TICK - originalTick;
			TPS_Timer();
		});
	}
}
