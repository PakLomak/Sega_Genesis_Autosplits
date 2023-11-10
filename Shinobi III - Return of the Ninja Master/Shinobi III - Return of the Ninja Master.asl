state("Fusion", "3.64")
{
byte start: "Fusion.exe", 0x2A52D4, 0xF501;
byte screen: "Fusion.exe", 0x2A52D4, 0x33;
byte input: "Fusion.exe", 0x2A52D4, 0xF4E0;
byte stage: "Fusion.exe", 0x2A52D4, 0x37AC;
byte sublvl: "Fusion.exe", 0x2A52D4, 0x37AD;
byte reset: "Fusion.exe", 0x2A52D4, 0xA000;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x135B241;
byte screen: "mednafen.exe", 0x134BD73;
byte input: "mednafen.exe", 0x135B220;
byte stage: "mednafen.exe", 0x134F4EC;
byte sublvl: "mednafen.exe", 0x134F4ED;
byte reset: "mednafen.exe", 0x1355D40;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x1654081;
byte screen: "mednafen.exe", 0x1644BB3;
byte input: "mednafen.exe", 0x1654060;
byte stage: "mednafen.exe", 0x164832C;
byte sublvl: "mednafen.exe", 0x164832D;
byte reset: "mednafen.exe", 0x164EB80;
}
state("Retroarch", "1.16.0 BlastEm")
{
byte start: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xF500;
byte screen: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0x32;
byte input: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xF4E1;
byte stage: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0x37AD;
byte sublvl: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0x37AC;
byte reset: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xA001;
}
state("emuhawk", "1.13.2")
{
byte start: "libgenplusgx.dll", 0x000062D8, 0xF500;
byte screen: "libgenplusgx.dll", 0x000062D8, 0x32;
byte input: "libgenplusgx.dll", 0x000062D8, 0xF4E1;
byte stage: "libgenplusgx.dll", 0x000062D8, 0x37AD;
byte sublvl: "libgenplusgx.dll", 0x000062D8, 0x37AC;
byte reset: "libgenplusgx.dll", 0x000062D8, 0xA001;
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
    return (old.screen == 0x10 && current.screen == 0x14 && current.start == 0x09);
}
split
{
    if (settings["Level"] && current.stage == old.stage + 1) return true;
    if (settings["Mini_boss"] && current.stage == 0x00 && old.sublvl == 0x00 && current.sublvl == 0x01) return true; //Forest
    if (settings["Mini_boss"] && current.stage == 0x01 && old.sublvl == 0x00 && current.sublvl == 0x01) return true; //Horseback Riding
    if (settings["Mini_boss"] && current.stage == 0x02 && old.sublvl == 0x00 && current.sublvl == 0x01) return true; //Biochemical Laboratory
    if (settings["Mini_boss"] && current.stage == 0x03 && old.sublvl == 0x00 && current.sublvl == 0x01) return true; //Surfboarding
    if (settings["Mini_boss"] && current.stage == 0x04 && old.sublvl == 0x00 && current.sublvl == 0x01) return true; //Burning Forest 
    if (settings["Mini_boss"] && current.stage == 0x05 && old.sublvl == 0x00 && current.sublvl == 0x01) return true; //Falling Rocks 
    if (settings["Round_7"] && current.stage == 0x06 && old.sublvl == 0x00 && current.sublvl == 0x01) return true; //Ship 
    if (current.screen == 0x28 && old.stage == 0x06 && current.stage == 0x00) return true;
}
reset
{
    return (current.screen == 0x00 && current.reset == 0xFF);
}
startup
{
	settings.Add("main", false, "AutoSplitter for Shinobi III - Return of the Ninja Master by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
    settings.Add("options", true, "Options");
	settings.Add("Level", true, "Split by level", "options");
    settings.Add("Mini_boss", false, "Split by Mini-boss", "options");
    settings.Add("Round_7", false, "Split by Ship", "options");
}
