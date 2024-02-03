state("Fusion", "3.64")
{
byte ChangeScreen: "Fusion.exe", 0x2A52D4, 0x9928;
byte ChangeScreen2: "Fusion.exe", 0x2A52D4, 0x9929;
byte Demo: "Fusion.exe", 0x2A52D4, 0xFF98;
byte Level: "Fusion.exe", 0x2A52D4, 0xA692;
byte FinalBossDeath: "Fusion.exe", 0x2A52D4, 0xFD58;
byte BathysphereTime: "Fusion.exe", 0x2A52D4, 0xFCA1;
byte InOutBathysphere: "Fusion.exe", 0x2A52D4, 0xFD4F;
byte CheckPoint: "Fusion.exe", 0x2A52D4, 0xFDE0;
byte HpBathysphere: "Fusion.exe", 0x2A52D4, 0xAFDE;
}
state("Mednafen", "0.9.48")
{
byte ChangeScreen: "mednafen.exe", 0x1355668;
byte ChangeScreen2: "mednafen.exe", 0x1355669;
byte Demo: "mednafen.exe", 0x135BCD8;
byte Level: "mednafen.exe", 0x13563D2;
byte FinalBossDeath: "mednafen.exe", 0x135BA98;
byte BathysphereTime: "mednafen.exe", 0x135B9E1;
byte InOutBathysphere: "mednafen.exe", 0x135BA8F;
byte CheckPoint: "mednafen.exe", 0x135BB20;
byte HpBathysphere: "mednafen.exe", 0x1356D1E;
}
state("Mednafen", "1.29.0")
{
byte ChangeScreen: "mednafen.exe", 0x164E4A8;
byte ChangeScreen2: "mednafen.exe", 0x164E4A9;
byte Demo: "mednafen.exe", 0x1654B18;
byte Level: "mednafen.exe", 0x164F212;
byte FinalBossDeath: "mednafen.exe", 0x16548D8;
byte BathysphereTime: "mednafen.exe", 0x1654821;
byte InOutBathysphere: "mednafen.exe", 0x16548CF;
byte CheckPoint: "mednafen.exe", 0x1654960;
byte HpBathysphere: "mednafen.exe", 0x164FB5E;
}
state("Retroarch", "1.16.0 GX")
{
byte ChangeScreen: "genesis_plus_gx_libretro.dll", 0x07118A0, 0x9929;
byte ChangeScreen2: "genesis_plus_gx_libretro.dll", 0x07118A0, 0x9928;
byte Demo: "genesis_plus_gx_libretro.dll", 0x07118A0, 0xFF99;
byte Level: "genesis_plus_gx_libretro.dll", 0x07118A0, 0xA693;
byte FinalBossDeath: "genesis_plus_gx_libretro.dll", 0x07118A0, 0xFD59;
byte BathysphereTime: "genesis_plus_gx_libretro.dll", 0x07118A0, 0xFCA0;
byte InOutBathysphere: "genesis_plus_gx_libretro.dll", 0x07118A0, 0xFD4E;
byte CheckPoint: "genesis_plus_gx_libretro.dll", 0x07118A0, 0xFDE1;
byte HpBathysphere: "genesis_plus_gx_libretro.dll", 0x07118A0, 0xAFDF;
}
state("emuhawk", "1.13.2")
{
byte ChangeScreen: "libgenplusgx.dll", 0x000062D8, 0x9929;
byte ChangeScreen2: "libgenplusgx.dll", 0x000062D8, 0x9928;
byte Demo: "libgenplusgx.dll", 0x000062D8, 0xFF99;
byte Level: "libgenplusgx.dll", 0x000062D8, 0xA693;
byte FinalBossDeath: "libgenplusgx.dll", 0x000062D8, 0xFD59;
byte BathysphereTime: "libgenplusgx.dll", 0x000062D8, 0xFCA0;
byte InOutBathysphere: "libgenplusgx.dll", 0x000062D8, 0xFD4E;
byte CheckPoint: "libgenplusgx.dll", 0x000062D8, 0xFDE1;
byte HpBathysphere: "libgenplusgx.dll", 0x000062D8, 0xAFDF;
}

init
{
int memSize = modules.First().ModuleMemorySize;
switch (memSize)
{
    case 91533312:
        print("Detected Mednafen 1.29.0");
        version = "1.29.0";
        break;
    case 93294592:
        print("Detected Mednafen 0.9.48");
        version = "0.9.48";
        break;
    case 4104192:
        print("Detected Kega Fusion 3.64");
        version = "3.64";
        break;
    default:
		print("Unknown Emulator");
		version = "";
		break;
}
    vars.Start = false;
    vars.worms = false;
    vars.Bathysphere = false;
    vars.inBathysphere1 = true;
    vars.inBathysphere2 = true;
    vars.inBathysphere3 = true;
    vars.DethBathysphere = false;
}
start
{
    print(vars.inBathysphere1.ToString());
    if (current.ChangeScreen == 0x88 && current.ChangeScreen2 == 0x62) vars.Start = true;
    if (current.ChangeScreen == 0x89 && current.ChangeScreen2 == 0x82 && current.Demo == 0x00 && current.Level == 0x00 && vars.Start == true)
    {
        vars.Start = false;
        vars.worms = false;
        vars.Bathysphere = false;
        vars.inBathysphere1 = true;
        vars.inBathysphere2 = true;
        vars.inBathysphere3 = true;
        vars.DethBathysphere = false;
        return true;
    }
}
reset
{
    if (current.ChangeScreen == 0x89 && current.ChangeScreen2 == 0xC2) vars.worms = true;
    if (current.ChangeScreen == 0x82 && current.ChangeScreen2 == 0xCC && current.Level == 0x00 && current.HpBathysphere == 0x00 && vars.worms == false) return true;
}
split
{
    if (settings["asteroids"] && old.Level == 0x00 && current.Level == 0x10)
    {
        vars.Bathysphere = false;
        vars.inBathysphere1 = true;
        vars.inBathysphere2 = true;
        vars.inBathysphere3 = true;
        vars.DethBathysphere = false;
        return true;
    } // New Junk City -> andy asteroids?
    if (old.Level == 0x10 && current.Level == 0x01 || old.Level == 0x1C && current.Level == 0x01) return true; // andy asteroids? -> What the heck? (Hell or Heck?)
    if (settings["Snowman"] && old.Level == 0x01 && current.Level == 0x02) return true; // What the heck? -> What the heck? (Snowman Boss)
    if (settings["SnowmanDeth"] && old.Level == 0x02 && current.Level == 0x01) return true; // What the heck? (Snowman Boss) -> What the heck?
    if (old.Level == 0x01 && current.Level == 0x03) return true; // What the heck? - > What the heck? (Evil Boss)
    if (settings["asteroids"] && old.Level == 0x03 && current.Level == 0x11) return true; // What the heck? (Evil Boss) -> andy asteroids?
    if (old.Level == 0x11 && current.Level == 0x0E || old.Level == 0x1C && current.Level == 0x0E) return true; // andy asteroids? -> Down the tubes
    if (settings["BathysphereShort"])
    {
        if (current.HpBathysphere >= 0x12 || current.BathysphereTime == 0x00) vars.DethBathysphere = true;
        if (current.BathysphereTime == 0x1E) vars.DethBathysphere = false;
        if (current.Level == 0x0E && current.BathysphereTime == 0x1E && vars.inBathysphere1 == true) vars.Bathysphere = true; // Первый заход в батисферу
        if (old.InOutBathysphere == 0x00 && current.InOutBathysphere == 0xFF && vars.Bathysphere == true && vars.inBathysphere1 == true)
        {
            vars.inBathysphere1 = false;
            return true;
        }
        if (old.InOutBathysphere == 0xFF && current.InOutBathysphere == 0x00 && vars.Bathysphere == true && vars.DethBathysphere == false)
        {
            vars.Bathysphere = false;
            return true;
        }
    }
    if (settings["BathysphereAverage"])
    {
        if (current.Level == 0x0E && current.BathysphereTime == 0x1E && current.CheckPoint == 0xFF && vars.inBathysphere2 == true) vars.Bathysphere = true; // Второй заход в батисферу
        if (old.InOutBathysphere == 0x00 && current.InOutBathysphere == 0xFF && vars.Bathysphere == true && vars.inBathysphere2 == true && current.CheckPoint == 0xFF)
        {
            vars.inBathysphere2 = false;
            return true;
        }
        if (old.InOutBathysphere == 0xFF && current.InOutBathysphere == 0x00 && vars.Bathysphere == true && vars.inBathysphere2 == true && current.CheckPoint == 0xFF && vars.DethBathysphere == false)
        {
            vars.Bathysphere = false;
            return true;
        }
    }
    if (settings["BathysphereLong"])
    {
        if (current.Level == 0x0F && current.BathysphereTime == 0x1E && vars.inBathysphere3 == true) vars.Bathysphere = true; // Третий заход в батисферу
        if (current.Level == 0x0F && old.InOutBathysphere == 0x00 && current.InOutBathysphere == 0xFF && vars.Bathysphere == true && vars.inBathysphere3 == true)
        {
            vars.inBathysphere3 = false;
            return true;
        }
        if (current.Level == 0x0F && old.InOutBathysphere == 0xFF && current.InOutBathysphere == 0x00 && vars.Bathysphere == true && vars.inBathysphere3 == true && vars.DethBathysphere == false)
        {
            vars.Bathysphere = false;
            return true;
        }
    }
    //if (settings["tubes"] && old.Level == 0x0E && current.Level == 0x0F) return true; // Down the tubes -> Down the tubes?
    if (settings["asteroids"] && old.Level == 0x0F && current.Level == 0x12) return true; // Down the tubes? -> andy asteroids?
    if (old.Level == 0x12 && current.Level == 0x04 || old.Level == 0x1C && current.Level == 0x04) return true; // andy asteroids? -> Snot a problem! Round 1
    if (old.Level == 0x04 && current.Level == 0x05) return true; // Snot a problem! Round 1 -> Snot a problem! Round 2
    if (old.Level == 0x05 && current.Level == 0x06) return true; // Snot a problem! Round 2 -> Snot a problem! Round 3
    if (settings["asteroids"] && old.Level == 0x06 && current.Level == 0x13) return true; // Snot a problem! Round 3 -> andy asteroids?
    if (old.Level == 0x13 && current.Level == 0x0A || old.Level == 0x1C && current.Level == 0x0A) return true; // andy asteroids? -> Level 5
    if (settings["asteroids"] && old.Level == 0x0B && current.Level == 0x14) return true; // Level 5 -> andy asteroids?
    if (old.Level == 0x14 && current.Level == 0x07 || old.Level == 0x1C && current.Level == 0x07) return true; // andy asteroids? -> For pete's sake!
    if (settings["asteroids"] && old.Level == 0x07 && current.Level == 0x15) return true; // For pete's sake! -> andy asteroids?
    if (old.Level == 0x15 && current.Level == 0x0D || old.Level == 0x1C && current.Level == 0x0D) return true; // andy asteroids? -> intestinal distress!
    if (settings["asteroids"] && old.Level == 0x0D && current.Level == 0x16) return true; // intestinal distress! -> andy asteroids?
    if (old.Level == 0x16 && current.Level == 0x09 || old.Level == 0x1C && current.Level == 0x09) return true; // andy asteroids? -> buttville (Helicopter)
    if (settings["Helicopter"] && old.Level == 0x09 && current.Level == 0x08) return true; // buttville (Helicopter) -> buttville (Slug)
    if (current.Level == 0x08 && old.FinalBossDeath == 0x00 && current.FinalBossDeath == 0x01) return true; // buttville Final Boss
}
startup
{
	settings.Add("main", false, "AutoSplitter for Earthworm Jim (Genesis) by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
    settings.Add("options", true, "Options");
	settings.Add("asteroids", true, "Split by andy asteroids", "options");
    settings.Add("Snowman", false, "Split by Snowman", "options");
    settings.Add("SnowmanDeth", false, "Split by Defeated Snowman", "options");
    settings.Add("BathysphereShort", true, "Short Bathysphere Race", "options");
    settings.Add("BathysphereAverage", true, "Average  Bathysphere Race", "options");
    settings.Add("BathysphereLong", true, "Long Bathysphere Race", "options");
    //settings.Add("tubes", true, "Split by Down the tubes", "options");
    settings.Add("Helicopter", true, "Split by buttville Helicopter", "options");
}