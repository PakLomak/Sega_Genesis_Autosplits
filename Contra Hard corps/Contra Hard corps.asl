state("Fusion", "3.64")
{
byte stage: "Fusion.exe", 0x2A52D4, 0xFA48;
byte player: "Fusion.exe", 0x2A52D4, 0xD703;
byte scroling: "Fusion.exe", 0x2A52D4, 0xA0E8;
byte scroling2: "Fusion.exe", 0x2A52D4, 0xA0E9;
byte movie: "Fusion.exe", 0x2A52D4, 0xA0D9;
byte animation3: "Fusion.exe", 0x2A52D4, 0xB183;
byte latter1: "Fusion.exe", 0x2A52D4, 0xB198;
byte latter2: "Fusion.exe", 0x2A52D4, 0xB1F4;
byte scene: "Fusion.exe", 0x2A52D4, 0xA003;
}
state("Mednafen", "0.9.48")
{
byte stage: "mednafen.exe", 0x135B788;
byte player: "mednafen.exe", 0x1359443;
byte scroling: "mednafen.exe", 0x1355E28;
byte scroling2: "mednafen.exe", 0x1355E29;
byte movie: "mednafen.exe", 0x1355E19;
byte animation3: "mednafen.exe", 0x1356EC3;
byte latter1: "mednafen.exe", 0x1356ED8;
byte latter2: "mednafen.exe", 0x1356F34;
byte scene: "mednafen.exe", 0x1355D43;
}
state("Mednafen", "1.29.0")
{
byte stage: "mednafen.exe", 0x16545C8;
byte player: "mednafen.exe", 0x1652283;
byte scroling: "mednafen.exe", 0x164EC68;
byte scroling2: "mednafen.exe", 0x164EC69;
byte movie: "mednafen.exe", 0x164EC59;
byte animation3: "mednafen.exe", 0x164FD03;
byte latter1: "mednafen.exe", 0x164FD18;
byte latter2: "mednafen.exe", 0x164FD74;
byte scene: "mednafen.exe", 0x164EB83;
}
state("Retroarch", "1.16.0 BlastEm")
{
byte stage: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xFA49;
byte player: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xD702;
byte scroling: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xA0E9;
byte scroling2: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xA0E8;
byte movie: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xA0D8;
byte animation3: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xB182;
byte latter1: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xB199;
byte latter2: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xB1F5;
byte scene: "blastem_libretro.dll", 0x0172B18, 0xD0, 0x58, 0xA002;
}
state("emuhawk", "1.13.2")
{
byte stage: "libgenplusgx.dll", 0x000062D8, 0xFA49;
byte player: "libgenplusgx.dll", 0x000062D8, 0xD702;
byte scroling: "libgenplusgx.dll", 0x000062D8, 0xA0E9;
byte scroling2: "libgenplusgx.dll", 0x000062D8, 0xA0E8;
byte movie: "libgenplusgx.dll", 0x000062D8, 0xA0D8;
byte animation3: "libgenplusgx.dll", 0x000062D8, 0xB182;
byte latter1: "libgenplusgx.dll", 0x000062D8, 0xB199;
byte latter2: "libgenplusgx.dll", 0x000062D8, 0xB1F5;
byte scene: "libgenplusgx.dll", 0x000062D8, 0xA002;
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
	vars.five = 0;
	vars.bahamut = 0;
	vars.rocket = 0;
}
startup
{
	settings.Add("main", false, "AutoSplitter for Contra Hard corps by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}
