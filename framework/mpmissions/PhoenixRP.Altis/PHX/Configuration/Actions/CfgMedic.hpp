/*
	@File: CfgNHS.hpp
	@Author: Jack "Scarso" Farhall & Lewis Mackinnon
	@Description: Configures the contents of all map inits.
*/

// NHS General Stores
class nhsGeneral {
	actions[] = {
		{ "<t color='#007ac3'>[NHS]</t> Item Market", "life_fnc_virt_menu", "nhs_market", "playerSide isEqualTo independent", 5 },
		{ "<t color='#007ac3'>[NHS]</t> Clothing Store", "life_fnc_clothingMenu", "nhs_clothing", "playerSide isEqualTo independent", 5 },
		{ "<t color='#007ac3'>[NHS]</t> Equipment Store", "life_fnc_weaponShopMenu", "nhs_general_store", "playerSide isEqualTo independent", 5 },
		{ "<t color='#007ac3'>[NHS]</t> Get Response Mission", "PHX_fnc_getPatrol", "", "playerSide isEqualTo independent && { !PHX_DoingMission }", 5 },
		{ "<t color='#ADFF2F'>[ATM]</t> Cashpoint", "PHX_fnc_atmMenu", "", "playerSide isEqualTo independent", 5 }
	};
};

// NHS Vehicle Stores
class nhsCarKavala {
	actions[] = {
		{ "<t color='#007ac3'>[NHS]</t> Vehicle Store", "life_fnc_vehicleShopMenu", {"nhs_ground_store","independent",{"nhs_car_spawn_kavala_1","nhs_car_spawn_kavala_2"},"med","Vehicle Store"}, "playerSide isEqualTo independent", 5 }
	};
};
class nhsCarAthira {
	actions[] = {
		{ "<t color='#007ac3'>[NHS]</t> Vehicle Store", "life_fnc_vehicleShopMenu", {"nhs_ground_store","independent",{"nhs_car_spawn_athira_1","nhs_car_spawn_athira_2"},"med","Vehicle Store"}, "playerSide isEqualTo independent", 5 }
	};
};
class nhsCarPyrgos {
	actions[] = {
		{ "<t color='#007ac3'>[NHS]</t> Vehicle Store", "life_fnc_vehicleShopMenu", {"nhs_ground_store","independent",{"nhs_car_spawn_pyrgos_1","nhs_car_spawn_pyrgos_2"},"med","Vehicle Store"}, "playerSide isEqualTo independent", 5 }
	};
};
class nhsCarSpec {
	actions[] = {
		{ "<t color='#007ac3'>[NHS]</t> Vehicle Store", "life_fnc_vehicleShopMenu", {"nhs_ground_store","independent",{"apc_car_spawn_spec_1","apc_car_spawn_spec_2","apc_car_spawn_spec_3"},"med","Vehicle Store"}, "playerSide isEqualTo independent", 5 }
	};
};
class nhsAirKavala {
	actions[] = {
		{ "<t color='#007ac3'>[NHS]</t> Vehicle Store", "life_fnc_vehicleShopMenu", {"nhs_air_store","independent",{"nhs_air_spawn_kavala_1"},"med","Vehicle Store"}, "playerSide isEqualTo independent && call life_sarlevel >= 1", 5 }
	};
};
class nhsAirAthira {
	actions[] = {
		{ "<t color='#007ac3'>[NHS]</t> Vehicle Store", "life_fnc_vehicleShopMenu", {"nhs_air_store","independent",{"nhs_air_spawn_athira_1"},"med","Vehicle Store"}, "playerSide isEqualTo independent && call life_sarlevel >= 1", 5 }
	};
};
class nhsAirPyrgos {
	actions[] = {
		{ "<t color='#007ac3'>[NHS]</t> Vehicle Store", "life_fnc_vehicleShopMenu", {"nhs_air_store","independent",{"nhs_air_spawn_pyrgos_1"},"med","Vehicle Store"}, "playerSide isEqualTo independent && call life_sarlevel >= 1", 5 }
	};
};
class nhsAirSpec {
	actions[] = {
		{ "<t color='#007ac3'>[NHS]</t> Vehicle Store", "life_fnc_vehicleShopMenu", {"nhs_air_store","independent",{"apc_air_spawn_spec_1"},"med","Vehicle Store"}, "playerSide isEqualTo independent && call life_sarlevel >= 1", 5 }
	};
};
class nhsSeaSpec {
	actions[] = {
		{ "<t color='#007ac3'>[NHS]</t> Vehicle Store", "life_fnc_vehicleShopMenu", {"nhs_sea_store","independent",{"apc_sea_spawn_spec_2"},"med","Vehicle Store"}, "playerSide isEqualTo independent && call life_sarlevel >= 1", 5 }
	};
};