state("retroarch", "1.9.8") //RAM 0x00 == "blastem_libretro.dll", 0x173B18, 0x198, 0x00; Little endian!
{
    byte nullByte:              "blastem_libretro.dll", 0x173B18, 0x198, 0x0000;
    byte blockControll:         "blastem_libretro.dll", 0x173B18, 0x198, 0x0511;
    byte level:                 "blastem_libretro.dll", 0x173B18, 0x198, 0x012e;
    byte flagState:             "blastem_libretro.dll", 0x173B18, 0x198, 0x012a; //value = 0x18 endValue = 0x2C reset = 0x00
    byte manualEndLevel:        "blastem_libretro.dll", 0x173B18, 0x198, 0x12be; //value = 0x50
    byte timerEndLevel:         "blastem_libretro.dll", 0x173B18, 0x198, 0x1038;
    ushort flagAutoEndLevel:    "blastem_libretro.dll", 0x173B18, 0x198, 0x1004; //value = 0xFFFF
    ushort screenBright:        "blastem_libretro.dll", 0x173B18, 0x198, 0x1080; //value = 0xFFFF
    byte demo:                  "blastem_libretro.dll", 0x173B18, 0x198, 0x100a;
}
state("ralibretro") //RAM 0x00 == "genesis_plus_gx_libretro.dll", 0x00298720, 0x0; Little endian!
{
    byte nullByte:              "genesis_plus_gx_libretro.dll", 0x00298720, 0x0000;
    byte blockControll:         "genesis_plus_gx_libretro.dll", 0x00298720, 0x0511;
    byte level:                 "genesis_plus_gx_libretro.dll", 0x00298720, 0x012e;
    byte flagState:             "genesis_plus_gx_libretro.dll", 0x00298720, 0x012a; //value = 0x18 endValue = 0x2C reset = 0x00
    byte manualEndLevel:        "genesis_plus_gx_libretro.dll", 0x00298720, 0x12be; //value = 0x50
    byte timerEndLevel:         "genesis_plus_gx_libretro.dll", 0x00298720, 0x1038;
    ushort flagAutoEndLevel:    "genesis_plus_gx_libretro.dll", 0x00298720, 0x1004; //value = 0xFFFF
    ushort screenBright:        "genesis_plus_gx_libretro.dll", 0x00298720, 0x1080; //value = 0xFFFF
    byte demo:                  "genesis_plus_gx_libretro.dll", 0x00298720, 0x100a;
}
state ("Fusion") //RAM 0x00 == "Fusion.exe", 0x2A52D4, 0x00;
{
    byte nullByte:"Fusion.exe", 0x2A52D4, 0x0000;
    byte blockControll:"Fusion.exe", 0x2A52D4, 0x0511;
    byte level:"Fusion.exe", 0x2A52D4, 0x012e;
    byte flagState:"Fusion.exe", 0x2A52D4, 0x012a;
    byte manualEndLevel:"Fusion.exe", 0x2A52D4, 0x12be;
    byte timerEndLevel:"Fusion.exe", 0x2A52D4, 0x1038;
    ushort flagAutoEndLevel:"Fusion.exe", 0x2A52D4, 0x1004;
    ushort screenBright:"Fusion.exe", 0x2A52D4, 0x1080;
    byte demo:"Fusion.exe", 0x2A52D4, 0x100a;
}
state("mednafen", "1.27.1") //RAM 0x00 == 0x16EEB80
{
    byte nullByte:"mednafen.exe", 0x16EEB80;
    byte blockControll:"mednafen.exe", 0x16EF091;
    byte level:"mednafen.exe", 0x16EECAE;
    byte flagState:"mednafen.exe", 0x16EECAA;
    byte manualEndLevel:"mednafen.exe", 0x16EFE3E;
    byte timerEndLevel:"mednafen.exe", 0x16EFBB8;
    ushort flagAutoEndLevel:"mednafen.exe", 0x16EFB84;
    ushort screenBright:"mednafen.exe", 0x16EFC00;
    byte demo:"mednafen.exe", 0x16EFB8A;
}
state("mednafen", "0.9.48") //RAM 0x00 == 0x134BD40
{
    byte nullByte:"mednafen.exe", 0x134BD40;
    byte blockControll:"mednafen.exe", 0x134C251;
    byte level:"mednafen.exe", 0x134BE6E;
    byte flagState:"mednafen.exe", 0x134BE6A;
    byte manualEndLevel:"mednafen.exe", 0x134CFFE;
    byte timerEndLevel:"mednafen.exe", 0x134CD78;
    ushort flagAutoEndLevel:"mednafen.exe", 0x134CD44;
    ushort screenBright:"mednafen.exe", 0x134CDC0;
    byte demo:"mednafen.exe", 0x134CD4A;
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
    return current.demo != 0x01 && current.level == 0x00 && old.blockControll == 0x01 && current.blockControll == 0x00;
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