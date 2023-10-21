class CfgStores {
	class fuelStation {
		name = "Fuel Station";
		increase = 1; // % increase each "sleep"
		time = 300; // time in ms / 100 = sleep
		reward[] = {30000, 50000};
		sideRequired = 2;
		condition = "playerSide isEqualTo civilian";
		fail = "[""You must be a civilian to rob this store"",""red""] spawn PHX_fnc_notify";
	};

	class localBank {
		name = "Local Bank";
		increase = 1; // % increase each "sleep"
		time = 300; // time in ms / 100 = sleep
		reward[] = {200000, 375000};
		sideRequired = 5;
		condition = "playerSide isEqualTo civilian";
		fail = "[""You must be a civilian to rob this bank"",""red""] spawn PHX_fnc_notify";
	};

	class cashHouse {
		name = "Cash House";
		increase = 1; // % increase each "sleep"
		time = 300; // time in ms / 100 = sleep
		reward[] = {250000, 425000};
		sideRequired = 5;
		condition = "playerSide isEqualTo civilian";
		fail = "[""You must be a civilian to rob this house"",""red""] spawn PHX_fnc_notify";
	};
};