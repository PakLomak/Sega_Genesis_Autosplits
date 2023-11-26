state("Fusion", "3.64")
{
byte start: "Fusion.exe", 0x2A52D4, 0xFFD6;
byte idlvl: "Fusion.exe", 0x2A52D4, 0xFC45;
byte lvl: "Fusion.exe", 0x2A52D4, 0xFC43;
byte done: "Fusion.exe", 0x2A52D4, 0xA20E;
byte reset: "Fusion.exe", 0x2A52D4, 0xF007;
byte time: "Fusion.exe", 0x2A52D4, 0xFC3C;
byte Charter: "Fusion.exe", 0x2A52D4, 0xEF3A;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x135BD16;
byte idlvl: "mednafen.exe", 0x135B985;
byte lvl: "mednafen.exe", 0x135B983;
byte done: "mednafen.exe", 0x1355F4E;
byte reset: "mednafen.exe", 0x135AD47;
byte time: "mednafen.exe", 0x135B97C;
byte Charter: "mednafen.exe", 0x135AC7A;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x1654B56;
byte idlvl: "mednafen.exe", 0x16547C5;
byte lvl: "mednafen.exe", 0x16547C3;
byte done: "mednafen.exe", 0x164ED8E;
byte reset: "mednafen.exe", 0x1653B87;
byte time: "mednafen.exe", 0x16547BC;
byte Charter: "mednafen.exe", 0x1653ABA;
}
state("Retroarch", "1.16.0 GX")
{
byte start: "genesis_plus_gx_libretro.dll", 0x07118A0, 0xFFD7;
byte idlvl: "genesis_plus_gx_libretro.dll", 0x07118A0, 0xFC44;
byte lvl: "genesis_plus_gx_libretro.dll", 0x07118A0, 0xFC42;
byte done: "genesis_plus_gx_libretro.dll", 0x07118A0, 0xA20F;
byte reset: "genesis_plus_gx_libretro.dll", 0x07118A0, 0xF006;
byte time: "genesis_plus_gx_libretro.dll", 0x07118A0, 0xFC3D;
byte Charter: "genesis_plus_gx_libretro.dll", 0x07118A0, 0xEF3B;
}
state("emuhawk", "1.13.2")
{
byte start: "libgenplusgx.dll", 0x000062D8, 0xFFD7;
byte idlvl: "libgenplusgx.dll", 0x000062D8, 0xFC44;
byte lvl: "libgenplusgx.dll", 0x000062D8, 0xFC42;
byte done: "libgenplusgx.dll", 0x000062D8, 0xA20F;
byte reset: "libgenplusgx.dll", 0x000062D8, 0xF006;
byte time: "libgenplusgx.dll", 0x000062D8, 0xFC3D;
byte Charter: "libgenplusgx.dll", 0x000062D8, 0xEF3B;
}

init
{
int memSize = modules.First().ModuleMemorySize;
switch (memSize)
{
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
start
{
    //if (current.time == 0x99 && current.idlvl == 0x00) vars.Start = true;
    if (old.Charter == 0x00 && current.Charter == 0xFF) vars.Start = true;
    if (old.start == 0x16 && current.start == 0xFF && vars.Start == true)
    {
        vars.Start = false;
        return true;
    }
}
split
{
    if (current.lvl == old.lvl + 2) return true;
    if (settings["Rooms"])
    {
    if (current.lvl == 0x00 || current.lvl == 0x02 || current.lvl == 0x04)
    {
        if (old.idlvl == 0x06 && current.idlvl == 0x08) return true;
        if (old.idlvl == 0x0A && current.idlvl == 0x0C) return true;
    }
    if (current.lvl == 0x04 && old.idlvl == 0x0E && current.idlvl == 0x10) return true; // Alien House -> Zamza
    if (current.lvl == 0x04 || current.lvl == 0x06 || current.lvl == 0x08 || current.lvl == 0x0A || current.lvl == 0x0E)
    {
        if (old.idlvl == 0x08 && current.idlvl == 0x0A) return true;
        if (old.idlvl == 0x14 && current.idlvl == 0x16) return true;
    }
    if (current.lvl == 0x08 || current.lvl == 0x0C)
    {
        if (old.idlvl == 0x04 && current.idlvl == 0x06) return true;
    }
    if (current.lvl == 0x0C && old.idlvl == 0x10 && current.idlvl == 0x12) return true;
    if (current.lvl == 0x0E && old.idlvl == 0x00 && current.idlvl == 0x02) return true;
    }
    if (current.lvl == 0x0E && old.done == 0x00 && current.done == 0xE0) return true;
}
reset
{
    return (current.reset == 0x00 && current.idlvl == 0x00 && current.lvl == 0x00);
}
startup
{
	refreshRate = 70;
	settings.Add("main", false, "AutoSplitter for Streets of Rage 2 by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
    settings.Add("options", true, "Options");
	settings.Add("Rooms", true, "Split by Division of locations", "options");
}
