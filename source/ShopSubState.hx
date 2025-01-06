package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

class ShopSubState extends FlxSubState
{
	public var BLACK_BACKGROUND:FlxSprite;

	public var KITCHEN_BUTTON:FlxButton;

	override public function create()
	{
		initalizeShopObjects();
		super.create();
	}

	public function initalizeShopObjects()
	{
		BLACK_BACKGROUND = new FlxSprite(0, 0).makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		BLACK_BACKGROUND.alpha = 0.5;
		add(BLACK_BACKGROUND);

		KITCHEN_BUTTON = new FlxButton(FlxG.width, 5, "Kitchen", kitchenFunction);
		KITCHEN_BUTTON.x = FlxG.width - KITCHEN_BUTTON.width - 5;
		KITCHEN_BUTTON.y += (KITCHEN_BUTTON.height * 2) - 5;

		add(KITCHEN_BUTTON);
	}

	public function kitchenFunction()
	{
		PlayState.GAMEPLAY_INSTANCE.kitchenFunction();
	}

	override public function update(elapsed:Float)
	{
		PlayState.GAMEPLAY_INSTANCE.tickUpdate();

		super.update(elapsed);
	}
}
