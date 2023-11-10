state("Fusion", "3.64")
{
byte level: "Fusion.exe", 0x2A52D4, 0xDD21;
byte start: "Fusion.exe", 0x2A52D4, 0xFFF5;
byte input: "Fusion.exe", 0x2A52D4, 0xDD3C;
byte bosshp: "Fusion.exe", 0x2A52D4, 0xA36F;
byte bubbles: "Fusion.exe", 0x2A52D4, 0xDD1D;
byte screen: "Fusion.exe", 0x2A52D4, 0xFFFF;
}
state("Mednafen", "0.9.48")
{
byte level: "mednafen.exe", 0x1359A61;
byte start: "mednafen.exe", 0x135BD35;
byte input: "mednafen.exe", 0x1359A7C;
byte bosshp: "mednafen.exe", 0x13560AF;
byte bubbles: "mednafen.exe", 0x1359A5D;
byte screen: "mednafen.exe", 0x135BD3F;
}
state("Mednafen", "1.29.0")
{
byte level: "mednafen.exe", 0x16528A1;
byte start: "mednafen.exe", 0x1654B75;
byte input: "mednafen.exe", 0x16528BC;
byte bosshp: "mednafen.exe", 0x164EEEF;
byte bubbles: "mednafen.exe", 0x165289D;
byte screen: "mednafen.exe", 0x1654B7F;
}
state("Retroarch", "1.16.0 BlastEm")
{
byte level: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xDD20;
byte start: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xFFF4;
byte input: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xDD3D;
byte bosshp: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xA36E;
byte bubbles: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xDD1C;
byte screen: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xFFFE;
}
state("emuhawk", "1.13.2")
{
byte level: "libgenplusgx.dll", 0x000062D8, 0xDD20;
byte start: "libgenplusgx.dll", 0x000062D8, 0xFFF4;
byte input: "libgenplusgx.dll", 0x000062D8, 0xDD3D;
byte bosshp: "libgenplusgx.dll", 0x000062D8, 0xA36E;
byte bubbles: "libgenplusgx.dll", 0x000062D8, 0xDD1C;
byte screen: "libgenplusgx.dll", 0x000062D8, 0xFFFE;
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
    return (current.screen == 0xD8 && old.start != 0xF6 && current.start == 0x0F6 && current.input == 0xFF);
}
split
{
    if (current.level != 0x03 && current.level == old.level + 1) return true;
    if (current.level == 0x0D && current.bosshp == 0xFF && current.bubbles > old.bubbles) return true;
    
}
reset
{
    if (current.screen == 0xC4 || current.screen == 0xB4) return true;
}
startup
{
	refreshRate = 70;
	settings.Add("main", false, "AutoSplitter for We're Back! - A Dinosaur's Tale by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/PakLomak", "main");
}