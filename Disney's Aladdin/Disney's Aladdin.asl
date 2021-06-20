state ("Fusion") //RAM 0x00 == "Fusion.exe", 0x2A52D4, 0x00;
{
	byte start: 		"Fusion.exe", 0x2A52D4, 0x07264;
	byte start2:		"Fusion.exe", 0x2A52D4, 0x07265;
	byte sword:		"Fusion.exe", 0x2A52D4, 0x0729C;
	byte stage: 		"Fusion.exe", 0x2A52D4, 0x07E26;
	byte hp:		"Fusion.exe", 0x2A52D4, 0x07F06;
	byte end:		"Fusion.exe", 0x2A52D4, 0x0EFA6;
	byte demoTimer:		"Fusion.exe", 0x2A52D4, 0x0F13E;
	byte demoTimer2:	"Fusion.exe", 0x2A52D4, 0x0F13F;
}
state("mednafen", "1.26.1") //RAM 0x00 == 0x17D3F80
{
	byte start: 		"mednafen.exe", 0x17DB1E4; //7264
	byte start2:		"mednafen.exe", 0x17DB1E5; //7265
	byte sword:		"mednafen.exe", 0x17DB21C; //729C
	byte stage:		"mednafen.exe", 0x17DBDA6; //7E26
	byte hp:		"mednafen.exe", 0x17DBE86; //7F06
	byte end:		"mednafen.exe", 0x17E2F26; //EFA6
	byte demoTimer:		"mednafen.exe", 0x17E30BE; //F13E
	byte demoTimer2:	"mednafen.exe", 0x17E30BF; //F13F
	
}
state("mednafen", "0.9.48") //RAM 0x00 == 0x134BD40
{
	byte start: 		"mednafen.exe", 0x1352FA4; //7264
	byte start2:		"mednafen.exe", 0x1352FA5; //7265
	byte sword:		"mednafen.exe", 0x1352FDC; //729C
	byte stage:		"mednafen.exe", 0x1353B66; //7E26
	byte hp:		"mednafen.exe", 0x1353C46; //7F06
	byte end:		"mednafen.exe", 0x135ACE6; //EFA6
	byte demoTimer:		"mednafen.exe", 0x135AE7E; //F13E
	byte demoTimer2:	"mednafen.exe", 0x135AE7F; //F13F
}
init
{
    if (modules.First().ModuleMemorySize == 99102720)
        version = "1.26.1";
    else if (modules.First().ModuleMemorySize == 93294592)
        version = "0.9.48";
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
