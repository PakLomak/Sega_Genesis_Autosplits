state ("Fusion")
{
    byte start:"Fusion.exe", 0x2A52D4, 0xFE1D;
    byte lvl:"Fusion.exe", 0x2A52D4, 0xFE2C;
    byte igt:"Fusion.exe", 0x2A52D4, 0xFE2F;
    byte reset:"Fusion.exe", 0x2A52D4, 0xFE18;
    byte press:"Fusion.exe", 0x2A52D4, 0xFEFF;
    byte press2:"Fusion.exe", 0x2A52D4, 0xFEFE;
}
start
{
    return (current.start == 0xC2 && old.start != 0xC2 && current.igt == 0x00 && current.lvl == 0x00);
}
split
{
    if (settings["level_split"] && current.lvl == old.lvl + 1) return true;
    if (current.lvl == 0x05 && current.press2 == 0x00 && current.press == 0xD8 && old.press != 0xD8) return true;
}
reset
{
    return (current.start == 0xB4 && current.igt == 0x00 && current.lvl == 0x00 && current.reset == 0xD2);
}
startup 
{
	settings.Add("main", false, "AutoSplitter for The Terminator by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
    settings.Add("options", true, "Options");
	settings.Add("level_split", true, "Split by levels", "options");
}