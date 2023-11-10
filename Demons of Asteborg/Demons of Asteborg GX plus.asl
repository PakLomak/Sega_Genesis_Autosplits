state("Retroarch", "1.16.0 GX")
{
byte start: "genesis_plus_gx_libretro.dll", 0x07118A0, 0x6D7D;
byte screen: "genesis_plus_gx_libretro.dll", 0x07118A0, 0x7150;
byte screen2: "genesis_plus_gx_libretro.dll", 0x07118A0, 0x7151;
byte lastboss: "genesis_plus_gx_libretro.dll", 0x07118A0, 0xBE0E;
byte dead: "genesis_plus_gx_libretro.dll", 0x07118A0, 0x6D19;
byte reset: "genesis_plus_gx_libretro.dll", 0x07118A0, 0x0;
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