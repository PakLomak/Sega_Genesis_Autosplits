state("Fusion", "3.64")
{
byte start: "Fusion.exe", 0x2A52D4, 0xC0;
byte start2: "Fusion.exe", 0x2A52D4, 0xA0;
byte stage: "Fusion.exe", 0x2A52D4, 0x8C;
byte demo: "Fusion.exe", 0x2A52D4, 0xFE96;
byte screen: "Fusion.exe", 0x2A52D4, 0x53;
byte blue: "Fusion.exe", 0x2A52D4, 0x52;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x134BE00;
byte start2: "mednafen.exe", 0x134BDE0;
byte stage: "mednafen.exe", 0x134BDCC;
byte demo: "mednafen.exe", 0x135BBD6;
byte screen: "mednafen.exe", 0x134BD93;
byte blue: "mednafen.exe", 0x134BD92;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x1644C40;
byte start2: "mednafen.exe", 0x1644C20;
byte stage: "mednafen.exe", 0x1644C0C;
byte demo: "mednafen.exe", 0x1654A16;
byte screen: "mednafen.exe", 0x1644BD3;
byte blue: "mednafen.exe", 0x1644BD2;
}
state("Retroarch", "1.16.0 BlastEm")
{
byte start: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xC1;
byte start2: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xA1;
byte stage: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0x8D;
byte demo: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xFE97;
byte screen: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0x52;
byte blue: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0x53;
}
state("emuhawk", "1.13.2")
{
byte start: "libgenplusgx.dll", 0x000062D8, 0xC1;
byte start2: "libgenplusgx.dll", 0x000062D8, 0xA1;
byte stage: "libgenplusgx.dll", 0x000062D8, 0x8D;
byte demo: "libgenplusgx.dll", 0x000062D8, 0xFE97;
byte screen: "libgenplusgx.dll", 0x000062D8, 0x52;
byte blue: "libgenplusgx.dll", 0x000062D8, 0x53;
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
    return (current.start == 0x7B && current.stage == 0x00 && current.start2 == 0x00 && current.demo == 0x00);
}
split
{
    if (old.stage == 0x14 && current.stage == 0x01) return true;
    if (old.stage == 0x01 && current.stage == 0x02) return true;
    if (old.stage == 0x02 && current.stage == 0x05) return true;
    if (old.stage == 0x05 && current.stage == 0x06) return true;
    if (old.stage == 0x06 && current.stage == 0x08) return true;
    if (old.stage == 0x08 && current.stage == 0x07) return true;
    if (old.stage == 0x07 && current.stage == 0x09) return true;
    if (old.stage == 0x09 && current.stage == 0x0B) return true;
    if (old.stage == 0x0B && current.stage == 0x0C) return true;
    if (current.stage == 0x0C && old.screen == 0x04 && current.screen == 0x84) return true;
}
reset
{
    return (current.blue == 0x1F);
}
startup
{
	refreshRate = 70;
	settings.Add("main", false, "AutoSplitter for Robocop Versus The Terminator by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}