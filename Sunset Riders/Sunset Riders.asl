state("Fusion", "3.64")
{
byte start: "Fusion.exe", 0x2A52D4, 0xB083;
byte level: "Fusion.exe", 0x2A52D4, 0xB089;
byte bossHP: "Fusion.exe", 0x2A52D4, 0xDADD;
byte reset: "Fusion.exe", 0x2A52D4, 0xFEFB;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x1356DC3;
byte level: "mednafen.exe", 0x1356DC9;
byte bossHP: "mednafen.exe", 0x135981D;
byte reset: "mednafen.exe", 0x135BC3B;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x164FC03;
byte level: "mednafen.exe", 0x164FC09;
byte bossHP: "mednafen.exe", 0x165265D;
byte reset: "mednafen.exe", 0x1654A7B;
}
state("Retroarch", "1.14.0 BlastEm")
{
byte start: "blastem_libretro.dll", 0x172B18, 0x198, 0xB082;
byte level: "blastem_libretro.dll", 0x172B18, 0x198, 0xB088;
byte bossHP: "blastem_libretro.dll", 0x172B18, 0x198, 0xDADC;
byte reset: "blastem_libretro.dll", 0x172B18, 0x198, 0xFEFA;
}
init
{
     if (modules.First().ModuleMemorySize == 93294592)
        version = "0.9.48";
    else if (modules.First().ModuleMemorySize == 91533312)  
        version = "1.29.0";
}
start
{
    return(old.start == 0x04 && current.start == 0x06);
}
split
{
    if (current.level == old.level + 1)return true;
    if (current.level == 0x0A && old.bossHP == 0x01 && current.bossHP == 0x00)return true;
}
reset
{
    return(current.level == 0x00 && current.start == 0x00 && current.reset == 0x74);
}
startup
{
	refreshRate = 70;
	settings.Add("main", false, "AutoSplitter for Sunset Riders by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}