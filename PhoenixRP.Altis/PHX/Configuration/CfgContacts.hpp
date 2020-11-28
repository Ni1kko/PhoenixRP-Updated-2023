class CfgContacts {
	class Police {
		title = "APC Dispatch";
		colour = "#316DFF";
		picture = "\a3\3den\Data\Displays\Display3DEN\PanelRight\side_west_ca.paa";
		comms = true;
		condition = "true";
		targets = "(side _x) isEqualTo west";
		priority = 20;
	};

	class NHS {
		title = "NHS Dispatch";
		colour = "#FFCC00";
		picture = "\a3\3den\Data\Displays\Display3DEN\PanelRight\side_guer_ca.paa";
		comms = true;
		condition = "true";
		targets = "(side _x) isEqualTo independent";
		priority = 21;
	};

	class HAVOC {
		title = "HAVOC Dispatch";
		colour = "#bf351a";
		picture = "\a3\3den\Data\Displays\Display3DEN\PanelRight\side_east_ca.paa";
		comms = true;
		condition = "true";
		targets = "(side _x) isEqualTo east";
		priority = 22;
	};

	class adminRequest {
		title = "Admin Request";
		colour = "#ffcefe";
		picture = "\a3\ui_f_curator\Data\Logos\arma3_curator_eye_64_ca.paa";
		comms = false;
		condition = "true";
		targets = "(_x getVariable ['isStaff', """"]) in [""Admin"", ""Moderator""]";
		priority = 31;
	};

	class adminBroadcast {
		title = "Staff Annoucement";
		colour = "#ffcefe";
		picture = "\a3\ui_f_curator\Data\Logos\arma3_curator_eye_64_ca.paa";
		comms = false;
		condition = "(call life_adminlevel) > 0";
		targets = "true";
		priority = 32;
	};

	class taxiRequest {
		title = "Taxi Request";
		colour = "#ffcefe";
		picture = "data\icons\ico_taxi.paa";
		comms = true;
		condition = "{_x getVariable ['isTax', false]} count playableUnits > 0";
		targets = "(side _x) isEqualTo civilian && {_x getVariable ['isTax', false]}";
		priority = 33;
	};

	class repairRequest {
		title = "Repair Request";
		colour = "#ffcefe";
		picture = "data\icons\ico_repair.paa";
		comms = true;
		condition = "{_x getVariable ['isSer', false]} count playableUnits > 0";
		targets = "(side _x) isEqualTo civilian && {_x getVariable ['isSer', false]}";
		priority = 34;
	};

	class lawyerRequest {
		title = "Lawyer Request";
		colour = "#ffcefe";
		picture = "data\icons\ico_lawyer.paa";
		comms = true;
		condition = "{_x getVariable ['isLaw', false]} count playableUnits > 0";
		targets = "(side _x) isEqualTo civilian && {_x getVariable ['isLaw', false]}";
		priority = 35;
	};

	class so1Request {
		title = "SO1 Protection Request";
		colour = "#ffcefe";
		picture = "data\icons\ico_so1.paa";
		comms = true;
		condition = "{_x getVariable ['isSO1', false]} count playableUnits > 0";
		targets = "side _x isEqualTo civilian && {_x getVariable ['isSO1', false]}";
		priority = 36;
	};

	class OAB {
		title = "Open Air Broadcast";
		colour = "#c8cecb";
		picture = "\a3\ui_f\Data\map\vehicleIcons\iconHelicopter_ca.paa";
		comms = true;
		condition = "(call life_coplevel) > 2 || {playerSide isEqualTo east}";
		targets = "!(isNull objectParent _x) && {vehicle _x isKindOf 'Air'}";
		priority = 37;
	};

	class OSB {
		title = "Open Sea Broadcast";
		colour = "#c8cecb";
		picture = "\a3\ui_f\Data\map\vehicleIcons\iconShip_ca.paa";
		comms = true;
		condition = "(call life_coplevel) > 2 || {playerSide isEqualTo east}";
		targets = "!(isNull objectParent _x) && {vehicle _x isKindOf 'Ship'}";
		priority = 38;
	};
};