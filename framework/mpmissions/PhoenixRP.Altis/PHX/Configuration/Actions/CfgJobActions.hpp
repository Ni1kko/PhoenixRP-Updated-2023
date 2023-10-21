/*
	@File: CfgJOB.hpp
	@Author: Jack "Scarso" Farhall & Lewis Mackinnon
	@Description: Configures the contents of all map inits.
*/

class newsteam {
	actions[] = {
		{ "<t color='#b4a7d6'>[CIV]</t> License Store", "PHX_fnc_openLicenses", {"news"}, "playerSide isEqualTo civilian", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Check In", "PHX_fnc_jobHandling", {"News","true"}, "playerSide isEqualTo civilian && { !(player getVariable [""isNEW"", false]) } && { license_civ_news }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Check Out", "PHX_fnc_jobHandling", {"News","false"}, "playerSide isEqualTo civilian && { (player getVariable [""isNEW"", false]) }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> General Market", "life_fnc_virt_menu", "general_market", "playerSide isEqualTo civilian && { (player getVariable [""isNEW"", false]) }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> General Store", "life_fnc_weaponShopMenu", "general_store", "playerSide isEqualTo civilian && { (player getVariable [""isNEW"", false]) }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Clothing Store", "life_fnc_clothingMenu", "news_clothing", "playerSide isEqualTo civilian && { (player getVariable [""isNEW"", false]) }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Vehicle Store", "life_fnc_vehicleShopMenu", {"civ_news","civilian",{"civ_newscar_Kavala","civ_newscar_Kavala_1"},"civ","Vehicle Store"}, "(playerSide isEqualTo civilian && license_civ_driver) && { (player getVariable [""isNEW"", false]) }", 5 },
		{ "<t color='#ADFF2F'>[ATM]</t> Cashpoint", "PHX_fnc_atmMenu", "", "playerSide isEqualTo civilian && { (player getVariable [""isNEW"", false]) }", 5 }
	};
};
class lawyer_kavala {
	actions[] = {
		{ "<t color='#b4a7d6'>[CIV]</t> License Store", "PHX_fnc_openLicenses", {"lawyer"}, "playerSide isEqualTo civilian", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Check In", "PHX_fnc_jobHandling", {"Lawyer","true"}, "playerSide isEqualTo civilian && { !(player getVariable [""isLAW"", false]) } && { license_civ_lawyer }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Check Out", "PHX_fnc_jobHandling", {"Lawyer","false"}, "playerSide isEqualTo civilian && { (player getVariable [""isLAW"", false]) }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Check In", "PHX_fnc_jobHandling", {"Judge","true"}, "playerSide isEqualTo civilian && { !(player getVariable [""isJUDGE"", false]) } && { PHX_isJudge }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Check Out", "PHX_fnc_jobHandling", {"Judge","false"}, "playerSide isEqualTo civilian && { (player getVariable [""isJUDGE"", false]) }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> General Market", "life_fnc_virt_menu", "general_market", "playerSide isEqualTo civilian && { (player getVariable [""isLAW"", false]) }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> General Store", "life_fnc_weaponShopMenu", "general_store", "playerSide isEqualTo civilian && { (player getVariable [""isLAW"", false]) }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Clothing Store", "life_fnc_clothingMenu", "lawyer_clothing", "playerSide isEqualTo civilian && { (player getVariable [""isLAW"", false]) }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Vehicle Store", "life_fnc_vehicleShopMenu", {"civ_lawyer","civilian",{"civ_car_spawn_lawyer_1"},"civ","Vehicle Store"}, "(playerSide isEqualTo civilian && license_civ_driver) && { (player getVariable [""isLAW"", false]) }", 5 },
		{ "<t color='#ADFF2F'>[ATM]</t> Cashpoint", "PHX_fnc_atmMenu", "", "playerSide isEqualTo civilian && { (player getVariable [""isLaw"", false]) }", 5 }
	};
};
class lawyer_athira {
	actions[] = {
		{ "<t color='#b4a7d6'>[CIV]</t> License Store", "PHX_fnc_openLicenses", {"lawyer"}, "playerSide isEqualTo civilian", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Check In", "PHX_fnc_jobHandling", {"Lawyer","true"}, "playerSide isEqualTo civilian && { !(player getVariable [""isLAW"", false]) } && { license_civ_lawyer }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Check Out", "PHX_fnc_jobHandling", {"Lawyer","false"}, "playerSide isEqualTo civilian && { (player getVariable [""isLAW"", false]) }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Check In Judge", "PHX_fnc_jobHandling", {"Judge","true"}, "playerSide isEqualTo civilian && { !(player getVariable [""isJUDGE"", false]) } && { PHX_isJudge }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Check Out Judge", "PHX_fnc_jobHandling", {"Judge","false"}, "playerSide isEqualTo civilian && { (player getVariable [""isJUDGE"", false]) }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> General Market", "life_fnc_virt_menu", "general_market", "playerSide isEqualTo civilian && { (player getVariable [""isLAW"", false]) }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> General Store", "life_fnc_weaponShopMenu", "general_store", "playerSide isEqualTo civilian && { (player getVariable [""isLAW"", false]) }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Clothing Store", "life_fnc_clothingMenu", "lawyer_clothing", "playerSide isEqualTo civilian && { (player getVariable [""isLAW"", false]) }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Vehicle Store", "life_fnc_vehicleShopMenu", {"civ_lawyer","civilian",{"civ_car_spawn_lawyer_2"},"civ","Vehicle Store"}, "(playerSide isEqualTo civilian && license_civ_driver) && { (player getVariable [""isLAW"", false]) }", 5 },
		{ "<t color='#ADFF2F'>[ATM]</t> Cashpoint", "PHX_fnc_atmMenu", "", "playerSide isEqualTo civilian && { (player getVariable [""isLaw"", false]) }", 5 }
	};
};
class taximan_hq {
	actions[] = {
		{ "<t color='#b4a7d6'>[CIV]</t> License Store", "PHX_fnc_openLicenses", {"taximan"}, "playerSide isEqualTo civilian", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Check In", "PHX_fnc_jobHandling", {"Taxi","true"}, "playerSide isEqualTo civilian && { !(player getVariable [""isTAX"", false]) } && { license_civ_taximan }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Check Out", "PHX_fnc_jobHandling", {"Taxi","false"}, "playerSide isEqualTo civilian && { (player getVariable [""isTAX"", false]) }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> General Market", "life_fnc_virt_menu", "general_market", "playerSide isEqualTo civilian && { (player getVariable [""isTAX"", false]) }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> General Store", "life_fnc_weaponShopMenu", "general_store", "playerSide isEqualTo civilian && { (player getVariable [""isTAX"", false]) }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Clothing Store", "life_fnc_clothingMenu", "taxi_clothing", "playerSide isEqualTo civilian && { (player getVariable [""isTAX"", false]) }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Vehicle Store", "life_fnc_vehicleShopMenu", {"civ_taxi","civilian",{"civ_car_spawn_taxi_1","civ_car_spawn_taxi_2"},"civ","Vehicle Store"}, "(playerSide isEqualTo civilian && license_civ_driver) && { (player getVariable [""isTAX"", false]) }", 5 },
		{ "<t color='#ADFF2F'>[ATM]</t> Cashpoint", "PHX_fnc_atmMenu", "", "playerSide isEqualTo civilian && { (player getVariable [""isTax"", false]) }", 5 }
	};
};
class taximan_kavala {
	actions[] = {
		{ "<t color='#b4a7d6'>[CIV]</t> Check In", "PHX_fnc_jobHandling", {"Taxi","true"}, "playerSide isEqualTo civilian && { !(player getVariable [""isTAX"", false]) } && { license_civ_taximan }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Check Out", "PHX_fnc_jobHandling", {"Taxi","false"}, "playerSide isEqualTo civilian && { (player getVariable [""isTAX"", false]) }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> General Market", "life_fnc_virt_menu", "general_market", "playerSide isEqualTo civilian && { (player getVariable [""isTAX"", false]) }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> General Store", "life_fnc_weaponShopMenu", "general_store", "playerSide isEqualTo civilian && { (player getVariable [""isTAX"", false]) }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Clothing Store", "life_fnc_clothingMenu", "taxi_clothing", "playerSide isEqualTo civilian && { (player getVariable [""isTAX"", false]) }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Vehicle Store", "life_fnc_vehicleShopMenu", {"civ_taxi","civilian",{"civ_car_spawn_taxi_3","civ_car_spawn_taxi_4"},"civ","Vehicle Store"}, "(playerSide isEqualTo civilian && license_civ_driver) && { (player getVariable [""isTAX"", false]) }", 5 },
		{ "<t color='#ADFF2F'>[ATM]</t> Cashpoint", "PHX_fnc_atmMenu", "", "playerSide isEqualTo civilian && { (player getVariable [""isTax"", false]) }", 5 }
	};
};
class taximan_sofia {
	actions[] = {
		{ "<t color='#b4a7d6'>[CIV]</t> Check In", "PHX_fnc_jobHandling", {"Taxi","true"}, "playerSide isEqualTo civilian && { !(player getVariable [""isTAX"", false]) } && { license_civ_taximan }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Check Out", "PHX_fnc_jobHandling", {"Taxi","false"}, "playerSide isEqualTo civilian && { (player getVariable [""isTAX"", false]) }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> General Market", "life_fnc_virt_menu", "general_market", "playerSide isEqualTo civilian && { (player getVariable [""isTAX"", false]) }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> General Store", "life_fnc_weaponShopMenu", "general_store", "playerSide isEqualTo civilian && { (player getVariable [""isTAX"", false]) }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Clothing Store", "life_fnc_clothingMenu", "taxi_clothing", "playerSide isEqualTo civilian && { (player getVariable [""isTAX"", false]) }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Vehicle Store", "life_fnc_vehicleShopMenu", {"civ_taxi","civilian",{"civ_car_spawn_taxi_5","civ_car_spawn_taxi_6"},"civ","Vehicle Store"}, "(playerSide isEqualTo civilian && license_civ_driver) && { (player getVariable [""isTAX"", false]) }", 5 },
		{ "<t color='#ADFF2F'>[ATM]</t> Cashpoint", "PHX_fnc_atmMenu", "", "playerSide isEqualTo civilian && { (player getVariable [""isTax"", false]) }", 5 }
	};
};
class service {
	actions[] = {
		{ "<t color='#b4a7d6'>[CIV]</t> License Store", "PHX_fnc_openLicenses", {"repair"}, "playerSide isEqualTo civilian", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Check In", "PHX_fnc_jobHandling", {"Mechanic","true"}, "playerSide isEqualTo civilian && { !(player getVariable [""isSER"", false]) } && { license_civ_repair }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Check Out", "PHX_fnc_jobHandling", {"Mechanic","false"}, "playerSide isEqualTo civilian && { (player getVariable [""isSER"", false]) }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> General Market", "life_fnc_virt_menu", "general_market", "playerSide isEqualTo civilian && { (player getVariable [""isSER"", false]) }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> General Store", "life_fnc_weaponShopMenu", "general_store", "playerSide isEqualTo civilian && { (player getVariable [""isSER"", false]) }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Clothing Store", "life_fnc_clothingMenu", "repair_clothing", "playerSide isEqualTo civilian && { (player getVariable [""isSER"", false]) }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Vehicle Store", "life_fnc_vehicleShopMenu", {"civ_repair","civilian",{"civ_car_spawn_repair"},"civ","Vehicle Store"}, "(playerSide isEqualTo civilian && license_civ_driver) && { (player getVariable [""isSER"", false]) }", 5 },
		{ "<t color='#ADFF2F'>[ATM]</t> Cashpoint", "PHX_fnc_atmMenu", "", "playerSide isEqualTo civilian && { (player getVariable [""isSer"", false]) }", 5 }
	};
};
class service2 {
	actions[] = {
		{ "<t color='#b4a7d6'>[CIV]</t> License Store", "PHX_fnc_openLicenses", {"repair"}, "playerSide isEqualTo civilian", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Check In", "PHX_fnc_jobHandling", {"Mechanic","true"}, "playerSide isEqualTo civilian && { !(player getVariable [""isSER"", false]) } && { license_civ_repair }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Check Out", "PHX_fnc_jobHandling", {"Mechanic","false"}, "playerSide isEqualTo civilian && { (player getVariable [""isSER"", false]) }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> General Market", "life_fnc_virt_menu", "general_market", "playerSide isEqualTo civilian && { (player getVariable [""isSER"", false]) }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> General Store", "life_fnc_weaponShopMenu", "general_store", "playerSide isEqualTo civilian && { (player getVariable [""isSER"", false]) }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Clothing Store", "life_fnc_clothingMenu", "repair_clothing", "playerSide isEqualTo civilian && { (player getVariable [""isSER"", false]) }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Vehicle Store", "life_fnc_vehicleShopMenu", {"civ_repair","civilian",{"civ_car_spawn_repair_1"},"civ","Vehicle Store"}, "(playerSide isEqualTo civilian && license_civ_driver) && { (player getVariable [""isSER"", false]) }", 5 },
		{ "<t color='#ADFF2F'>[ATM]</t> Cashpoint", "PHX_fnc_atmMenu", "", "playerSide isEqualTo civilian && { (player getVariable [""isSer"", false]) }", 5 }
	};
};
class so1House {
	actions[] = {
		{ "<t color='#b4a7d6'>[CIV]</t> Check In", "PHX_fnc_jobHandling", {"SO1","true"}, "playerSide isEqualTo civilian && { !(player getVariable [""isSO1"", false]) } && { license_civ_so1 }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Check Out", "PHX_fnc_jobHandling", {"SO1","false"}, "playerSide isEqualTo civilian && { (player getVariable [""isSO1"", false]) }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> General Market", "life_fnc_virt_menu", "so1_market", "playerSide isEqualTo civilian && { (player getVariable [""isSO1"", false]) }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Equipment Store", "life_fnc_weaponShopMenu", "so1_equipment", "playerSide isEqualTo civilian && { (player getVariable [""isSO1"", false]) }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Clothing Store", "life_fnc_clothingMenu", "so1_clothing", "playerSide isEqualTo civilian && { (player getVariable [""isSO1"", false]) }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Clothing Store", "life_fnc_clothingMenu", "governor_clothing", "playerSide isEqualTo civilian && { (player getVariable [""isPM"", false]) }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Vehicle Store", "life_fnc_vehicleShopMenu", {"car_so1","civilian",{"civ_car_spawn_so1_house_1","civ_car_spawn_so1_house_2"},"civ","Vehicle Store"}, "(playerSide isEqualTo civilian && license_civ_driver) && { (player getVariable [""isSO1"", false]) }", 5 },
		{ "<t color='#ADFF2F'>[ATM]</t> Cashpoint", "PHX_fnc_atmMenu", "", "playerSide isEqualTo civilian && { (player getVariable [""isSO1"", false]) }", 5 }
	};
};
class so1Offices {
	actions[] = {
		{ "<t color='#b4a7d6'>[CIV]</t> Check In", "PHX_fnc_jobHandling", {"SO1","true"}, "playerSide isEqualTo civilian && { !(player getVariable [""isSO1"", false]) } && { license_civ_so1 }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Check Out", "PHX_fnc_jobHandling", {"SO1","false"}, "playerSide isEqualTo civilian && { (player getVariable [""isSO1"", false]) }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> General Market", "life_fnc_virt_menu", "so1_market", "playerSide isEqualTo civilian && { (player getVariable [""isSO1"", false]) }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Equipment Store", "life_fnc_weaponShopMenu", "so1_equipment", "playerSide isEqualTo civilian && { (player getVariable [""isSO1"", false]) }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Clothing Store", "life_fnc_clothingMenu", "so1_clothing", "playerSide isEqualTo civilian && { (player getVariable [""isSO1"", false]) }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Clothing Store", "life_fnc_clothingMenu", "governor_clothing", "playerSide isEqualTo civilian && { (player getVariable [""isPM"", false]) }", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Vehicle Store", "life_fnc_vehicleShopMenu", {"car_so1","civilian",{"civ_car_spawn_so1_offices"},"civ","Vehicle Store"}, "(playerSide isEqualTo civilian && license_civ_driver) && { (player getVariable [""isSO1"", false]) }", 5 },
		{ "<t color='#ADFF2F'>[ATM]</t> Cashpoint", "PHX_fnc_atmMenu", "", "playerSide isEqualTo civilian && { (player getVariable [""isSO1"", false]) }", 5 }
	};
};
class so1Air {
	actions[] = {
		{ "<t color='#b4a7d6'>[CIV]</t> Vehicle Store", "life_fnc_vehicleShopMenu", {"air_so1","civilian",{"civ_air_spawn_so1"},"civ","Vehicle Store"}, "(playerSide isEqualTo civilian && license_civ_pilot) && { (player getVariable [""isSO1"", false]) }", 5 }
	};
};
