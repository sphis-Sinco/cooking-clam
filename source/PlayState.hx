package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxTimer;

class PlayState extends FlxState
{
	public var TICK:Int = 0;
	public var TPS:Float = 0;

	public var DEBUG_TEXT:FlxText;
	public var DEBUG_MODE:Bool = false;

	override public function create()
	{
		initalizeDebugObjects();

		super.create();
	}

	public function initalizeDebugObjects()
	{
		DEBUG_TEXT = new FlxText(8,8,0,"TICK: 0\nTPS: 0", 16);
		DEBUG_TEXT.visible = DEBUG_MODE;
		add(DEBUG_TEXT);

		TPS_Timer();
	}

	public function TPS_Timer()
	{
		var originalTick:Int = TICK;
		FlxTimer.wait(1, () -> {
			TPS = TICK - originalTick;
			TPS_Timer();
		});
	}

	override public function update(elapsed:Float)
	{
		TICK++;

		// should not update it if it's not visible
		if (DEBUG_TEXT.visible) DEBUG_TEXT.text = 'TICK: $TICK\nTPS: $TPS';

		// DEBUG_MODE is basically the toggle for DEBUG_TEXT's visibility
		if (DEBUG_TEXT.visible != DEBUG_MODE) DEBUG_TEXT.visible = DEBUG_MODE;

		// !DEBUG_MODE is the opposite of DEBUG_MODE so DEBUG_MODE = !DEBUG_MODE will flip the value
		if (FlxG.keys.justReleased.F3) DEBUG_MODE = !DEBUG_MODE;

		super.update(elapsed);
	}
}
