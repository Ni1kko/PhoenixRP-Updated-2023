class CfgAirdrop {
    class Altis {
        positions[] = {
            {8905.64,7496.92,0},
            {11196.2,8720.02,0},
            {12286.9,8907.2,0},
            {13819.1,6390.64,0},
            {14783.4,11154.5,0},
            {17067.2,11352.7,0},
            {19343,9680.53,0},
            {20264.8,8802.87,0},
            {20083.4,6720.3,0}
        };

        classes[] = {"one","two","three","four"};
    };

    class pja305 {
        positions[] = {};

        classes[] = {};
    };

    civilians = 30; //Needs x civilians to spawn
    radius = 75; //Radius of the zone
    spawnInterval = 7000; //Gets variable time (s)
    deleteTimer = 1500; //In seconds
    sleepTime = 300;//In seconds
    enable_airdrop = 1;

    class one {
        weapons[] = {
            {"hgun_Pistol_Signal_F",2},
            {"hgun_PDW2000_F",3},
            {"SMG_01_F",6},
            {"SMG_03C_TR_hex",2},
            {"SMG_03_TR_khaki",1},
            {"SMG_03_camo",3},
            {"arifle_TRG21_F",1},
            {"arifle_Katiba_F",4},
            {"arifle_CTARS_hex_F",1},
            {"sgun_HunterShotgun_01_sawedoff_F",2},
            {"srifle_DMR_06_camo_F",2},
            {"srifle_DMR_04_Tan_F",1}
        };
        magazines[] = {};
        items[] = {
            {"optic_AMS_snd",2},
            {"optic_LRPS",1},
            {"muzzle_snds_B_khk_F",3},
            {"bipod_02_F_lush",1}
        };
        virtualItemChance = 15;
        virtualItems[] = {{"mre", 5}, {"Bandage", 10}, {"Gauze", 2}};
    };

    class two {
        weapons[] = {
            {"hgun_Pistol_01_F",4},
            {"arifle_AKS_F",1},
            {"arifle_MXC_khk_F",2},
            {"arifle_ARX_ghex_F",4},
            {"LMG_Mk200_F",1},
            {"sgun_HunterShotgun_01_sawedoff_F",1},
            {"sgun_HunterShotgun_01_F",3},
            {"arifle_SPAR_03_blk_F",1},
            {"srifle_EBR_F",2},
            {"srifle_LRR_F",1}
        };
        magazines[] = {
            {"20Rnd_762x51_Mag",17},
            {"2Rnd_12Gauge_Pellets",8},
            {"6Rnd_12Gauge_Slug",16},
            {"10Rnd_127x54_Mag",2},
            {"UGL_FlareYellow_F",1}
        };
        items[] = {
            {"muzzle_snds_B",2}
        };
        virtualItemChance = 15;
        virtualItems[] = {{"lockpick", 5}, {"gpstracker", 1}, {"spikeStrip", 2}};
    };

    class three {
        weapons[] = {
            {"arifle_Mk20C_F",2},
            {"SMG_03C_khaki",3},
            {"SMG_02_F",6},
            {"arifle_MXC_Black_F",1},
            {"arifle_MXM_khk_F",3},
            {"arifle_MSBS65_Mark_camo_F",2},
            {"arifle_AKM_F",7},
            {"arifle_AK12U_F",2},
            {"LMG_03_F",1},
            {"sgun_HunterShotgun_01_F",1},
            {"srifle_DMR_01_F",3},
            {"LMG_Zafir_F",1}
        };
        magazines[] = {};
        items[] = {
            {"muzzle_snds_93mmg_tan",1},
            {"optic_Hamr",2},
            {"bipod_02_F_tan",2}
        };
        virtualItemChance = 40;
        virtualItems[] = {{"boltcutter", 3}, {"hackingdevice", 1}};
    };

    class four {
        weapons[] = {
            {"arifle_MXM_khk_F",1},
            {"arifle_MSBS65_black_F",3},
            {"arifle_MSBS65_UBS_camo_F",6},
            {"arifle_AKM_F",1},
            {"arifle_AK12U_F",3},
            {"LMG_Mk200_F",2},
            {"arifle_RPK12_lush_F",1},
            {"arifle_MX_SW_khk_F",1},
            {"SMG_03_TR_camo",1},
            {"sgun_HunterShotgun_01_F",1},
            {"srifle_DMR_01_F",1}
        };
        magazines[] = {};
        items[] = {
            {"optic_LRPS",2},
            {"optic_Arco_ghex_F",1},
            {"muzzle_snds_B",2},
            {"muzzle_snds_L",3},
            {"optic_Aco",4},
            {"bipod_01_F_blk",3},
            {"muzzle_snds_B_lush_F",1},
            {"muzzle_snds_65_TI_blk_F",1},
            {"muzzle_snds_65_TI_hex_F",2}
        };
        virtualItemChance = 45;
        virtualItems[] = {{"boltcutter", 3}, {"drill", 1}};
    };
};