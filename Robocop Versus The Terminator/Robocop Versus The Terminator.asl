state ("Fusion") //RAM 0x00 == "Fusion.exe", 0x2A52D4, 0x00;
{
    byte start:"Fusion.exe", 0x2A52D4, 0xC0;
    byte start2:"Fusion.exe", 0x2A52D4, 0xA0;
    byte stage:"Fusion.exe", 0x2A52D4, 0x8C;
    byte demo:"Fusion.exe", 0x2A52D4, 0xFE96;
    byte screen:"Fusion.exe", 0x2A52D4, 0x53;
    byte blue:"Fusion.exe", 0x2A52D4, 0x52;
}
state("mednafen", "1.27.1") //RAM 0x00 == 0x16EEB80
{
    byte start:"mednafen.exe", 0x16EEC40;
    byte start2:"mednafen.exe", 0x16EEC20;
    byte stage:"mednafen.exe", 0x16EEC0C;
    byte demo:"mednafen.exe", 0x16FEA16;
    byte screen:"mednafen.exe", 0x16EEBD3;
    byte blue:"mednafen.exe", 0x16EEBD2;
}
state("mednafen", "0.9.48") //RAM 0x00 == 0x134BD40
{
    byte start:"mednafen.exe", 0x134BE00;
    byte start2:"mednafen.exe", 0x134BDE0;
    byte stage:"mednafen.exe", 0x134BDCC;
    byte demo:"mednafen.exe", 0x135BBD6;
    byte screen:"mednafen.exe", 0x134BD93;
    byte blue:"mednafen.exe", 0x134BD92;
}
state("retroarch", "1.9.8") //RAM 0x00 == "blastem_libretro.dll", 0x173B18, 0x198, 0x00;
{
    byte start:"blastem_libretro.dll", 0x173B18, 0x198, 0xC1;
    byte start2:"blastem_libretro.dll", 0x173B18, 0x198, 0xA1;
    byte stage:"blastem_libretro.dll", 0x173B18, 0x198, 0x8D;
    byte demo:"blastem_libretro.dll", 0x173B18, 0x198, 0xFE97;
    byte screen:"blastem_libretro.dll", 0x173B18, 0x198, 0x52;
    byte blue:"blastem_libretro.dll", 0x173B18, 0x198, 0x53;
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