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
state("Retroarch", "1.16.0 BlastEm")
{
byte start: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xFFD7;
byte idlvl: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xFC44;
byte lvl: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xFC42;
byte done: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xA20F;
byte reset: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xF006;
byte time: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xFC3D;
byte Charter: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xEF3B;
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
    if (current.idlvl == 0x00 && old.start == 0x16 && current.start == 0xFF && vars.Start == true)
    {
        vars.Start = false;
        return true;
    }
}
split
{
    if (settings["Segment"] && current.idlvl == old.idlvl + 2) return true;
    if (settings["Levels"] && current.lvl == old.lvl + 2) return true;
    if (current.lvl == 0x00)
    {
        if (settings["Bar"] && old.idlvl == 0x06 && current.idlvl == 0x08) return true; //Street -> Bar
        if (settings["Barbon"] && old.idlvl == 0x0A && current.idlvl == 0x0C) return true; //Bar -> Barbon
    }
    if (current.lvl == 0x02)
    {
        if (settings["Truck"] && old.idlvl == 0x06 && current.idlvl == 0x08) return true; //Bridge -> Truck
        if (settings["Bridge"] && old.idlvl == 0x08 && current.idlvl == 0x0A) return true; //Truck -> Bridge
        if (settings["Jet"] && old.idlvl == 0x0A && current.idlvl == 0x0C) return true; //Bridge -> Jet
    }
    if (current.lvl == 0x04)
    {
        if (settings["Arcade Hall"] && old.idlvl == 0x00 && current.idlvl == 0x02) return true; //Amusement Park -> Arcade Hall
        if (settings["In the hold"] && old.idlvl == 0x02 && current.idlvl == 0x04) return true; //Arcade Hall -> In the hold
        if (settings["Pirates attraction"] && old.idlvl == 0x06 && current.idlvl == 0x08) return true; //In the hold -> Pirates attraction
        if (settings["Park"] && old.idlvl == 0x08 && current.idlvl == 0x0A) return true; //Pirates attraction -> Park
        if (settings["Alien House"] && old.idlvl == 0x0A && current.idlvl == 0x0C) return true; //Park -> Alien House
        if (settings["Zamza"] && old.idlvl == 0x0E && current.idlvl == 0x10) return true; //Alien House -> Zamza
    }
    if (current.lvl == 0x06)
    {
        if (settings["Stadium"] && old.idlvl == 0x02 && current.idlvl == 0x04) return true; //Ouside -> Stadium
        if (settings["Secter Elevator"] && old.idlvl == 0x08 && current.idlvl == 0x0A) return true; //Stadium -> Secter Elevator
        if (settings["Abadede"] && old.idlvl == 0x14 && current.idlvl == 0x16) return true; //Secter Elevator -> Abadede
    }
    if (current.lvl == 0x08)
    {
        if (settings["Ship bilge 2"] && old.idlvl == 0x02 && current.idlvl == 0x04) return true; //Ship bilge -> Ship bilge 2
        if (settings["Ship deck"] && old.idlvl == 0x04 && current.idlvl == 0x06) return true; //Ship bilge 2 -> Ship deck
        if (settings["R.Bear"] && old.idlvl == 0x08 && current.idlvl == 0x0A) return true; //Ship deck -> R.Bear
    }
    if (current.lvl == 0x0A)
    {
        if (settings["Jungle Base"] && old.idlvl == 0x02 && current.idlvl == 0x04) return true; //Beach -> Jungle Base
        if (settings["Jungle Base 2"] && old.idlvl == 0x04 && current.idlvl == 0x06) return true; //Jungle Base -> Jungle Base 2
        if (settings["Sother & Stealth"] && old.idlvl == 0x08 && current.idlvl == 0x0A) return true; //Jungle Base 2 -> Sother & Stealth
    }
    if (current.lvl == 0x0C)
    {
        if (settings["Munitions Plant 2"] && old.idlvl == 0x02 && current.idlvl == 0x04) return true; //Munitions Plant -> Munitions Plant 2
        if (settings["Cargo Elevator"] && old.idlvl == 0x04 && current.idlvl == 0x06) return true; //Munitions Plant 2 -> Cargo Elevator
        if (settings["Cargo Elevator 2"] && old.idlvl == 0x08 && current.idlvl == 0x0A) return true; //Cargo Elevator -> Cargo Elevator 2
        if (settings["Particle and Molecule"] && old.idlvl == 0x10 && current.idlvl == 0x12) return true; //Cargo Elevator 2 -> Particle and Molecule 
    }
    if (current.lvl == 0x0E)
    {
        if (settings["Uulture"] && old.idlvl == 0x00 && current.idlvl == 0x02) return true; //Syndicate Stronghold -> Uulture
        if (settings["Nail"] && old.idlvl == 0x02 && current.idlvl == 0x04) return true; //Uulture -> Nail
        if (settings["Z. Kusano"] && old.idlvl == 0x04 && current.idlvl == 0x06) return true; //Nail -> Z. Kusano
        if (settings["Shiva & Mr.X"] && old.idlvl == 0x08 && current.idlvl == 0x0A) return true; //Z. Kusano -> Shiva & Mr.X
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
    settings.Add("Levels", true, "Split by levels", "options");
    settings.Add("Segment", false, "Split by all segments", "options");
	settings.Add("STAGE 1", true, "STAGE 1");
    settings.Add("Bar", true, "Split Bar", "STAGE 1");
    settings.Add("Barbon", true, "Split Barbon", "STAGE 1");
    settings.Add("STAGE 2", true, "STAGE 2");
    settings.Add("Truck", true, "Split Truck", "STAGE 2");
    settings.Add("Bridge", true, "Split Bridge", "STAGE 2");
    settings.Add("Jet", true, "Split Jet", "STAGE 2");
    settings.Add("STAGE 3", true, "STAGE 3");
    settings.Add("Arcade Hall", true, "Split Arcade Hall", "STAGE 3");
    settings.Add("In the hold", true, "Split In the hold", "STAGE 3");
    settings.Add("Pirates attraction", true, "Split Pirates attraction", "STAGE 3");
    settings.Add("Park", true, "Split Park", "STAGE 3");
    settings.Add("Alien House", true, "Split Alien House", "STAGE 3");
    settings.Add("Zamza", true, "Split Zamza", "STAGE 3");
    settings.Add("STAGE 4", true, "STAGE 4");
    settings.Add("Stadium", true, "Split Stadium", "STAGE 4");
    settings.Add("Secter Elevator", true, "Split Secter Elevator", "STAGE 4");
    settings.Add("Abadede", true, "Split Abadede", "STAGE 4");
    settings.Add("STAGE 5", true, "STAGE 5");
    settings.Add("Ship bilge 2", true, "Split Ship bilge Room 2", "STAGE 5");
    settings.Add("Ship deck", true, "Split Ship deck", "STAGE 5");
    settings.Add("R.Bear", true, "Split R.Bear", "STAGE 5");
    settings.Add("STAGE 6", true, "STAGE 6");
    settings.Add("Jungle Base", true, "Split Jungle Base", "STAGE 6");
    settings.Add("Jungle Base 2", true, "Split Jungle Base Next Line", "STAGE 6");
    settings.Add("Sother & Stealth", true, "Split Sother & Stealth", "STAGE 6");
    settings.Add("STAGE 7", true, "STAGE 7");
    settings.Add("Munitions Plant 2", true, "Split Munitions Plant 2", "STAGE 7");
    settings.Add("Cargo Elevator", true, "Split Cargo Elevator", "STAGE 7");
    settings.Add("Cargo Elevator 2", true, "Split Cargo Elevator 2", "STAGE 7");
    settings.Add("Particle and Molecule", true, "Split Particle and Molecule", "STAGE 7");
    settings.Add("STAGE 8", true, "STAGE 8");
    settings.Add("Uulture", true, "Split Uulture", "STAGE 8");
    settings.Add("Nail", true, "Split Nail", "STAGE 8");
    settings.Add("Z. Kusano", true, "Split Z. Kusano", "STAGE 8");
    settings.Add("Shiva & Mr.X", true, "Split Shiva & Mr.X", "STAGE 8");
}