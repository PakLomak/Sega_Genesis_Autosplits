state("Fusion", "3.64")
{
byte move: "Fusion.exe", 0x2A52D4, 0x90D1;
byte stage: "Fusion.exe", 0x2A52D4, 0xFB2B;
byte orb: "Fusion.exe", 0x2A52D4, 0xBCD3;
}
state("Mednafen", "0.9.48")
{
byte move: "mednafen.exe", 0x1354E11;
byte stage: "mednafen.exe", 0x135B86B;
byte orb: "mednafen.exe", 0x1357A13;
}
state("Mednafen", "1.29.0")
{
byte move: "mednafen.exe", 0x164DC51;
byte stage: "mednafen.exe", 0x16546AB;
byte orb: "mednafen.exe", 0x1650853;
}
state("Retroarch", "1.16.0 BlastEm")
{
byte move: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0x90D0;
byte stage: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xFB2A;
byte orb: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xBCD2;
}
state("emuhawk", "1.13.2")
{
byte move: "libgenplusgx.dll", 0x000062D8, 0x90D0;
byte stage: "libgenplusgx.dll", 0x000062D8, 0xFB2A;
byte orb: "libgenplusgx.dll", 0x000062D8, 0xBCD2;
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
	return (old.move == 0x03 && current.move == 0x04 && current.stage == 0x00);
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
