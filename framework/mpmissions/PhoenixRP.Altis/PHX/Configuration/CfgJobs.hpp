/*
uniform[] = {
	"U_C_Journalist",  // Uniform
	"H_Cap_press", // Headgear
	"V_Press_F",  // Vest
	"B_Messenger_Black_F", // Backpack
	{}, // Uniform Items
	{}, // Vest Items
	{}, // Backpack Items
	{"ItemMap", "ItemCompass", "ItemRadio", "ItemWatch", "ItemGPS"}, // General Items
	{} // Virtual Items
};
*/

class CfgJobs {
	class News {
		title = "News Presenter";
		short = "NEW";
		isGroup = false;
		uniform[] = {
			"U_C_Journalist", "H_Cap_press", "V_Press_F", "B_Messenger_Black_F",
			{},
			{},
			{},
			{"ItemMap", "ItemCompass", "ItemRadio", "ItemWatch", "ItemGPS"},
			{}
		};
	};

	class Lawyer {
		title = "Lawyer";
		short = "LAW";
		isGroup = false;
		uniform[] = {
			"U_NikosAgedBody", "H_Hat_brown", "", "",
			{},
			{},
			{},
			{"ItemMap", "ItemCompass", "ItemRadio", "ItemWatch", "ItemGPS"},
			{}
		};
	};

	class Judge {
		title = "Judge";
		short = "JUDGE";
		isGroup = false;
		uniform[] = {
			"U_C_Uniform_Scientist_01_F", "H_Beret_gen_F", "", "",
			{},
			{},
			{},
			{"ItemMap", "ItemCompass", "ItemRadio", "ItemWatch", "ItemGPS"},
			{}
		};
	};

	class Taxi {
		title = "Taximan";
		short = "TAX";
		isGroup = false;
		uniform[] = {
			"U_Rangemaster", "", "", "",
			{},
			{},
			{},
			{"ItemMap", "ItemCompass", "ItemRadio", "ItemWatch", "ItemGPS"},
			{}
		};
	};

	class Mechanic {
		title = "Mechanic";
		short = "SER";
		isGroup = false;
		uniform[] = {
			"U_C_ConstructionCoverall_Blue_F", "H_Construction_earprot_yellow_F", "V_Safety_yellow_F", "",
			{},
			{},
			{"toolkit"},
			{"ItemMap", "ItemCompass", "ItemRadio", "ItemWatch", "ItemGPS"},
			{}
		};
	};

	class SO1 {
		title = "SO1 Officer";
		short = "SO1";
		isGroup = true;
		uniform[] = {
			"U_Marshal", "H_Cap_blk", "V_PlateCarrier2_blk", "B_Carryall_cbr",
			{},
			{},
			{"toolkit"},
			{"ItemMap", "ItemCompass", "ItemRadio", "ItemWatch", "ItemGPS"},
			{}
		};
	};
};
