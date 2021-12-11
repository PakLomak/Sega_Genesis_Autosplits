state ("Fusion") //RAM 0x00 == "Fusion.exe", 0x2A52D4, 0x00;
{
    byte start:"Fusion.exe", 0x2A52D4, 0x73;
    byte hp:"Fusion.exe", 0x2A52D4, 0x7C;
    byte demo:"Fusion.exe", 0x2A52D4, 0x0A;
    byte lvl:"Fusion.exe", 0x2A52D4, 0xBB;
    byte bossHP:"Fusion.exe", 0x2A52D4, 0xB39;
    byte reset:"Fusion.exe", 0x2A52D4, 0x10;
}
state("mednafen", "1.27.1") //RAM 0x00 == 0x16EEB80
{
    byte start:"mednafen.exe", 0x16EEBF3;
    byte hp:"mednafen.exe", 0x16EEBFC;
    byte demo:"mednafen.exe", 0x16EEB8A;
    byte lvl:"mednafen.exe", 0x16EEC3B;
    byte bossHP:"mednafen.exe", 0x16EF6B9;
    byte reset:"mednafen.exe", 0x16EEB90;
}
state("mednafen", "0.9.48") //RAM 0x00 == 0x134BD40
{
    byte start:"mednafen.exe", 0x134BDB3;
    byte hp:"mednafen.exe", 0x134BDBC;
    byte demo:"mednafen.exe", 0x134BD4A;
    byte lvl:"mednafen.exe", 0x134BDFB;
    byte bossHP:"mednafen.exe", 0x134C879;
    byte reset:"mednafen.exe", 0x134BD50;
}
state("retroarch", "1.9.12") //RAM 0x00 == "blastem_libretro.dll", 0x172B18, 0x198, 0x00; Little endian!
{
    byte start:"blastem_libretro.dll", 0x172B18, 0x198, 0x72;
    byte hp:"blastem_libretro.dll", 0x172B18, 0x198, 0x7D;
    byte demo:"blastem_libretro.dll", 0x172B18, 0x198, 0x0B;
    byte lvl:"blastem_libretro.dll", 0x172B18, 0x198, 0xBA;
    byte bossHP:"blastem_libretro.dll", 0x172B18, 0x198, 0xB38;
    byte reset:"blastem_libretro.dll", 0x172B18, 0x198, 0x11;
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
    return (old.start != 0x00 && current.start == 0x00 && current.hp == 0x01 && current.demo == 0x00 && current.lvl == 0x00);
}
split
{
    if (settings["All_levels"] && current.lvl == old.lvl + 1) return true;
    if (old.lvl == 0x10 && current.lvl == 0x15) return true; //Subterranean Terror
    if (settings["levels"])
    {
        if (old.lvl == 0x03 && current.lvl == 0x04) return true; //Castle Wyvern
        if (old.lvl == 0x07 && current.lvl == 0x08) return true; //Siege of the Rookery
        if (old.lvl == 0x0B && current.lvl == 0x10) return true; //Stone and Steel
        if (old.lvl == 0x19 && current.lvl == 0x1B) return true; //The Forge
    }
    //if (current.lvl == 0x1B && old.bossHP != 0x00 && current.bossHP == 0x00) return true; //Demona
    if (current.lvl == 0x1B && old.bossHP == 0xF8 && current.bossHP == 0x00) return true; //Demona
    if (current.lvl == 0x1B && old.bossHP == 0x18 && current.bossHP == 0x00) return true; //Demona  
}
reset
{
    return (current.start == 0x00 && current.reset == 0x10);
}
startup
{
	refreshRate = 70;
	settings.Add("main", false, "AutoSplitter for Gargoyles Genesis by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
    settings.Add("options", true, "Options");
	settings.Add("All_levels", false, "Split by Screens", "options");
    settings.Add("levels", true, "Split by main Levels", "options");
}