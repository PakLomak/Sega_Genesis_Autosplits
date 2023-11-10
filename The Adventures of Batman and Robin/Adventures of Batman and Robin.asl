state("Fusion", "3.64")
{
byte start: "Fusion.exe", 0x2A52D4, 0xAE43;
byte x: "Fusion.exe", 0x2A52D4, 0xF607;
byte stage: "Fusion.exe", 0x2A52D4, 0xF602;
byte global: "Fusion.exe", 0x2A52D4, 0xF5FA;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x1356B83;
byte x: "mednafen.exe", 0x135B347;
byte stage: "mednafen.exe", 0x135B342;
byte global: "mednafen.exe", 0x135B33A;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x164F9C3;
byte x: "mednafen.exe", 0x1654187;
byte stage: "mednafen.exe", 0x1654182;
byte global: "mednafen.exe", 0x165417A;
}
state("Retroarch", "1.16.0 BlastEm")
{
byte start: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xAE42;
byte x: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xF606;
byte stage: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xF603;
byte global: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xF5FB;
}
state("emuhawk", "1.13.2")
{
byte start: "libgenplusgx.dll", 0x000062D8, 0xAE42;
byte x: "libgenplusgx.dll", 0x000062D8, 0xF606;
byte stage: "libgenplusgx.dll", 0x000062D8, 0xF603;
byte global: "libgenplusgx.dll", 0x000062D8, 0xF5FB;
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
    return (current.start == 0x8C);
}
split
{
    if (old.x == 0x72 && current.x == 0x96 && current.stage != 0x44) return(true);
    if (old.stage == 0x22 && current.stage == 0x23) return(true);
    if (current.stage == 0x44 && old.x == 0x96 && current.x == 0x54) return(true);
}
reset
{
    return (current.x == 0x08 && current.global == 0x00);
}
startup
{
	refreshRate = 70;
	settings.Add("main", false, "AutoSplitter for Adventures of Batman and Robin Genesis by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}
