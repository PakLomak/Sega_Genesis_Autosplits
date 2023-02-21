state("Fusion", "3.64")
{
byte screen: "Fusion.exe", 0x2A52D4, 0xFFFE;
byte screen2: "Fusion.exe", 0x2A52D4, 0xFFFF;
byte start: "Fusion.exe", 0x2A52D4, 0xFFF5;
byte input: "Fusion.exe", 0x2A52D4, 0xDD3C;
}
state("Mednafen", "0.9.48")
{
byte screen: "mednafen.exe", 0x135BD3E;
byte screen2: "mednafen.exe", 0x135BD3F;
byte start: "mednafen.exe", 0x135BD35;
byte input: "mednafen.exe", 0x1359A7C;
}
state("Mednafen", "1.29.0")
{
byte screen: "mednafen.exe", 0x1654B7E;
byte screen2: "mednafen.exe", 0x1654B7F;
byte start: "mednafen.exe", 0x1654B75;
byte input: "mednafen.exe", 0x16528BC;
}
state("Retroarch", "1.14.0 BlastEm")
{
byte screen: "blastem_libretro.dll", 0x172B18, 0x198, 0xFFFF;
byte screen2: "blastem_libretro.dll", 0x172B18, 0x198, 0xFFFE;
byte start: "blastem_libretro.dll", 0x172B18, 0x198, 0xFFF4;
byte input: "blastem_libretro.dll", 0x172B18, 0x198, 0xDD3D;
}
state("Retroarch", "1.14.0 GX")
{
byte screen: "genesis_plus_gx_libretro.dll", 0x06A8990, 0xFFFF;
byte screen2: "genesis_plus_gx_libretro.dll", 0x06A8990, 0xFFFE;
byte start: "genesis_plus_gx_libretro.dll", 0x06A8990, 0xFFF4;
byte input: "genesis_plus_gx_libretro.dll", 0x06A8990, 0xDD3D;
}
state("emuhawk", "1.13.2")
{
byte screen: "libgenplusgx.dll", 0x000062D8, 0xFFFF;
byte screen2: "libgenplusgx.dll", 0x000062D8, 0xFFFE;
byte start: "libgenplusgx.dll", 0x000062D8, 0xFFF4;
byte input: "libgenplusgx.dll", 0x000062D8, 0xDD3D;
}
init
{
    if (modules.First().ModuleMemorySize == 91533312)  
        version = "1.29.0";
    else if (modules.First().ModuleMemorySize == 93294592)
        version = "0.9.48";
        vars._1sp = true;
}
start
{
    if (current.screen2 == 0xD8 && old.start != 0xF6 && current.start == 0x0F6 && current.input == 0xFF)
    {
        return vars._1sp == true;
    }
}
split
{
    if (current.screen == 0x5B && old.screen2 != 0x54 && current.screen2 == 0x54) return true;
    if (current.screen == 0x1E && old.screen2 != 0xCA && current.screen2 == 0xCA && vars._1sp == true)
    {
        return vars._1sp == false;
    }
}
reset
{
    if (current.screen == 0x59)
    {
        if (current.screen2 == 0xC4) return true;
        if (current.screen2 == 0xB4) return true;
    }
}
startup
{
	refreshRate = 70;
	settings.Add("main", false, "AutoSplitter for We're Back! - A Dinosaur's Tale by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/PakLomak", "main");
}