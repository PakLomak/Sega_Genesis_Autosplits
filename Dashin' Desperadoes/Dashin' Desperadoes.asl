state("Fusion", "3.64")
{
byte stage: "Fusion.exe", 0x2A52D4, 0xD439;
byte blackScreen: "Fusion.exe", 0x2A52D4, 0x898F;
}
state("Mednafen", "0.9.48")
{
byte stage: "mednafen.exe", 0x1359179;
byte blackScreen: "mednafen.exe", 0x13546CF;
}
state("Mednafen", "1.29.0")
{
byte stage: "mednafen.exe", 0x1651FB9;
byte blackScreen: "mednafen.exe", 0x164D50F;
}
state("Retroarch", "1.16.0 BlastEm")
{
byte stage: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xD438;
byte blackScreen: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0x898E;
}
state("emuhawk", "1.13.2")
{
byte stage: "libgenplusgx.dll", 0x000062D8, 0xD438;
byte blackScreen: "libgenplusgx.dll", 0x000062D8, 0x898E;
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
	if (old.stage == 0x00 && current.stage == 0x12) return true;
}
split
{
	if (current.stage == old.stage + 1) return true;
	if (current.stage== 0x23 && old.blackScreen == 0x01 && current.blackScreen == 0x00) return true;
}
reset
{
	return (current.stage == 0x00);
}
startup
{
	settings.Add("main", false, "AutoSplitter for Dashin' Desperadoes by LosharaLoshara");
	settings.Add("main3", false, "--https://www.twitch.tv/losharaloshara", "main");
}