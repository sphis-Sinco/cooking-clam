package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

class PlayState extends FlxState
{
	public var TICK:Int = 0;
	public var TPS:Float = 0;

	public var DEBUG_TEXT:FlxText;
	public var DEBUG_MODE:Bool = false;

	public var PLAYER:FlxSprite;

	public var SHOP_BUTTON:FlxButton;
	public var IN_SHOP:Bool = false;

	public static var GAMEPLAY_INSTANCE:PlayState;

	override public function create()
	{
		initalizeDebugObjects();
		initalizeGameplayObjects();

		GAMEPLAY_INSTANCE = this;

		super.create();
	}

	public function initalizeDebugObjects()
	{
		DEBUG_TEXT = new FlxText(8, 8, 0, "", 16);
		DEBUG_TEXT.visible = DEBUG_MODE;
		add(DEBUG_TEXT);

		TPS_Timer();
	}

	public function TPS_Timer()
	{
		var originalTick:Int = TICK;
		FlxTimer.wait(1, () ->
		{
			TPS = TICK - originalTick;
			TPS_Timer();
		});
	}

	public function initalizeGameplayObjects()
	{
		PLAYER = new FlxSprite(0, 0);

		// this is temporary
		PLAYER.makeGraphic(64, 128, FlxColor.GREEN);

		PLAYER.screenCenter();
		PLAYER.y += PLAYER.height / 2;

		add(PLAYER);

		SHOP_BUTTON = new FlxButton(FlxG.width, 5, "Shop", shopfunction);
		SHOP_BUTTON.x = FlxG.width - SHOP_BUTTON.width - 5;

		add(SHOP_BUTTON);
	}

	public function shopfunction()
	{
		if (IN_SHOP)
			return;

		openSubState(new ShopSubState());
		IN_SHOP = true;
	}

	public function kitchenFunction()
	{
		if (!IN_SHOP)
			return;

		closeSubState();
		IN_SHOP = false;
	}

	override public function update(elapsed:Float)
	{
		tickUpdate();

		super.update(elapsed);
	}

	public function tickUpdate()
	{
		TICK++;

		// !DEBUG_MODE is the opposite of DEBUG_MODE so DEBUG_MODE = !DEBUG_MODE will flip the value
		if (FlxG.keys.justReleased.F3)
			DEBUG_MODE = !DEBUG_MODE;

		// DEBUG_MODE is basically the toggle for DEBUG_TEXT's visibility
		// put it below "keys.justReleased.F3" incase DEBUG_MODE got swapped
		if (DEBUG_TEXT.visible != DEBUG_MODE)
			DEBUG_TEXT.visible = DEBUG_MODE;

		// should not update it if it's not visible
		if (DEBUG_TEXT.visible)
			DEBUG_TEXT.text = 'TICK: $TICK\nTPS: $TPS';
	}
}
