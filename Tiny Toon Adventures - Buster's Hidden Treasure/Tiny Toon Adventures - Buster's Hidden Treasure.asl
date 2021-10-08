state ("Fusion") //RAM 0x00 == "Fusion.exe", 0x2A52D4, 0x00;
{
    byte start:"Fusion.exe", 0x2A52D4, 0xF907;
    byte scene:"Fusion.exe", 0x2A52D4, 0xF905;
    byte level:"Fusion.exe", 0x2A52D4, 0xF941;
    byte boss_hit:"Fusion.exe", 0x2A52D4, 0xA231;
    byte global:"Fusion.exe", 0x2A52D4, 0xF900;
    byte bunny:"Fusion.exe", 0x2A52D4, 0xFB0A;
}
state("mednafen", "1.27.1") //RAM 0x00 == 0x16EEB80
{
    byte start:"mednafen.exe", 0x16FE487;
    byte scene:"mednafen.exe", 0x16FE485;
    byte level:"mednafen.exe", 0x16FE4C1;
    byte boss_hit:"mednafen.exe", 0x16F8DB1;
    byte global:"mednafen.exe", 0x16FE480;
    byte bunny:"mednafen.exe", 0x16FE68A;
}
state("mednafen", "0.9.48") //RAM 0x00 == 0x134BD40
{
    byte start:"mednafen.exe", 0x135B647;
    byte scene:"mednafen.exe", 0x135B645;
    byte level:"mednafen.exe", 0x135B681;
    byte boss_hit:"mednafen.exe", 0x1355F71;
    byte global:"mednafen.exe", 0x135B640;
    byte bunny:"mednafen.exe", 0x135B84A;
}
state("retroarch", "1.9.8") //RAM 0x00 == "blastem_libretro.dll", 0x173B18, 0x198, 0x00; Little endian!
{
    byte start:"blastem_libretro.dll", 0x173B18, 0x198, 0xF906;
    byte scene:"blastem_libretro.dll", 0x173B18, 0x198, 0xF904;
    byte level:"blastem_libretro.dll", 0x173B18, 0x198, 0xF940;
    byte boss_hit:"blastem_libretro.dll", 0x173B18, 0x198, 0xA230;
    byte global:"blastem_libretro.dll", 0x173B18, 0x198, 0xF901;
    byte bunny:"blastem_libretro.dll", 0x173B18, 0x198, 0xFB0B;
}
init
{
    if (modules.First().ModuleMemorySize == 90116096)
        version = "1.27.1";
    else if (modules.First().ModuleMemorySize == 93294592)
        version = "0.9.48";
    vars.l0 = 0;
}
start
{
    if (current.start == 0x06 && current.scene == 0x00)
    {
        vars.l0 = 0;
        return true;
    }
}
split
{
    if (old.level != 0x28 && current.level == 0x28 && current.bunny != 0xFF)
    {
        if (vars.l0 > 0) return true;
        vars.l0 = vars.l0 + 1;
    }
    if (current.level == 0x22 && old.boss_hit == 0x09 && current.boss_hit == 0x0A) return true;
}
reset
{
    return (current.global == 0x00 && current.scene == 0x08);
}
startup
{
	refreshRate = 70;
	settings.Add("main", false, "AutoSplitter for Tiny Toon Adventures: Buster's Hidden Treasure by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}