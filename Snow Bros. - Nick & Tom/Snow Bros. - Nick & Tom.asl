state ("Fusion") //RAM 0x00 == "Fusion.exe", 0x2A52D4, 0x00;
{
    byte start:"Fusion.exe", 0x2A52D4, 0x07;
    byte level:"Fusion.exe", 0x2A52D4, 0x55;
    byte boss:"Fusion.exe", 0x2A52D4, 0x860;
}
state("mednafen", "1.27.1") //RAM 0x00 == 0x16EEB80
{
    byte start:"mednafen.exe", 0x16EEB87;
    byte level:"mednafen.exe", 0x16EEBD5;
    byte boss:"mednafen.exe", 0x16EF3E0;
}
state("mednafen", "0.9.48") //RAM 0x00 == 0x134BD40
{
    byte start:"mednafen.exe", 0x134BD47;
    byte level:"mednafen.exe", 0x134BD95;
    byte boss:"mednafen.exe", 0x134C5A0;
}
state("retroarch", "1.9.8") //RAM 0x00 == "blastem_libretro.dll", 0x173B18, 0x198, 0x00; Little endian!
{
    byte start:"blastem_libretro.dll", 0x173B18, 0x198, 0x06;
    byte level:"blastem_libretro.dll", 0x173B18, 0x198, 0x54;
    byte boss:"blastem_libretro.dll", 0x173B18, 0x198, 0x861;
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
    return (old.start == 0x02 && current.start == 0x03);
}
split
{
    if (current.level == old.level + 1) return true;
    if (current.level == 0x45 && old.boss == 0x00 && current.boss == 0xFF) return true;
}
reset
{
    return (current.start == 0xFF);
}