state ("Fusion") //RAM 0x00 == "Fusion.exe", 0x2A52D4, 0x00;
{
	byte stage :				"Fusion.exe", 0x2A52D4, 0xD439;
	byte blackScreen :			"Fusion.exe", 0x2A52D4, 0x898F;
}
state("mednafen", "1.27.1") //RAM 0x00 == 0x16EEB80
{
	byte stage :				"mednafen.exe", 0x16FBFB9;
	byte blackScreen :			"mednafen.exe", 0x16F750F;
}
state("mednafen", "0.9.48") //RAM 0x00 == 0x134BD40
{
	byte stage :				"mednafen.exe", 0x1359179;
	byte blackScreen :			"mednafen.exe", 0x13546CF;
}
state("retroarch", "1.9.8") //RAM 0x00 == "blastem_libretro.dll", 0x173B18, 0x198, 0x00; Little endian!
{
	byte stage :				"blastem_libretro.dll", 0x173B18, 0x198, 0xd438;
	byte blackScreen :			"blastem_libretro.dll", 0x173B18, 0x198, 0x898e;
}
state("emuhawk") //RAM 0x00 == "libgenplusgx.dll", 0x000062D8, 0x00; Little endian!
{
	byte stage :				"libgenplusgx.dll", 0x000062D8, 0xd438;
	byte blackScreen :			"libgenplusgx.dll", 0x000062D8, 0x898e;
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
	if (old.stage == 0x00 && current.stage == 0x12) return true;
}
split
{
	if (current.stage == old.stage + 1) return true;
	if (current.stage== 0x23 && old.blackScreen == 0x01 && current.blackScreen == 0x00) return true;
}
reset
{
	return (current.stage == 0x00);
}
startup
{
	settings.Add("main", false, "AutoSplitter for Dashin' Desperadoes by LosharaLoshara");
	settings.Add("main3", false, "--https://www.twitch.tv/losharaloshara", "main");
}