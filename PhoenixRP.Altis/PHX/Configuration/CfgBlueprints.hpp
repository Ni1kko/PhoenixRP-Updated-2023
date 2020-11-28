#define ROOT(dir, root) #[dir, root] call PHX_fnc_iconDir
class CfgBlueprints {
	class Virtual {
		class WeedCoffee {
			icon = ROOT("data\icons\ico_coffee.paa", true);
			fullName = "Cannabis Coffee";
			name = "Cannabis Coffee";
			time = 20;
			level = 1;
			ingredients[] = {{"coffee", 1}, {"marijuana", 1}};
			product = "weedCoffee";
			condition = "true";
		};
		class mre {
			icon = ROOT("data\icons\ico_mre.paa", true);
			fullName = "MRE";
			name = "MRE";
			time = 25;
			level = 1;
			ingredients[] = {{"tbacon", 1}, {"apple", 1}};
			product = "mre";
			condition = "true";
		};
		class lockpick {
			icon = ROOT("data\icons\ico_lockpick.paa", true);
			fullName = "Lockpick";
			name = "Lockpick";
			time = 50;
			level = 5;
			ingredients[] = {{"iron_bar", 1}};
			product = "lockpick";
			condition = "true";
		};
		class boltcutter {
			icon = ROOT("data\icons\ico_boltCutter.paa", true);
			fullName = "Boltcutter";
			name = "Boltcutter";
			time = 100;
			level = 5;
			ingredients[] = {{"iron_bar", 1}, {"lockpick", 1}};
			product = "boltcutter";
			condition = "true";
		};
		class Saline {
			icon = ROOT("data\icons\ico_saline.paa", true);
			fullName = "Saline";
			name = "Saline";
			time = 100;
			level = 5;
			ingredients[] = {{"refined_salt", 1}, {"waterBottle", 1}};
			product = "Saline";
			condition = "true";
		};
		class medikit_virtual {
			icon = ROOT("data\icons\ico_medikit.paa", true);
			fullName = "Medikit";
			name = "Medikit";
			time = 100;
			level = 10;
			ingredients[] = {{"firstaidkit_virtual", 2}};
			product = "medikit_virtual";
			condition = "true";
		};
		class siphonpump {
			icon = ROOT("data\icons\ico_siphon.paa", true);
			fullName = "Fuel Siphon Pump";
			name = "Fuel Siphon Pump";
			time = 150;
			level = 10;
			ingredients[] = {{"fuelFull", 1}, {"iron_bar", 1}};
			product = "siphonpump";
			condition = "true";
		};
		class gpstracker {
			icon = ROOT("data\icons\ico_gpstracker.paa", true);
			fullName = "GPS Tracker";
			name = "GPS Tracker";
			time = 150;
			level = 15;
			ingredients[] = {{"iron_bar", 3}};
			product = "gpstracker";
			condition = "true";
		};
		class hackingdevice {
			icon = ROOT("data\icons\ico_hackingdevice.paa", true);
			fullName = "Hacking Device";
			name = "Hacking Device";
			time = 300;
			level = 20;
			ingredients[] = {{"iron_bar", 3}, {"boltcutter", 1}, {"lockpick", 3}, {"cut_diamond", 20}};
			product = "hackingdevice";
			condition = "true";
		};
		class drill {
			icon = ROOT("data\icons\ico_blastingcharge.paa", true);
			fullName = "Industrial Drill";
			name = "Industrial Drill";
			time = 300;
			level = 20;
			ingredients[] = {{"iron_bar", 3}, {"pickaxe", 1}, {"fuelFull", 1}, {"cut_diamond", 20}};
			product = "drill";
			condition = "true";
		};
        class spikeStrip {
			icon = ROOT("data\icons\ico_spikestrip.paa", true);
			fullName = "Police Stinger";
			name = "Police Stinger";
			time = 150;
			level = 10;
			ingredients[] = {{"iron_bar", 3}, {"lockpick", 3}, {"cut_sapphire", 10}};
			product = "spikeStrip";
			condition = "PHX_PrestigeLevel >= 1";
		};
	/* Would be an amazing addition!
		class vodkaredgull {
			icon = ROOT("data\icons\ico_vodkaredgull.paa", true);
			fullName = "Vodka Redgull Cocktail";
			name = "Vodka Redgull Cocktail";
			time = 50;
			level = 10;
			ingredients[] = {{"vodka", 1}, {"redgull", 1}};
			product = "vodkaredgull";
			condition = "true";
		};
	*/
	};
    class Physical {
		// General Items
		class G_Tactical_Clear {
			icon = ROOT("\a3\Weapons_F_Exp\Acc\Data\UI\icon_muzzle_snds_65_TI_blk_F_ca.paa", false);
			fullName = "Night-Vision Glasses";
			name = "Night-Vision Glasses";
			time = 40;
			level = 1;
			ingredients[] = {{"glass", 2}, {"silicon", 2}};
			product = "G_Tactical_Clear";
			condition = "true";
		};

		// Pistols
		class hgun_Pistol_heavy_02_F {
			icon = ROOT("\a3\Weapons_F_Exp\Acc\Data\UI\icon_muzzle_snds_65_TI_blk_F_ca.paa", false);
			fullName = "Zubr .45 ACP";
			name = "Zubr .45 ACP";
			time = 100;
			level = 5;
			ingredients[] = {{"weapon", 1}, {"iron_bar", 1}};
			product = "hgun_Pistol_heavy_02_F";
			condition = "true";
		};

        // SMGs
		// Shotguns
		class sgun_HunterShotgun_01_sawedoff_F {
			icon = ROOT("\a3\Weapons_F_Exp\Acc\Data\UI\icon_muzzle_snds_65_TI_blk_F_ca.paa", false);
			fullName = "Kozlice 12G (Sawn-Off)";
			name = "Kozlice 12G (Sawn-Off)";
			time = 200;
			level = 15;
			ingredients[] = {{"refined_oil", 1}, {"weapon", 1}, {"iron_bar", 5}};
			product = "sgun_HunterShotgun_01_sawedoff_F";
			condition = "true";
		};
		class sgun_HunterShotgun_01_F {
			icon = ROOT("\a3\Weapons_F_Exp\Acc\Data\UI\icon_muzzle_snds_65_TI_blk_F_ca.paa", false);
			fullName = "Kozlice 12G";
			name = "Kozlice 12G";
			time = 250;
			level = 15;
			ingredients[] = {{"refined_oil", 1}, {"weapon", 1}, {"iron_bar", 10}};
			product = "sgun_HunterShotgun_01_F";
			condition = "true";
		};

		// Assault Rifles
		class arifle_AKM_F {
			icon = ROOT("\a3\Weapons_F_Exp\Acc\Data\UI\icon_muzzle_snds_65_TI_blk_F_ca.paa", false);
			fullName = "AKM 7.62mm";
			name = "AKM 7.62mm";
			time = 250;
			level = 20;
			ingredients[] = {{"silicon", 2}, {"weapon", 1}, {"iron_bar", 10}};
			product = "arifle_AKM_F";
			condition = "true";
		};
        class arifle_AK12_F {
			icon = ROOT("\a3\Weapons_F_Exp\Acc\Data\UI\icon_muzzle_snds_65_TI_blk_F_ca.paa", false);
			fullName = "AK-12 7.62mm (Black)";
			name = "AK-12 7.62mm (Black)";
			time = 350;
			level = 25;
			ingredients[] = {{"weapon", 5}, {"iron_bar", 10}, {"silver_ore", 10}};
			product = "arifle_AK12_F";
			condition = "PHX_PrestigeLevel >= 1 && PHX_DonatorLevel > 0";     // Black for Sponsors
		};
        class arifle_AK12_lush_F {
			icon = ROOT("\a3\Weapons_F_Exp\Acc\Data\UI\icon_muzzle_snds_65_TI_blk_F_ca.paa", false);
			fullName = "AK-12 7.62mm (Lush)";
			name = "AK-12 7.62mm (Lush)";
			time = 350;
			level = 25;
			ingredients[] = {{"weapon", 5}, {"iron_bar", 10}, {"silver_ore", 10}};
			product = "arifle_AK12_lush_F";
			condition = "PHX_PrestigeLevel >= 1";
		};
        class arifle_RPK12_F {
			icon = ROOT("\a3\Weapons_F_Exp\Acc\Data\UI\icon_muzzle_snds_65_TI_blk_F_ca.paa", false);
			fullName = "RPK 7.62mm (Black)";
			name = "RPK 7.62mm (Black)";
			time = 350;
			level = 25;
			ingredients[] = {{"weapon", 10}, {"iron_bar", 10}, {"silver_ore", 10}};
			product = "arifle_RPK12_F";
			condition = "PHX_PrestigeLevel >= 1 && PHX_DonatorLevel > 0";     // Black for Sponsors
		};
        class arifle_RPK12_lush_F {
			icon = ROOT("\a3\Weapons_F_Exp\Acc\Data\UI\icon_muzzle_snds_65_TI_blk_F_ca.paa", false);
			fullName = "RPK 7.62mm (Lush)";
			name = "RPK 7.62mm (Lush)";
			time = 350;
			level = 25;
			ingredients[] = {{"weapon", 10}, {"iron_bar", 10}, {"silver_ore", 10}};
			product = "arifle_RPK12_lush_F";
			condition = "PHX_PrestigeLevel >= 1";
		};
    
		// LMGs
		class LMG_03_F {
			icon = ROOT("\a3\Weapons_F_Exp\Acc\Data\UI\icon_muzzle_snds_65_TI_blk_F_ca.paa", false);
			fullName = "LIM 5.56mm";
			name = "LIM 5.56mm";
			time = 300;
			level = 25;
			ingredients[] = {{"weapon", 5}, {"iron_bar", 15}, {"refined_oil", 5}};
			product = "LMG_03_F";
			condition = "PHX_PrestigeLevel >= 1";
		};
        class LMG_Mk200_black_F {
			icon = ROOT("\a3\Weapons_F_Exp\Acc\Data\UI\icon_muzzle_snds_65_TI_blk_F_ca.paa", false);
			fullName = "Mk200 6.5mm (Black)";
			name = "Mk200 6.5mm (Black)";
			time = 350;
			level = 30;
			ingredients[] = {{"weapon", 10}, {"goldbarunmarked", 1}};
			product = "LMG_Mk200_black_F";
			condition = "PHX_PrestigeLevel >= 2 && PHX_DonatorLevel > 0";     // Black for Sponsors
		};
        class LMG_Mk200_F {
			icon = ROOT("\a3\Weapons_F_Exp\Acc\Data\UI\icon_muzzle_snds_65_TI_blk_F_ca.paa", false);
			fullName = "Mk200 6.5mm";
			name = "Mk200 6.5mm";
			time = 350;
			level = 30;
			ingredients[] = {{"weapon", 10}, {"goldbarunmarked", 1}};
			product = "LMG_Mk200_F";
			condition = "PHX_PrestigeLevel >= 2";
		};
       
		// Marksman Rifles
		class srifle_DMR_06_hunter_F {
			icon = ROOT("\a3\Weapons_F_Exp\Acc\Data\UI\icon_muzzle_snds_65_TI_blk_F_ca.paa", false);
			fullName = "Mk14 7.62mm";
			name = "Mk14 7.62mm";
			time = 250;
			level = 25;
			ingredients[] = {{"weapon", 1}, {"iron_bar", 10}, {"silicon", 5}}; 
			product = "srifle_DMR_06_hunter_F";
			condition = "true";
		};
        class srifle_EBR_F {
			icon = ROOT("\a3\Weapons_F_Exp\Acc\Data\UI\icon_muzzle_snds_65_TI_blk_F_ca.paa", false);
			fullName = "Mk18 7.62mm";
			name = "Mk18 7.62mm";
			time = 350;
			level = 35;
			ingredients[] = {{"weapon", 5}, {"silver_bar", 5}, {"cut_diamond", 15}};
			product = "srifle_EBR_F";
			condition = "PHX_PrestigeLevel >= 1";
		};
		class srifle_DMR_04_F {
			icon = ROOT("\a3\Weapons_F_Exp\Acc\Data\UI\icon_muzzle_snds_65_TI_blk_F_ca.paa", false);
			fullName = "ASP-1 Kir (Black)";
			name = "ASP-1 Kir (Black)";
			time = 450;
			level = 40;
			ingredients[] = {{"weapon", 5}, {"silver_bar", 5}, {"goldbarunmarked", 1}};
			product = "srifle_DMR_04_F";
			condition = "PHX_PrestigeLevel >= 2 && PHX_DonatorLevel > 0";     // Black for Sponsors
		};
		class srifle_DMR_04_Tan_F {
			icon = ROOT("\a3\Weapons_F_Exp\Acc\Data\UI\icon_muzzle_snds_65_TI_blk_F_ca.paa", false);
			fullName = "ASP-1 Kir (Tan)";
			name = "ASP-1 Kir (Tan)";
			time = 450;
			level = 40;
			ingredients[] = {{"weapon", 5}, {"silver_bar", 5}, {"goldbarunmarked", 1}};
			product = "srifle_DMR_04_Tan_F";
			condition = "PHX_PrestigeLevel >= 2";
		};

		// Special Weapon Ammunition
		class 200Rnd_65x39_cased_Box {
			icon = ROOT("\a3\Weapons_F_Exp\Acc\Data\UI\icon_muzzle_snds_65_TI_blk_F_ca.paa", false);
			fullName = "6.5mm 200Rnd Belt";
			name = "6.5mm 200Rnd Belt";
			time = 200;
			level = 30;
			ingredients[] = {{"iron_bar", 2}};
			product = "200Rnd_65x39_cased_Box";
			condition = "PHX_PrestigeLevel >= 2";
		};
        class 75rnd_762x39_AK12_Mag_F {
			icon = ROOT("\a3\Weapons_F_Exp\Acc\Data\UI\icon_muzzle_snds_65_TI_blk_F_ca.paa", false);
			fullName = "7.62mm 75Rnd (Black)";
			name = "7.62mm 75Rnd (Black)";
			time = 200;
			level = 25;
			ingredients[] = {{"iron_bar", 1}, {"cut_opal", 1}};
			product = "75rnd_762x39_AK12_Mag_F";
			condition = "PHX_PrestigeLevel >= 1 && PHX_DonatorLevel > 0";     // Black for Sponsors
		};
        class 75rnd_762x39_AK12_Lush_Mag_F {
			icon = ROOT("\a3\Weapons_F_Exp\Acc\Data\UI\icon_muzzle_snds_65_TI_blk_F_ca.paa", false);
			fullName = "7.62mm 75Rnd (Lush)";
			name = "7.62mm 75Rnd (Lush)";
			time = 200;
			level = 25;
			ingredients[] = {{"iron_bar", 1}, {"cut_opal", 1}};
			product = "75rnd_762x39_AK12_Lush_Mag_F";
			condition = "PHX_PrestigeLevel >= 1";
		};
        class 150Rnd_762x54_Box {
			icon = ROOT("\a3\Weapons_F_Exp\Acc\Data\UI\icon_muzzle_snds_65_TI_blk_F_ca.paa", false);
			fullName = "7.62mm 150Rnd Box";
			name = "7.62mm 150Rnd Box";
			time = 600;
			level = 40;
			ingredients[] = {{"iron_bar", 20}, {"cut_emerald", 2}, {"goldbarunmarked", 2}};    // = 665,860 GBP
			product = "150Rnd_762x54_Box";
			condition = "PHX_PrestigeLevel >= 3";
		};
		class 10Rnd_127x54_Mag {
			icon = ROOT("\a3\Weapons_F_Exp\Acc\Data\UI\icon_muzzle_snds_65_TI_blk_F_ca.paa", false);
			fullName = "12.7mm 10Rnd Mag";
			name = "12.7mm 10Rnd Mag";
			time = 225;
			level = 40;
			ingredients[] = {{"iron_bar", 2}, {"cut_sapphire", 1}};  // = 13,166 GBP
			product = "10Rnd_127x54_Mag";
			condition = "PHX_PrestigeLevel >= 2";
		};
		class 7Rnd_408_Mag {
			icon = ROOT("\a3\Weapons_F_Exp\Acc\Data\UI\icon_muzzle_snds_65_TI_blk_F_ca.paa", false);
			fullName = ".408 7Rnd LRR Mag";
			name = ".408 7Rnd LRR Mag";
			time = 1000;
			level = 48;
			ingredients[] = {{"refined_oil", 3}, {"iron_bar", 15}, {"plutonium239", 1}}; // = 358,994 GBP
			product = "7Rnd_408_Mag";
			condition = "PHX_PrestigeLevel >= 4";
		};
        class 10Rnd_338_Mag {
			icon = ROOT("\a3\Weapons_F_Exp\Acc\Data\UI\icon_muzzle_snds_65_TI_blk_F_ca.paa", false);
			fullName = ".338 LM 10Rnd Mag";
			name = ".338 LM 10Rnd Mag";
			time = 1000;
			level = 49;
			ingredients[] = {{"weapon", 15}, {"iron_bar", 15}, {"cut_emerald", 1}, {"goldbarunmarked", 2}};  // = 819,245 GBP
			product = "10Rnd_338_Mag";
			condition = "PHX_PrestigeLevel >= 5";
		};
		class 10Rnd_93x64_DMR_05_Mag {
			icon = ROOT("\a3\Weapons_F_Exp\Acc\Data\UI\icon_muzzle_snds_65_TI_blk_F_ca.paa", false);
			fullName = "9.3mm 10Rnd Mag";
			name = "9.3mm 10Rnd Mag";
			time = 1000;
			level = 50;
			ingredients[] = {{"weapon", 20}, {"iron_bar", 5}, {"chest", 1}, {"goldbarunmarked", 2}}; // 1,035,665 GBP
			product = "10Rnd_93x64_DMR_05_Mag";
			condition = "PHX_PrestigeLevel >= 7";
		};
		class 1Rnd_Smoke_Grenade_shell {
			icon = ROOT("\a3\Weapons_F_Exp\Acc\Data\UI\icon_muzzle_snds_65_TI_blk_F_ca.paa", false);
			fullName = "Smoke Round (White)";
			name = "Smoke Round (White)";
			time = 300;
			level = 20;
			ingredients[] = {{"refined_oil", 1}, {"iron_bar", 10}, {"cut_opal", 5}};
			product = "1Rnd_Smoke_Grenade_shell";
			condition = "true";
		};		
        class 10Rnd_50BW_Mag_F {
			icon = ROOT("\a3\Weapons_F_Exp\Acc\Data\UI\icon_muzzle_snds_65_TI_blk_F_ca.paa", false);
			fullName = "50 BW 10Rnd Caseless Mag";
			name = "50 BW 10Rnd Caseless Mag";
			time = 500;
			level = 40;
			ingredients[] = {{"refined_oil", 2}, {"iron_bar", 10}, {"goldbarunmarked", 1}}; // = 330,996 GBP
			product = "10Rnd_50BW_Mag_F";
			condition = "PHX_PrestigeLevel >= 2";
		};

        // Attachments
		class muzzle_snds_B {
			icon = ROOT("\a3\Weapons_F_Exp\Acc\Data\UI\icon_muzzle_snds_65_TI_blk_F_ca.paa", false);
			fullName = "7.62mm Suppressor (Black)";
			name = "7.62mm Suppressor (Black)";
			time = 250;
			level = 25;
			ingredients[] = {{"iron_bar", 5}, {"refined_oil", 3}, {"cut_diamond", 5}};
			product = "muzzle_snds_B";
			condition = "PHX_PrestigeLevel >= 1 && PHX_DonatorLevel > 0";     // Black for Sponsors
		};
		class muzzle_snds_B_lush_F {
			icon = ROOT("\a3\Weapons_F_Exp\Acc\Data\UI\icon_muzzle_snds_65_TI_blk_F_ca.paa", false);
			fullName = "7.62mm Suppressor (Lush)";
			name = "7.62mm Suppressor (Lush)";
			time = 250;
			level = 25;
			ingredients[] = {{"iron_bar", 5}, {"refined_oil", 3}, {"cut_ruby", 5}};
			product = "muzzle_snds_B_lush_F";
			condition = "PHX_PrestigeLevel >= 1";
		};
		class muzzle_snds_338_black {
			icon = ROOT("\a3\Weapons_F_Exp\Acc\Data\UI\icon_muzzle_snds_65_TI_blk_F_ca.paa", false);
			fullName = ".338 Sound Suppressor (Black)";
			name = ".338 Sound Suppressor (Black)";
			time = 1000;
			level = 50;
			ingredients[] = {{"iron_bar", 10}, {"antique", 2}, {"goldbarunmarked", 1}}; // = 893,330 GBP
			product = "muzzle_snds_338_black";
			condition = "PHX_PrestigeLevel >= 6 && PHX_DonatorLevel > 0";     // Black for Sponsors
		};
		class muzzle_snds_338_sand {
			icon = ROOT("\a3\Weapons_F_Exp\Acc\Data\UI\icon_muzzle_snds_65_TI_blk_F_ca.paa", false);
			fullName = ".338 Sound Suppressor (Sand)";
			name = ".338 Sound Suppressor (Sand)";
			time = 1000;
			level = 50;
			ingredients[] = {{"iron_bar", 10}, {"antique", 2}, {"goldbarunmarked", 1}}; // = 893,330 GBP
			product = "muzzle_snds_338_sand";
			condition = "PHX_PrestigeLevel >= 6";
		};
		class optic_DMS {
			icon = ROOT("\a3\Weapons_F_Exp\Acc\Data\UI\icon_muzzle_snds_65_TI_blk_F_ca.paa", false);
			fullName = "DMS";
			name = "DMS";
			time = 200;
			level = 30;
			ingredients[] = {{"cut_diamond", 10}, {"copper_bar", 15}, {"glass", 5}, {"cut_opal", 2}}; // = 113,040 GBP
			product = "optic_DMS";
			condition = "true";
		};
		class optic_AMS {
			icon = ROOT("\a3\Weapons_F_Exp\Acc\Data\UI\icon_muzzle_snds_65_TI_blk_F_ca.paa", false);
			fullName = "AMS (Black)";
			name = "AMS (Black)";
			time = 400;
			level = 35;
			ingredients[] = {{"cut_diamond", 15}, {"aluminium", 15}, {"glass", 5}, {"cut_ruby", 2}}; // = 184,815 GBP
			product = "optic_AMS";
			condition = "PHX_PrestigeLevel >= 1 && PHX_DonatorLevel > 0";     // Black for Sponsors
		};        
		class optic_AMS_khk {
			icon = ROOT("\a3\Weapons_F_Exp\Acc\Data\UI\icon_muzzle_snds_65_TI_blk_F_ca.paa", false);
			fullName = "AMS (Khaki)";
			name = "AMS (Khaki)";
			time = 400;
			level = 35;
			ingredients[] = {{"cut_diamond", 15}, {"aluminium", 15}, {"glass", 5}, {"cut_ruby", 2}}; // = 184,815 GBP
			product = "optic_AMS_khk";
			condition = "PHX_PrestigeLevel >= 1";
		};
		class optic_LRPS {
			icon = ROOT("\a3\Weapons_F_Exp\Acc\Data\UI\icon_muzzle_snds_65_TI_blk_F_ca.paa", false);
			fullName = "LRPS";
			name = "LRPS";
			time = 600;
			level = 40;
			ingredients[] = {{"cut_diamond", 15}, {"iron_bar", 10}, {"glass", 10}, {"cut_emerald", 3}}; // = 262,960 GBP
			product = "optic_LRPS";
			condition = "PHX_PrestigeLevel >= 2";
		};
	};
};
