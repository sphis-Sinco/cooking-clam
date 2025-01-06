package;

import flixel.FlxG;
import flixel.FlxSubState;
import flixel.ui.FlxButton;

class ShopSubState extends FlxSubState
{
	public var KITCHEN_BUTTON:FlxButton;

	override public function create()
	{
		initalizeShopObjects();
		super.create();
	}

	public function initalizeShopObjects()
		{
	
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
		super.update(elapsed);
	}
}