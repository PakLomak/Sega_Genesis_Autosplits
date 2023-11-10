state("Fusion", "3.64")
{
byte start: "Fusion.exe", 0x2A52D4, 0xDC2;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x134CB02;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x1645942;
}
state("Retroarch", "1.16.0 BlastEm")
{
byte start: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xDC3;
}
state("emuhawk", "1.13.2")
{
byte start: "libgenplusgx.dll", 0x000062D8, 0xDC3;
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
	return (old.start == 0x07 && current.start == 0x09);
}
split
{
	if (current.start == 0x06 && old.start != 0x06) return(true);
}
startup
{
	settings.Add("main", false, "AutoSplitter for Battle Toads - Double Dragon by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}
