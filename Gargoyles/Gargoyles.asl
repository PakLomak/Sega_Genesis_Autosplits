state("Fusion", "3.64")
{
byte start: "Fusion.exe", 0x2A52D4, 0x73;
byte hp: "Fusion.exe", 0x2A52D4, 0x7C;
byte demo: "Fusion.exe", 0x2A52D4, 0xA;
byte lvl: "Fusion.exe", 0x2A52D4, 0xBB;
byte bossHP: "Fusion.exe", 0x2A52D4, 0xB39;
byte reset: "Fusion.exe", 0x2A52D4, 0x10;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x134BDB3;
byte hp: "mednafen.exe", 0x134BDBC;
byte demo: "mednafen.exe", 0x134BD4A;
byte lvl: "mednafen.exe", 0x134BDFB;
byte bossHP: "mednafen.exe", 0x134C879;
byte reset: "mednafen.exe", 0x134BD50;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x1644BF3;
byte hp: "mednafen.exe", 0x1644BFC;
byte demo: "mednafen.exe", 0x1644B8A;
byte lvl: "mednafen.exe", 0x1644C3B;
byte bossHP: "mednafen.exe", 0x16456B9;
byte reset: "mednafen.exe", 0x1644B90;
}
state("Retroarch", "1.16.0 BlastEm")
{
byte start: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0x72;
byte hp: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0x7D;
byte demo: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xB;
byte lvl: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xBA;
byte bossHP: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xB38;
byte reset: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0x11;
}
state("emuhawk", "1.13.2")
{
byte start: "libgenplusgx.dll", 0x000062D8, 0x72;
byte hp: "libgenplusgx.dll", 0x000062D8, 0x7D;
byte demo: "libgenplusgx.dll", 0x000062D8, 0xB;
byte lvl: "libgenplusgx.dll", 0x000062D8, 0xBA;
byte bossHP: "libgenplusgx.dll", 0x000062D8, 0xB38;
byte reset: "libgenplusgx.dll", 0x000062D8, 0x11;
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
}
start
{
    return (old.start != 0x00 && current.start == 0x00 && current.hp == 0x01 && current.demo == 0x00 && current.lvl == 0x00);
}
split
{
    if (settings["All_levels"] && current.lvl == old.lvl + 1) return true;
    if (settings["levels"])
    {
        if (old.lvl == 0x03 && current.lvl == 0x04) return true; //Castle Wyvern
        if (old.lvl == 0x07 && current.lvl == 0x08) return true; //Siege of the Rookery
        if (old.lvl == 0x0B && current.lvl == 0x10) return true; //Stone and Steel
	if (old.lvl == 0x10 && current.lvl == 0x15) return true; //Subterranean Terror
        if (old.lvl == 0x19 && current.lvl == 0x1B) return true; //The Forge
    }
    //if (current.lvl == 0x1B && old.bossHP != 0x00 && current.bossHP == 0x00) return true; //Demona
    if (current.lvl == 0x1B && old.bossHP == 0xF8 && current.bossHP == 0x00) return true; //Demona
    if (current.lvl == 0x1B && old.bossHP == 0x18 && current.bossHP == 0x00) return true; //Demona  
}
reset
{
    return (current.start == 0x00 && current.reset == 0x10);
}
startup
{
	refreshRate = 70;
	settings.Add("main", false, "AutoSplitter for Gargoyles Genesis by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
    settings.Add("options", true, "Options");
	settings.Add("All_levels", false, "Split by Screens", "options");
    settings.Add("levels", true, "Split by main Levels", "options");
}
