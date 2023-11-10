state("Fusion", "3.64")
{
byte start: "Fusion.exe", 0x2A52D4, 0xF907;
byte scene: "Fusion.exe", 0x2A52D4, 0xF905;
byte level: "Fusion.exe", 0x2A52D4, 0xF941;
byte boss_hit: "Fusion.exe", 0x2A52D4, 0xA231;
byte global: "Fusion.exe", 0x2A52D4, 0xF900;
byte bunny: "Fusion.exe", 0x2A52D4, 0xFB0A;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x135B647;
byte scene: "mednafen.exe", 0x135B645;
byte level: "mednafen.exe", 0x135B681;
byte boss_hit: "mednafen.exe", 0x1355F71;
byte global: "mednafen.exe", 0x135B640;
byte bunny: "mednafen.exe", 0x135B84A;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x1654487;
byte scene: "mednafen.exe", 0x1654485;
byte level: "mednafen.exe", 0x16544C1;
byte boss_hit: "mednafen.exe", 0x164EDB1;
byte global: "mednafen.exe", 0x1654480;
byte bunny: "mednafen.exe", 0x165468A;
}
state("Retroarch", "1.16.0 BlastEm")
{
byte start: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xF906;
byte scene: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xF904;
byte level: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xF940;
byte boss_hit: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xA230;
byte global: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xF901;
byte bunny: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xFB0B;
}
state("emuhawk", "1.13.2")
{
byte start: "libgenplusgx.dll", 0x000062D8, 0xF906;
byte scene: "libgenplusgx.dll", 0x000062D8, 0xF904;
byte level: "libgenplusgx.dll", 0x000062D8, 0xF940;
byte boss_hit: "libgenplusgx.dll", 0x000062D8, 0xA230;
byte global: "libgenplusgx.dll", 0x000062D8, 0xF901;
byte bunny: "libgenplusgx.dll", 0x000062D8, 0xFB0B;
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
    vars.l0 = 0;
}
start
{
    if (current.start == 0x06 && current.scene == 0x00)
    {
        vars.l0 = 0;
        return true;
    }
}
split
{
    if (old.level != 0x28 && current.level == 0x28 && current.bunny != 0xFF)
    {
        if (vars.l0 > 0) return true;
        vars.l0 = vars.l0 + 1;
    }
    if (current.level == 0x22 && old.boss_hit == 0x09 && current.boss_hit == 0x0A) return true;
}
reset
{
    return (current.global == 0x00 && current.scene == 0x08);
}
startup
{
	refreshRate = 70;
	settings.Add("main", false, "AutoSplitter for Tiny Toon Adventures: Buster's Hidden Treasure by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}