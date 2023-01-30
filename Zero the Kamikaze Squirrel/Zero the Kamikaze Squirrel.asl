state("Retroarch", "1.9.12 BlastEm")
{
byte nullByte: "blastem_libretro.dll", 0x172B18, 0x198, 0x1;
byte start: "blastem_libretro.dll", 0x172B18, 0x198, 0x115B;
byte menu: "blastem_libretro.dll", 0x172B18, 0x198, 0x12A;
byte blockControll: "blastem_libretro.dll", 0x172B18, 0x198, 0x511;
byte level: "blastem_libretro.dll", 0x172B18, 0x198, 0x12E;
byte flagState: "blastem_libretro.dll", 0x172B18, 0x198, 0x12A;
byte manualEndLevel: "blastem_libretro.dll", 0x172B18, 0x198, 0x12BE;
byte timerEndLevel: "blastem_libretro.dll", 0x172B18, 0x198, 0x1038;
ushort flagAutoEndLevel: "blastem_libretro.dll", 0x172B18, 0x198, 0x1004;
ushort screenBright: "blastem_libretro.dll", 0x172B18, 0x198, 0x1080;
byte demo: "blastem_libretro.dll", 0x172B18, 0x198, 0x100A;
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
byte menu: "Fusion.exe", 0x2A52D4, 0x12B;
byte blockControll: "Fusion.exe", 0x2A52D4, 0x510;
byte level: "Fusion.exe", 0x2A52D4, 0x12F;
byte flagState: "Fusion.exe", 0x2A52D4, 0x12B;
byte manualEndLevel: "Fusion.exe", 0x2A52D4, 0x12BF;
byte timerEndLevel: "Fusion.exe", 0x2A52D4, 0x1039;
ushort flagAutoEndLevel: "Fusion.exe", 0x2A52D4, 0x1005;
ushort screenBright: "Fusion.exe", 0x2A52D4, 0x1081;
byte demo: "Fusion.exe", 0x2A52D4, 0x100B;
}
state("Mednafen", "0.9.48")
{
byte nullByte: "mednafen.exe", 0x134BD40;
byte start: "mednafen.exe", 0x134CE9A;
byte menu: "mednafen.exe", 0x134BE6B;
byte blockControll: "mednafen.exe", 0x134C250;
byte level: "mednafen.exe", 0x134BE6F;
byte flagState: "mednafen.exe", 0x134BE6B;
byte manualEndLevel: "mednafen.exe", 0x134CFFF;
byte timerEndLevel: "mednafen.exe", 0x134CD79;
ushort flagAutoEndLevel: "mednafen.exe", 0x134CD45;
ushort screenBright: "mednafen.exe", 0x134CDC1;
byte demo: "mednafen.exe", 0x134CD4B;
}
state("Mednafen", "1.29.0")
{
byte nullByte: "mednafen.exe", 0x1644B80;
byte start: "mednafen.exe", 0x1645CDA;
byte menu: "mednafen.exe", 0x1644CAB;
byte blockControll: "mednafen.exe", 0x1645090;
byte level: "mednafen.exe", 0x1644CAF;
byte flagState: "mednafen.exe", 0x1644CAB;
byte manualEndLevel: "mednafen.exe", 0x1645E3F;
byte timerEndLevel: "mednafen.exe", 0x1645BB9;
ushort flagAutoEndLevel: "mednafen.exe", 0x1645B85;
ushort screenBright: "mednafen.exe", 0x1645C01;
byte demo: "mednafen.exe", 0x1645B8B;
}
start
{
    //return current.demo != 0x01 && current.level == 0x00 && old.blockControll == 0x01 && current.blockControll == 0x00;
    return current.demo != 0x01 && current.level == 0x00 && current.menu == 0x10 && old.start == 0x08 && current.start == 0x00;
}
split
{
    if (current.demo == 0x01)
        return false;
    if (old.level == 0x12)
        return current.level == 0x13;
    if (current.level == 0x15)
        return current.flagState == 0x2C && current.screenBright == 0xFFFF && old.screenBright != 0xFFFF;
    return current.flagState == 0x18 && (current.manualEndLevel == 0x50 && old.manualEndLevel != 0x50 || current.timerEndLevel == 0x00 && old.timerEndLevel != 0x00 && current.flagAutoEndLevel == 0xFFFF);
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
}
init
{
     if (modules.First().ModuleMemorySize == 93294592)
        version = "0.9.48";
    else if (modules.First().ModuleMemorySize == 91533312)  
        version = "1.29.0";
}