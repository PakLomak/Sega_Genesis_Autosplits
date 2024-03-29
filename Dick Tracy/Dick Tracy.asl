state("Fusion", "3.64")
{
byte screen: "Fusion.exe", 0x2A52D4, 0xFD39;
byte lvl: "Fusion.exe", 0x2A52D4, 0xFD3B;
byte menu: "Fusion.exe", 0x2A52D4, 0x1C0F;
byte hpBoss: "Fusion.exe", 0x2A52D4, 0xFDAF;
byte complete: "Fusion.exe", 0x2A52D4, 0x5A23;
}
state("Mednafen", "0.9.48")
{
byte screen: "mednafen.exe", 0x135BA79;
byte lvl: "mednafen.exe", 0x135BA7B;
byte menu: "mednafen.exe", 0x134D94F;
byte hpBoss: "mednafen.exe", 0x135BAEF;
byte complete: "mednafen.exe", 0x1351763;
}
state("Mednafen", "1.29.0")
{
byte screen: "mednafen.exe", 0x16548B9;
byte lvl: "mednafen.exe", 0x16548BB;
byte menu: "mednafen.exe", 0x164678F;
byte hpBoss: "mednafen.exe", 0x165492F;
byte complete: "mednafen.exe", 0x164A5A3;
}
state("Retroarch", "1.16.0 BlastEm")
{
byte screen: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xFD38;
byte lvl: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xFD3A;
byte menu: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0x1C0E;
byte hpBoss: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xFDAE;
byte complete: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0x5A22;
}
state("emuhawk", "1.13.2")
{
byte screen: "libgenplusgx.dll", 0x000062D8, 0xFD38;
byte lvl: "libgenplusgx.dll", 0x000062D8, 0xFD3A;
byte menu: "libgenplusgx.dll", 0x000062D8, 0x1C0E;
byte hpBoss: "libgenplusgx.dll", 0x000062D8, 0xFDAE;
byte complete: "libgenplusgx.dll", 0x000062D8, 0x5A22;
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
    return (old.screen == 0x00 && current.screen == 0x01 && current.menu == 0x00 && current.lvl == 0xFF);
}
split
{
    if (current.complete == 0xEE && old.complete != 0xEE && current.screen != 0x4E) return true;
    if (current.lvl == 0x11 && current.screen == 0x45 && old.hpBoss == 0x01 && current.hpBoss == 0x00) return true;
}
reset
{
    return (current.screen == 0x00 && current.lvl == 0x00 && current.menu == 0x00 && current.complete == 0x00);
}
startup 
{
	settings.Add("main", false, "AutoSplitter for Dick Tracy by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}