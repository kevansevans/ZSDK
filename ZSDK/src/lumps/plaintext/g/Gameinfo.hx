package lumps.plaintext.g;

import lumps.base.Text;

/**
 * ...
 * @author kevansevans
 */
enum abstract IWAD(String) from String {
	public var doom_one:String = "doom.wad";
	public var doom_two:String = "doom2.wad";
	public var doom_twof:String = "doom2f.wad";
	public var doom_tnt:String = "tnt.wad";
	public var doom_plutonia:String = "plutonia.wad";
	public var heretic:String = "heretic.wad";
	public var hexen:String = "hexen.wad";
	public var hexen_dd:String = "hexdd.wad";
	public var strife:String = "strife1.wad";
	public var strife_ve:String = "sve.wad";
	public var chexquest:String = "chex.wad";
}
enum abstract FTP_IWAD(String) from String {
	public var doom:String = "doom1.wad";
	public var heretic:String = "heretic1.wad";
	public var hexen:String = "hexen.wad";
	public var strife:String = "strife0.wad";
	public var freedoom_1:String = "freedoom1.wad";
	public var freedoom_2:String = "freedoom2.wad";
	public var freeDM:String = "freedm.wad";
	public var blasphemer:String = "heretic.wad";
	public var chexquest3:String = "chex3.wad";
	public var actiondoom2:String = "action2.wad";
	public var harmony:String = "harm1.wad";
	public var hacx:String = "hacx.wad";
	public var advOfSqr:String = "square1.pk3";
	public var delaweare:String = "delaweare.wad";
}
class Gameinfo extends Text 
{

	public function new(_lumpname:String, _directory:String="") 
	{
		super(_lumpname, _directory);
	}
}