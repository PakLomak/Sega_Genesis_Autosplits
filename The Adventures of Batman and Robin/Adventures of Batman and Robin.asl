state ("Fusion") //RAM 0x00 == "Fusion.exe", 0x2A52D4, 0x00;
{
    byte start:"Fusion.exe", 0x2A52D4, 0xAE43;
    byte x:"Fusion.exe", 0x2A52D4, 0xF607;
    byte stage:"Fusion.exe", 0x2A52D4, 0xF602;
    byte global:"Fusion.exe", 0x2A52D4, 0xF5FA;
}
state("mednafen", "1.26.1") //RAM 0x00 == 0x17D3F80
{
    byte start:"mednafen.exe", 0x17DEDC3;
    byte x:"mednafen.exe", 0x17E3587;
    byte stage:"mednafen.exe", 0x17E3582;
    byte global:"mednafen.exe", 0x17E357A;
}
state("mednafen", "0.9.48") //RAM 0x00 == 0x134BD40
{
    byte start:"mednafen.exe", 0x1356B83;
    byte x:"mednafen.exe", 0x135B347;
    byte stage:"mednafen.exe", 0x135B342;
    byte global:"mednafen.exe", 0x135B33A;
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
    return (current.start == 0x8C);
}
split
{
    if (old.x == 0x72 && current.x == 0x96 && current.stage != 0x44) return(true);
    if (old.stage == 0x22 && current.stage == 0x23) return(true);
    if (current.stage == 0x44 && old.x == 0x96 && current.x == 0x54) return(true);
}
reset
{
    return (current.x == 0x08 && current.global == 0x00);
}
startup
{
	refreshRate = 70;
	settings.Add("main", false, "AutoSplitter for Adventures of Batman and Robin Genesis by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}