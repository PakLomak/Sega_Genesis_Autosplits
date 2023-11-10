state("Fusion", "3.64")
{
byte start: "Fusion.exe", 0x2A52D4, 0xB083;
byte level: "Fusion.exe", 0x2A52D4, 0xB089;
byte bossHP: "Fusion.exe", 0x2A52D4, 0xDADD;
byte reset: "Fusion.exe", 0x2A52D4, 0xFEFB;
byte pose: "Fusion.exe", 0x2A52D4, 0xB0C1;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x1356DC3;
byte level: "mednafen.exe", 0x1356DC9;
byte bossHP: "mednafen.exe", 0x135981D;
byte reset: "mednafen.exe", 0x135BC3B;
byte pose: "mednafen.exe", 0x1356E01;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x164FC03;
byte level: "mednafen.exe", 0x164FC09;
byte bossHP: "mednafen.exe", 0x165265D;
byte reset: "mednafen.exe", 0x1654A7B;
byte pose: "mednafen.exe", 0x164FC41;
}
state("Retroarch", "1.16.0 BlastEm")
{
byte start: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xB082;
byte level: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xB088;
byte bossHP: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xDADC;
byte reset: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xFEFA;
byte pose: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xB0C0;
}
state("Retroarch", "1.16.0 GX")
{
byte start: "genesis_plus_gx_libretro.dll", 0x07118A0, 0xB082;
byte level: "genesis_plus_gx_libretro.dll", 0x07118A0, 0xB088;
byte bossHP: "genesis_plus_gx_libretro.dll", 0x07118A0, 0xDADC;
byte reset: "genesis_plus_gx_libretro.dll", 0x07118A0, 0xFEFA;
byte pose: "genesis_plus_gx_libretro.dll", 0x07118A0, 0xB0C0;
}
state("emuhawk", "1.13.2")
{
byte start: "libgenplusgx.dll", 0x000062D8, 0xB082;
byte level: "libgenplusgx.dll", 0x000062D8, 0xB088;
byte bossHP: "libgenplusgx.dll", 0x000062D8, 0xDADC;
byte reset: "libgenplusgx.dll", 0x000062D8, 0xFEFA;
byte pose: "libgenplusgx.dll", 0x000062D8, 0xB0C0;
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
    return(old.start == 0x04 && current.start == 0x06);
}
split
{
    if (settings["level_split"])
    {
    if (old.level == 0x01 && current.level == 0x03)return true;
    if (old.level == 0x04 && current.level == 0x06)return true;
    if (old.level == 0x07 && current.level == 0x09)return true;
    }
    if (settings["split_pose"])
    {
    if (current.level == 0x01 && current.pose == 0x05 && old.pose != 0x05)return true;
    if (current.level == 0x04 && current.pose == 0x05 && old.pose != 0x05)return true;
    if (current.level == 0x07 && current.pose == 0x05 && old.pose != 0x05)return true;
    }
    if (old.level == 0x00 && current.level == 0x01)return true;
    if (old.level == 0x03 && current.level == 0x04)return true;
    if (old.level == 0x06 && current.level == 0x07)return true;
    if (old.level == 0x09 && current.level == 0x0A)return true;
    if (current.level == 0x0A && old.bossHP == 0x01 && current.bossHP == 0x00)return true;
}
reset
{
    return(current.level == 0x00 && current.start == 0x00 && current.reset == 0x74);
}
startup
{
	refreshRate = 70;
	settings.Add("main", false, "AutoSplitter for Sunset Riders by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
    settings.Add("options", true, "Options");
	settings.Add("level_split", true, "Split by levels", "options");
	settings.Add("split_pose", false, "Split by pose", "options");
}