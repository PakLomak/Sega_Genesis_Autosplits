state("Fusion", "3.64")
{
byte start: "Fusion.exe", 0x2A52D4, 0xFE1D;
byte lvl: "Fusion.exe", 0x2A52D4, 0xFE2C;
byte igt: "Fusion.exe", 0x2A52D4, 0xFE2F;
byte reset: "Fusion.exe", 0x2A52D4, 0xFE18;
byte press: "Fusion.exe", 0x2A52D4, 0xFEFF;
byte press2: "Fusion.exe", 0x2A52D4, 0xFEFE;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x135BB5D;
byte lvl: "mednafen.exe", 0x135BB6C;
byte igt: "mednafen.exe", 0x135BB6F;
byte reset: "mednafen.exe", 0x135BB58;
byte press: "mednafen.exe", 0x135BC3F;
byte press2: "mednafen.exe", 0x135BC3E;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x165499D;
byte lvl: "mednafen.exe", 0x16549AC;
byte igt: "mednafen.exe", 0x16549AF;
byte reset: "mednafen.exe", 0x1654998;
byte press: "mednafen.exe", 0x1654A7F;
byte press2: "mednafen.exe", 0x1654A7E;
}
state("Retroarch", "1.16.0 BlastEm")
{
byte start: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xFE1C;
byte lvl: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xFE2D;
byte igt: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xFE2E;
byte reset: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xFE19;
byte press: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xFEFE;
byte press2: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xFEFF;
}
state("emuhawk", "1.13.2")
{
byte start: "libgenplusgx.dll", 0x000062D8, 0xFE1C;
byte lvl: "libgenplusgx.dll", 0x000062D8, 0xFE2D;
byte igt: "libgenplusgx.dll", 0x000062D8, 0xFE2E;
byte reset: "libgenplusgx.dll", 0x000062D8, 0xFE19;
byte press: "libgenplusgx.dll", 0x000062D8, 0xFEFE;
byte press2: "libgenplusgx.dll", 0x000062D8, 0xFEFF;
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
    return (current.start == 0xC2 && old.start != 0xC2 && current.igt == 0x00 && current.lvl == 0x00);
}
split
{
    if (settings["level_split"] && current.lvl == old.lvl + 1) return true;
    if (current.lvl == 0x05 && current.press2 == 0x00 && current.press == 0xD8 && old.press != 0xD8) return true;
}
reset
{
    return (current.start == 0xB4 && current.igt == 0x00 && current.lvl == 0x00 && current.reset == 0xD2);
}
startup 
{
	settings.Add("main", false, "AutoSplitter for The Terminator by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
    settings.Add("options", true, "Options");
	settings.Add("level_split", true, "Split by levels", "options");
}