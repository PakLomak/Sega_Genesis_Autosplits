state("Fusion", "3.64")
{
byte screen_savers: "Fusion.exe", 0x2A52D4, 0x12F;
byte start: "Fusion.exe", 0x2A52D4, 0x11F;
byte LVL: "Fusion.exe", 0x2A52D4, 0xC45;
byte bomb_time: "Fusion.exe", 0x2A52D4, 0x2D9F;
byte Number_of_bombs: "Fusion.exe", 0x2A52D4, 0x2D9D;
byte Column: "Fusion.exe", 0x2A52D4, 0xA283;
byte bossHP1: "Fusion.exe", 0x2A52D4, 0x118A;
byte bossHP2: "Fusion.exe", 0x2A52D4, 0x1042;
byte bossHP3: "Fusion.exe", 0x2A52D4, 0xF9E;
}
state("Mednafen", "0.9.48")
{
byte screen_savers: "mednafen.exe", 0x134BE6F;
byte start: "mednafen.exe", 0x134BE5F;
byte LVL: "mednafen.exe", 0x134C985;
byte bomb_time: "mednafen.exe", 0x134EADF;
byte Number_of_bombs: "mednafen.exe", 0x134EADD;
byte Column: "mednafen.exe", 0x1355FC3;
byte bossHP1: "mednafen.exe", 0x134CECA;
byte bossHP2: "mednafen.exe", 0x134CD82;
byte bossHP3: "mednafen.exe", 0x134CCDE;
}
state("Mednafen", "1.27.1")
{
byte screen_savers: "mednafen.exe", 0x16EECAF;
byte start: "mednafen.exe", 0x16EEC9F;
byte LVL: "mednafen.exe", 0x16EF7C5;
byte bomb_time: "mednafen.exe", 0x16F191F;
byte Number_of_bombs: "mednafen.exe", 0x16F191D;
byte Column: "mednafen.exe", 0x16F8E03;
byte bossHP1: "mednafen.exe", 0x16EFD0A;
byte bossHP2: "mednafen.exe", 0x16EFBC2;
byte bossHP3: "mednafen.exe", 0x16EFB1E;
}
state("Mednafen", "1.29.0")
{
byte screen_savers: "mednafen.exe", 0x1644CAF;
byte start: "mednafen.exe", 0x1644C9F;
byte LVL: "mednafen.exe", 0x16457C5;
byte bomb_time: "mednafen.exe", 0x164791F;
byte Number_of_bombs: "mednafen.exe", 0x164791D;
byte Column: "mednafen.exe", 0x164EE03;
byte bossHP1: "mednafen.exe", 0x1645D0A;
byte bossHP2: "mednafen.exe", 0x1645BC2;
byte bossHP3: "mednafen.exe", 0x1645B1E;
}
state("Mednafen", "1.32.1")
{
byte screen_savers: "mednafen.exe", 0x168C16F;
byte start: "mednafen.exe", 0x168C15F;
byte LVL: "mednafen.exe", 0x168CC85;
byte bomb_time: "mednafen.exe", 0x168EDDF;
byte Number_of_bombs: "mednafen.exe", 0x168EDDD;
byte Column: "mednafen.exe", 0x16962C3;
byte bossHP1: "mednafen.exe", 0x168D1CA;
byte bossHP2: "mednafen.exe", 0x168D082;
byte bossHP3: "mednafen.exe", 0x168CFDE;
}
state("fcadefbneo", "2.1.45")
{
byte screen_savers: "fcadefbneo.exe", 0x06B82198, 0x12E;
byte start: "fcadefbneo.exe", 0x06B82198, 0x11E;
byte LVL: "fcadefbneo.exe", 0x06B82198, 0xC44;
byte bomb_time: "fcadefbneo.exe", 0x06B82198, 0x2D9E;
byte Number_of_bombs: "fcadefbneo.exe", 0x06B82198, 0x2D9C;
byte Column: "fcadefbneo.exe", 0x06B82198, 0xA282;
byte bossHP1: "fcadefbneo.exe", 0x06B82198, 0x118B;
byte bossHP2: "fcadefbneo.exe", 0x06B82198, 0x1043;
byte bossHP3: "fcadefbneo.exe", 0x06B82198, 0xF9F;
}
state("Retroarch", "PicoDrive")
{
byte screen_savers: "picodrive_libretro.dll", 0x001B3E50, 0x12E;
byte start: "picodrive_libretro.dll", 0x001B3E50, 0x11E;
byte LVL: "picodrive_libretro.dll", 0x001B3E50, 0xC44;
byte bomb_time: "picodrive_libretro.dll", 0x001B3E50, 0x2D9E;
byte Number_of_bombs: "picodrive_libretro.dll", 0x001B3E50, 0x2D9C;
byte Column: "picodrive_libretro.dll", 0x001B3E50, 0xA282;
byte bossHP1: "picodrive_libretro.dll", 0x001B3E50, 0x118B;
byte bossHP2: "picodrive_libretro.dll", 0x001B3E50, 0x1043;
byte bossHP3: "picodrive_libretro.dll", 0x001B3E50, 0xF9F;
}
state("emuhawk", "1.13.2")
{
byte screen_savers: "libgenplusgx.dll", 0x000062D8, 0x12E;
byte start: "libgenplusgx.dll", 0x000062D8, 0x11E;
byte LVL: "libgenplusgx.dll", 0x000062D8, 0xC44;
byte bomb_time: "libgenplusgx.dll", 0x000062D8, 0x2D9E;
byte Number_of_bombs: "libgenplusgx.dll", 0x000062D8, 0x2D9C;
byte Column: "libgenplusgx.dll", 0x000062D8, 0xA282;
byte bossHP1: "libgenplusgx.dll", 0x000062D8, 0x118B;
byte bossHP2: "libgenplusgx.dll", 0x000062D8, 0x1043;
byte bossHP3: "libgenplusgx.dll", 0x000062D8, 0xF9F;
}
/*update{
    print("Старт " + current.start.ToString("X2"));
    print("Column " + current.Column.ToString("X2"));
    print("bossHP1 " + current.bossHP1.ToString("X2"));
    print("bossHP2 " + current.bossHP2.ToString("X2"));
    print("bossHP3 " + current.bossHP3.ToString("X2"));
}*/
init
{
    vars.start = false;
    vars.SpLitON = false;
    vars.bossDEAD = false;
    vars.LastBoss = false;
int memSize = modules.First().ModuleMemorySize;
switch (memSize)
{
	case 92479488:
        print("Detected Mednafen 1.32.1");
        version = "1.32.1";
        break;
    case 91533312:
        print("Detected Mednafen 1.29.0");
        version = "1.29.0";
        break;
    case 93294592:
        print("Detected Mednafen 0.9.48");
        version = "0.9.48";
        break;
    case 4104192:
        print("Detected Kega Fusion 3.64");
        version = "3.64";
        break;
    default:
		print("Unknown Emulator");
		version = "";
		break;
}
}
start{
    if (old.screen_savers == 0x90 && current.screen_savers == 0x00 && current.LVL == 0x00) vars.start = true;
    if (current.LVL <= 0x05 && old.start == 0x03 && current.start == 0x00 && vars.start == true && current.bomb_time == 0x00){
        vars.start = false;
        vars.SpLitON = false;
        vars.LastBoss = false;
        vars.bossDEAD = false;
        return true;
    }
}
reset{
    if (old.screen_savers == 0x00 && current.screen_savers == 0x90 && current.LVL == 0x00){
        vars.start = false;
        vars.SpLitON = false;
        vars.bossDEAD = false;
        vars.LastBoss = false;
        return true;
    }
}
split{
    if (old.Number_of_bombs == 0x01 && current.Number_of_bombs == 0x00) vars.SpLitON = true;
    if (settings["LVL"]){
    if (old.start == 0x00 && current.start == 0x03 && current.bomb_time != 0x00) {
        vars.SpLitON = false;
        return true;
    }
    if (settings["Boss"]){
    if (current.bomb_time == 0x10 && old.start == 0x0E && current.start == 0xFF) return true;
    if (current.bomb_time == 0x10 && old.start == 0x18 && current.start == 0xFF) return true;
    if (current.bomb_time == 0x10 && old.start == 0x1A && current.start == 0xFF) return true;
    }
    }
    if (settings["Column"]){
    if (old.Column == 0x02 && current.Column == 0x03 && vars.SpLitON == true ||
        old.Column == 0x02 && current.Column == 0x04 && vars.SpLitON == true){
        vars.SpLitON = false;
        return true;
    }
    if (settings["AterBoss"]){
        if (current.bossHP1 == 0xFF && current.bossHP2 == 0xFF) vars.bossDEAD = true;
        if (old.start == 0x00 && current.start == 0x03 && current.bomb_time != 0x00 && vars.bossDEAD == true) {
        vars.SpLitON = false;
        vars.bossDEAD = false;
        return true;
    }}
    }//split on colum
    if (settings["Bomb"] && current.Number_of_bombs == old.Number_of_bombs - 1 && current.start == 0xFF) return true;//split bomb
    if (current.bossHP1 == 0x0A && current.bossHP2 == 0x0A && current.bossHP3 == 0x0A && current.bomb_time == 0x10 && current.start == 0xFF) vars.LastBoss = true;
    if (current.bossHP1 == 0xFF && current.bossHP2 == 0xFF && current.bossHP3 == 0xFF && vars.LastBoss == true){
        vars.LastBoss = false;
        return true;
    }
}
startup
{
	settings.Add("main", false, "AutoSplitter for Daffy Duck in Hollywood (E) (M5) by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
	settings.Add("options", true, "Options");
	settings.Add("LVL", false, "Split by Level", "options");
    settings.Add("Boss", false, "Before Boss", "LVL");
    settings.Add("Column", false, "Split by Column and Floor", "options");
    settings.Add("AterBoss", false, "After Boss", "Column");
    settings.Add("Bomb", false, "Split by Grab the bomb", "options");
}