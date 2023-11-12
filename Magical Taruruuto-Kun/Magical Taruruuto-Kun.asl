state("Fusion", "3.64")
{
byte Level: "Fusion.exe", 0x2A52D4, 0xFD4B;
byte start: "Fusion.exe", 0x2A52D4, 0xFEF9;
byte MenuBar: "Fusion.exe", 0x2A52D4, 0xF807;
byte Sega: "Fusion.exe", 0x2A52D4, 0xF022;
byte Sega_2: "Fusion.exe", 0x2A52D4, 0xF023;
byte BossHP: "Fusion.exe", 0x2A52D4, 0xF881;
}
state("Mednafen", "0.9.48")
{
byte Level: "mednafen.exe", 0x135BA8B;
byte start: "mednafen.exe", 0x135BC39;
byte MenuBar: "mednafen.exe", 0x135B547;
byte Sega: "mednafen.exe", 0x135AD62;
byte Sega_2: "mednafen.exe", 0x135AD63;
byte BossHP: "mednafen.exe", 0x135B5C1;
}
state("Mednafen", "1.29.0")
{
byte Level: "mednafen.exe", 0x16548CB;
byte start: "mednafen.exe", 0x1654A79;
byte MenuBar: "mednafen.exe", 0x1654387;
byte Sega: "mednafen.exe", 0x1653BA2;
byte Sega_2: "mednafen.exe", 0x1653BA3;
byte BossHP: "mednafen.exe", 0x1654401;
}
state("Retroarch", "1.16.0 BlastEm")
{
byte Level: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xFD4A;
byte start: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xFEF8;
byte MenuBar: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xF806;
byte Sega: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xF023;
byte Sega_2: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xF022;
byte BossHP: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xF880;
}
state("emuhawk", "1.13.2")
{
byte Level: "libgenplusgx.dll", 0x000062D8, 0xFD4A;
byte start: "libgenplusgx.dll", 0x000062D8, 0xFEF8;
byte MenuBar: "libgenplusgx.dll", 0x000062D8, 0xF806;
byte Sega: "libgenplusgx.dll", 0x000062D8, 0xF023;
byte Sega_2: "libgenplusgx.dll", 0x000062D8, 0xF022;
byte BossHP: "libgenplusgx.dll", 0x000062D8, 0xF880;
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
    vars.menu = false;
}
start
{
    if (current.Sega == 0x6A && current.Sega_2 == 0x2B) vars.menu = true;
    if (current.MenuBar == 0x00 && old.start == 0x00 && current.start == 0x01)
    {
        vars.menu = false;
        return true;
    }
}
split
{
    if (settings["All"] && current.Level == old.Level + 1) return true;
    if (settings["Stage"])
    {
    if (old.Level == 0x05 && current.Level == 0x06)return true; // Jabao 
    if (old.Level == 0x06 && current.Level == 0x07)return true; // Magic Kingdom 
    if (old.Level == 0x0D && current.Level == 0x0F)return true; // Mikotaka
    if (old.Level == 0x0F && current.Level == 0x10)return true; // Magic Kingdom
    if (old.Level == 0x12 && current.Level == 0x13)return true; // Picture Book Forest
    if (old.Level == 0x16 && current.Level == 0x18)return true; // Picture Book Sky
    if (old.Level == 0x19 && current.Level == 0x1C)return true; // Picture Book Mountain
    if (old.Level == 0x1D && current.Level == 0x1F)return true; // Dowahha
    if (old.Level == 0x1F && current.Level == 0x20)return true; // Highway
    if (old.Level == 0x22 && current.Level == 0x23)return true; // Castle
    if (old.Level == 0x42 && current.Level == 0x43)return true; // Castle
    }
    if (current.Level == 0x43 && old.BossHP == 0x02 && current.BossHP == 0x81 || current.Level == 0x43 && old.BossHP == 0x81 && current.BossHP == 0x01) return true;
}
reset
{
    if (current.start == 0x00 && current.Sega == 0x6C && current.Sega_2 == 0x23) return true;
}
startup
{
	settings.Add("main", false, "AutoSplitter for Magical Taruruuto-Kun by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
    settings.Add("options", true, "Options");
    settings.Add("All", false, "Split by all screen", "options");
    settings.Add("Stage", true, "Split by Stages & Bosses", "options");
}