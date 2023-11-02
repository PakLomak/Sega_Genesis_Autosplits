state ("Fusion")
{
byte ChangeScreen:"Fusion.exe", 0x2A52D4, 0x9928;
byte ChangeScreen2:"Fusion.exe", 0x2A52D4, 0x9929;
byte Demo:"Fusion.exe", 0x2A52D4, 0xFF98;
byte Level:"Fusion.exe", 0x2A52D4, 0xA692;
byte FinalBossDeath:"Fusion.exe", 0x2A52D4, 0xFD58;
byte BathysphereTime:"Fusion.exe", 0x2A52D4, 0xFCA1;
byte InOutBathysphere:"Fusion.exe", 0x2A52D4, 0xFD4F;
byte CheckPoint:"Fusion.exe", 0x2A52D4, 0xFDE0;
byte HpBathysphere:"Fusion.exe", 0x2A52D4, 0xAFDE;
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
state("Retroarch", "1.16.0 BlastEm")
{
byte ChangeScreen: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0x9929;
byte ChangeScreen2: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0x9928;
byte Demo: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xFF99;
byte Level: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xA693;
byte FinalBossDeath: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xFD59;
byte BathysphereTime: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xFCA0;
byte InOutBathysphere: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xFD4E;
byte CheckPoint: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xFDE1;
byte HpBathysphere: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xAFDF;
}
init
{
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
    if (settings["asteroids"] && old.Level == 0x00 && current.Level == 0x10) return true; // New Junk City -> andy asteroids?
    if (old.Level == 0x10 && current.Level == 0x01) return true; // andy asteroids? -> What the heck? (Hell or Heck?)
    if (settings["Snowman"] && old.Level == 0x01 && current.Level == 0x02) return true; // What the heck? -> What the heck? (Snowman Boss)
    if (settings["SnowmanDeth"] && old.Level == 0x02 && current.Level == 0x01) return true; // What the heck? (Snowman Boss) -> What the heck?
    if (old.Level == 0x01 && current.Level == 0x03) return true; // What the heck? - > What the heck? (Evil Boss)
    if (settings["asteroids"] && old.Level == 0x03 && current.Level == 0x11) return true; // What the heck? (Evil Boss) -> andy asteroids?
    if (old.Level == 0x11 && current.Level == 0x0E) return true; // andy asteroids? -> Down the tubes
    if (settings["BathysphereShort"])
    {
        if (current.HpBathysphere >= 0x12) vars.DethBathysphere = true;
        if (current.BathysphereTime == 0x1E) vars.DethBathysphere = false;
        if (current.Level == 0x0E && current.BathysphereTime == 0x1E) vars.Bathysphere = true; // Первый заход в батисферу
        if (old.InOutBathysphere == 0x00 && current.InOutBathysphere == 0xFF && vars.Bathysphere == true && vars.inBathysphere1 == true)
        {
            vars.inBathysphere1 = false;
            return true;
        }
        if (old.InOutBathysphere == 0xFF && current.InOutBathysphere == 0x00 && vars.Bathysphere == true && vars.DethBathysphere == false)
        {
            vars.Bathysphere = false;
            vars.inBathysphere1 = false;
            return true;
        }
    }
    if (settings["BathysphereAverage"])
    {
        if (current.Level == 0x0E && current.BathysphereTime == 0x1E && current.CheckPoint == 0xFF) vars.Bathysphere = true; // Второй заход в батисферу
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
        if (current.Level == 0x0F && current.BathysphereTime == 0x1E) vars.Bathysphere = true; // Третий заход в батисферу
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
    if (old.Level == 0x12 && current.Level == 0x04) return true; // andy asteroids? -> Snot a problem! Round 1
    if (old.Level == 0x04 && current.Level == 0x05) return true; // Snot a problem! Round 1 -> Snot a problem! Round 2
    if (old.Level == 0x05 && current.Level == 0x06) return true; // Snot a problem! Round 2 -> Snot a problem! Round 3
    if (settings["asteroids"] && old.Level == 0x06 && current.Level == 0x13) return true; // Snot a problem! Round 3 -> andy asteroids?
    if (old.Level == 0x13 && current.Level == 0x0A) return true; // andy asteroids? -> Level 5
    if (settings["asteroids"] && old.Level == 0x0B && current.Level == 0x14) return true; // Level 5 -> andy asteroids?
    if (old.Level == 0x14 && current.Level == 0x07) return true; // andy asteroids? -> For pete's sake!
    if (settings["asteroids"] && old.Level == 0x07 && current.Level == 0x15) return true; // For pete's sake! -> andy asteroids?
    if (old.Level == 0x15 && current.Level == 0x0D) return true; // andy asteroids? -> intestinal distress!
    if (settings["asteroids"] && old.Level == 0x0D && current.Level == 0x16) return true; // intestinal distress! -> andy asteroids?
    if (old.Level == 0x16 && current.Level == 0x09) return true; // andy asteroids? -> buttville (Helicopter)
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