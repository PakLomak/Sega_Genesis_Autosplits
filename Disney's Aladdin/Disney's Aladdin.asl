state ("Fusion") //RAM 0x00 == "Fusion.exe", 0x2A52D4, 0x00;
{
	byte start: 		"Fusion.exe", 0x2A52D4, 0x07264;
	byte start2:		"Fusion.exe", 0x2A52D4, 0x07265;
	byte sword:			"Fusion.exe", 0x2A52D4, 0x0729C;
	byte stage: 		"Fusion.exe", 0x2A52D4, 0x07E26;
	byte hp:			"Fusion.exe", 0x2A52D4, 0x07F06;
	byte end:			"Fusion.exe", 0x2A52D4, 0x0EFA6;
}
state("mednafen", "1.26.1") //RAM 0x00 == 0x17D3F80
{
	byte start: 		"mednafen.exe", 0x17DB1E4; //7264
	byte start2:		"mednafen.exe", 0x17DB1E5; //7265
	byte sword:			"mednafen.exe", 0x17DB21C; //729C
	byte stage:			"mednafen.exe", 0x17DBDA6; //7E26
	byte hp:			"mednafen.exe", 0x17DBE86; //7F06
	byte end:			"mednafen.exe", 0x17E2F26; //EFA6
}
state("mednafen", "0.9.48") //RAM 0x00 == 0x134BD40
{
	byte start: 		"mednafen.exe", 0x1352FA4; //7264
	byte start2:		"mednafen.exe", 0x1352FA5; //7265
	byte sword:			"mednafen.exe", 0x1352FDC; //729C
	byte stage:			"mednafen.exe", 0x1353B66; //7E26
	byte hp:			"mednafen.exe", 0x1353C46; //7F06
	byte end:			"mednafen.exe", 0x135ACE6; //EFA6
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
	return (current.start == 0x8E && current.start2 == 0xD2 && current.sword ==0x05 || current.start == 0x6B && current.start2 == 0xF8 && current.sword ==0x05);
}
split
{
	if (old.stage == 0x01 && current.stage == 0x03) return(true); //The Desert
	if (old.stage == 0x03 && current.stage == 0x00) return(true); //Agrabah Rooftops
	if (old.stage != 0x04 && current.stage == 0x04) return(true); //Sultan's Dungeon
	if (old.stage != 0x05 && current.stage == 0x05) return(true); //Cave of Wonders
	if (old.stage != 0x07 && current.stage == 0x07) return(true); //The Escape
	//if (old.stage != 0x08 && current.stage == 0x08) return(true); //Rug Ride
	if (old.stage != 0x09 && current.stage == 0x09) return(true); //Inside the Lamp
	if (old.stage != 0x0A && current.stage == 0x0A) return(true); //Sultan's Palace
	//if (old.stage != 0x0C && current.stage == 0x0C) return(true); //Iago Fjght
	if (old.stage != 0x0B && current.stage == 0x0B) return(true); //Jafar's Palace
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
}
