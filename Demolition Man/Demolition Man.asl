state("Fusion", "3.64")
{
byte stage: "Fusion.exe", 0x2A52D4, 0x539;
byte game: "Fusion.exe", 0x2A52D4, 0x56B;
byte lives: "Fusion.exe", 0x2A52D4, 0x54B;
byte xz: "Fusion.exe", 0x2A52D4, 0xFE58;
byte reset: "Fusion.exe", 0x2A52D4, 0xE61;
byte menu: "Fusion.exe", 0x2A52D4, 0xFDCF;
byte screen: "Fusion.exe", 0x2A52D4, 0xAF7;
}
state("Mednafen", "0.9.48")
{
byte stage: "mednafen.exe", 0x134C279;
byte game: "mednafen.exe", 0x134C2AB;
byte lives: "mednafen.exe", 0x134C28B;
byte xz: "mednafen.exe", 0x135BB98;
byte reset: "mednafen.exe", 0x134CBA1;
byte menu: "mednafen.exe", 0x135BB0F;
byte screen: "mednafen.exe", 0x134C837;
}
state("Mednafen", "1.29.0")
{
byte stage: "mednafen.exe", 0x16450B9;
byte game: "mednafen.exe", 0x16450EB;
byte lives: "mednafen.exe", 0x16450CB;
byte xz: "mednafen.exe", 0x16549D8;
byte reset: "mednafen.exe", 0x16459E1;
byte menu: "mednafen.exe", 0x165494F;
byte screen: "mednafen.exe", 0x1645677;
}
state("Retroarch", "1.16.0 BlastEm")
{
byte stage: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0x538;
byte game: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0x56A;
byte lives: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0x54A;
byte xz: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xFE59;
byte reset: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xE60;
byte menu: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xFDCE;
byte screen: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xAF6;
}
state("Retroarch", "1.16.0 GX")
{
byte stage: "genesis_plus_gx_libretro.dll", 0x07118A0, 0x538;
byte game: "genesis_plus_gx_libretro.dll", 0x07118A0, 0x56A;
byte lives: "genesis_plus_gx_libretro.dll", 0x07118A0, 0x54A;
byte xz: "genesis_plus_gx_libretro.dll", 0x07118A0, 0xFE59;
byte reset: "genesis_plus_gx_libretro.dll", 0x07118A0, 0xE60;
byte menu: "genesis_plus_gx_libretro.dll", 0x07118A0, 0xFDCE;
byte screen: "genesis_plus_gx_libretro.dll", 0x07118A0, 0xAF6;
}
state("emuhawk", "1.13.2")
{
byte stage: "libgenplusgx.dll", 0x000062D8, 0x538;
byte game: "libgenplusgx.dll", 0x000062D8, 0x56A;
byte lives: "libgenplusgx.dll", 0x000062D8, 0x54A;
byte xz: "libgenplusgx.dll", 0x000062D8, 0xFE59;
byte reset: "libgenplusgx.dll", 0x000062D8, 0xE60;
byte menu: "libgenplusgx.dll", 0x000062D8, 0xFDCE;
byte screen: "libgenplusgx.dll", 0x000062D8, 0xAF6;
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
    return (current.screen != 0x00 && current.menu == 0x00 && old.xz != 0x08 && current.xz == 0x08);
}
split
{
    if (current.stage <= 0x09 && old.game == 0x01 && current.game == 0x00 && current.xz == 0x08 && current.lives >=0x01) return true;
}
reset
{
    return (current.stage == 0x00 && current.lives == 0x00 && current.xz == 0x00 && current.reset == 0x00);
}
startup
{
	settings.Add("main", false, "AutoSplitter for Demolition Man by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}