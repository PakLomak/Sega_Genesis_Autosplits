state ("Fusion") //RAM 0x00 == "Fusion.exe", 0x2A52D4, 0x00;
{
    byte start:"Fusion.exe", 0x2A52D4, 0xAE43;
    byte x:"Fusion.exe", 0x2A52D4, 0xF607;
    byte stage:"Fusion.exe", 0x2A52D4, 0xF602;
    byte global:"Fusion.exe", 0x2A52D4, 0xF5FA;
}
state("mednafen", "1.27.1") //RAM 0x00 == 0x16EEB80
{
    byte start:"mednafen.exe", 0x16F99C3;
    byte x:"mednafen.exe", 0x16FE187;
    byte stage:"mednafen.exe", 0x16FE182;
    byte global:"mednafen.exe", 0x16FE17A;
}
state("mednafen", "0.9.48") //RAM 0x00 == 0x134BD40
{
    byte start:"mednafen.exe", 0x1356B83;
    byte x:"mednafen.exe", 0x135B347;
    byte stage:"mednafen.exe", 0x135B342;
    byte global:"mednafen.exe", 0x135B33A;
}
state("retroarch", "1.9.8") //RAM 0x00 == "blastem_libretro.dll", 0x173B18, 0x198, 0x00; Little endian!
{
    byte start:"blastem_libretro.dll", 0x173B18, 0x198, 0xAE42;//0xAE43
    byte x:"blastem_libretro.dll", 0x173B18, 0x198, 0xF606;//0xF607
    byte stage:"blastem_libretro.dll", 0x173B18, 0x198, 0xF603;//0xF602
    byte global:"blastem_libretro.dll", 0x173B18, 0x198, 0xF5FB;//0xF5FA
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
