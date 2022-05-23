state("retroarch", "BlastEm") //RAM 0x00 == "blastem_libretro.dll", 0x172B18, 0x198, 0x00; Little endian!
{
    byte start:"genesis_plus_gx_libretro.dll", 0x02851A60, 0x6D7D; //6D7C
    byte screen:"genesis_plus_gx_libretro.dll", 0x02851A60, 0x7150; //7151
    byte screen2:"genesis_plus_gx_libretro.dll", 0x02851A60, 0x7151; //7150
    byte lastboss:"genesis_plus_gx_libretro.dll", 0x02851A60, 0xBE0E; //BE0F
    byte dead:"genesis_plus_gx_libretro.dll", 0x02851A60, 0x6D19; //6D18
    byte reset:"genesis_plus_gx_libretro.dll", 0x02851A60, 0x00; //00
}
start
{
    return (old.start == 0x0C && current.start == 0x0D);
}
split
{
    if (old.screen != 0x1C && current.screen == 0x1C && current.screen2 == 0x01) return true;
    if (current.screen == 0x9D && current.screen2 == 0x02 && current.lastboss <= 0x02 && old.dead == 0x00 && current.dead == 0x0D) return true;
}
reset
{
    return (current.reset == 0x00);
}
startup
{
	settings.Add("main", false, "AutoSplitter for Demons of Asteborg by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}
update
{
    //print(current.start.ToString("X2"));
}