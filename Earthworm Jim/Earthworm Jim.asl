state ("Fusion")
{
byte ChangeScreen:"Fusion.exe", 0x2A52D4, 0x9928;
byte ChangeScreen2:"Fusion.exe", 0x2A52D4, 0x9929;
byte Demo:"Fusion.exe", 0x2A52D4, 0xFF98;
byte Level:"Fusion.exe", 0x2A52D4, 0xA692;
byte FinalBossDeath:"Fusion.exe", 0x2A52D4, 0xFD58;
}
state("Mednafen", "1.29.0")
{
byte ChangeScreen: "mednafen.exe", 0x164E4A8;
byte ChangeScreen2: "mednafen.exe", 0x164E4A9;
byte Demo: "mednafen.exe", 0x1654B18;
byte Level: "mednafen.exe", 0x164F212;
byte FinalBossDeath: "mednafen.exe", 0x16548D8
}
state("Retroarch", "1.14.0 BlastEm")
{
byte ChangeScreen: "blastem_libretro.dll", 0x172B18, 0x198, 0x9929;
byte ChangeScreen2: "blastem_libretro.dll", 0x172B18, 0x198, 0x9928;
byte Demo: "blastem_libretro.dll", 0x172B18, 0x198, 0xFF99;
byte Level: "blastem_libretro.dll", 0x172B18, 0x198, 0xA693;
byte FinalBossDeath: "blastem_libretro.dll", 0x172B18, 0x198, 0xFD59;
}
init
{
    vars.Start = false;
    vars.worms = false;
}
start
{
    if (current.ChangeScreen == 0x88 && current.ChangeScreen2 == 0x62) vars.Start = true;
    if (current.ChangeScreen == 0x89 && current.ChangeScreen2 == 0x82 && current.Demo == 0x00 && current.Level == 0x00 && vars.Start == true)
    {
        vars.Start = false;
        vars.worms = false;
        return true;
    }
}
reset
{
    if (current.ChangeScreen == 0x89 && current.ChangeScreen2 == 0xC2) vars.worms = true;
    if (current.ChangeScreen == 0x82 && current.ChangeScreen2 == 0xCC && current.Level == 0x00 && vars.worms == false) return true;
}
split
{
    if (settings["asteroids"] && old.Level == 0x00 && current.Level == 0x10) return true; // New Junk City -> andy asteroids?
    if (old.Level == 0x10 && current.Level == 0x01) return true; // andy asteroids? -> What the heck? (Hell or Heck?)
    if (settings["asteroids"] && old.Level == 0x01 && current.Level == 0x11) return true; // What the heck? (Hell or Heck?) -> andy asteroids?
    if (old.Level == 0x11 && current.Level == 0x0E) return true; // andy asteroids? -> Down the tubes
    if (settings["tubes"] && old.Level == 0x0E && current.Level == 0x0F) return true; // Down the tubes -> Down the tubes?
    if (settings["asteroids"] && old.Level == 0x0F && current.Level == 0x12) return true; // Down the tubes? -> andy asteroids?
    if (old.Level == 0x12 && current.Level == 0x04) return true; // andy asteroids? -> Snot a problem! Round 1
    if (old.Level == 0x04 && current.Level == 0x05) return true; // Snot a problem! Round 1 -> Snot a problem! Round 2
    if (old.Level == 0x05 && current.Level == 0x06) return true; // Snot a problem! Round 2 -> Snot a problem! Round 3
    if (settings["asteroids"] && old.Level == 0x06 && current.Level == 0x13) return true; // Snot a problem! Round 3 -> andy asteroids?
    if (old.Level == 0x13 && current.Level == 0x0A) return true; // andy asteroids? -> Level 5
    if (settings["asteroids"] && old.Level == 0x0A && current.Level == 0x14) return true; // Level 5 -> andy asteroids?
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
    settings.Add("tubes", true, "Split by Down the tubes", "options");
    settings.Add("Helicopter", false, "Split by buttville Helicopter", "options");
}