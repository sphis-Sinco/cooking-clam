package;

class FileManager
{
	public static var STATE_FOLDER:String = 'default';

	public static function getAssetPath(path:String):String
		return 'assets/$path';

	public static function getAssetFile(file:String):String
		return getAssetPath('$STATE_FOLDER/$file');
    
	public static function getDataFile(file:String):String
		return getAssetFile('data/$file');

	public static function getImageFile(file:String):String
		return getAssetFile('images/$file.png');

	public static function getSoundFile(file:String):String
		return getAssetFile('$file.wav');
}