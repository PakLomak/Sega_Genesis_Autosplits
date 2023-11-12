state("Fusion", "3.64")
{
byte Level: "Fusion.exe", 0x2A52D4, 0xFD4B;
byte start: "Fusion.exe", 0x2A52D4, 0xFEF9;
byte MenuBar:"Fusion.exe", 0x2A52D4, 0xF807;
byte Sega:"Fusion.exe", 0x2A52D4, 0xF022;
byte Sega_2:"Fusion.exe", 0x2A52D4, 0xF023;
byte BossHP:"Fusion.exe", 0x2A52D4, 0xF881;
}
init
{
    vars.menu = false;
}
start
{
    if (current.Sega == 0x6A && current.Sega_2 == 0x2B) vars.menu = true;
    if (current.MenuBar == 0x00 && old.start == 0x00 && current.start == 0x01)
    {
        vars.menu = false;
        return true;
    }
}
split
{
    if (settings["All"] && current.Level == old.Level + 1) return true;
    if (settings["Stage"])
    {
    if (old.Level == 0x05 && current.Level == 0x06)return true; // Jabao 
    if (old.Level == 0x06 && current.Level == 0x07)return true; // Magic Kingdom 
    if (old.Level == 0x0D && current.Level == 0x0F)return true; // Mikotaka
    if (old.Level == 0x0F && current.Level == 0x10)return true; // Magic Kingdom
    if (old.Level == 0x12 && current.Level == 0x13)return true; // Picture Book Forest
    if (old.Level == 0x16 && current.Level == 0x18)return true; // Picture Book Sky
    if (old.Level == 0x19 && current.Level == 0x1C)return true; // Picture Book Mountain
    if (old.Level == 0x1D && current.Level == 0x1F)return true; // Dowahha
    if (old.Level == 0x1F && current.Level == 0x20)return true; // Highway
    if (old.Level == 0x22 && current.Level == 0x23)return true; // Castle
    if (old.Level == 0x42 && current.Level == 0x43)return true; // Castle
    }
    if (current.Level == 0x43 && old.BossHP == 0x02 && current.BossHP == 0x81 || current.Level == 0x43 && old.BossHP == 0x81 && current.BossHP == 0x01) return true;
}
reset
{
    if (current.start == 0x00 && current.Sega == 0x6C && current.Sega_2 == 0x23) return true;
}
startup
{
	settings.Add("main", false, "AutoSplitter for Magical Taruruuto-Kun by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
    settings.Add("All", true, "Split by all screen", "options");
    settings.Add("Stage", false, "Split by Stages & Bosses", "options");
}
