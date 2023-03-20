state("Retroarch", "1.14.0 BlastEm")
{
byte nullByte: "blastem_libretro.dll", 0x172B18, 0x198, 0x1;
byte start: "blastem_libretro.dll", 0x172B18, 0x198, 0x115B;
byte start2: "blastem_libretro.dll", 0x172B18, 0x198, 0x1159;
byte menu: "blastem_libretro.dll", 0x172B18, 0x198, 0x12A;
byte blockControll: "blastem_libretro.dll", 0x172B18, 0x198, 0x511;
byte level: "blastem_libretro.dll", 0x172B18, 0x198, 0x12E;
byte flagState: "blastem_libretro.dll", 0x172B18, 0x198, 0x12A;
byte manualEndLevel: "blastem_libretro.dll", 0x172B18, 0x198, 0x12BE;
byte timerEndLevel: "blastem_libretro.dll", 0x172B18, 0x198, 0x1038;
byte flagAutoEndLevel: "blastem_libretro.dll", 0x172B18, 0x198, 0x1081;
byte screenBright: "blastem_libretro.dll", 0x172B18, 0x198, 0x8DD2;
byte demo: "blastem_libretro.dll", 0x172B18, 0x198, 0x100A;
byte end: "blastem_libretro.dll", 0x172B18, 0x198, 0x1105;
}
state("ralibretro") //RAM 0x00 == "genesis_plus_gx_libretro.dll", 0x00298720, 0x0; Little endian!
{
    byte nullByte:              "genesis_plus_gx_libretro.dll", 0x00298720, 0x0000;
    byte start:                 "genesis_plus_gx_libretro.dll", 0x00298720, 0xFFCB;
    byte menu:                  "genesis_plus_gx_libretro.dll", 0x00298720, 0x00EC;
    byte blockControll:         "genesis_plus_gx_libretro.dll", 0x00298720, 0x0511;
    byte level:                 "genesis_plus_gx_libretro.dll", 0x00298720, 0x012e;
    byte flagState:             "genesis_plus_gx_libretro.dll", 0x00298720, 0x012a; //value = 0x18 endValue = 0x2C reset = 0x00
    byte manualEndLevel:        "genesis_plus_gx_libretro.dll", 0x00298720, 0x12be; //value = 0x50
    byte timerEndLevel:         "genesis_plus_gx_libretro.dll", 0x00298720, 0x1038;
    ushort flagAutoEndLevel:    "genesis_plus_gx_libretro.dll", 0x00298720, 0x1004; //value = 0xFFFF
    ushort screenBright:        "genesis_plus_gx_libretro.dll", 0x00298720, 0x1080; //value = 0xFFFF
    byte demo:                  "genesis_plus_gx_libretro.dll", 0x00298720, 0x100a;
}
state("Fusion", "3.64")
{
byte nullByte: "Fusion.exe", 0x2A52D4, 0x0;
byte start: "Fusion.exe", 0x2A52D4, 0x115A;
byte start2: "Fusion.exe", 0x2A52D4, 0x1158;
byte menu: "Fusion.exe", 0x2A52D4, 0x12B;
byte blockControll: "Fusion.exe", 0x2A52D4, 0x510;
byte level: "Fusion.exe", 0x2A52D4, 0x12F;
byte flagState: "Fusion.exe", 0x2A52D4, 0x12B;
byte manualEndLevel: "Fusion.exe", 0x2A52D4, 0x12BF;
byte timerEndLevel: "Fusion.exe", 0x2A52D4, 0x1039;
byte flagAutoEndLevel: "Fusion.exe", 0x2A52D4, 0x1080;
byte screenBright: "Fusion.exe", 0x2A52D4, 0x8DD3;
byte demo: "Fusion.exe", 0x2A52D4, 0x100B;
byte end: "Fusion.exe", 0x2A52D4, 0x1104;
}
state("Mednafen", "0.9.48")
{
byte nullByte: "mednafen.exe", 0x134BD40;
byte start: "mednafen.exe", 0x134CE9A;
byte start2: "mednafen.exe", 0x134CE98;
byte menu: "mednafen.exe", 0x134BE6B;
byte blockControll: "mednafen.exe", 0x134C250;
byte level: "mednafen.exe", 0x134BE6F;
byte flagState: "mednafen.exe", 0x134BE6B;
byte manualEndLevel: "mednafen.exe", 0x134CFFF;
byte timerEndLevel: "mednafen.exe", 0x134CD79;
byte flagAutoEndLevel: "mednafen.exe", 0x134CDC0;
byte screenBright: "mednafen.exe", 0x1354B13;
byte demo: "mednafen.exe", 0x134CD4B;
byte end: "mednafen.exe", 0x134CE44;
}
state("Mednafen", "1.29.0")
{
byte nullByte: "mednafen.exe", 0x1644B80;
byte start: "mednafen.exe", 0x1645CDA;
byte start2: "mednafen.exe", 0x1645CD8;
byte menu: "mednafen.exe", 0x1644CAB;
byte blockControll: "mednafen.exe", 0x1645090;
byte level: "mednafen.exe", 0x1644CAF;
byte flagState: "mednafen.exe", 0x1644CAB;
byte manualEndLevel: "mednafen.exe", 0x1645E3F;
byte timerEndLevel: "mednafen.exe", 0x1645BB9;
byte flagAutoEndLevel: "mednafen.exe", 0x1645C00;
byte screenBright: "mednafen.exe", 0x164D953;
byte demo: "mednafen.exe", 0x1645B8B;
byte end: "mednafen.exe", 0x1645C84;
}
state("emuhawk", "1.13.2")
{
byte nullByte: "libgenplusgx.dll", 0x000062D8, 0x1;
byte start: "libgenplusgx.dll", 0x000062D8, 0x115B;
byte start2: "libgenplusgx.dll", 0x000062D8, 0x1159;
byte menu: "libgenplusgx.dll", 0x000062D8, 0x12A;
byte blockControll: "libgenplusgx.dll", 0x000062D8, 0x511;
byte level: "libgenplusgx.dll", 0x000062D8, 0x12E;
byte flagState: "libgenplusgx.dll", 0x000062D8, 0x12A;
byte manualEndLevel: "libgenplusgx.dll", 0x000062D8, 0x12BE;
byte timerEndLevel: "libgenplusgx.dll", 0x000062D8, 0x1038;
byte flagAutoEndLevel: "libgenplusgx.dll", 0x000062D8, 0x1081;
byte screenBright: "libgenplusgx.dll", 0x000062D8, 0x8DD2;
byte demo: "libgenplusgx.dll", 0x000062D8, 0x100A;
byte end: "libgenplusgx.dll", 0x000062D8, 0x1105;
}
start
{
    //return current.demo != 0x01 && current.level == 0x00 && old.blockControll == 0x01 && current.blockControll == 0x00;
    if (current.demo != 0x01 && current.menu == 0x10)
    {
        if (old.start == 0x08 && current.start == 0x00)return true;
        else if (old.start2 == 0x04 && current.start2 == 0x00)return true;
    }
}
split
{
    /*if (current.demo == 0x01)
        return false;
    if (old.level == 0x12)
        return current.level == 0x13;*/
    if (settings["flag"] && current.level != 0x03 && current.level != 0x06 && current.level != 0x0A && current.level != 0x0D && current.level != 0x10 && current.level != 0x08 && current.level != 0x12) 
    {
        if (current.level == old.level + 1) return true;
    }
    if (settings["Level"])
    {
        if (old.level == 0x01 && current.level == 0x02) return true;
        if (old.level == 0x04 && current.level == 0x05) return true;
        if (old.level == 0x08 && current.level == 0x09) return true;
        if (old.level == 0x0B && current.level == 0x0C) return true;
        if (old.level == 0x0E && current.level == 0x0F) return true;
        if (old.level == 0x10 && current.level == 0x11) return true;
        if (old.level == 0x13 && current.level == 0x14) return true;
        if (old.level == 0x14 && current.level == 0x15) return true;
    }
    if (current.level == 0x15 && current.flagState == 0x2C && current.screenBright == 0xFF && old.end == 0x00 && current.end >= 0x01) return true;
}
reset
{
    return current.flagState == 0x00;
}
startup
{
	refreshRate = 70;
	settings.Add("main", false, "AutoSplitter for Zero the Kamikaze Squirrel by Xanders08");
	settings.Add("main3", false, "--https://www.twitch.tv/Xanders08", "main");
    settings.Add("options", true, "Options");
	settings.Add("flag", true, "Split by after Flag", "options");
	settings.Add("Level", false, "Split by Level", "options");
}
init
{
     if (modules.First().ModuleMemorySize == 93294592)
        version = "0.9.48";
    else if (modules.First().ModuleMemorySize == 91533312)  
        version = "1.29.0";
}