state ("Fusion") //RAM 0x00 == "Fusion.exe", 0x2A52D4, 0x00;
{
	byte stage: 		"Fusion.exe", 0x2A52D4, 0x0FA48;
	byte player:		"Fusion.exe", 0x2A52D4, 0x0D703;
	byte scroling:		"Fusion.exe", 0x2A52D4, 0x0A0E8;
	byte scroling2:		"Fusion.exe", 0x2A52D4, 0x0A0E9;
	byte movie:			"Fusion.exe", 0x2A52D4, 0x0A0D9;
	byte animation3:	"Fusion.exe", 0x2A52D4, 0x0B183;
	byte latter1:		"Fusion.exe", 0x2A52D4, 0x0B198;
	byte latter2:		"Fusion.exe", 0x2A52D4, 0x0B1F4;
	byte scene:			"Fusion.exe", 0x2A52D4, 0x0A003;
}
state("mednafen", "1.27.1") //RAM 0x00 == 0x16EEB80
{
	byte stage: 		"mednafen.exe", 0x16FE5C8; //FA48
	byte player:		"mednafen.exe", 0x16FC283; //D703
	byte scroling:		"mednafen.exe", 0x16F8C68; //A0E8
	byte scroling2:		"mednafen.exe", 0x16F8C69; //A0E9
	byte movie:			"mednafen.exe", 0x16F8C59; //A0D9
	byte animation3:	"mednafen.exe", 0x16F9D03; //B183
	byte latter:		"mednafen.exe", 0x16F9D18; //B198
	byte Decay:			"mednafen.exe", 0x16F9D74; //B1F4
	byte scene:			"mednafen.exe", 0x16F8B83; //A003
}
state("mednafen", "0.9.48") //RAM 0x00 == 0x134BD40
{
	byte stage: 		"mednafen.exe", 0x135B788; //FA48
	byte player:		"mednafen.exe", 0x1359443; //D703
	byte scroling:		"mednafen.exe", 0x1355E28; //A0E8
	byte scroling2:		"mednafen.exe", 0x1355E29; //A0E9
	byte movie:			"mednafen.exe", 0x1355E19; //A0D9
	byte animation3:	"mednafen.exe", 0x1356EC3; //B183
	byte latter:		"mednafen.exe", 0x1356ED8; //B198
	byte Decay:			"mednafen.exe", 0x1356F34; //B1F4
	byte scene:			"mednafen.exe", 0x1355D43; //A003
}
start
{
	return (current.stage == 0x0C && current.scroling == 0x03 && old.player == 0x06 && current.player != 0x06);
}
split
{
	if (current.stage == 0x11 && current.latter == 0x10 && current.Decay == 0xFF && old.Decay != 0xFF && current.animation3 >= 0x03) return(true); //Go after deadeye Joe
	if (current.stage == 0x44 && current.latter == 0x10 && current.Decay == 0xFF && old.Decay != 0xFF && current.animation3 >= 0x03) return(true); //Fight with Joe
	if (current.stage == 0x2C && current.movie == 0x01 && old.movie != 0x01 && vars.five >= 3) return(true); //Battle with bosses
	if (current.stage == 0x2C && current.movie == 0x01 && old.movie != 0x01) vars.five = vars.five + 1;
	if (current.stage == 0x2C && old.stage != 0x2C) return(true);
	if (current.stage == 0x05 && current.latter == 0x10 && current.Decay == 0xFF && old.Decay != 0xFF && current.animation3 >= 0x03) return(true); //Noiman Cascade 2
	if (current.stage == 0x09 && current.latter == 0x10 && current.Decay == 0xFF && old.Decay != 0xFF && current.animation3 >= 0x03) return(true); //Junggle BASE 2
	if (current.stage == 0x08 && current.latter == 0x10 && current.Decay == 0xFF && old.Decay != 0xFF && current.animation3 >= 0x03) return(true); //Fight with Doctor 2
	if (current.stage == 0x23 && current.movie == 0x01 && old.movie != 0x01) return(true); //Heart
	if (current.stage == 0x2A && current.movie == 0x01 && old.movie != 0x01) return(true); //Alien GUN
	if (current.stage == 0x13 && current.latter == 0x10 && current.Decay == 0xFF && old.Decay != 0xFF && current.animation3 >= 0x03) return(true); //Rescue the research center
	if (current.stage == 0x14 && current.latter == 0x10 && current.Decay == 0xFF && old.Decay != 0xFF && current.animation3 >= 0x03) return(true); //Alien cell
	if (current.stage == 0x1A && current.latter == 0x10 && current.Decay == 0xFF && old.Decay != 0xFF && current.animation3 >= 0x03) return(true); //Fight with transformer
	if (current.stage == 0x17 && current.latter == 0x10 && current.Decay == 0xFF && old.Decay != 0xFF && current.animation3 >= 0x03) return(true); //Battle on the train
	if (current.stage == 0x1D && old.stage != 0x1D) return(true); //Last fight with Joe & Fight with Bahamut
	if (current.stage == 0x1D && current.movie == 0x01 && old.movie != 0x01 && vars.rocket >= 1) return(true); //Destroy ALIEN CELL
	if (current.stage == 0x1D && current.movie == 0x01 && old.movie != 0x01) vars.rocket = vars.rocket + 1;
	if (current.stage == 0x46 && current.movie == 0x01 && old.movie != 0x01 && vars.bahamut >= 2) return(true); //Fight with BahamutALIEN
	if (current.stage == 0x46 && current.movie == 0x01 && old.movie != 0x01) vars.bahamut = vars.bahamut + 1;
	if (current.scene == 0x10) vars.five = 0;
	if (current.scene == 0x10) vars.bahamut = 0;
}
init
{
	if (modules.First().ModuleMemorySize == 90116096)
        version = "1.27.1";
    else if (modules.First().ModuleMemorySize == 93294592)
        version = "0.9.48";
	vars.five = 0;
	vars.bahamut = 0;
	vars.rocket = 0;
}
startup
{
	settings.Add("main", false, "AutoSplitter for Contra Hard corps by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}
