state("Fusion", "3.64")
{
byte start: "Fusion.exe", 0x2A52D4, 0x586C;
byte level: "Fusion.exe", 0x2A52D4, 0x3ED3;
byte choose: "Fusion.exe", 0x2A52D4, 0x1D15;
byte bstart: "Fusion.exe", 0x2A52D4, 0x4103;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x13515AC;
byte level: "mednafen.exe", 0x134FC13;
byte choose: "mednafen.exe", 0x134DA55;
byte bstart: "mednafen.exe", 0x134FE43;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x164A3EC;
byte level: "mednafen.exe", 0x1648A53;
byte choose: "mednafen.exe", 0x1646895;
byte bstart: "mednafen.exe", 0x1648C83;
}
state("Retroarch", "1.16.0 BlastEm")
{
byte start: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0x586D;
byte level: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0x3ED2;
byte choose: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0x1D14;
byte bstart: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0x4102;
}
state("emuhawk", "1.13.2")
{
byte start: "libgenplusgx.dll", 0x000062D8, 0x586D;
byte level: "libgenplusgx.dll", 0x000062D8, 0x3ED2;
byte choose: "libgenplusgx.dll", 0x000062D8, 0x1D14;
byte bstart: "libgenplusgx.dll", 0x000062D8, 0x4102;
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
    return (old.start == 0x00 && current.start == 0xFF && current.bstart == 0x80 && current.choose != 0xE8 && current.choose != 0xA0 && current.choose != 0x8C);
}
split
{
    if (old.level == 0x4C && current.level == 0x50) return true;//Xibalba Falls
    if (old.level == 0x50 && current.level == 0x54) return true;//Tazamul Mines
    if (old.level == 0x54 && current.level == 0x58) return true;//Lost City of Copan
    if (old.level == 0x58 && current.level == 0x5C) return true;//Copan Temple
    if (old.level == 0x5C && current.level == 0x60) return true;//Lakamul Rainforest
    if (old.level == 0x60 && current.level == 0x64) return true;//Yaxchilan Lagoon
    if (settings["Runaway_Minecar"] && old.level == 0x64 && current.level == 0x68) return true;//Runaway Minecar
    if (settings["Tikal_Ruins"] && old.level == 0x68 && current.level == 0x6C) return true;//Tikal Ruins
    if (old.level == 0x6C && current.level == 0x70) return true;//Temple of Tikal
    if (old.level == 0x70 && current.level == 0x74) return true;//Warrior Spirit
    if (old.level == 0x74 && current.level == 0x78) return true;//Ending 
}
reset
{
    return (current.level == 0x00);
}
startup
{
	refreshRate = 70;
	settings.Add("main", false, "AutoSplitter for Pitfall The Mayan Adventure Genesis by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
    settings.Add("options", true, "Options");
	settings.Add("Runaway_Minecar", true, "Yaxchilan Lagoon -> Runaway Minecar", "options");
    settings.Add("Tikal_Ruins", true, "Runaway Minecar -> Tikal Ruins", "options");
}