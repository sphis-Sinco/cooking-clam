package;

class FileManager
{
	public static var STATE_FOLDER:String = 'default';

	public static function getAssetPath(path:String):String
	{
		return 'assets/$path';
	}
	public static function getAssetFile(file:String):String
	{
		return getAssetPath('$STATE_FOLDER/$file');
	}
}