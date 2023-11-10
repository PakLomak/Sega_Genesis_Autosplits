state("Fusion", "3.64")
{
byte start: "Fusion.exe", 0x2A52D4, 0x7264;
byte start2: "Fusion.exe", 0x2A52D4, 0x7265;
byte sword: "Fusion.exe", 0x2A52D4, 0x729C;
byte stage: "Fusion.exe", 0x2A52D4, 0x7E26;
byte hp: "Fusion.exe", 0x2A52D4, 0x7F06;
byte end: "Fusion.exe", 0x2A52D4, 0xEFA6;
byte demoTimer: "Fusion.exe", 0x2A52D4, 0xF13E;
byte demoTimer2: "Fusion.exe", 0x2A52D4, 0xF13F;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x1352FA4;
byte start2: "mednafen.exe", 0x1352FA5;
byte sword: "mednafen.exe", 0x1352FDC;
byte stage: "mednafen.exe", 0x1353B66;
byte hp: "mednafen.exe", 0x1353C46;
byte end: "mednafen.exe", 0x135ACE6;
byte demoTimer: "mednafen.exe", 0x135AE7E;
byte demoTimer2: "mednafen.exe", 0x135AE7F;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x164BDE4;
byte start2: "mednafen.exe", 0x164BDE5;
byte sword: "mednafen.exe", 0x164BE1C;
byte stage: "mednafen.exe", 0x164C9A6;
byte hp: "mednafen.exe", 0x164CA86;
byte end: "mednafen.exe", 0x1653B26;
byte demoTimer: "mednafen.exe", 0x1653CBE;
byte demoTimer2: "mednafen.exe", 0x1653CBF;
}
state("Retroarch", "1.16.0 BlastEm")
{
byte start: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0x7265;
byte start2: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0x7264;
byte sword: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0x729D;
byte stage: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0x7E27;
byte hp: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0x7F07;
byte end: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xEFA7;
byte demoTimer: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xF13F;
byte demoTimer2: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xF13E;
}
state("emuhawk", "1.13.2")
{
byte start: "libgenplusgx.dll", 0x000062D8, 0x7265;
byte start2: "libgenplusgx.dll", 0x000062D8, 0x7264;
byte sword: "libgenplusgx.dll", 0x000062D8, 0x729D;
byte stage: "libgenplusgx.dll", 0x000062D8, 0x7E27;
byte hp: "libgenplusgx.dll", 0x000062D8, 0x7F07;
byte end: "libgenplusgx.dll", 0x000062D8, 0xEFA7;
byte demoTimer: "libgenplusgx.dll", 0x000062D8, 0xF13F;
byte demoTimer2: "libgenplusgx.dll", 0x000062D8, 0xF13E;
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
	return (current.start == 0x8E && current.start2 == 0xD2 && current.sword ==0x05 || current.start == 0x6B && current.start2 == 0xF8 && current.sword ==0x05) && (current.demoTimer != 0x00 || current.demoTimer2 != 0x00);
}
split
{
	if (settings["The_Desert"] && old.stage == 0x01 && current.stage == 0x03) return(true); //The Desert
	if (settings["Agrabah_Rooftops"] && old.stage == 0x03 && current.stage == 0x00) return(true); //Agrabah Rooftops
	if (settings["Sultan's_Dungeon"] && old.stage != 0x04 && current.stage == 0x04) return(true); //Sultan's Dungeon
	if (settings["Cave_of_Wonders"] && old.stage != 0x05 && current.stage == 0x05) return(true); //Cave of Wonders
	if (settings["The_Escape"] && old.stage != 0x07 && current.stage == 0x07) return(true); //The Escape
	if (settings["Rug_Ride"] && old.stage != 0x08 && current.stage == 0x08) return(true); //Rug Ride
	if (settings["Inside_the_Lamp"] && old.stage != 0x09 && current.stage == 0x09) return(true); //Inside the Lamp
	if (settings["Sultan's_Palace"] && old.stage != 0x0A && current.stage == 0x0A) return(true); //Sultan's Palace
	if (settings["Iago_Fjght"] && old.stage != 0x0C && current.stage == 0x0C) return(true); //Iago Fjght
	if (settings["Jafar's_Palace"] && old.stage != 0x0B && current.stage == 0x0B) return(true); //Jafar's Palace
	if (current.stage == 0x0B && current.end == 0xFF && old.end != 0xFF && old.hp == 0x84 && current.hp == 0x00) return(true);
}
reset
{
	return (current.start == 0x96 && current.start2 == 0xB2 || current.start == 0x73 && current.start2 == 0xD8);
}
startup
{
	refreshRate = 70;
	settings.Add("main", false, "AutoSplitter for Disney's Aladdin Genesis by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
	settings.Add("options", true, "Options");
	settings.Add("The_Desert", true, "The Desert", "options");
	settings.Add("Agrabah_Rooftops", true, "Agrabah Rooftops", "options");
	settings.Add("Sultan's_Dungeon", true, "Sultan's Dungeon", "options");
	settings.Add("Cave_of_Wonders", true, "Cave of Wonders", "options");
	settings.Add("The_Escape", true, "The Escape", "options");
	settings.Add("Rug_Ride", false, "Rug Ride", "options");
	settings.Add("Inside_the_Lamp", true, "Inside the Lamp", "options");
	settings.Add("Sultan's_Palace", true, "Sultan's Palace", "options");
	settings.Add("Iago_Fjght", false, "Iago Fjght", "options");
	settings.Add("Jafar's_Palace", true, "Jafar's Palace", "options");
}
