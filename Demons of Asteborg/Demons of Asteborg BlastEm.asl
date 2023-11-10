state("Retroarch", "1.16.0 BlastEm")
{
byte start: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0x6D7D;
byte screen: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0x7150;
byte screen2: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0x7151;
byte lastboss: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xBE0E;
byte dead: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0x6D19;
byte reset: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0x0;
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