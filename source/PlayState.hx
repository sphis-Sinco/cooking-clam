package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

class PlayState extends FlxState
{
	public var TICK:Int = 0;
	public var TPS:Float = 0;

	public var DEBUG_TEXT:FlxText;
	public var DEBUG_MODE:Bool = false;

	public var PLAYER:FlxSprite;

	override public function create()
	{
		initalizeDebugObjects();
		initalizeGameplayObjects();

		super.create();
	}

	public function initalizeDebugObjects()
	{
		DEBUG_TEXT = new FlxText(8,8,0,"", 16);
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

	public function initalizeGameplayObjects()
	{
		PLAYER = new FlxSprite(0,0);
		
		// this is temporary
		PLAYER.makeGraphic(64, 128, FlxColor.GREEN);

		PLAYER.screenCenter();
		PLAYER.y += PLAYER.height / 2;

		add(PLAYER);
	}

	override public function update(elapsed:Float)
	{
		TICK++;

		// !DEBUG_MODE is the opposite of DEBUG_MODE so DEBUG_MODE = !DEBUG_MODE will flip the value
		if (FlxG.keys.justReleased.F3) DEBUG_MODE = !DEBUG_MODE;

		// DEBUG_MODE is basically the toggle for DEBUG_TEXT's visibility
		// put it below "keys.justReleased.F3" incase DEBUG_MODE got swapped
		if (DEBUG_TEXT.visible != DEBUG_MODE) DEBUG_TEXT.visible = DEBUG_MODE;

		// should not update it if it's not visible
		if (DEBUG_TEXT.visible) DEBUG_TEXT.text = 'TICK: $TICK\nTPS: $TPS';

		super.update(elapsed);
	}
}
