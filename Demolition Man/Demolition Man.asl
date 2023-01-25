state ("Fusion") //RAM 0x00 == "Fusion.exe", 0x2A52D4, 0x00;
{
	byte stage:"Fusion.exe", 0x2A52D4, 0x0539;
    byte game:"Fusion.exe", 0x2A52D4, 0x056B;
    byte lives:"Fusion.exe", 0x2A52D4, 0x054B;
    byte xz:"Fusion.exe", 0x2A52D4, 0xFE58;
    byte reset:"Fusion.exe", 0x2A52D4, 0xE61;
    byte menu:"Fusion.exe", 0x2A52D4, 0xFDCF;
    byte screen:"Fusion.exe", 0x2A52D4, 0xAF7;
}
state("mednafen", "1.29.0") //RAM 0x00 == 0x1644B80
{
	byte stage:"mednafen.exe", 0x16450B9;
    byte game:"mednafen.exe", 0x16450EB;
    byte lives:"mednafen.exe", 0x16450CB;
    byte xz:"mednafen.exe", 0x16549D8;
    byte reset:"mednafen.exe", 0x16459E1;
    byte menu:"mednafen.exe", 0x165494F;
    byte screen:"mednafen.exe", 0x1645677;
}
state("mednafen", "0.9.48") //RAM 0x00 == 0x134BD40
{
	byte stage:"mednafen.exe", 0x134C279;
    byte game:"mednafen.exe", 0x134C2AB;
    byte lives:"mednafen.exe", 0x134C28B;
    byte xz:"mednafen.exe", 0x135BB98;
    byte reset:"mednafen.exe", 0x134CBA1;
    byte menu:"mednafen.exe", 0x135BB0F;
    byte screen:"mednafen.exe", 0x134C837;
}
state("retroarch", "1.9.8") //RAM 0x00 == "blastem_libretro.dll", 0x173B18, 0x198, 0x00; Little endian!
{
	byte stage:"blastem_libretro.dll", 0x173B18, 0x198, 0x0538;
    byte game:"blastem_libretro.dll", 0x173B18, 0x198, 0x056A;
    byte lives:"blastem_libretro.dll", 0x173B18, 0x198, 0x054A;
    byte xz:"blastem_libretro.dll", 0x173B18, 0x198, 0xFE59;
    byte reset:"blastem_libretro.dll", 0x173B18, 0x198, 0xE60;
    byte menu:"blastem_libretro.dll", 0x173B18, 0x198, 0xFDCE;
    byte screen:"blastem_libretro.dll", 0x173B18, 0x198, 0xAF6;
}
state("emuhawk") //RAM 0x00 == "libgenplusgx.dll", 0x000062D8, 0x00; Little endian!
{
	byte stage:"libgenplusgx.dll", 0x000062D8, 0x0538;
    byte game:"libgenplusgx.dll", 0x000062D8, 0x056A;
    byte lives:"libgenplusgx.dll", 0x000062D8, 0x054A;
    byte xz:"libgenplusgx.dll", 0x000062D8, 0xFE59;
    byte reset:"libgenplusgx.dll", 0x000062D8, 0xE60;
    byte menu:"libgenplusgx.dll", 0x000062D8, 0xFDCE;
    byte screen:"libgenplusgx.dll", 0x000062D8, 0xAF6;
}
init
{
    if (modules.First().ModuleMemorySize == 91533312)
        version = "1.29.0";
    else if (modules.First().ModuleMemorySize == 93294592)
        version = "0.9.48";
}
start
{
    return (current.screen != 0x00 && current.menu == 0x00 && old.xz != 0x08 && current.xz == 0x08);
}
split
{
    if (current.stage <= 0x09 && old.game == 0x01 && current.game == 0x00 && current.xz == 0x08 && current.lives >=0x01) return true;
}
reset
{
    return (current.stage == 0x00 && current.lives == 0x00 && current.xz == 0x00 && current.reset == 0x00);
}
startup
{
	settings.Add("main", false, "AutoSplitter for Demolition Man by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}