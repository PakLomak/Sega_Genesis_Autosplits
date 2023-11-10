state("Fusion", "3.64")
{
byte start: "Fusion.exe", 0x2A52D4, 0x16EEB87;
byte level: "Fusion.exe", 0x2A52D4, 0x16EEBD5;
byte boss: "Fusion.exe", 0x2A52D4, 0x16EF3E0;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x2A3A8C7;
byte level: "mednafen.exe", 0x2A3A915;
byte boss: "mednafen.exe", 0x2A3B120;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x2D33707;
byte level: "mednafen.exe", 0x2D33755;
byte boss: "mednafen.exe", 0x2D33F60;
}
state("Retroarch", "1.16.0 BlastEm")
{
byte start: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0x16EEB86;
byte level: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0x16EEBD4;
byte boss: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0x16EF3E1;
}
state("emuhawk", "1.13.2")
{
byte start: "libgenplusgx.dll", 0x000062D8, 0x16EEB86;
byte level: "libgenplusgx.dll", 0x000062D8, 0x16EEBD4;
byte boss: "libgenplusgx.dll", 0x000062D8, 0x16EF3E1;
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
    return (old.start == 0x02 && current.start == 0x03);
}
split
{
    if (current.level == old.level + 1) return true;
    if (current.level == 0x45 && old.boss == 0x00 && current.boss == 0xFF) return true;
}
reset
{
    return (current.start == 0xFF);
}