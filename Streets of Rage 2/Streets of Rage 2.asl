state ("Fusion") //RAM 0x00 == "Fusion.exe", 0x2A52D4, 0x00;
{
    byte start:"Fusion.exe", 0x2A52D4, 0xFFD6;
    byte idlvl:"Fusion.exe", 0x2A52D4, 0xFC45;
    byte lvl:"Fusion.exe", 0x2A52D4, 0xFC43;
    byte done:"Fusion.exe", 0x2A52D4, 0xA20E;
    byte reset:"Fusion.exe", 0x2A52D4, 0xF007;
}
state("mednafen", "1.27.1") //RAM 0x00 == 0x16EEB80
{
    byte start:"mednafen.exe", 0x16FEB56;
    byte idlvl:"mednafen.exe", 0x16FE7C5;
    byte lvl:"mednafen.exe", 0x16FE7C3;
    byte done:"mednafen.exe", 0x16F8D8E;
    byte reset:"mednafen.exe", 0x16FDB87;
}
state("mednafen", "0.9.48") //RAM 0x00 == 0x134BD40
{
    byte start:"mednafen.exe", 0x135BD16;
    byte idlvl:"mednafen.exe", 0x135B985;
    byte lvl:"mednafen.exe", 0x135B983;
    byte done:"mednafen.exe", 0x1355F4E;
    byte reset:"mednafen.exe", 0x135AD47;
}
state("retroarch", "1.9.8") //RAM 0x00 == "blastem_libretro.dll", 0x173B18, 0x198, 0x00; Little endian!
{
    byte start:"blastem_libretro.dll", 0x173B18, 0x198, 0xFFD7;
    byte idlvl:"blastem_libretro.dll", 0x173B18, 0x198, 0xFC44;
    byte lvl:"blastem_libretro.dll", 0x173B18, 0x198, 0xFC42;
    byte done:"blastem_libretro.dll", 0x173B18, 0x198, 0xA20F;
    byte reset:"blastem_libretro.dll", 0x173B18, 0x198, 0xF006;
}
init
{
    if (modules.First().ModuleMemorySize == 90116096)
        version = "1.27.1";
    else if (modules.First().ModuleMemorySize == 93294592)
        version = "0.9.48";
}
start
{
    return (old.start == 0x16 && current.start == 0xFF && current.idlvl == 0x00);
}
split
{
    if (current.lvl == old.lvl + 2) return true;
    if (current.lvl == 0x0E && old.done == 0x00 && current.done == 0xE0) return true;
}
reset
{
    return (current.reset == 0x00 && current.idlvl == 0x00 && current.lvl == 0x00);
}
startup
{
	refreshRate = 70;
	settings.Add("main", false, "AutoSplitter for Streets of Rage 2 by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}
