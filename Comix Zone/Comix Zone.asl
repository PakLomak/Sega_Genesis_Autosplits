state ("Fusion")
{
	byte timeUpper: 		"Fusion.exe", 0x2A52D4, 0x0c03e;
	byte time: 				"Fusion.exe", 0x2A52D4, 0x0c03f;
	byte demo: 				"Fusion.exe", 0x2A52D4, 0x0c190;
	byte panelID: 			"Fusion.exe", 0x2A52D4, 0x0bf38;
	byte page: 				"Fusion.exe", 0x2A52D4, 0x0bf39;
	byte stage: 			"Fusion.exe", 0x2A52D4, 0x0bf1e;
	//byte page_scroll: 	"Fusion.exe", 0x2A52D4, 0x000a8;
	byte page_sheet:        "Fusion.exe", 0x2A52D4, 0x0bec2;
    byte page_sheet2:       "Fusion.exe", 0x2A52D4, 0x0bec3;
    ushort waterTimer: 		"Fusion.exe", 0x2A52D4, 0x05e08;
	byte switcher: 			"Fusion.exe", 0x2A52D4, 0x0606c;
	byte ending: 			"Fusion.exe", 0x2A52D4, 0x0bfd6;
    byte dead:              "Fusion.exe", 0x2A52D4, 0x0BF04;
}
state("mednafen", "1.26.1") //RAM 0x00 == 0x17D3F80
{
    byte timeUpper : "mednafen.exe", 0x17DFFBE;//0x00c03e
    byte time : "mednafen.exe", 0x17DFFBF;//0x00c03f
    byte demo : "mednafen.exe", 0x17E0110;//0x00c190
    byte panelID : "mednafen.exe", 0x17DFEB9;//0x00bf39
    byte page : "mednafen.exe", 0x17DFEB8;//0x00bf38
    byte stage : "mednafen.exe", 0x17DFE9F;//0x00bf1f
    //byte page_scroll : "mednafen.exe", 0x17D4028;//0x0000a8
    byte page_sheet:"mednafen.exe", 0x17DFE42;//0x0bec2
    byte page_sheet2:"mednafen.exe", 0x17DFE43;//0x0bec3
    ushort waterTimer : "mednafen.exe", 0x17D9D88;//0x005e08
    byte switcher : "mednafen.exe", 0x17D9FEC;//0x00606c
    byte ending : "mednafen.exe", 0x17DFF57;//0x00bfd7
    byte animation : "mednafen.exe", 0x17D96C7;//0x005747
    byte yPos : "mednafen.exe", 0x17D96C4;//0x005744
    byte yPos2 : "mednafen.exe", 0x17D96C5;//0x005745
    byte waterPos : "mednafen.exe", 0x17D9D63;//0x005de3
    byte dead: "mednafen.exe", 0x17DFE84;//0x0BF04
}
state("mednafen", "0.9.48") //RAM 0x00 == 0x134BD40
{
    byte timeUpper : "mednafen.exe", 0x1357D7E;//0x00c03e
    byte time : "mednafen.exe", 0x1357D7F;//0x00c03f
    byte demo : "mednafen.exe", 0x1357ED0;//0x00c190
    byte panelID : "mednafen.exe", 0x1357C79;//0x00bf39
    byte page : "mednafen.exe", 0x1357C78;//0x00bf38
    byte stage : "mednafen.exe", 0x1357C5F;//0x00bf1f
    //byte page_scroll : "mednafen.exe", 0x134BDE8;//0x0000a8
    byte page_sheet:"mednafen.exe", 0x1357C02;//0x0bec2
    byte page_sheet2:"mednafen.exe", 0x1357C03;//0x0bec3
    ushort waterTimer : "mednafen.exe", 0x1351B48;//0x005e08
    byte switcher : "mednafen.exe", 0x1351DAC;//0x00606c
    byte ending : "mednafen.exe", 0x1357D17;//0x00bfd7
    byte animation : "mednafen.exe", 0x1351487;//0x005747
    byte yPos : "mednafen.exe", 0x1351484;//0x005744
    byte yPos2 : "mednafen.exe", 0x1351485;//0x005745
    byte waterPos : "mednafen.exe", 0x1351B23;//0x005de3
    byte dead: "mednafen.exe", 0x1357C44;//0x0BF04
}
state("mednafen", "1.27.1") //RAM 0x00 == 0x16EEB80
{
    byte timeUpper : "mednafen.exe", 0x16FABBE;//0x00c03e
    byte time : "mednafen.exe", 0x16FABBF;//0x00c03f
    byte demo : "mednafen.exe", 0x16FAD10;//0x00c190
    byte panelID : "mednafen.exe", 0x16FAAB9;//0x00bf39
    byte page : "mednafen.exe", 0x16FAAB8;//0x00bf38
    byte stage : "mednafen.exe", 0x16FAA9F;//0x00bf1f
    //byte page_scroll : "mednafen.exe", 0x16EEC28;//0x0000a8
    byte page_sheet:"mednafen.exe", 0x16FAA42;//0x0bec2
    byte page_sheet2:"mednafen.exe", 0x16FAA43;//0x0bec3
    ushort waterTimer : "mednafen.exe", 0x16F4988;//0x005e08
    byte switcher : "mednafen.exe", 0x16F4BEC;//0x00606c
    byte ending : "mednafen.exe", 0x16FAB57;//0x00bfd7
    byte animation : "mednafen.exe", 0x16F42C7;//0x005747
    byte yPos : "mednafen.exe", 0x16F42C4;//0x005744
    byte yPos2 : "mednafen.exe", 0x16F42C5;//0x005745
    byte waterPos : "mednafen.exe", 0x16F4963;//0x005de3
    byte dead: "mednafen.exe", 0x16FAA84;//0x0BF04
}
state("retroarch", "1.9.8") //RAM 0x00 == "blastem_libretro.dll", 0x173B18, 0x198, 0x00; Little endian!
{
    byte timeUpper : "blastem_libretro.dll", 0x173B18, 0x198, 0x00c03f;//0x00c03e
    byte time : "blastem_libretro.dll", 0x173B18, 0x198, 0x00c03e;//0x00c03f
    byte demo : "blastem_libretro.dll", 0x173B18, 0x198, 0x00c191;//0x00c190
    byte panelID : "blastem_libretro.dll", 0x173B18, 0x198, 0x00bf38;//0x00bf39
    byte page : "blastem_libretro.dll", 0x173B18, 0x198, 0x00bf39;//0x00bf38
    byte stage : "blastem_libretro.dll", 0x173B18, 0x198, 0x00bf1e;//0x00bf1f
    //byte page_scroll : "blastem_libretro.dll", 0x173B18, 0x198, 0x0000a9;//0x0000a8
    byte page_sheet:"blastem_libretro.dll", 0x173B18, 0x198, 0x0bec3;//0x0bec2
    byte page_sheet2:"blastem_libretro.dll", 0x173B18, 0x198, 0x0bec2;//0x0bec3
    ushort waterTimer : "blastem_libretro.dll", 0x173B18, 0x198, 0x005e09;//0x005e08
    byte switcher : "blastem_libretro.dll", 0x173B18, 0x198, 0x00606d;//0x00606c
    byte ending : "blastem_libretro.dll", 0x173B18, 0x198, 0x00bfd6;//0x00bfd7
    byte animation : "blastem_libretro.dll", 0x173B18, 0x198, 0x005746;//0x005747
    byte yPos : "blastem_libretro.dll", 0x173B18, 0x198, 0x005745;//0x005744
    byte yPos2 : "blastem_libretro.dll", 0x173B18, 0x198, 0x005744;//0x005745
    byte waterPos : "blastem_libretro.dll", 0x173B18, 0x198, 0x005de2;//0x005de3
    byte dead: "blastem_libretro.dll", 0x173B18, 0x198, 0x0BF05;//0x0BF04
}
update
{
    //print(modules.First().ModuleMemorySize.ToString());
}
init
{
    if (modules.First().ModuleMemorySize == 90116096)
        version = "1.27.1";
    if (modules.First().ModuleMemorySize == 99102720)
        version = "1.26.1";
    else if (modules.First().ModuleMemorySize == 93294592)
        version = "0.9.48";
}
start
{
    if (current.demo != 1)
        if (current.stage == 0)
            if (current.page == 0)
                if (current.panelID == 0)
                    if (current.timeUpper == 0)
                        if (current.time >= 0x70 && old.time < 0x70)
                            return true;
    return false;
}

split
{
    byte stage = current.stage;
    if (current.demo != 1)
    {
        //if (old.page_scroll == 0x80 && current.page_scroll == 0x52) return true;
        if (current.page_sheet == 0xBE && current.page_sheet2 == 0xC4 && old.page_sheet2 != 0xC4 && current.stage != 5 && current.dead != 0xFF) return true;
        if (current.stage == 5 && current.page == 2 && current.panelID == 0)
        {
            if (current.waterTimer != 0 && current.yPos == 3 && current.yPos2 < 0x50)
            {
                if (current.waterPos > old.waterPos)
                    return true;
            }
            if (current.ending == 3 && old.ending != 3)
                return true;
        }
    }
    return false;
}
startup 
{
    refreshRate = 70;
	settings.Add("main", false, "AutoSplitter for Comix Zone corps by Xanders08");
	settings.Add("main3", false, "--https://www.twitch.tv/Xanders08", "main");
}