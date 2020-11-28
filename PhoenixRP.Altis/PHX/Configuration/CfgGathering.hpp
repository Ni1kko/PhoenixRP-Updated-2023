/*
	@File: CfgGathering.hpp
	@Author: Jack "Scarso" Farhall & Lewis Mackinnon
	@Description: Configures the settings behind the gather sites.
*/

class CfgFishing {
	fishingItems[] = {"salema_raw", "ornate_raw", "mackerel_raw", "tuna_raw", "mullet_raw", "catshark_raw"};
	fishingZones[] = { "fishing_zone_1", "fishing_zone_2", "fishing_zone_3", "fishing_zone_4", "fishing_zone_5" };
};

class CfgGathering {

	// Gather Sites
	class apple {
		text = "Gathering apples...";
		amount = 5; 
		zones[] = { "apple_field_1", "apple_field_2", "apple_field_3", "apple_field_4" };
		profession[] = { "Prof_Gathering", 0, 1, 50 };
		gathered = "apple";
		gems[] = {};
		item = "";
		zoneSize = 30;
		canUseDevice = false;
	};
	class peach {
		text = "Gathering peaches...";
		amount = 5; 
		zones[] = { "peach_field_1", "peach_field_2", "peach_field_3", "peach_field_4" };
		profession[] = { "Prof_Gathering", 0, 1, 50 };
		gathered = "peach";
		gems[] = {};
		item = "";
		zoneSize = 30;
		canUseDevice = false;
	};
	class corn {
		text = "Gathering corn...";
		amount = 3; 
		zones[] = { "corn_field" };
		profession[] = { "Prof_Gathering", 0, 1, 50 };
		gathered = "corn";
		gems[] = {};
		item = "";
		zoneSize = 30;
		canUseDevice = false;
	};
	class rock {
		text = "Gathering rocks...";
		amount = 3; 
		zones[] = { "prison_rocks", "havoc_prison_rocks" };
		profession[] = { "Prof_Gathering", 0, 1, 50 };
		gathered = "rock";
		gems[] = {};
		item = "";
		zoneSize = 5;
		canUseDevice = true;
	};
	class coral {
		text = "Gathering coral...";
		amount = 3; 
		zones[] = { "coral_reef" };
		profession[] = { "Prof_Gathering", 0, 1, 50 };
		gathered = "coral";
		gems[] = {};
		item = "";
		zoneSize = 30;
		canUseDevice = false;
	};
	class tobacco {
		text = "Gathering tobacco...";
		amount = 3; 
		zones[] = { "tobacco_field" };
		profession[] = { "Prof_Gathering", 0, 1, 50 };
		gathered = "tobacco";
		gems[] = {};
		item = "";
		zoneSize = 30;
		canUseDevice = false;
	};
	class weed {
		text = "Gathering weed...";
		amount = 3; 
		zones[] = { "weed_field" };
		profession[] = { "Prof_Gathering", 0, 1, 50 };
		gathered = "cannabis";
		gems[] = {};
		item = "";
		zoneSize = 30;
		canUseDevice = false;
	};
	class opium {
		text = "Gathering opium...";
		amount = 3; 
		zones[] = { "opium_field" };
		profession[] = { "Prof_Gathering", 0, 1, 50 };
		gathered = "heroin_unprocessed";
		gems[] = {};
		item = "";
		zoneSize = 30;
		canUseDevice = false;
	};
	class cocaine {
		text = "Gathering cocaine...";
		amount = 3; 
		zones[] = { "cocaine_field" };
		profession[] = { "Prof_Gathering", 0, 1, 50 };
		gathered = "cocaine_unprocessed";
		gems[] = {};
		item = "";
		zoneSize = 30;
		canUseDevice = false;
	};
	class ecstasy {
		text = "Gathering ecstasy...";
		amount = 3; 
		zones[] = { "ecstasy_field" };
		profession[] = { "Prof_Gathering", 0, 1, 50 };
		gathered = "sassafras";
		gems[] = {};
		item = "";
		zoneSize = 30;
		canUseDevice = false;
	};
	// Mining Sites
	class sand {
		text = "Mining sand...";
		amount = 5;
		zones[] = { "sand_mine" };
		profession[] = { "Prof_Mining", 0, 1, 50 };
		gathered = "sand";
		gems[] = {};
		item = "shovel";
		zoneSize = 30;
		canUseDevice = true;
	};
	class salt {
		text = "Mining salt...";
		amount = 5;
		zones[] = { "salt_mine" };
		profession[] = { "Prof_Mining", 0, 1, 50 };
		gathered = "unrefined_salt";
		gems[] = {};
		item = "pickaxe";
		zoneSize = 30;
		canUseDevice = true;
	};
	class copper {
		text = "Mining copper...";
		amount = 5;
		zones[] = { "copper_mine" };
		profession[] = { "Prof_Mining", 0, 1, 50 };
		gathered = "copper_ore";
		gems[] = { {"nothing","uncut_opal","uncut_sapphire","uncut_ruby","uncut_emerald","uncut_diamond"}, {0.75,0.12,0.08,0.04,0.01} };
		item = "pickaxe";
		zoneSize = 30;
		canUseDevice = true;
	};
	class silver {
		text = "Mining silver...";
		amount = 5;
		zones[] = { "silver_mine" };
		profession[] = { "Prof_Mining", 0, 1, 50 };
		gathered = "silver_ore";
		gems[] = { {"nothing","uncut_opal","uncut_sapphire","uncut_ruby","uncut_emerald","uncut_diamond"}, {0.75,0.12,0.08,0.04,0.01} };
		item = "pickaxe";
		zoneSize = 30;
		canUseDevice = true;
	};
	class iron {
		text = "Mining iron...";
		amount = 5;
		zones[] = { "iron_mine" };
		profession[] = { "Prof_Mining", 0, 1, 50 };
		gathered = "iron_ore";
		gems[] = { {"nothing","uncut_opal","uncut_sapphire","uncut_ruby","uncut_emerald","uncut_diamond"}, {0.75,0.12,0.08,0.04,0.01} };
		item = "pickaxe";
		zoneSize = 30;
		canUseDevice = true;
	};
	class aluminium {
		text = "Mining bauxite...";
		amount = 5;
		zones[] = { "aluminium_mine" };
		profession[] = { "Prof_Mining", 0, 1, 50 };
		gathered = "bauxite";
		gems[] = { {"nothing","uncut_opal","uncut_sapphire","uncut_ruby","uncut_emerald","uncut_diamond"}, {0.75,0.12,0.08,0.04,0.01} };
		item = "pickaxe";
		zoneSize = 30;
		canUseDevice = true;
	};
	class silicon {
		text = "Mining quartz...";
		amount = 5;
		zones[] = { "silicon_mine" };
		profession[] = { "Prof_Mining", 0, 1, 50 };
		gathered = "quartz";
		gems[] = { {"nothing","uncut_opal","uncut_sapphire","uncut_ruby","uncut_emerald","uncut_diamond"}, {0.75,0.12,0.08,0.04,0.01} };
		item = "pickaxe";
		zoneSize = 30;
		canUseDevice = true;
	};
	class diamond {
		text = "Mining diamond...";
		amount = 3;
		zones[] = { "diamond_mine" };
		profession[] = { "Prof_Mining", 0, 1, 50 };
		gathered = "uncut_diamond";
		gems[] = { {"nothing","uncut_opal","uncut_sapphire","uncut_ruby","uncut_emerald"}, {0.75,0.13,0.07,0.05} };
		item = "pickaxe";
		zoneSize = 30;
		canUseDevice = true;
	};
	class oil {
		text = "Mining oil...";
		amount = 3;
		zones[] = { "oil_field" };
		profession[] = { "Prof_Mining", 0, 1, 50 };
		gathered = "unrefined_oil";
		gems[] = { {"nothing","uncut_opal","uncut_sapphire","uncut_ruby","uncut_emerald"}, {0.75,0.12,0.08,0.04,0.01} };
		item = "pickaxe";
		zoneSize = 30;
		canUseDevice = true;
	};
	class uranium {
		text = "Mining uranium...";
		amount = 3;
		zones[] = { "uranium_mine" };
		profession[] = { "Prof_Mining", 0, 1, 50 };
		gathered = "uranium_ore";
		gems[] = {};
		item = "pickaxe";
		zoneSize = 30;
		canUseDevice = true;
	};
};
