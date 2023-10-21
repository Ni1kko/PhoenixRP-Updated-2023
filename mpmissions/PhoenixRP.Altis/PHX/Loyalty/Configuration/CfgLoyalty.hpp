#define ROOT(dir, root) #[dir, root] call PHX_fnc_iconDir

class CfgLoyalty {
	class Rewards {
		class Money {
			title = "Money Reward";
			picture = ROOT("data\perks\sweetTalker.paa", true);
			uniquePicture = false;
			valFormat = "£%1";
			onClaim = "[_value, 0, 1, 'Loyalty Reward'] call PHX_fnc_handleMoney";
		};
		class XP {
			title = "XP Reward";
			picture = ROOT("data\ui\xp.paa", true);
			uniquePicture = false;
			valFormat = "%1 XP";
			onClaim = "[_value, ""Loyalty Reward""] spawn PHX_fnc_handleXP";
		};
		class Virtual {
			title = "Virtual Item Reward";
			picture = ROOT("\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa", false);
			uniquePicture = true;
			valFormat = "%1";
			onClaim = "[""Loyalty Reward"", getPlayerUID player, '""""Virtual Item""""', format['""""%1""""', _value select 0], _value select 1, false] remoteExecCall ([""fnc_sendMail"", ""PHXSRV""] call SOCK_fnc_getRemoteDestination);";
		};
		class Physical {
			title = "Physical Item Reward";
			picture = ROOT("\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa", false);
			uniquePicture = true;
			valFormat = "%1";
			onClaim = "[""Loyalty Reward"", getPlayerUID player, '""""Physical Item""""', format['""""%1""""', _value select 0], _value select 1, false] remoteExecCall ([""fnc_sendMail"", ""PHXSRV""] call SOCK_fnc_getRemoteDestination);";
		};
		class Vehicle {
			title = "Vehicle Reward";
			picture = ROOT("\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\spaceGarage_ca.paa", false);
			uniquePicture = true;
			valFormat = "%1";
			onClaim = "[""Loyalty Reward"", getPlayerUID player, '""""Vehicle""""', format['""""%1""""', _value select 0], _value select 1, false] remoteExecCall ([""fnc_sendMail"", ""PHXSRV""] call SOCK_fnc_getRemoteDestination);";
		};
	};

	class Tiers {
		class One {
			condition = "_loyDays <= 8";
			rewards[] = {
				{"Money", {5000, 25000}, "_chance <= 50"},
				{"XP", {0, 250}, "true"}
			};
		};
		class Two {
			condition = "_loyDays <= 16";
			rewards[] = {
				{"Money", {25000, 50000}, "_chance <= 50"},
				{"XP", {250, 500}, "_chance <= 75"},
				{"Virtual", {"redgull", 1}, "true"}
				// {"Virtual", {"waterBottle", 1}, "true"}
			};
		};
		class Three {
			condition = "_loyDays <= 24";
			rewards[] = {
				{"Money", {50000, 100000}, "_chance <= 50"},
				{"XP", {500, 1000}, "_chance <= 85"},
				{"Virtual", {"redgull", 1}, "_chance <= 90"},
				{"Physical", {"Rangefinder", 1}, "_chance <= 95"},
				{"Vehicle", {"C_Kart_01_Blu_F", 0}, "true"}
			};
		};
		class Four {
			condition = "_loyDays <= 32";
			rewards[] = {
				{"Money", {100000, 125000}, "_chance <= 60"}, // changed from 50
				{"XP", {1000, 1250}, "_chance <= 75"}, // changed from 85
				{"Virtual", {"redgull", 1}, "_chance <= 85"}, // changed from 90
				{"Physical", {"Rangefinder", 1}, "_chance <= 90"}, // changed from 95
				{"Physical", {"G_Tactical_Clear", 1}, "_chance <= 95"}, // new - NV Glasses
				{"Vehicle", {"C_Kart_01_Blu_F", 0}, "true"}
			};
		};
		class Five {
			condition = "_loyDays <= 64";
			rewards[] = {
				{"Money", {125000, 140000}, "_chance <= 70"}, // changed from 50
				{"XP", {1250, 1500}, "_chance <= 75"}, // changed from 85
				{"Virtual", {"redgull", 1}, "_chance <= 85"}, // changed from 90
				{"Physical", {"Rangefinder", 1}, "_chance <= 90"}, // changed from 95
				{"Physical", {"G_Tactical_Clear", 1}, "_chance <= 95"}, // new - NV Glasses
				{"Vehicle", {"C_Kart_01_Blu_F", 0}, "true"}
			};
		};
		class Six {
			condition = "_loyDays <= 100";
			rewards[] = {
				{"Money", {140000, 150000}, "_chance <= 70"},
				{"XP", {1500, 2000}, "_chance <= 75"},
				{"Virtual", {"redgull", 1}, "_chance <= 80"},
				{"Virtual", {"cigarette", 1}, "_chance <= 85"},
				{"Physical", {"Rangefinder", 1}, "_chance <= 90"},
				{"Physical", {"G_Tactical_Clear", 1}, "_chance <= 95"}, // new - NV Glasses
				{"Vehicle", {"C_Kart_01_Blu_F", 0}, "true"}
			};
		};
		class Seven {
			condition = "true";
			rewards[] = {
				{"Money", {140000, 150000}, "_chance <= 70"},
				{"XP", {2000, 3000}, "_chance <= 75"},
				{"Virtual", {"vodka", 1}, "_chance <= 80"},
				{"Virtual", {"redgull", 1}, "_chance <= 85"},
				{"Virtual", {"weedCoffee", 1}, "_chance <= 90"},
				{"Physical", {"Rangefinder", 1}, "_chance <= 95"},
				{"Physical", {"G_Tactical_Clear", 1}, "_chance <= 95"}, // new - NV Glasses
				{"Vehicle", {"C_Kart_01_Blu_F", 0}, "true"}
			};
		};
	};
};