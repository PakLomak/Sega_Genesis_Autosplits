state ("Fusion") //RAM 0x00 == "Fusion.exe", 0x2A52D4, 0x00;
{
	byte start:"Fusion.exe", 0x2A52D4, 0x00DC2;
}
state("mednafen", "1.26.1") //RAM 0x00 == 0x17D3F80
{
	byte start:"mednafen.exe", 0x17D4D42; //0DC2
}
state("mednafen", "0.9.48") //RAM 0x00 == 0x134BD40
{
	byte start:"mednafen.exe", 0x134CB02; //0DC2
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
	return (old.start == 0x07 && current.start == 0x09);
}
split
{
	if (current.start == 0x06 && old.start != 0x06) return(true);
}
startup
{
	settings.Add("main", false, "AutoSplitter for Battle Toads - Double Dragon by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}
