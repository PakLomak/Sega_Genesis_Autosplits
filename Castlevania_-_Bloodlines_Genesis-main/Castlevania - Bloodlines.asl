state ("Fusion") //RAM 0x00 == "Fusion.exe", 0x2A52D4, 0x00;
{
	byte move: 			"Fusion.exe", 0x2A52D4, 0x090D1;
	byte stage:			"Fusion.exe", 0x2A52D4, 0x0FB2B;
	byte orb:			"Fusion.exe", 0x2A52D4, 0x0BCD3;
}
state("mednafen", "1.26.1") //RAM 0x00 == 0x17D3F80
{
	byte move: 			"mednafen.exe", 0x17DD051; //90D1
	byte stage:			"mednafen.exe", 0x17E3AAB; //FB2B
	byte orb:			"mednafen.exe", 0x17DFC53; //BCD3
}
state("mednafen", "0.9.48") //RAM 0x00 == 0x134BD40
{
	byte move: 			"mednafen.exe", 0x1354E11; //90D1
	byte stage:			"mednafen.exe", 0x135B86B; //FB2B
	byte orb:			"mednafen.exe", 0x1357A13; //BCD3
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
	return (old.move == 0x03 && current.move == 0x04);
}
split
{
	if (settings["Cerberus"] && old.stage == 0x07 && current.stage == 0x08) return(true); //Cerberus
	if (settings["Armor"] && current.stage == 0x0D && old.orb != 0x0B && current.orb == 0x0B) return(true); //Armor
	if (settings["3_Bosses_WHG"] && old.stage == 0x13 && current.stage == 0x15) return(true); //Wizard
	if (settings["Golem"] && current.stage == 0x18 && old.orb != 0x0B && current.orb == 0x0B) return(true); //Golem
	if (settings["Snake_Dragon"] && old.stage == 0x40 && current.stage == 0x1C) return(true); //Snake Dragon
	if (settings["Gargoyle"] && current.stage == 0x1D && old.orb != 0x0B && current.orb == 0x0B) return(true); //Gargoyle
	if (settings["Frankenstein"] && old.stage == 0x48 && current.stage == 0x35) return(true); //Frankenstein
	if (settings["Gear_Steamer"] && current.stage == 0x2E && old.orb != 0x0B && current.orb == 0x0B) return(true); //Gear Steamer
	if (settings["Talos"] && old.stage == 0x47 && current.stage == 0x3E) return(true); //Talos
	if (settings["Princess_of_Moss"] && current.stage == 0x3F && old.orb != 0x0B && current.orb == 0x0B) return(true); //Princess of Moss 
	if (settings["Death"] && old.stage == 0x4C && current.stage == 0x28) return(true); //Death
	if (settings["Elizabeth_Bartley"] && old.stage == 0x25 && current.stage == 0x4D) return(true); //Elizabeth Bartley
	if (settings["Dracula"] && current.stage == 0x30 && old.orb != 0x0B && current.orb == 0x0B) return(true); //Dracula
}
startup
{
	settings.Add("main", false, "AutoSplitter for Castlevanid - Bloodlines by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
	settings.Add("options", true, "Options");
	settings.Add("Cerberus", false, "Cerberus", "options");
	settings.Add("Armor", true, "Armor", "options");
	settings.Add("3_Bosses_WHG", false, "3 Bosses WHG", "options");
	settings.Add("Golem", true, "Golem", "options");
	settings.Add("Snake_Dragon", false, "Snake Dragon", "options");
	settings.Add("Gargoyle", true, "Gargoyle", "options");
	settings.Add("Frankenstein", false, "Frankenstein", "options");
	settings.Add("Gear_Steamer", true, "Gear Steamer", "options");
	settings.Add("Talos", false, "Talos", "options");
	settings.Add("Princess_of_Moss", true, "Princess of Moss", "options");
	settings.Add("Death", true, "Death", "options");
	settings.Add("Elizabeth_Bartley", true, "Elizabeth Bartley", "options");
	settings.Add("Dracula", true, "Dracula", "options");
}
