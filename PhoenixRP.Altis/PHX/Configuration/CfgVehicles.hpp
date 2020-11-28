class CfgVehicleStores {
    // Civilian Dealerships
    class car_dealership {
        side = "civ";
        conditions = "(playerSide isEqualTo civilian && license_civ_driver) || { (player getVariable ['isCID', false]) || (player getVariable ['isHSS', false])}";
        vehicles[] = {
            { "B_Quadbike_01_F", "" }, // Quad Bike
            { "C_Hatchback_01_F", "" }, // Hatchback
            { "C_Offroad_01_F", "" }, // Offroad
            { "I_E_Offroad_01_covered_F", "" }, // Offroad Covered
            { "I_E_Offroad_01_comms_F", "PHX_DonatorLevel > 0" }, // Offroad Comms (Donator)
            { "C_Offroad_02_unarmed_F", "" }, // MB 4WD
            { "C_SUV_01_F", "" }, // SUV
            { "C_Hatchback_01_sport_F", "" }, // Hatchback (Sport)
			{ "C_Van_02_transport_F", "" } // Van Transport
        };
    };
    class truck_dealership {
        side = "civ";
        conditions = "(playerSide isEqualTo civilian && license_civ_trucking) || { (player getVariable ['isCID', false]) || (player getVariable ['isHSS', false])}";
        vehicles[] = {
            { "C_Tractor_01_F", "" }, // Tractor
            { "C_Van_02_transport_F", "" }, // Van Transport
            { "C_Van_02_vehicle_F", "" }, // Van (Cargo)
            { "C_Van_01_transport_F", "" }, // Truck
            { "C_Van_01_box_F", "" }, // Truck Boxer
			{ "C_Van_01_fuel_F", "" }, // Fuel Truck
            { "I_Truck_02_transport_F", "" }, // Zamak Transport
            { "I_Truck_02_covered_F", "" }, // Zamak Transport (Covered)
            { "I_Truck_02_ammo_F", "" }, // Zamak Ammo
            { "I_Truck_02_fuel_F", "" }, // Zamak Fuel
            { "O_Truck_03_transport_F", "" }, // Tempest Transport
            { "O_Truck_03_covered_F", "" }, // Tempest Transport (Covered)
            { "O_Truck_03_ammo_F", "" }, // Tempest Ammo
            { "O_Truck_03_fuel_F", "" }, // Tempest Fuel
            { "O_Truck_03_device_F", "" }, // Tempest (Device)
            { "B_Truck_01_flatbed_F", "" }, // HEMTT Flatbed
            { "B_Truck_01_cargo_F", "" }, // HEMTT Cargo
            { "B_Truck_01_transport_F", "" }, // HEMTT Transport
            { "B_Truck_01_covered_F", "" }, // HEMTT Transport (Covered)
            { "B_Truck_01_ammo_F", "" }, // HEMTT Ammo
            { "B_T_Truck_01_fuel_F", "" }, // HEMTT Fuel
            { "B_Truck_01_box_F", "" } // HEMTT Box
        };
    };
    class boat_dealership {
        side = "civ";
        conditions = "(playerSide isEqualTo civilian && license_civ_boat) || { (player getVariable ['isCID', false]) || (player getVariable ['isHSS', false])}";
        vehicles[] = {
            { "C_Scooter_Transport_01_F", "" }, // Water Scooter
            { "C_Rubberboat", "" }, // Rescue Boat
            { "C_Boat_Civil_01_F", "" }, // Motorboat
            { "C_Boat_Transport_02_F", "" }, // RHIB
            { "B_SDV_01_F", "license_civ_boat && license_civ_dive" } // SDV
        };
    };
    class international_dealership {
        side = "civ";
        conditions = "(playerSide isEqualTo civilian && license_civ_pilot) || { (player getVariable ['isCID', false]) || (player getVariable ['isHSS', false])}";
        vehicles[] = {
            { "C_Heli_Light_01_civil_F", "" }, // M-900
            { "B_Heli_Light_01_F", "" }, // MH-9 Hummingbird
            { "O_Heli_Light_02_unarmed_F", "" }, // PO-30 Orca (Unarmed)
            { "I_Heli_light_03_unarmed_F", "" }, // WY-55 Hellcat (Unarmed)
            { "O_Heli_Transport_04_F", "" }, // Mi-290 Taru
            { "O_Heli_Transport_04_bench_F", "" }, // Mi-290 Taru (Bench)
            { "O_Heli_Transport_04_covered_F", "" }, // Mi-290 Taru (Transport)
            { "O_Heli_Transport_04_box_F", "" }, // Mi-290 Taru (Cargo)
            { "O_Heli_Transport_04_ammo_F", "" }, // Mi-290 Taru (Ammo)
            { "O_Heli_Transport_04_fuel_F", "" }, // Mi-290 Taru (Fuel)
            { "B_Heli_Transport_03_unarmed_F", "" }, // CH-67 Huron (Unarmed)
            { "I_Heli_Transport_02_F", "" }, // CH-49 Mohawk
            { "B_T_VTOL_01_infantry_F", "" }, // V-44 X Blackfish (Infantry Transport)
            { "B_T_VTOL_01_vehicle_F", "" }, // V-44 X Blackfish (Vehicle Transport)
            { "C_Plane_Civil_01_F", "" }, // Caesar BTT
            { "C_Plane_Civil_01_racing_F", "" }, // Caesar BTT (Racing)
            { "I_Plane_Fighter_03_CAS_F", "" }, // A-143 Buzzard (CAS)
            { "I_Plane_Fighter_04_F", "" }, // A-149 Gryphon
            { "B_Plane_CAS_01_F", "" }, // A-164 Wipeout (CAS)
            { "B_Plane_Fighter_01_F", "" }, // F/A-181 Black Wasp II
            { "B_Plane_Fighter_01_Stealth_F", "" }, // F/A-181 Black Wasp II (Stealth)
            { "O_Plane_CAS_02_F", "" }, // To-199 Neophron (CAS)
            { "O_Plane_Fighter_02_F", "" }, // To-201 Shikra
            { "O_Plane_Fighter_02_Stealth_F", "" } // To-201 Shikra (Stealth)
        };
    };
    class karting_dealership {
        side = "civ";
        conditions = "(playerSide isEqualTo civilian && license_civ_karting) || { (player getVariable ['isCID', false]) || (player getVariable ['isHSS', false])}";
        vehicles[] = {
            { "C_Kart_01_Blu_F", "" }, // Kart (Bluking)
            { "C_Kart_01_Fuel_F", "" }, // Kart (Fuel)
            { "C_Kart_01_Red_F", "" }, // Kart (Redstone)
            { "C_Kart_01_Vrana_F", "" }, // Kart (Vrana)
            { "C_Kart_01_black_F", "" }, // Kart (Black)
            { "C_Kart_01_white_F", "" }, // Kart (White)
            { "C_Kart_01_green_F", "" }, // Kart (Green)
            { "C_Kart_01_orange_F", "" }, // Kart (Orange)
            { "C_Kart_01_yellow_F", "" }, // Kart (Yellow)
        };
    };
    class rebel_dealership {
        side = "civ";
        conditions = "(playerSide isEqualTo civilian && (license_civ_rebel || license_civ_PMC)) || { (player getVariable ['isCID', false]) || (player getVariable ['isHSS', false])}";
        vehicles[] = {
            { "C_SUV_01_F", "" }, // SUV
            { "C_Hatchback_01_sport_F", "" }, // Hatchback (Sport)
            { "B_G_Offroad_01_armed_F", "" }, // Offroad (Armed)
            { "I_C_Offroad_02_unarmed_F", "" }, // MB 4WD
            { "I_C_Offroad_02_LMG_F", "" }, // MB 4WD (LMG)
            { "O_LSV_02_unarmed_ghex_F", "" }, // Qilin (Unarmed)
            { "B_LSV_01_unarmed_F", "license_civ_PMC" }, // Prowler (Unarmed)
            { "B_CTRG_LSV_01_light_F", "license_civ_PMC" }, // Prowler (Light)
            { "O_MRAP_02_F", "" }, // Ifrit
            { "I_MRAP_03_F", "" }, // Strider
            { "B_Heli_Light_01_F", "" }, // MH-9 Hummingbird
            { "O_Heli_Light_02_unarmed_F", "" }, // PO-30 Orca (Unarmed)
            { "I_Heli_light_03_unarmed_F", "" }, // WY-55 Hellcat (Unarmed)
            { "O_Heli_Transport_04_F", "" }, // Mi-290 Taru
            { "O_Heli_Transport_04_bench_F", "" }, // Mi-290 Taru (Bench)
            { "O_Heli_Transport_04_covered_F", "" }, // Mi-290 Taru (Transport)
            { "O_Heli_Transport_04_box_F", "" }, // Mi-290 Taru (Cargo)
            { "O_Heli_Transport_04_ammo_F", "" }, // Mi-290 Taru (Ammo)
            { "O_Heli_Transport_04_fuel_F", "" }, // Mi-290 Taru (Fuel)
            { "B_Heli_Transport_01_camo_F", "" }, // UH-80 Ghost Hawk (Camo)
            { "O_T_VTOL_02_infantry_F", "" }, // Y-32 Xi'an (Infantry Transport)
            { "O_T_VTOL_02_vehicle_F", "" } // Y-32 Xi'an (Vehicle Transport
        };
    };

    // Civilian Jobs
    class civ_news {
        side = "civ";
        conditions = "license_civ_news";
        vehicles[] = {
            { "C_IDAP_Van_02_vehicle_F", "" } // Van Transport
        };
    };
    class civ_lawyer {
        side = "civ";
        conditions = "license_civ_lawyer";
        vehicles[] = {
            { "SUV_01_base_black_F", "" } // SUV
        };
    };
    class civ_taxi {
        side = "civ";
        conditions = "license_civ_taximan";
        vehicles[] = {
            { "SUV_01_base_grey_F", "" } // SUV
        };
    };
    class civ_repair {
        side = "civ";
        conditions = "license_civ_repair";
        vehicles[] = {
            { "C_Offroad_01_repair_F", "" }, // Offraod (Services)
		    { "C_Van_02_service_F", "" } // Van (Services)
        };
    };
    class car_so1 {
          side = "civ";
          conditions = "playerSide isEqualTo civilian && license_civ_SO1";
          vehicles[] = {
            { "SUV_01_base_red_F", "" } // SUV
        };
    };
    class air_so1 {
          side = "civ";
          conditions = "playerSide isEqualTo civilian && license_civ_SO1";
          vehicles[] = {
            { "C_Heli_light_01_blue_F", "" } // M-900
        };
    };

    // APC Stores
    class apc_ground_store {
        side = "cop";
        conditions = "playerSide isEqualTo west";
        vehicles[] = {
            // coplevel-1 | PCSO
            // coplevel-2 | PPC
            // coplevel-3 | Police Constable
            { "C_Hatchback_01_F", "call life_coplevel >= 3" }, // Hatchback
            { "C_SUV_01_F", "call life_coplevel >= 3" }, // SUV
            // coplevel-4 | Senior Police Constable
            { "C_Offroad_01_covered_F", "call life_coplevel >= 4" }, // Offroad (Covered)
            // coplevel-5 | Sergeant
            { "C_Hatchback_01_sport_F", "call life_coplevel >= 5 || call life_tpulevel >= 1 || call life_ctulevel >= 1" }, // Hatchback (Sport)
            { "B_GEN_Van_02_transport_F", "call life_coplevel >= 5" }, // Van Transport
            { "B_GEN_Van_02_vehicle_F", "call life_coplevel >= 5" }, // Van (Cargo)
            // coplevel-6 | Inspector
            // coplevel-7 | Chief Inspector
            // coplevel-8 | Commander
            // coplevel-9 | Superintendent
            { "B_LSV_01_unarmed_black_F", "call life_coplevel >= 9 || call life_tpulevel >= 2 || call life_ctulevel >= 1" }, // Prowler (Unarmed)
            // coplevel-10 | Chief Superintendent
            { "B_MRAP_01_F", "call life_coplevel >= 10 || call life_tpulevel >= 3 || call life_ctulevel >= 1" } // Hunter
            // coplevel-11 | Assistant Commissioner
            // coplevel-12 | Deputy Commissioner
            // coplevel-13 | Commissioner
        };
    };
    class apc_air_store {
        side = "cop";
        conditions = "playerSide isEqualTo west && call life_npaslevel >= 1";
        vehicles[] = {
            // npaslevel-1 | Tier 1 Pilot
            { "C_Heli_Light_01_civil_F", "call life_npaslevel >= 1" }, // M-900
            { "B_Heli_Light_01_F", "call life_npaslevel >= 1" }, // MH-9 Hummingbird
            { "I_Heli_light_03_unarmed_F", "call life_npaslevel >= 1" }, // WY-55 Hellcat (Unarmed)
            // npaslevel-2 | Tier 2 Pilot
            { "O_Heli_Light_02_unarmed_F", "call life_npaslevel >= 2"}, // PO-30 Orca (Unarmed)
            { "O_Heli_Transport_04_black_F", "call life_npaslevel >= 2" }, // Mi-290 Taru
            { "O_Heli_Transport_04_covered_black_F", "call life_npaslevel >= 2" }, // Mi-290 Taru (Transport)
            { "O_Heli_Transport_04_box_black_F", "call life_npaslevel >= 2" }, // Mi-290 Taru (Cargo)
            // npaslevel-3 | Tier 3 Pilot
            { "B_Heli_Transport_01_F", "call life_npaslevel >= 3"}, // UH-80 Ghost Hawk (Camo)
            { "B_Heli_Transport_03_unarmed_F", "call life_npaslevel >= 3"}, // CH-67 Huron (Unarmed)
            { "B_UAV_01_F", "call life_npaslevel >= 3"}, // AR-2 Darter
            // npaslevel-4 | Tier 4 Pilot
            { "I_Heli_light_03_F", "call life_npaslevel >= 4" }, // WY-55 Hellcat
            { "B_T_VTOL_01_infantry_F", "call life_npaslevel >= 4"}, // V-44 X Blackfish (Infantry Transport)
            { "B_T_VTOL_01_vehicle_F", "call life_npaslevel >= 4"} // V-44 X Blackfish (Vehicle Transport)
        };
    };
    class cop_sea_store {
        side = "cop";
        conditions = "playerSide isEqualTo west && call life_mpulevel >= 1";
        vehicles[] = {
            // life_mpulevel-1 | Marine Officer
            { "B_Boat_Transport_01_F", "call life_mpulevel >= 1" }, // Assault Boat
            { "C_Boat_Civil_01_police_F", "call life_mpulevel >= 1" }, // Motorboat (Police)
            { "B_G_Boat_Transport_02_F", "call life_mpulevel >= 1" }, // RHIB
            // life_mpulevel-2 | Advanced Marine Officer
            { "B_SDV_01_F", "call life_coplevel >= 2" }, // SDV
            { "C_Scooter_Transport_01_F", "call life_mpulevel >= 2" }, // Water Scooter
            // life_mpulevel-3 | Marine Trainer
            { "B_Boat_Armed_01_minigun_F", "call life_mpulevel >= 3" } // Speedboat Minigun
            // life_tpulevel-4 | Deputy/Chief
        };
    };

    // NHS Stores
    class nhs_ground_store {
        side = "med";
        conditions = "";
        vehicles[] = {
            // mediclevel-1 | Student
            { "C_Hatchback_01_F", "call life_medicLevel >= 1" }, // Hatchback
            { "C_SUV_01_F", "call life_medicLevel >= 1" }, // SUV
            { "C_Offroad_02_unarmed_F", "call life_medicLevel >= 1" }, // MB 4WD
            // mediclevel-2 | First Aider
            { "C_Van_02_medevac_F", "call life_medicLevel >= 2" }, // Van (Ambulance)
            // mediclevel-3 | Paramedic
            { "C_Hatchback_01_sport_F", "call life_medicLevel >= 3" } // Hatchback (Sport)
            // mediclevel-4 | Doctor
            // mediclevel-5 | General Practitioner
            // mediclevel-6 | Surgeon
            // mediclevel-7 | Consultant
            // mediclevel-8 | Chief Medical Officer
        };
    };
    class nhs_air_store {
        side = "med";
        conditions = "playerSide isEqualTo independent && call life_sarlevel >= 1";
        vehicles[] = {
            // sarlevel-1 | CAT-1
            { "C_Heli_Light_01_civil_F", "call life_sarlevel >= 1"}, // M-900
            { "B_Heli_Light_01_F", "call life_sarlevel >= 1"}, // MH-9 Hummingbird
            // sarlevel-2 | CAT-2
            { "O_Heli_Light_02_unarmed_F", "call life_sarlevel >= 2" }, // PO-30 Orca (Unarmed)
            // sarlevel-3 | CAT-3
            { "O_Heli_Transport_04_medevac_black_F", "call life_sarlevel >= 3"}, // Mi-290 Taru (Medical)
            // sarlevel-4 | CAT-4
            { "B_Heli_Transport_03_unarmed_green_F", "call life_sarlevel >= 4"}, // CH-67 Huron (Unarmed)
            // sarlevel-5 | CAT-5
            { "B_Heli_Transport_01_camo_F", "call life_sarlevel >= 5"} // UH-80 Ghost Hawk (Camo)
        };
    };
    class nhs_sea_store {
        side = "med";
        conditions = "playerSide isEqualTo independent && call life_sarlevel >= 1";
        vehicles[] = {
            // sarlevel-1 | CAT-1
            { "B_Boat_Transport_01_F", "call life_sarlevel >= 1" }, // Rescue Boat
            { "B_G_Boat_Transport_02_F", "call life_sarlevel >= 1" }  // Motorboat
            // sarlevel-2 | CAT-2
            // sarlevel-3 | CAT-3
            // sarlevel-4 | CAT-4
            // sarlevel-5 | CAT-5
        };
    };

    // HAVOC Stores
    class havoc_ground_store {
        side = "east";
        conditions = "playerSide isEqualTo east";
        vehicles[] = {
            // havoclevel-1 | Private
            { "I_Quadbike_01_F", "call life_havoclevel >= 1" }, // Quad Bike
            { "O_G_Offroad_01_F", "call life_havoclevel >= 1" }, // Offroad
            { "O_T_LSV_02_unarmed_black_F", "call life_havoclevel >= 1" }, // Qilin (Unarmed)
            { "C_Van_02_transport_F", "call life_havoclevel >= 1" }, // Van Transport
            { "O_Truck_03_covered_F", "call life_havoclevel >= 1" }, // Zamak Transport (Covered)
            { "I_E_Offroad_01_comms_F", "call life_havoclevel >= 1 || PHX_DonatorLevel > 0" }, // Offroad Comms
            // havoclevel-2 | Lance Corporal
            // havoclevel-3 | Corporal
            // havoclevel-4 | Sergeant
            // havoclevel-5 | Staff Sergeant
            { "I_MRAP_03_F", "call life_havoclevel >= 5 || call life_hsflevel >= 2" }, // Strider
            // havoclevel-6 | Warrant Officer
            { "I_G_Offroad_01_armed_F", "call life_havoclevel >= 6 || call life_hsflevel >= 2" }, // Offroad (Armed)
            // havoclevel-7 | 2nd Lieutenant
            // havoclevel-8 | Lieutenant
            // havoclevel-9 | Captain
            // havoclevel-10 | Brigadier
            // havoclevel-11 | Major
            { "I_LT_01_cannon_F", "call life_havoclevel >= 11"}, // AWC 304 Nyx (Autocannon)
            { "I_APC_Wheeled_03_cannon_F", "call life_havoclevel >= 11" }, // AFV-4 Gorgon
            { "O_T_LSV_02_armed_F", "call life_havoclevel >= 11" } // Qilin (Armed)
            // havoclevel-12 | Colonel
            // havoclevel-13 | General
        };
    };
    class havoc_air_store {
        side = "east";
        conditions = "playerSide isEqualTo east && call life_hadlevel >= 1";
        vehicles[] = {
            // hadlevel-1 | Tier 1 Pilot
            { "B_Heli_Light_01_stripped_F", "call life_hadlevel >= 1"}, // MH-9 Hummingbird
            // hadlevel-2 | Tier 2 Pilot
            { "I_Heli_light_03_unarmed_F", "call life_hadlevel >= 2" }, // WY-55 Hellcat (Unarmed)
            { "O_Heli_Light_02_unarmed_F", "call life_hadlevel >= 2" }, // PO-30 Orca (Unarmed)
            { "O_Heli_Transport_04_black_F", "call life_hadlevel >= 2" }, // Mi-290 Taru
            { "O_Heli_Transport_04_covered_black_F", "call life_hadlevel >= 2" }, // Mi-290 Taru (Transport)
            { "B_Heli_Transport_03_F", "call life_hadlevel >= 2" }, // CH-67 Huron (Unarmed)
            // hadlevel-3 | Tier 3 Pilot
            { "I_Heli_light_03_F", "call life_hadlevel >= 3" }, // WY-55 Hellcat
            { "O_T_VTOL_02_infantry_grey_F", "call life_hadlevel >= 3" }, // Y-32 Xi'an (Infantry Transport)
			{ "O_T_VTOL_02_vehicle_grey_F", "call life_hadlevel >= 3" }, // Y-32 Xi'an (Vehicle Transport)
            // hadlevel-4 | Tier 4 Pilot
            { "O_UAV_01_F", "call life_hadlevel >= 4" } // AR-2 Darter
        };
    };
    class havoc_sea_store {
        side = "east";
        conditions = "playerSide isEqualTo east && call life_hmulevel >= 1";
        vehicles[] = {
            // hmulevel-1 | HMU-1
            { "B_Boat_Transport_01_F", "call life_hmulevel >= 1" }, // Assault Boat
            // hmulevel-2 | HMU-2
            { "B_G_Boat_Transport_02_F", "call life_hmulevel >= 2" }, // RHIB
            { "B_SDV_01_F", "call life_hmulevel >= 2" }, // SDV
            // hmulevel-3 | HMU-3
            { "B_Boat_Armed_01_minigun_F", "call life_hmulevel >= 3" } // Sppedboat Minigun
        };
    };
};

class LifeCfgVehicles {
    class Default {
        vItemSpace = -1;
        conditions = "";
        isDonator = false;
        price = -1;
        textures[] = {};
    };

    // Karts
    class C_Kart_01_Blu_F {
        vItemSpace = 5;
        conditions = "";
        isDonator = false;
        price = 25000;
        textures[] = {};
    };

    class C_Kart_01_Fuel_F : C_Kart_01_Blu_F{};
    class C_Kart_01_Red_F : C_Kart_01_Blu_F{};
    class C_Kart_01_Vrana_F : C_Kart_01_Blu_F{};
    class C_Kart_01_black_F : C_Kart_01_Blu_F{};
    class C_Kart_01_white_F : C_Kart_01_Blu_F{};
    class C_Kart_01_green_F : C_Kart_01_Blu_F{};
    class C_Kart_01_orange_F : C_Kart_01_Blu_F{};
    class C_Kart_01_yellow_F : C_Kart_01_Blu_F{};

    // Cars
    class B_Quadbike_01_F { // Quad Bike
        vItemSpace = 25;
        conditions = "";
        isDonator = false;
        price = 5000;
        textures[] = {
            { "Brown", "cop", {"\A3\Soft_F\Quadbike_01\Data\Quadbike_01_co.paa"}, "" },
            { "Digi Desert", "reb", {"\A3\Soft_F\Quadbike_01\Data\quadbike_01_opfor_co.paa"}, "" },
            { "Black", "civ", {"\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa"}, "" },
            { "Blue", "civ", {"\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa"}, "" },
            { "Red", "civ", {"\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa"}, "" },
            { "White", "civ", {"\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa"}, "" },
            { "Digi Green", "civ", {"\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa"}, "" },
            { "Hunter Camo", "civ", {"\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa"}, "" },
            { "Donator", "civ", {"data\textures\Donator\Vehicles\Money.paa", "#(argb,8,8,3)color(0.05,0.05,0.05,1)"}, "PHX_DonatorLevel > 0" },
            { "Rebel Camo", "civ", {"\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa"}, "" },
            { "Red Gang Skin", "reb", {"data\textures\gangs\bases\gangred.paa"}, "['NE'] call PHX_fnc_ownsBase" },
            { "Green Gang Skin", "reb", {"data\textures\gangs\bases\ganggreen.paa"}, "['NW'] call PHX_fnc_ownsBase" },
            { "Blue Gang Skin", "reb", {"data\textures\gangs\bases\gangblue.paa"}, "['SW'] call PHX_fnc_ownsBase" }
        };
    };
    class I_Quadbike_01_F { // Quad Bike (HAVOC)
        vItemSpace = 25;
        conditions = "";
        isDonator = false;
        price = 5000;
        textures[] = {
            { "HAVOC Quad Bike", "havoc", {"data\textures\HAVOC\havocVehicleCamo.paa"}, "" }
		};
    };
    class C_Hatchback_01_F { // Hatchback
        vItemSpace = 40;
        conditions = "";
        isDonator = false;
        price = 10000;
        textures[] = {
            { "Beige", "civ", {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa"}, ""  },
            { "Green", "civ", {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa"}, ""  },
            { "Blue", "civ", {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa"}, ""  },
            { "Dark Blue", "civ", {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa"}, ""  },
            { "Yellow", "civ", {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa"}, ""  },
            { "White", "civ", {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07_co.paa"}, ""  },
            { "Grey", "civ", {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa"}, ""  },
            { "Black", "civ", {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa"}, ""  },
            { "Donator", "civ", {"data\textures\Donator\Vehicles\Money.paa"}, "PHX_DonatorLevel > 0" },
            { "Police Hatchback White", "cop", {"data\textures\Police\Vehicles\Police_Hatchback_White.paa"}, ""  },
            { "Police Hatchback Black ", "cop", {"data\textures\Police\Vehicles\Police_Hatchback_Black.paa"}, "call life_tpulevel >= 1 || call life_ctulevel >= 1"  },
            { "NHS Hatchback", "med", {"data\textures\Medic\Vehicles\nhs_hatchback.paa"}, ""  }
        };
    };
    class C_Offroad_01_F { // Offroad
        vItemSpace = 60;
        conditions = "";
        isDonator = false;
        price = 25000;
        textures[] = {
            { "Red", "civ", {"\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa", "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa"}, ""  },
            { "Yellow", "civ", {"\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa", "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa"}, ""  },
            { "White", "civ", {"\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa", "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa"}, ""  },
            { "Blue", "civ", {"\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa", "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa"}, ""  },
            { "Dark Red", "civ", {"\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa", "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa"}, ""  },
            { "Blue / White", "civ", {"\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa", "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa"}, ""  },
            { "Donator", "civ", {"data\textures\Donator\Vehicles\Money.paa", "#(argb,8,8,3)color(0.05,0.05,0.05,1)"}, "PHX_DonatorLevel > 0" },
            { "NCA Offroad", "OLD", {"\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa"}, ""  },
            { "Fire Offroad", "OLD", {"\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa"}, ""  },
            { "Guerilla Camo 1", "civ", {"\a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_01_co.paa","\a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_01_co.paa"}, ""  },
            { "Guerilla Camo 2", "civ", {"\a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_02_co.paa","\a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_02_co.paa"}, ""  },
            { "Guerilla Camo 3", "civ", {"\a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_03_co.paa","\a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_03_co.paa"}, ""  },
            { "Guerilla Camo 4", "civ", {"\a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_04_co.paa","\a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_04_co.paa"}, ""  },
            { "Guerilla Camo 5", "civ", {"\a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_05_co.paa","\a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_05_co.paa"}, ""  },
            { "Guerilla Camo 6", "civ", {"\a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_06_co.paa","\a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_06_co.paa"}, ""  },
            { "Guerilla Camo 7", "civ", {"\a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_07_co.paa","\a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_07_co.paa"}, ""  },
            { "Guerilla Camo 8", "civ", {"\a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_08_co.paa","\a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_08_co.paa"}, ""  },
            { "Guerilla Camo 9", "civ", {"\a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_09_co.paa","\a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_09_co.paa"}, ""  },
            { "Guerilla Camo 10", "civ", {"\a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_10_co.paa","\a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_10_co.paa"}, ""  },
            { "Guerilla Camo 11", "civ", {"\a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_11_co.paa","\a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_11_co.paa"}, ""  },
            { "Guerilla Camo 12", "civ", {"\a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_12_co.paa","\a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_12_co.paa"}, ""  }
        };
    };
    class I_E_Offroad_01_covered_F { // Offroad Covered
        vItemSpace = 90;
        conditions = "";
        isDonator = false;
        price = 45000;
        textures[] = {
            { "Green", "civ", {"\a3\soft_f_enoch\offroad_01\data\offroad_01_ext_grn_co.paa","\a3\soft_f_enoch\offroad_01\data\offroad_01_ext_grn_co.paa","\a3\soft_f_enoch\offroad_01\data\offroad_01_cover_grn_co.paa"}, ""  },
            { "EAF", "civ", {"\a3\soft_f_enoch\offroad_01\data\offroad_01_ext_eaf_co.paa","\a3\soft_f_enoch\offroad_01\data\offroad_01_ext_eaf_co.paa","\a3\soft_f_enoch\offroad_01\data\offroad_01_cover_eaf_co.paa"}, ""  },
            { "Park Ranger", "civ", {"\a3\soft_f_enoch\offroad_01\data\offroad_01_ext_ranger_co.paa","\a3\soft_f_enoch\offroad_01\data\offroad_01_ext_ranger_co.paa","\a3\soft_f_enoch\offroad_01\data\offroad_01_cover_ranger_co.paa"}, ""  },
            { "Donator", "civ", {"data\textures\Donator\Vehicles\Money.paa", "\a3\soft_f_enoch\offroad_01\data\offroad_01_ext_blk_co.paa", "data\textures\Donator\Vehicles\Money.paa"}, "PHX_DonatorLevel > 0" },
            { "Black (Donator)", "civ", {"\a3\soft_f_enoch\offroad_01\data\offroad_01_ext_blk_co.paa","\a3\soft_f_enoch\offroad_01\data\offroad_01_ext_blk_co.paa","\a3\soft_f_enoch\offroad_01\data\offroad_01_cover_blk_co.paa"}, "PHX_DonatorLevel > 0"  },
            { "HAVOC Offroad", "havoc", {"data\textures\HAVOC\havocVehicleCamo.paa", "\a3\soft_f_enoch\offroad_01\data\offroad_01_ext_blk_co.paa", "data\textures\HAVOC\havocVehicleCamo.paa"}, "" }
        };
    };
    class I_E_Offroad_01_comms_F { // Offroad Comms [DONATOR]
        vItemSpace = 90;
        conditions = "";
        isDonator = true;
        price = 45000;
        textures[] = {
            { "Black (Donator)", "civ", {"\a3\soft_f_enoch\offroad_01\data\offroad_01_ext_blk_co.paa","\a3\soft_f_enoch\offroad_01\data\offroad_01_ext_blk_co.paa","\a3\soft_f_enoch\offroad_01\data\offroad_01_cover_blk_co.paa"}, "PHX_DonatorLevel > 0"  },
            { "Green", "civ", {"\a3\soft_f_enoch\offroad_01\data\offroad_01_ext_grn_co.paa","\a3\soft_f_enoch\offroad_01\data\offroad_01_ext_grn_co.paa","\a3\soft_f_enoch\offroad_01\data\offroad_01_cover_grn_co.paa"}, ""  },
            { "EAF", "civ", {"\a3\soft_f_enoch\offroad_01\data\offroad_01_ext_eaf_co.paa","\a3\soft_f_enoch\offroad_01\data\offroad_01_ext_eaf_co.paa","\a3\soft_f_enoch\offroad_01\data\offroad_01_cover_eaf_co.paa"}, ""  },
            { "Park Ranger", "civ", {"\a3\soft_f_enoch\offroad_01\data\offroad_01_ext_ranger_co.paa","\a3\soft_f_enoch\offroad_01\data\offroad_01_ext_ranger_co.paa","\a3\soft_f_enoch\offroad_01\data\offroad_01_cover_ranger_co.paa"}, ""  },
            { "Donator", "civ", {"data\textures\Donator\Vehicles\Money.paa", "\a3\soft_f_enoch\offroad_01\data\offroad_01_ext_blk_co.paa", "\a3\soft_f_enoch\offroad_01\data\offroad_01_cover_blk_co.paa"}, "PHX_DonatorLevel > 0" }
        };
    };
    class C_Offroad_01_covered_F { // Offroad Covered [POLICE]
        vItemSpace = 90;
        conditions = "";
        isDonator = false;
        price = 45000;
        textures[] = {
            { "Police Offroad", "cop", {"data\textures\Police\Vehicles\police_offroad.paa","\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa","#(rgb,8,8,3)color(0.97,0.97,0.97,1)"}, "" }
        };
    };
    class C_Offroad_01_comms_F { // Offroad Comms [POLICE]
        vItemSpace = 90;
        conditions = "";
        isDonator = false;
        price = 45000;
        textures[] = {};
    };
    class C_Offroad_01_repair_F { // Offraod (Services)
        vItemSpace = 90;
        conditions = "";
        isDonator = false;
        price = 45000;
        textures[] = {};
    };
    class B_G_Offroad_01_armed_F { // Offroad (Armed)
        vItemSpace = 65;
        conditions = "";
        isDonator = false;
        price = 10000000;
        textures[] = {
            { "Red", "civ", {"\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa", "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa"}, ""  },
            { "Yellow", "civ", {"\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa", "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa"}, ""  },
            { "White", "civ", {"\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa", "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa"}, ""  },
            { "Blue", "civ", {"\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa", "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa"}, ""  },
            { "Dark Red", "civ", {"\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa", "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa"}, ""  },
            { "Blue / White", "civ", {"\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa", "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa"}, ""  },
            { "Donator", "civ", {"data\textures\Donator\Vehicles\Money.paa", "#(argb,8,8,3)color(0.05,0.05,0.05,1)"}, "PHX_DonatorLevel > 0" },
            { "NCA Offroad", "OLD", {"\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa"}, ""  },
            { "Fire Offroad", "OLD", {"\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa"}, ""  }
        };
    };
    class O_G_Offroad_01_F { // HAVOC Offroad
        vItemSpace = 60;
        conditions = "";
        isDonator = false;
        price = 25000;
        textures[] = {
            { "HAVOC Offroad", "havoc", {"data\textures\HAVOC\havocVehicleCamo.paa"}, "" }
        };
    };
    class I_G_Offroad_01_armed_F { // HAOVC Offroad (Armed)
        vItemSpace = 65;
        conditions = "";
        isDonator = false;
        price = 10000000;
        textures[] = {
            { "HAVOC Offroad (Armed)", "havoc", {"data\textures\HAVOC\havocVehicleCamo.paa"}, "" }
		};
    };
    class C_Offroad_02_unarmed_F { // MB 4WD
        vItemSpace = 60;
        conditions = "";
        isDonator = false;
        price = 30000;
        textures[] = {
            { "Black", "civ", {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_black_co.paa"}, ""  },
            { "Blue", "civ", {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_blue_co.paa"}, ""  },
            { "Green", "civ", {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_green_co.paa"}, ""  },
            { "Orange", "civ", {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_orange_co.paa"}, ""  },
            { "Red", "civ", {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_red_co.paa"}, ""  },
            { "White", "civ", {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_white_co.paa"}, ""  },
            { "Donator", "civ", {
                "data\textures\Donator\Vehicles\Money.paa",
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
                "#(argb,8,8,3)color(1,0.05,0.05,1)"
            }, "PHX_DonatorLevel > 0" },
			{ "NHS MB 4WD", "med", {"data\textures\Medic\Vehicles\nhs_mb4wd.paa"}, ""  }
        };
    };

    class I_C_Offroad_02_unarmed_F : C_Offroad_02_unarmed_F {};

    class I_C_Offroad_02_LMG_F { // MB 4WD (Armed)
        vItemSpace = 65;
        conditions = "";
        isDonator = false;
        price = 4500000;
        textures[] = {
            { "Black", "civ", {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_black_co.paa"}, ""  },
            { "Blue", "civ", {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_blue_co.paa"}, ""  },
            { "Green", "civ", {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_green_co.paa"}, ""  },
            { "Orange", "civ", {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_orange_co.paa"}, ""  },
            { "Red", "civ", {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_red_co.paa"}, ""  },
            { "White", "civ", {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_white_co.paa"}, ""  },
            { "Donator", "civ", {
                    "data\textures\Donator\Vehicles\Money.paa",
                    "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
                    "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
                    "#(argb,8,8,3)color(1,0.05,0.05,1)"
            }, "PHX_DonatorLevel > 0" }
        };
    };
    class C_SUV_01_F { // SUV
        vItemSpace = 50;
        conditions = "";
        isDonator = false;
        price = 75000;
        textures[] = {
            { "Dark Red", "OLD", {"\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa"}, "" },
            { "Silver", "OLD", {"\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa"}, "" },
            { "Orange", "OLD", {"\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa"}, "" },
            { "Orange", "OLD", {  "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa"}, "" },
            { "Black", "OLD", {"\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_02_co.paa"}, "" },
            { "Camo", "reb", {"data\textures\Civilian\Vehicles\camo_suv.paa"}, "" },
            { "Orange", "civ", {"\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa"}, "" },
            { "Black", "OLD", {"\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_02_co.paa"}, "" },
            { "Silver", "civ", {"\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa"}, "" },
            { "Dark Red", "civ", {"\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa"}, "" },
            { "Trippy", "civ", {"data\textures\Civilian\Vehicles\Trippy.paa"}, "" },
            { "Donator", "civ", {"data\textures\Donator\Vehicles\Money.paa"}, "PHX_DonatorLevel > 0" },
            { "NHS SUV", "med", {"data\textures\Medic\Vehicles\nhs_suv.paa"}, "" },
            { "Police SUV White", "cop", {"data\textures\Police\Vehicles\Police_SUV_White.paa"}, "" },
            { "Police SUV Black", "cop", {"data\textures\Police\Vehicles\Police_SUV_Black.paa"}, "call life_tpulevel >= 1 || call life_ctulevel >= 1" },
            { "Undercover SUV", "cop", {"\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_02_co.paa"}, "call life_coplevel >= 11 || call life_ctulevel >= 2" },
            { "First Crusade", "OLD", {"\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa"}, "['firstcrusade'] call PHX_fnc_inWhitelistGang"  },
            { "Barlow", "OLD", {"\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa"}, "['barlow'] call PHX_fnc_inWhitelistGang" },
            { "Rusty", "OLD", {"\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa"}, "['rusty'] call PHX_fnc_inWhitelistGang" },
            { "TITAN", "OLD", { "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa" }, "['titan'] call PHX_fnc_inWhitelistGang" },
            { "URA", "OLD", {"\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa"}, "['ura'] call PHX_fnc_inWhitelistGang" },
            { "ARR", "OLD", {"\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa"}, "['arr'] call PHX_fnc_inWhitelistGang" },
            { "APPA", "OLD", {"data\textures\gangs\appa\appa_suv.paa"}, "['appa'] call PHX_fnc_inWhitelistGang" },
            { "BIA", "OLD", {"\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa"}, "['bia'] call PHX_fnc_inWhitelistGang" },
            { "VENOM", "OLD", {"\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa"}, "['venom'] call PHX_fnc_inWhitelistGang" },
            { "Arcus", "OLD", {"\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa"}, "['arcus'] call PHX_fnc_inWhitelistGang" },
			{ "Hex", "civ", {"data\textures\Civilian\Vehicles\hex.paa"}, "" },
            { "Cherry", "civ", {"data\textures\Civilian\Vehicles\Prestige\SUV_Cherry.paa"}, "PHX_prestigeLevel >= 1" },
            { "Pastle", "civ", {"data\textures\Civilian\Vehicles\Prestige\SUV_Pastle.paa"}, "PHX_prestigeLevel >= 2" },
            { "Monster", "civ", {"data\textures\Civilian\Vehicles\Prestige\SUV_Monster.paa"}, "PHX_prestigeLevel >= 3" },
            { "Galaxy", "civ", {"data\textures\Civilian\Vehicles\Prestige\SUV_Galaxy.paa"}, "PHX_prestigeLevel >= 4" },
            { "Fade", "civ", {"data\textures\Civilian\Vehicles\Prestige\SUV_Fade.paa"}, "PHX_prestigeLevel >= 5" },
            { "Stickerbomb", "civ", {"data\textures\Civilian\Vehicles\Prestige\SUV_Stickerbomb.paa"}, "PHX_prestigeLevel >= 6" },
            { "Southpark", "civ", {"data\textures\Civilian\Vehicles\Prestige\SUV_Southpark.paa"}, "PHX_prestigeLevel >= 7" },
            { "Dark Camo", "civ", {"data\textures\Civilian\Vehicles\Prestige\SUV_DarkCamo.paa"}, "PHX_prestigeLevel >= 8" },
            { "Canada", "civ", {"data\textures\Civilian\Vehicles\Prestige\SUV_Canada.paa"}, "PHX_prestigeLevel >= 10" },
            { "Marka", "OLD", {"data\textures\gangs\marka\marka_suv.paa"}, "['marka'] call PHX_fnc_inWhitelistGang" },
            { "Matrix", "civ", {"data\textures\Civilian\Vehicles\Prestige\SUV_Matrix.paa"}, "PHX_prestigeLevel >= 1" },
            { "PBJ", "OLD", {"\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa"}, "['pbj', player] call PHX_fnc_inWhitelistGang" },
            { "Dynasty", "OLD", {"\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa"}, "['Dynasty', player] call PHX_fnc_inWhitelistGang" }
        };
    };
    class SUV_01_base_black_F { // SUV (Lawyer)
        vItemSpace = 50;
        conditions = "";
        isDonator = false;
        price = 0;
        textures[] = {
            { "Lawyer", "civ", {"\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_02_co.paa"}, "" }
        };
    };
    class SUV_01_base_grey_F { // SUV (Taximan)
        vItemSpace = 50;
        conditions = "";
        isDonator = false;
        price = 0;
        textures[] = {
            { "Taxi", "civ", {"data\textures\Civilian\Vehicles\taxi.paa"}, "" },
		    { "F/R Suv", "OLD", {"\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa"}, "" }
        };
    };
    class SUV_01_base_red_F { // SUV (SO1)
        vItemSpace = 50;
        conditions = "";
        isDonator = false;
        price = 0;
        textures[] = {
            { "SO1 SUV", "civ", {"data\textures\PM\PMSUV.paa"}, "" }
        };
    };
    class C_Hatchback_01_sport_F { // Hatchback (Sport)
        vItemSpace = 45;
        conditions = "";
        isDonator = false;
        price = 130000;
        textures[] = {
            { "Red", "OLD", {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport01_co.paa"}, "" },
            { "Dark Blue", "OLD", {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport02_co.paa"}, ""  },
            { "Orange", "civ", {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport03_co.paa"}, ""  },
            { "Black / White", "civ", {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport04_co.paa"}, ""  },
            { "Beige", "civ", {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport05_co.paa"}, ""  },
            { "Green", "civ", {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport06_co.paa"}, ""  },
            { "Blue", "civ", {"\a3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_BASE04_CO.paa"}, ""  },
            { "Green", "civ", {"\a3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_BASE02_CO.paa"}, ""  },
            { "Red", "civ", {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport01_co.paa"}, ""  },
            { "Camo", "reb", {"data\textures\Civilian\Vehicles\Camo_Hatchback.paa"}, ""  },
            { "Dark Blue", "civ", {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport02_co.paa"}, ""  },
            { "Donator", "civ", {"data\textures\Donator\Vehicles\Money.paa"}, "PHX_DonatorLevel > 0" },
            { "Police Hatchback White", "cop", {"data\textures\Police\Vehicles\Police_Hatchback_White.paa"}, ""  },
            { "Police Hatchback Black", "cop", {"data\textures\Police\Vehicles\Police_Hatchback_Black.paa"}, "call life_tpulevel >= 1 || call life_ctulevel >= 1"  },
            { "NHS Hatchback Sport", "med", {"data\textures\Medic\Vehicles\nhs_hatchback.paa"}, ""  },
            { "McQueen", "civ", {"data\textures\Civilian\Vehicles\mcqueen.paa"}, ""  },
            { "Toons", "civ", {"data\textures\Civilian\Vehicles\Prestige\HB_Toons.paa"}, "PHX_prestigeLevel >= 10" },
            { "Fractal", "civ", {"data\textures\Civilian\Vehicles\Prestige\HB_Fractal.paa"}, "PHX_prestigeLevel >= 5" }
        };
    };
    class C_Van_02_transport_F { // Van Transport
        vItemSpace = 100;
        conditions = "";
        isDonator = false;
        price = 150000;
        textures[] = {
            { "Police Van", "cop", {"data\textures\Police\Vehicles\police_van.paa"}, "" },
		    { "Police Van (OSU)", "OLD", {"\a3\soft_f_orange\van_02\data\van_body_Red_CO.paa"}, ""  },
		    { "Black", "reb", {"\a3\soft_f_orange\van_02\data\van_body_black_CO.paa"}, "" },
            { "Services", "civ", {"\a3\soft_f_orange\van_02\data\van_body_CivService_CO.paa"}, "" },
			{ "Daltgreen", "civ", {"\a3\soft_f_orange\van_02\data\van_body_Daltgreen_CO.paa"}, "" },
			{ "Masked", "civ", {"\a3\soft_f_orange\van_02\data\van_body_Masked_CO.paa"}, "" },
			{ "Orange", "civ", {"\a3\soft_f_orange\van_02\data\van_body_Orange_CO.paa"}, "" },
			{ "Red", "civ", {"\a3\soft_f_orange\van_02\data\van_body_Red_CO.paa"}, "" },
			{ "Redstone", "civ", {"\a3\soft_f_orange\van_02\data\van_body_Redstone_CO.paa"}, "" },
			{ "Vrana", "civ", {"\a3\soft_f_orange\van_02\data\van_body_Vrana_CO.paa"}, "" },
			{ "White", "civ", {"\a3\soft_f_orange\van_02\data\van_body_white_CO.paa"}, "" },
			{ "Fuel", "civ", {"\a3\soft_f_orange\van_02\data\van_body_Fuel_CO.paa"}, "" },
			{ "Altis News", "OLD", {"\a3\soft_f_orange\van_02\data\van_body_white_CO.paa"}, "" },
		    { "HAVOC Van", "havoc", {"data\textures\HAVOC\havocVehicleCamo.paa"}, "" },
		    { "10th Van", "OLD", {"\a3\soft_f_orange\van_02\data\van_body_white_CO.paa"}, "" }
        };
    };

    class B_G_Van_02_transport_F : C_Van_02_transport_F {};

    class B_GEN_Van_02_transport_F { // Police Van Transport
        vItemSpace = 100;
        conditions = "";
        isDonator = false;
        price = 0;
        textures[] = {
            { "Police Van", "cop", {"data\textures\Police\Vehicles\police_van.paa"}, "" }
        };
    };
    class C_Van_02_vehicle_F { // Van (Cargo)
        vItemSpace = 250;
        conditions = "";
        isDonator = false;
        price = 100000;
        textures[] = {
            { "Police Van", "cop", {"data\textures\Police\Vehicles\police_van.paa"}, "" },
            { "Police Van (OSU)", "OLD", {"\a3\soft_f_orange\van_02\data\van_body_Red_CO.paa"}, ""  },
            { "Black", "reb", {"\a3\soft_f_orange\van_02\data\van_body_black_CO.paa"}, "" },
            { "Services", "civ", {"\a3\soft_f_orange\van_02\data\van_body_CivService_CO.paa"}, "" },
			{ "Daltgreen", "civ", {"\a3\soft_f_orange\van_02\data\van_body_Daltgreen_CO.paa"}, "" },
			{ "Masked", "civ", {"\a3\soft_f_orange\van_02\data\van_body_Masked_CO.paa"}, "" },
			{ "Orange", "civ", {"\a3\soft_f_orange\van_02\data\van_body_Orange_CO.paa"}, "" },
			{ "Red", "civ", {"\a3\soft_f_orange\van_02\data\van_body_Red_CO.paa"}, "" },
			{ "Redstone", "civ", {"\a3\soft_f_orange\van_02\data\van_body_Redstone_CO.paa"}, "" },
			{ "Vrana", "civ", {"\a3\soft_f_orange\van_02\data\van_body_Vrana_CO.paa"}, "" },
			{ "White", "civ", {"\a3\soft_f_orange\van_02\data\van_body_white_CO.paa"}, "" },
			{ "Fuel", "civ", {"\a3\soft_f_orange\van_02\data\van_body_Fuel_CO.paa"}, "" }
        };
    };
    class B_GEN_Van_02_vehicle_F { // Police Van (Cargo)
        vItemSpace = 150;
        conditions = "";
        isDonator = false;
        price = 0;
        textures[] = {
            { "Police Van", "cop", {"data\textures\Police\Vehicles\police_van.paa"}, "" }
        };
    };
    class C_IDAP_Van_02_vehicle_F { // Van (Newsteam)
        vItemSpace = 150;
        conditions = "";
        isDonator = false;
        price = 0;
        textures[] = {
            { "Altis News", "civ", {"\a3\soft_f_orange\van_02\data\van_body_AAN_CO.paa"}, "" }
        };
    };
    class C_Van_02_service_F { // Van (Services)
        vItemSpace = 150;
        conditions = "";
        isDonator = false;
        price = 0;
        textures[] = {};
    };
    class C_Van_02_medevac_F { // NHS Van (Ambulance)
        vItemSpace = 100;
        conditions = "";
        isDonator = false;
        price = 0;
        textures[] = {
            { "NHS Van", "med", {"data\textures\Medic\Vehicles\nhs_van.paa"}, "" }
        };
    };
    class O_LSV_02_unarmed_ghex_F { // Qilin
        vItemSpace = 50;
        conditions = "";
        isDonator = false;
        price = 350000;
        textures[] = {
            { "Qilin", "reb", {"\a3\soft_f_exp\LSV_02\Data\CSAT_LSV_01_ghex_CO.paa", "\a3\soft_f_exp\LSV_02\Data\CSAT_LSV_02_ghex_CO.paa"}, "" },
            { "Ares Qilin", "OLD", {"\a3\soft_f_exp\LSV_02\Data\CSAT_LSV_01_ghex_CO.paa", "\a3\soft_f_exp\LSV_02\Data\CSAT_LSV_02_ghex_CO.paa"}, "['ares'] call PHX_fnc_inWhitelistGang" },
            { "Outlaws Qilin", "OLD", {"\a3\soft_f_exp\LSV_02\Data\CSAT_LSV_01_ghex_CO.paa", "\a3\soft_f_exp\LSV_02\Data\CSAT_LSV_02_ghex_CO.paa"}, "['outlaws'] call PHX_fnc_inWhitelistGang" },
            { "Adapt Qilin", "OLD", {"\a3\soft_f_exp\LSV_02\Data\CSAT_LSV_01_ghex_CO.paa", "\a3\soft_f_exp\LSV_02\Data\CSAT_LSV_02_ghex_CO.paa"}, "['adapt'] call PHX_fnc_inWhitelistGang" },
            { "Teal", "reb", {"#(rgb,8,8,3)color(0.05,0.67,737,1)", "\a3\soft_f_exp\LSV_02\Data\CSAT_LSV_02_ghex_CO.paa"}, "" },
            { "Lime", "reb", {"#(rgb,8,8,3)color(0.1,0.6,0.03,1)", "\a3\soft_f_exp\LSV_02\Data\CSAT_LSV_02_ghex_CO.paa"}, "" },
            { "Emerald", "reb", {"#(rgb,8,8,3)color(0.03,1,0.6,1)", "\a3\soft_f_exp\LSV_02\Data\CSAT_LSV_02_ghex_CO.paa"}, "" },
            { "Yellow", "reb", {"#(rgb,8,8,3)color(1,1,0.03,1)", "\a3\soft_f_exp\LSV_02\Data\CSAT_LSV_02_ghex_CO.paa"}, "" },
            { "Orange", "reb", {"#(rgb,8,8,3)color(1,0.2,0.03,1)", "\a3\soft_f_exp\LSV_02\Data\CSAT_LSV_02_ghex_CO.paa"}, "" },
            { "Red", "reb", {"#(rgb,8,8,3)color(0.9,0.03,0.03,1)", "\a3\soft_f_exp\LSV_02\Data\CSAT_LSV_02_ghex_CO.paa"}, "" },
            { "Green", "reb", {"#(rgb,8,8,3)color(0.03,0.9,0.03,1)", "\a3\soft_f_exp\LSV_02\Data\CSAT_LSV_02_ghex_CO.paa"}, "" },
            //{ "Black", "reb", {"#(rgb,8,8,3)color(0.03,0.03,0.03,1)", "\a3\soft_f_exp\LSV_02\Data\CSAT_LSV_02_ghex_CO.paa"}, "" },
            { "White", "reb", {"#(rgb,8,8,3)color(0.97,0.97,0.97,1)", "\a3\soft_f_exp\LSV_02\Data\CSAT_LSV_02_ghex_CO.paa"}, "" },
            { "Pink", "reb", {"#(rgb,8,8,3)color(0.97,0.03,0.5,1)", "\a3\soft_f_exp\LSV_02\Data\CSAT_LSV_02_ghex_CO.paa"}, "" },
            { "LoTUK Qilin", "OLD", {"\a3\soft_f_exp\LSV_02\Data\CSAT_LSV_01_ghex_CO.paa", "\a3\soft_f_exp\LSV_02\Data\CSAT_LSV_02_ghex_CO.paa"}, "['LOTUK'] call PHX_fnc_inWhitelistGang" },
            { "S K E N G Qilin", "OLD", {"\a3\soft_f_exp\LSV_02\Data\CSAT_LSV_01_ghex_CO.paa", "\a3\soft_f_exp\LSV_02\Data\CSAT_LSV_02_ghex_CO.paa"}, "['skeng'] call PHX_fnc_inWhitelistGang" },
            { "House Targaryen Qilin", "OLD", {"\a3\soft_f_exp\LSV_02\Data\CSAT_LSV_01_ghex_CO.paa", "\a3\soft_f_exp\LSV_02\Data\CSAT_LSV_02_ghex_CO.paa"}, "['hot'] call PHX_fnc_inWhitelistGang" },
            { "BIA Qilin", "OLD", {"\a3\soft_f_exp\LSV_02\Data\CSAT_LSV_01_ghex_CO.paa", "\a3\soft_f_exp\LSV_02\Data\CSAT_LSV_02_ghex_CO.paa"}, "['bia'] call PHX_fnc_inWhitelistGang" },
            { "Digi Camo", "reb", {"data\textures\civilian\vehicles\camo.paa"}, "" },
            { "Digi Camo", "reb", {"data\textures\Civilian\Vehicles\camo.paa"}, "" },
            { "Red Gang Skin", "reb", {"data\textures\gangs\bases\gangred.paa"}, "['NE'] call PHX_fnc_ownsBase" },
            { "Green Gang Skin", "reb", {"data\textures\gangs\bases\ganggreen.paa"}, "['NW'] call PHX_fnc_ownsBase" },
            { "Blue Gang Skin", "reb", {"data\textures\gangs\bases\gangblue.paa"}, "['SW'] call PHX_fnc_ownsBase" },
            { "Blue Digi Camo", "reb", {"data\textures\Civilian\Vehicles\BlueCamo.paa"}, "" },
            { "Genesis Qilin", "OLD", {"\a3\soft_f_exp\LSV_02\Data\CSAT_LSV_01_ghex_CO.paa", "\a3\soft_f_exp\LSV_02\Data\CSAT_LSV_02_ghex_CO.paa"}, "['genesis', player] call PHX_fnc_inWhitelistGang" },
            { "Ares Qilin", "OLD", {"\a3\soft_f_exp\LSV_02\Data\CSAT_LSV_01_ghex_CO.paa", "\a3\soft_f_exp\LSV_02\Data\CSAT_LSV_02_ghex_CO.paa"}, "['ares', player] call PHX_fnc_inWhitelistGang" },
            { "EvolvE Qilin", "reb", {"data\textures\gangs\EvolvE\EvolvE_qilin.paa", "\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_02_black_CO.paa"}, "['EvolvE', player] call PHX_fnc_inWhitelistGang" },
            { "Ares Qilin", "reb", {"data\textures\gangs\Ares\ares_qilin_1.paa", "data\textures\gangs\Ares\ares_qilin_2.paa"}, "['Ares', player] call PHX_fnc_inWhitelistGang" },
            { "Vanquish Qilin", "reb", {"data\textures\gangs\Vanquish\Vanquish_Qilin_0.paa", "data\textures\gangs\Vanquish\Vanquish_Qilin_1.paa", "data\textures\gangs\Vanquish\Vanquish_Qilin_2.paa" }, "['Vanq', player] call PHX_fnc_inWhitelistGang" },
            { "TMC Qilin", "reb", {"data\textures\gangs\TMC\TMC_Qilin.paa", "\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_02_black_CO.paa", "\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_03_black_CO.paa"}, "['TMC', player] call PHX_fnc_inWhitelistGang" }
        };
    };
    class O_T_LSV_02_unarmed_black_F { // Qilin [HAVOC]
        vItemSpace = 50;
        conditions = "";
        isDonator = false;
        price = 350000;
        textures[] = {
            { "HAVOC Qilin", "havoc", {"data\textures\HAVOC\havocVehicleCamo.paa"}, "" },
            { "Altis Repo", "OLD", {"#(rgb,8,8,3)color(0.03,0.03,0.03,1)"}, "['wasted'] call PHX_fnc_inWhitelistGang" },
            { "TFU Qilin", "cop", {"#(rgb,8,8,3)color(0.03,0.03,0.03,1)"}, "" }
        };
    };
    class O_T_LSV_02_armed_F { // Qilin (Armed)
        vItemSpace = 65;
        conditions = "";
        isDonator = false;
        price = 4500000;
        textures[] = {
            { "Qilin", "reb", {"\a3\soft_f_exp\LSV_02\Data\CSAT_LSV_01_ghex_CO.paa", "\a3\soft_f_exp\LSV_02\Data\CSAT_LSV_02_ghex_CO.paa"}, "" },
            { "Teal", "reb", {"#(rgb,8,8,3)color(0.05,0.67,737,1)", "\a3\soft_f_exp\LSV_02\Data\CSAT_LSV_02_ghex_CO.paa"}, "" },
            { "Lime", "reb", {"#(rgb,8,8,3)color(0.1,0.6,0.03,1)", "\a3\soft_f_exp\LSV_02\Data\CSAT_LSV_02_ghex_CO.paa"}, "" },
            { "Emerald", "reb", {"#(rgb,8,8,3)color(0.03,1,0.6,1)", "\a3\soft_f_exp\LSV_02\Data\CSAT_LSV_02_ghex_CO.paa"}, "" },
            { "Yellow", "reb", {"#(rgb,8,8,3)color(1,1,0.03,1)", "\a3\soft_f_exp\LSV_02\Data\CSAT_LSV_02_ghex_CO.paa"}, "" },
            { "Orange", "reb", {"#(rgb,8,8,3)color(1,0.2,0.03,1)", "\a3\soft_f_exp\LSV_02\Data\CSAT_LSV_02_ghex_CO.paa"}, "" },
            { "Red", "reb", {"#(rgb,8,8,3)color(0.9,0.03,0.03,1)", "\a3\soft_f_exp\LSV_02\Data\CSAT_LSV_02_ghex_CO.paa"}, "" },
            { "Green", "reb", {"#(rgb,8,8,3)color(0.03,0.9,0.03,1)", "\a3\soft_f_exp\LSV_02\Data\CSAT_LSV_02_ghex_CO.paa"}, "" },
            { "White", "reb", {"#(rgb,8,8,3)color(0.97,0.97,0.97,1)", "\a3\soft_f_exp\LSV_02\Data\CSAT_LSV_02_ghex_CO.paa"}, "" },
            { "Pink", "reb", {"#(rgb,8,8,3)color(0.97,0.03,0.5,1)", "\a3\soft_f_exp\LSV_02\Data\CSAT_LSV_02_ghex_CO.paa"}, "" },
            { "Digi Camo", "reb", {"data\textures\Civilian\Vehicles\camo.paa"}, "" },
            { "Red Gang Skin", "reb", {"data\textures\gangs\bases\gangred.paa"}, "['NE'] call PHX_fnc_ownsBase" },
            { "Green Gang Skin", "reb", {"data\textures\gangs\bases\ganggreen.paa"}, "['NW'] call PHX_fnc_ownsBase" },
            { "Blue Gang Skin", "reb", {"data\textures\gangs\bases\gangblue.paa"}, "['SW'] call PHX_fnc_ownsBase" },
            { "Blue Digi Camo", "reb", {"data\textures\Civilian\Vehicles\BlueCamo.paa"}, "" },
            { "HAVOC Qilin (Armed)", "havoc", {"data\textures\HAVOC\havocVehicleCamo.paa"}, "" }
        };
    };
    class B_CTRG_lsv_01_light_F { // Prowler (Light)
		vItemSpace = 30;
		conditions = "";
        isDonator = false;
		price = 300000;
		textures[] = {
			{ "Olive", "reb", {"\a3\soft_f_exp\lsv_01\data\nato_lsv_01_olive_co.paa","\a3\soft_f_exp\lsv_01\data\nato_lsv_02_olive_co.paa","\a3\soft_f_exp\lsv_01\data\nato_lsv_03_olive_co.paa","\a3\soft_f_exp\lsv_01\data\nato_lsv_adds_olive_co.paa"}, "" },
			{ "Sand", "reb", {"\a3\soft_f_exp\lsv_01\data\nato_lsv_01_sand_co.paa","\a3\soft_f_exp\lsv_01\data\nato_lsv_02_sand_co.paa","\a3\soft_f_exp\lsv_01\data\nato_lsv_03_sand_co.paa","\a3\soft_f_exp\lsv_01\data\nato_lsv_adds_sand_co.paa"}, "" },
			{ "Tropic", "reb", {"\a3\soft_f_exp\lsv_01\data\nato_lsv_01_dazzle_co.paa","\a3\soft_f_exp\lsv_01\data\nato_lsv_02_olive_co.paa","\a3\soft_f_exp\lsv_01\data\nato_lsv_03_olive_co.paa","\a3\soft_f_exp\lsv_01\data\nato_lsv_adds_olive_co.paa"}, "" },
			{ "Black", "reb", {"\a3\soft_f_exp\lsv_01\data\nato_lsv_01_black_co.paa","\a3\soft_f_exp\lsv_01\data\nato_lsv_02_black_co.paa","\a3\soft_f_exp\lsv_01\data\nato_lsv_03_black_co.paa","\a3\soft_f_exp\lsv_01\data\nato_lsv_adds_black_co.paa"}, "" },
            { "Injustice", "OLD", {"\a3\soft_f_exp\lsv_01\data\nato_lsv_01_black_co.paa","\a3\soft_f_exp\lsv_01\data\nato_lsv_02_black_co.paa","\a3\soft_f_exp\lsv_01\data\nato_lsv_03_black_co.paa","\a3\soft_f_exp\lsv_01\data\nato_lsv_adds_black_co.paa"}, "['injustice'] call PHX_fnc_inWhitelistGang" },
            { "Red Gang Skin", "reb", {"data\textures\gangs\bases\gangred.paa"}, "['NE'] call PHX_fnc_ownsBase" },
            { "Green Gang Skin", "reb", {"data\textures\gangs\bases\ganggreen.paa"}, "['NW'] call PHX_fnc_ownsBase" },
            { "Blue Gang Skin", "reb", {"data\textures\gangs\bases\gangblue.paa"}, "['SW'] call PHX_fnc_ownsBase" },
            { "Digi Camo", "reb", {"data\textures\civilian\vehicles\Camo.paa"}, "" },
            { "Blue Digi Camo", "reb", {"data\textures\civilian\vehicles\BlueCamo.paa"}, "" }
		};
	};
    class B_LSV_01_unarmed_F { // Prowler
		vItemSpace = 50;
		conditions = "";
        isDonator = false;
		price = 325000;
		textures[] = {
			{ "Olive", "reb", {"\a3\soft_f_exp\lsv_01\data\nato_lsv_01_olive_co.paa","\a3\soft_f_exp\lsv_01\data\nato_lsv_02_olive_co.paa","\a3\soft_f_exp\lsv_01\data\nato_lsv_03_olive_co.paa","\a3\soft_f_exp\lsv_01\data\nato_lsv_adds_olive_co.paa"}, "" },
			{ "Sand", "reb", {"\a3\soft_f_exp\lsv_01\data\nato_lsv_01_sand_co.paa","\a3\soft_f_exp\lsv_01\data\nato_lsv_02_sand_co.paa","\a3\soft_f_exp\lsv_01\data\nato_lsv_03_sand_co.paa","\a3\soft_f_exp\lsv_01\data\nato_lsv_adds_sand_co.paa"}, "" },
			{ "Tropic", "reb", {"\a3\soft_f_exp\lsv_01\data\nato_lsv_01_dazzle_co.paa","\a3\soft_f_exp\lsv_01\data\nato_lsv_02_olive_co.paa","\a3\soft_f_exp\lsv_01\data\nato_lsv_03_olive_co.paa","\a3\soft_f_exp\lsv_01\data\nato_lsv_adds_olive_co.paa"}, "" },
			{ "Black", "reb", {"\a3\soft_f_exp\lsv_01\data\nato_lsv_01_black_co.paa","\a3\soft_f_exp\lsv_01\data\nato_lsv_02_black_co.paa","\a3\soft_f_exp\lsv_01\data\nato_lsv_03_black_co.paa","\a3\soft_f_exp\lsv_01\data\nato_lsv_adds_black_co.paa"}, "" },
            { "Injustice", "OLD", {"\a3\soft_f_exp\lsv_01\data\nato_lsv_01_black_co.paa","\a3\soft_f_exp\lsv_01\data\nato_lsv_02_black_co.paa","\a3\soft_f_exp\lsv_01\data\nato_lsv_03_black_co.paa","\a3\soft_f_exp\lsv_01\data\nato_lsv_adds_black_co.paa"}, "['injustice'] call PHX_fnc_inWhitelistGang" },
            { "Red Gang Skin", "reb", {"data\textures\gangs\bases\gangred.paa"}, "['NE'] call PHX_fnc_ownsBase" },
            { "Green Gang Skin", "reb", {"data\textures\gangs\bases\ganggreen.paa"}, "['NW'] call PHX_fnc_ownsBase" },
            { "Blue Gang Skin", "reb", {"data\textures\gangs\bases\gangblue.paa"}, "['SW'] call PHX_fnc_ownsBase" },
            { "Digi Camo", "reb", {"data\textures\civilian\vehicles\Camo.paa"}, "" },
            { "Blue Digi Camo", "reb", {"data\textures\civilian\vehicles\BlueCamo.paa"}, "" }
		};
	};
    class B_T_LSV_01_armed_F { // Prowler (Armed)
		vItemSpace = 65;
		conditions = "";
        isDonator = false;
		price = 4500000;
		textures[] = {
			{ "Olive", "reb", {"\a3\soft_f_exp\lsv_01\data\nato_lsv_01_olive_co.paa","\a3\soft_f_exp\lsv_01\data\nato_lsv_02_olive_co.paa","\a3\soft_f_exp\lsv_01\data\nato_lsv_03_olive_co.paa","\a3\soft_f_exp\lsv_01\data\nato_lsv_adds_olive_co.paa"}, "" },
			{ "Sand", "reb", {"\a3\soft_f_exp\lsv_01\data\nato_lsv_01_sand_co.paa","\a3\soft_f_exp\lsv_01\data\nato_lsv_02_sand_co.paa","\a3\soft_f_exp\lsv_01\data\nato_lsv_03_sand_co.paa","\a3\soft_f_exp\lsv_01\data\nato_lsv_adds_sand_co.paa"}, "" },
			{ "Tropic", "reb", {"\a3\soft_f_exp\lsv_01\data\nato_lsv_01_dazzle_co.paa","\a3\soft_f_exp\lsv_01\data\nato_lsv_02_olive_co.paa","\a3\soft_f_exp\lsv_01\data\nato_lsv_03_olive_co.paa","\a3\soft_f_exp\lsv_01\data\nato_lsv_adds_olive_co.paa"}, "" },
			{ "Black", "reb", {"\a3\soft_f_exp\lsv_01\data\nato_lsv_01_black_co.paa","\a3\soft_f_exp\lsv_01\data\nato_lsv_02_black_co.paa","\a3\soft_f_exp\lsv_01\data\nato_lsv_03_black_co.paa","\a3\soft_f_exp\lsv_01\data\nato_lsv_adds_black_co.paa"}, "" },
            { "Injustice", "OLD", {"\a3\soft_f_exp\lsv_01\data\nato_lsv_01_black_co.paa","\a3\soft_f_exp\lsv_01\data\nato_lsv_02_black_co.paa","\a3\soft_f_exp\lsv_01\data\nato_lsv_03_black_co.paa","\a3\soft_f_exp\lsv_01\data\nato_lsv_adds_black_co.paa"}, "['injustice'] call PHX_fnc_inWhitelistGang" },
            { "Red Gang Skin", "reb", {"data\textures\gangs\bases\gangred.paa"}, "['NE'] call PHX_fnc_ownsBase" },
            { "Green Gang Skin", "reb", {"data\textures\gangs\bases\ganggreen.paa"}, "['NW'] call PHX_fnc_ownsBase" },
            { "Blue Gang Skin", "reb", {"data\textures\gangs\bases\gangblue.paa"}, "['SW'] call PHX_fnc_ownsBase" },
            { "Digi Camo", "reb", {"data\textures\civilian\vehicles\Camo.paa"}, "" },
            { "Blue Digi Camo", "reb", {"data\textures\civilian\vehicles\BlueCamo.paa"}, "" }
		};
	};
    class B_LSV_01_unarmed_black_F { // APC Prowler
        vItemSpace = 50;
        conditions = "";
        isDonator = false;
        price = 325000;
        textures[] = {
            { "Police Prowler", "cop", {"data\textures\Police\Vehicles\Police_Prowler.paa"}, "" }
        };
    };
    class B_MRAP_01_F { // Hunter
        vItemSpace = 60;
        conditions = "";
        isDonator = false;
        price = 3000000;
        textures[] = {
            { "Police Hunter", "cop", {"data\textures\Police\Vehicles\Police_Hunter_0.paa", "data\textures\Police\Vehicles\Police_Hunter_1.paa"}, "" },
            { "Hunter", "limited", {"#(rgb,8,8,3)color(0.97,0.03,0.5,1)"}, "" },
            { "Pink", "limited", {"#(rgb,8,8,3)color(0.97,0.03,0.5,1)","#(rgb,8,8,3)color(0.97,0.03,0.5,1)","#(rgb,8,8,3)color(0.97,0.03,0.5,1)"}, "" },
            { "SO1 Hunter", "cop", {"data\textures\PM\PMHunter.paa", "data\textures\PM\PMHunterBack.paa"}, "call life_coplevel >= 9" }
        };
    };
    class O_MRAP_02_F { // Ifrit
        vItemSpace = 60;
        conditions = "";
        isDonator = false;
        price = 3000000;
        textures[] = {
            { "Desert Hex", "reb", {"\A3\soft_F\MRAP_02\Data\MRAP_02_ext_01_CO.paa", "\A3\soft_F\MRAP_02\Data\MRAP_02_ext_02_CO.paa"}, "" },
            { "Desert", "OLD", {"\A3\soft_F\MRAP_02\Data\MRAP_02_ext_01_CO.paa", "\A3\soft_F\MRAP_02\Data\MRAP_02_ext_02_CO.paa"}, "" },
            { "Digi Camo", "reb", {"data\textures\Civilian\Vehicles\Camo.paa", "#(rgb,8,8,3)color(0.03,0.03,0.03,1)"}, "" },
            { "Donator", "reb", {"data\textures\Donator\Vehicles\Money.paa", "data\textures\Donator\Vehicles\Money.paa"}, "PHX_DonatorLevel > 0" },
            { "Supreme", "OLD", {"\A3\soft_F\MRAP_02\Data\MRAP_02_ext_01_CO.paa", "\A3\soft_F\MRAP_02\Data\MRAP_02_ext_02_CO.paa"}, "['adf'] call PHX_fnc_inWhitelistGang" },
            { "Seismic", "OLD", {"\A3\soft_F\MRAP_02\Data\MRAP_02_ext_01_CO.paa", "\A3\soft_F\MRAP_02\Data\MRAP_02_ext_02_CO.paa"}, "['seismic'] call PHX_fnc_inWhitelistGang" },
            { "Ares", "OLD", {"\A3\soft_F\MRAP_02\Data\MRAP_02_ext_01_CO.paa", "\A3\soft_F\MRAP_02\Data\MRAP_02_ext_02_CO.paa"}, "['ares'] call PHX_fnc_inWhitelistGang" },
            { "Ares", "OLD", {"\A3\soft_F\MRAP_02\Data\MRAP_02_ext_01_CO.paa", "\A3\soft_F\MRAP_02\Data\MRAP_02_ext_02_CO.paa"}, "['ares'] call PHX_fnc_inWhitelistGang" },
            { "Teal", "reb", {"#(rgb,8,8,3)color(0.05,0.67,737,1)", "#(rgb,8,8,3)color(0.03,0.03,0.03,1)"}, "" },
            { "Lime", "reb", {"#(rgb,8,8,3)color(0.1,0.6,0.03,1)", "#(rgb,8,8,3)color(0.03,0.03,0.03,1)"}, "" },
            { "Emerald", "reb", {"#(rgb,8,8,3)color(0.03,1,0.6,1)", "#(rgb,8,8,3)color(0.03,0.03,0.03,1)"}, "" },
            { "Yellow", "reb", {"#(rgb,8,8,3)color(1,1,0.03,1)", "#(rgb,8,8,3)color(0.03,0.03,0.03,1)"}, "" },
            { "Orange", "reb", {"#(rgb,8,8,3)color(1,0.2,0.03,1)", "#(rgb,8,8,3)color(0.03,0.03,0.03,1)"}, "" },
            { "Red", "reb", {"#(rgb,8,8,3)color(0.9,0.03,0.03,1)", "#(rgb,8,8,3)color(0.03,0.03,0.03,1)"}, "" },
            { "Green", "reb", {"#(rgb,8,8,3)color(0.03,0.9,0.03,1)", "#(rgb,8,8,3)color(0.03,0.03,0.03,1)"}, "" },
            { "Black", "reb", {"#(rgb,8,8,3)color(0.03,0.03,0.03,1)", "#(rgb,8,8,3)color(0.03,0.03,0.03,1)"}, "" },
            { "White", "reb", {"#(rgb,8,8,3)color(0.97,0.97,0.97,1)", "#(rgb,8,8,3)color(0.03,0.03,0.03,1)"}, "" },
            { "Pink", "reb", {"#(rgb,8,8,3)color(0.97,0.03,0.5,1)", "#(rgb,8,8,3)color(0.03,0.03,0.03,1)"}, "" },
            { "Poop Brown", "LIMITED", {"#(rgb,8,8,3)color(0.23,0.17,0,0.2)", "#(rgb,8,8,3)color(0.03,0.03,0.03,1)"}, "" },
            { "Green Gang Skin", "reb", {"\A3\soft_F_exp\MRAP_02\Data\MRAP_02_ext_01_ghex_CO.paa", "\A3\soft_F_exp\MRAP_02\Data\MRAP_02_ext_02_ghex_CO.paa"}, "" },
            { "Red Gang Skin", "reb", {"data\textures\gangs\bases\gangred.paa"}, "['NE'] call PHX_fnc_ownsBase" },
            { "Green Gang Skin", "reb", {"data\textures\gangs\bases\ganggreen.paa"}, "['NW'] call PHX_fnc_ownsBase" },
            { "Blue Gang Skin", "reb", {"data\textures\gangs\bases\gangblue.paa"}, "['SW'] call PHX_fnc_ownsBase" },
            { "Blue Digi Camo", "reb", {"data\textures\Civilian\Vehicles\BlueCamo.paa", "#(rgb,8,8,3)color(0.03,0.03,0.03,1)"}, "" },
            { "Bio Shatter", "reb", {"data\textures\Civilian\Vehicles\Bioshatter1.paa", "data\textures\Civilian\Vehicles\Bioshatter2.paa"}, "" },
            { "SFG", "OLD", {"\A3\soft_F_exp\MRAP_02\Data\MRAP_02_ext_01_ghex_CO.paa", "\A3\soft_F_exp\MRAP_02\Data\MRAP_02_ext_02_ghex_CO.paa"}, "['sfg', player] call PHX_fnc_inWhitelistGang" },
            { "TwoPointNine", "OLD", {"\A3\soft_F\MRAP_02\Data\MRAP_02_ext_01_CO.paa", "\A3\soft_F\MRAP_02\Data\MRAP_02_ext_02_CO.paa"}, "['TwoPoint', player] call PHX_fnc_inWhitelistGang" },
            { "EvolvE", "reb", {"data\textures\gangs\EvolvE\EvolvE_ifirit-front.paa", "data\textures\gangs\EvolvE\EvolvE_ifirt-back.paa"}, "['EvolvE', player] call PHX_fnc_inWhitelistGang" },
            { "Scream", "OLD", {"\A3\soft_F\MRAP_02\Data\MRAP_02_ext_01_CO.paa", "\A3\soft_F\MRAP_02\Data\MRAP_02_ext_02_CO.paa"}, "['Scream', player] call PHX_fnc_inWhitelistGang" },
            { "Ares", "reb", {"data\textures\gangs\Ares\ares_ifrit_main.paa", "data\textures\gangs\Ares\ares_ifrit_rear.paa"}, "['Ares', player] call PHX_fnc_inWhitelistGang" }
         };
    };
    class I_MRAP_03_F { // Strider
        vItemSpace = 60;
        conditions = "";
        isDonator = false;
        price = 2250000;
        textures[] = {
            { "HAVOC Strider", "havoc", {"data\textures\HAVOC\havocVehicleCamo.paa"}, "" },
            { "Strider", "LIMITED", {"#(rgb,8,8,3)color(0.97,0.03,0.5,1)"}, "" },
            { "Strider", "reb", {"\a3\soft_f_beta\mrap_03\data\mrap_03_ext_indp_co.paa"}, "" },
            { "Genesis", "OLD", {"\a3\soft_f_beta\mrap_03\data\mrap_03_ext_indp_co.paa"}, "['Genesis', player] call PHX_fnc_inWhitelistGang" }
        };
    };

    // Trucks
    class C_Tractor_01_F { // Tractor
        vItemSpace = 30;
        conditions = "";
        isDonator = false;
        price = 10000;
        textures[] = {
            { "Red", "civ", {"\a3\soft_f_enoch\tractor_01\data\tractor_01_2_red_co.paa"}, ""  },
            { "Green", "civ", {"\a3\soft_f_enoch\tractor_01\data\tractor_01_2_green_co.paa"}, ""  },
            { "Blue", "civ", {"\a3\soft_f_enoch\tractor_01\data\tractor_01_2_blue_co.paa"}, ""  }
        };
    };
    class C_Van_01_transport_F { // Truck
        vItemSpace = 100;
        conditions = "";
        isDonator = false;
        price = 40000;
        textures[] = {
            { "White", "civ", {"\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"}, "" },
            { "Red", "civ", {"\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"}, "" },
            { "Black", "reb", {"\a3\soft_f_gamma\Van_01\Data\van_01_ext_black_co.paa"}, "" },
            { "Olive", "reb", {"\a3\soft_f_exp\van_01\data\van_01_ext_oli_co.paa","\a3\soft_f_gamma\van_01\data\van_01_adds_co.paa","\a3\soft_f_exp\van_01\data\van_01_int_base_3_co.paa"}, "" },
            { "Brown", "reb", {"\a3\soft_f_exp\van_01\data\van_01_ext_brn_co.paa","\a3\soft_f_gamma\van_01\data\van_01_adds_co.paa","\a3\soft_f_exp\van_01\data\van_01_int_base_2_co.paa"}, "" },
            { "Guerilla 1", "reb", {"\a3\soft_f_bootcamp\van_01\data\van_01_ext_ig_01_co.paa","\a3\soft_f_bootcamp\van_01\data\van_01_adds_ig_01_co.paa","\a3\soft_f_gamma\van_01\data\van_01_int_base_co.paa"}, "" },
            { "Guerilla 2", "reb", {"\a3\soft_f_bootcamp\van_01\data\van_01_ext_ig_01_co.paa","\a3\soft_f_bootcamp\van_01\data\van_01_adds_ig_01_co.paa","\a3\soft_f_gamma\van_01\data\van_01_int_base_co.paa"}, "" },
            { "Guerilla 3", "reb", {"\a3\soft_f_bootcamp\van_01\data\van_01_ext_ig_01_co.paa","\a3\soft_f_bootcamp\van_01\data\van_01_adds_ig_01_co.paa","\a3\soft_f_gamma\van_01\data\van_01_int_base_co.paa"}, "" },
            { "Guerilla 4", "reb", {"\a3\soft_f_bootcamp\van_01\data\van_01_ext_ig_01_co.paa","\a3\soft_f_bootcamp\van_01\data\van_01_adds_ig_01_co.paa","\a3\soft_f_gamma\van_01\data\van_01_int_base_co.paa"}, "" },
            { "Guerilla 5", "reb", {"\a3\soft_f_bootcamp\van_01\data\van_01_ext_ig_01_co.paa","\a3\soft_f_bootcamp\van_01\data\van_01_adds_ig_01_co.paa","\a3\soft_f_gamma\van_01\data\van_01_int_base_co.paa"}, "" },
            { "Guerilla 6", "reb", {"\a3\soft_f_bootcamp\van_01\data\van_01_ext_ig_01_co.paa","\a3\soft_f_bootcamp\van_01\data\van_01_adds_ig_01_co.paa","\a3\soft_f_gamma\van_01\data\van_01_int_base_co.paa"}, "" },
            { "Guerilla 7", "reb", {"\a3\soft_f_bootcamp\van_01\data\van_01_ext_ig_01_co.paa","\a3\soft_f_bootcamp\van_01\data\van_01_adds_ig_01_co.paa","\a3\soft_f_gamma\van_01\data\van_01_int_base_co.paa"}, "" },
            { "Guerilla 8", "reb", {"\a3\soft_f_bootcamp\van_01\data\van_01_ext_ig_01_co.paa","\a3\soft_f_bootcamp\van_01\data\van_01_adds_ig_01_co.paa","\a3\soft_f_gamma\van_01\data\van_01_int_base_co.paa"}, "" }
        };
    };
    class C_Van_01_box_F { // Truck Boxer
        vItemSpace = 150;
        conditions = "";
        isDonator = false;
        price = 65000;
        textures[] = {
            { "White", "civ", {"\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"}, "" },
            { "Red", "civ", {"\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"}, "" },
            { "Ambulance", "OLD", {"data\textures\medic\vehicles\medtruckfront.paa", "data\textures\medic\vehicles\medtruckback.paa"}, "" },
            { "Black", "civ", {"\a3\soft_f_gamma\Van_01\Data\van_01_ext_black_co.paa"}, "" }
        };
    };
    class C_Van_01_fuel_F { // Truck (Fuel)
        vItemSpace = 175;
        vFuelSpace = 175;
        conditions = "";
        isDonator = false;
        price = 55000;
        textures[] = {
            { "White", "civ", {"\A3\soft_f_gamma\Van_01\data\van_01_ext_co.paa", "\A3\soft_f_gamma\Van_01\data\van_01_tank_co.paa"}, "" },
            { "White / Red", "civ", {"\A3\soft_f_gamma\Van_01\data\van_01_ext_co.paa", "\A3\soft_f_gamma\Van_01\data\van_01_tank_red_co.paa"}, "" },
            { "Black", "civ", {"\A3\soft_f_gamma\Van_01\data\van_01_ext_black_CO.paa", "\A3\soft_f_gamma\Van_01\data\van_01_tank_co.paa"}, "" },
            { "Black / Red", "civ", {"\A3\soft_f_gamma\Van_01\data\van_01_ext_black_CO.paa", "\A3\soft_f_gamma\Van_01\data\van_01_tank_red_co.paa"}, "" },
            { "Guerilla", "civ", {"\A3\soft_f_gamma\Van_01\data\van_01_ext_IG_CO.paa", "\A3\soft_f_gamma\Van_01\data\van_01_tank_IG_CO.paa"}, "" },
            { "Red", "civ", {"\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa", "\A3\soft_f_gamma\Van_01\data\van_01_tank_red_co.paa"}, "" }
        };
    };
    class I_Truck_02_transport_F { // Zamak Transport
        vItemSpace = 350;
        conditions = "";
        isDonator = false;
        price = 175000;
        textures[] = {
            { "Orange", "civ", {"\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa", "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"}, "" },
            { "Black", "OLD", {"#(argb,8,8,3)color(0.05,0.05,0.05,1)"}, "" },
            { "Digi Green", "civ", {"\a3\soft_f_beta\truck_02\data\truck_02_kab_indp_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_kuz_indp_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"}, "" },
            { "Hex", "civ", {"\a3\soft_f_beta\truck_02\data\truck_02_kab_opfor_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_kuz_opfor_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"}, "" },
            { "Blue", "civ", {"\a3\soft_f_beta\truck_02\data\truck_02_kab_blue_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_kuz_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"}, "" }
        };
    };
    class I_Truck_02_covered_F { // Zamak Transport (Covered)
        vItemSpace = 400;
        conditions = "";
        isDonator = false;
        price = 200000;
        textures[] = {
            { "Orange / Blue", "civ", {"\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa", "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"}, "" },
            { "Orange / Olive", "civ", {"\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa", "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_olive_CO.paa"}, "" },
            { "Black", "OLD", {"#(argb,8,8,3)color(0.05,0.05,0.05,1)"}, "" },
            { "Digi Green", "civ", {"\a3\soft_f_beta\truck_02\data\truck_02_kab_indp_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_kuz_indp_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"}, "" },
            { "Blue", "civ", {"\a3\soft_f_beta\truck_02\data\truck_02_kab_blue_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_kuz_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"}, "" },
            { "Blue Olive", "civ", {"\a3\soft_f_beta\truck_02\data\truck_02_kab_blue_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_kuz_olive_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"}, "" },
            { "Hex", "civ", {"\a3\soft_f_beta\truck_02\data\truck_02_kab_opfor_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_kuz_opfor_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"}, "" }
        };
    };
    class I_Truck_02_ammo_F { // Zamak Ammo
        vItemSpace = 350;
        conditions = "";
        isDonator = false;
        price = 125000;
        textures[] = {
            { "Orange / Blue", "civ", {"\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa", "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"}, "" },
            { "Orange / Olive", "civ", {"\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa", "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_olive_CO.paa"}, "" },
            { "Black", "OLD", {"#(argb,8,8,3)color(0.05,0.05,0.05,1)"}, "" },
            { "Digi Green", "civ", {"\a3\soft_f_beta\truck_02\data\truck_02_kab_indp_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_kuz_indp_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"}, "" },
            { "Blue", "civ", {"\a3\soft_f_beta\truck_02\data\truck_02_kab_blue_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_kuz_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"}, "" },
            { "Blue Olive", "civ", {"\a3\soft_f_beta\truck_02\data\truck_02_kab_blue_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_kuz_olive_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"}, "" },
            { "Hex", "civ", {"\a3\soft_f_beta\truck_02\data\truck_02_kab_opfor_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_kuz_opfor_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"}, "" }
        };
    };
    class I_Truck_02_fuel_F { // Zamak Fuel
        vItemSpace = 350;
        vFuelSpace = 400;
        conditions = "";
        isDonator = false;
        price = 150000;
        textures[] = {
            { "Digi Green", "civ", {"\a3\soft_f_beta\truck_02\data\truck_02_kab_indp_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_fuel_indp_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"}, "" },
            { "Blue", "civ", {"\a3\soft_f_beta\truck_02\data\truck_02_kab_blue_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_fuel_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"}, "" },
            { "Hex", "civ", {"\a3\soft_f_beta\truck_02\data\truck_02_kab_opfor_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_fuel_opfor_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"}, "" },
            { "Orange", "civ", {"\a3\soft_f_beta\truck_02\data\truck_02_kab_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_fuel_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"}, "" }
        };
    };
    class O_Truck_02_covered_F { // HAVOC Zamak Transport (Covered)
        vItemSpace = 400;
        conditions = "";
        isDonator = false;
        price = 200000;
        textures[] = {
            { "Digi Green", "civ", {"\a3\soft_f_beta\truck_02\data\truck_02_kab_indp_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_repair_indp_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"}, "" },
            { "Hex", "civ", {"\a3\soft_f_beta\truck_02\data\truck_02_kab_opfor_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_repair_opfor_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"}, "" }
        };
    };
    class O_Truck_03_transport_F { // Tempest Transport
        vItemSpace = 500;
        conditions = "";
        isDonator = false;
        price = 400000;
        textures[] = {
            { "Hex", "civ", {"\a3\soft_f_epc\truck_03\data\truck_03_ext01_co.paa","\a3\soft_f_epc\truck_03\data\truck_03_ext02_co.paa","\a3\soft_f_epc\truck_03\data\truck_03_cargo_co.paa"}, "" },
            { "Green Hex", "civ", {"\a3\soft_f_exp\truck_03\data\truck_03_ext01_ghex_co.paa","\a3\soft_f_exp\truck_03\data\truck_03_ext02_ghex_co.paa","\a3\soft_f_exp\truck_03\data\truck_03_cargo_ghex_co.paa"}, "" }
        };
    };
    class O_Truck_03_covered_F { // Tempest Transport (Covered)
        vItemSpace = 650;
        conditions = "";
        isDonator = false;
        price = 450000;
        textures[] = {
            { "Hex", "civ", {"\A3\Soft_F_EPC\Truck_03\Data\Truck_03_ext01_CO.paa","\A3\Soft_F_EPC\Truck_03\Data\Truck_03_ext02_CO.paa", "\A3\Soft_F_EPC\Truck_03\Data\Truck_03_cargo_CO.paa","\A3\Soft_F_EPC\Truck_03\Data\Truck_03_cover_CO.paa"}, "" },
            { "Green Hex", "civ", {"\a3\soft_f_exp\truck_03\data\truck_03_ext01_ghex_co.paa","\a3\soft_f_exp\truck_03\data\truck_03_ext02_ghex_co.paa","\a3\soft_f_exp\truck_03\data\truck_03_ammo_ghex_co.paa","\a3\soft_f_exp\truck_03\data\truck_03_ammo_ghex_co.paa"}, "" },
            { "HAVOC Tempest", "havoc", {"data\textures\HAVOC\havocVehicleCamo.paa", "#(rgb,8,8,3)color(0.03,0.03,0.03,1)", "#(rgb,8,8,3)color(0.03,0.03,0.03,1)", "#(rgb,8,8,3)color(0.03,0.03,0.03,1)"}, "" }
        };
    };
    class O_Truck_03_ammo_F { // Tempest Ammo
        vItemSpace = 450;
        conditions = "";
        isDonator = false;
        price = 300000;
        textures[] = {
            { "Hex", "civ", {"\a3\soft_f_epc\truck_03\data\truck_03_ext01_co.paa","\a3\soft_f_epc\truck_03\data\truck_03_ext02_co.paa","\a3\soft_f_epc\truck_03\data\truck_03_cargo_co.paa","\a3\structures_f\data\metal\containers\containers_02_set_co.paa"}, "" },
            { "Green Hex", "civ", {"\a3\soft_f_exp\truck_03\data\truck_03_ext01_ghex_co.paa","\a3\soft_f_exp\truck_03\data\truck_03_ext02_ghex_co.paa","\a3\soft_f_exp\truck_03\data\truck_03_cargo_ghex_co.paa","\a3\structures_f\data\metal\containers\containers_colors_05_co.paa"}, "" }
        };
    };
    class O_Truck_03_fuel_F { // Tempest Fuel
        vItemSpace = 450;
		vFuelSpace = 600;
        conditions = "";
        isDonator = false;
        price = 350000;
        textures[] = {
            { "Hex", "civ", {"\a3\soft_f_exp\truck_03\data\truck_03_ext01_ghex_co.paa","\a3\soft_f_exp\truck_03\data\truck_03_ext02_ghex_co.paa","\a3\soft_f_exp\truck_03\data\truck_03_fuel_ghex_co.paa"}, "" },
            { "Green Hex", "civ", {"\a3\soft_f_epc\truck_03\data\truck_03_ext01_co.paa","\a3\soft_f_epc\truck_03\data\truck_03_ext02_co.paa","\a3\soft_f_epc\truck_03\data\truck_03_fuel_co.paa"}, "" }
        };
    };
    class O_Truck_03_device_F { // Tempest (Device)
        vItemSpace = 350;
        conditions = "";
        isDonator = false;
        price = 450000;
        textures[] = {
            { "Hex", "civ", {"\a3\soft_f_epc\truck_03\data\truck_03_ext01_co.paa","\a3\soft_f_epc\truck_03\data\truck_03_ext02_co.paa","\a3\soft_f_epc\truck_03\data\truck_03_cargo_co.paa","\a3\structures_f_epc\items\electronics\data\the_device_02_co.paa","\a3\structures_f_epc\items\electronics\data\the_device_03_co.paa"}, "" },
            { "Green Hex", "civ", {"\a3\soft_f_exp\truck_03\data\truck_03_ext01_ghex_co.paa","\a3\soft_f_exp\truck_03\data\truck_03_ext02_ghex_co.paa","\a3\soft_f_exp\truck_03\data\truck_03_cargo_ghex_co.paa","\a3\structures_f_epc\items\electronics\data\the_device_02_co.paa","\a3\structures_f_epc\items\electronics\data\the_device_03_co.paa"}, "" }
        };
    };
    class B_Truck_01_mover_F { // HEMTT Mover
        vItemSpace = 450;
        conditions = "";
        isDonator = false;
        price = 500000;
        textures[] = {
            { "HEMTT", "civ", {"\a3\soft_f_beta\truck_01\data\truck_01_ext_01_co.paa", "\a3\soft_f_beta\truck_01\data\truck_01_ext_02_co.paa", "\a3\soft_f_beta\truck_01\data\truck_01_mprimer_co.paa"}, "" },
            { "HEMTT", "LIMITED", {"#(rgb,8,8,3)color(0.97,0.03,0.5,1)", "#(rgb,8,8,3)color(0.97,0.03,0.5,1)", "#(rgb,8,8,3)color(0.97,0.03,0.5,1)"}, "" }
        };
    };
    class B_Truck_01_flatbed_F { // HEMTT Flatbed
        vItemSpace = 200;
        conditions = "";
        isDonator = false;
        price = 300000;
        textures[] = {
            { "Sand", "civ", {"\a3\soft_f_beta\truck_01\data\truck_01_ext_01_co.paa","\a3\soft_f_beta\truck_01\data\truck_01_ext_02_co.paa","\a3\soft_f_enoch\truck_01\data\truck_01_ammo_co.paa","\a3\soft_f_enoch\truck_01\data\truck_01_cargo_co.paa"}, "" },
            { "Olive", "civ", {"\a3\soft_f_exp\truck_01\data\truck_01_ext_01_olive_co.paa","\a3\soft_f_exp\truck_01\data\truck_01_ext_02_olive_co.paa","\a3\soft_f_enoch\truck_01\data\truck_01_ammo_pacific_co.paa","\a3\soft_f_enoch\truck_01\data\truck_01_cargo_pacific_co.paa"}, "" }
        };
    };
    class B_Truck_01_cargo_F { // HEMTT Cargo
        vItemSpace = 750;
        conditions = "";
        isDonator = false;
        price = 750000;
        textures[] = {
            { "Sand", "civ", {"\a3\soft_f_beta\truck_01\data\truck_01_ext_01_co.paa","\a3\soft_f_beta\truck_01\data\truck_01_ext_02_co.paa","\a3\soft_f_enoch\truck_01\data\truck_01_ammo_co.paa","\a3\soft_f_enoch\truck_01\data\truck_01_cargo_co.paa"}, "" },
            { "Olive", "civ", {"\a3\soft_f_exp\truck_01\data\truck_01_ext_01_olive_co.paa","\a3\soft_f_exp\truck_01\data\truck_01_ext_02_olive_co.paa","\a3\soft_f_enoch\truck_01\data\truck_01_ammo_pacific_co.paa","\a3\soft_f_enoch\truck_01\data\truck_01_cargo_pacific_co.paa"}, "" }
        };
    };
    class B_Truck_01_transport_F { // HEMTT Transport
        vItemSpace = 650;
        conditions = "";
        isDonator = false;
        price = 650000;
        textures[] = {
            { "Sand", "civ", {"\a3\soft_f_beta\truck_01\data\truck_01_ext_01_co.paa","\a3\soft_f_beta\truck_01\data\truck_01_ext_02_co.paa","\a3\soft_f_beta\truck_01\data\truck_01_cargo_co.paa"}, "" },
            { "Olive", "civ", {"\a3\soft_f_exp\truck_01\data\truck_01_ext_01_olive_co.paa","\a3\soft_f_exp\truck_01\data\truck_01_ext_02_olive_co.paa","\a3\soft_f_exp\truck_01\data\truck_01_cargo_olive_co.paa"}, "" }
        };
    };
    class B_Truck_01_covered_F { // HEMTT Transport (Covered)
        vItemSpace = 700;
        conditions = "";
        isDonator = false;
        price = 700000;
        textures[] = {
            { "Sand", "civ", {"\a3\soft_f_beta\truck_01\data\truck_01_ext_01_co.paa","\a3\soft_f_beta\truck_01\data\truck_01_ext_02_co.paa","\a3\soft_f_beta\truck_01\data\truck_01_cargo_co.paa","\a3\soft_f_beta\truck_01\data\truck_01_cover_co.paa"}, "" },
            { "Olive", "civ", {"\a3\soft_f_exp\truck_01\data\truck_01_ext_01_olive_co.paa","\a3\soft_f_exp\truck_01\data\truck_01_ext_02_olive_co.paa","\a3\soft_f_exp\truck_01\data\truck_01_cargo_olive_co.paa","\a3\soft_f_exp\truck_01\data\truck_01_cover_olive_co.paa"}, "" }
        };
    };
    class B_Truck_01_ammo_F { // HEMTT Ammo
        vItemSpace = 600;
        conditions = "";
        isDonator = false;
        price = 550000;
        textures[] = {
            { "Sand", "civ", {"\a3\soft_f_beta\truck_01\data\truck_01_ext_01_co.paa","\a3\soft_f_beta\truck_01\data\truck_01_ext_02_co.paa","\a3\soft_f_gamma\truck_01\data\truck_01_ammo_co.paa"}, "" },
            { "Olive", "civ", {"\a3\soft_f_exp\truck_01\data\truck_01_ext_01_olive_co.paa","\a3\soft_f_exp\truck_01\data\truck_01_ext_02_olive_co.paa","\a3\soft_f_exp\truck_01\data\truck_01_ammo_olive_co.paa"}, "" }
        };
    };
    class B_T_Truck_01_fuel_F { // HEMTT Fuel
        vItemSpace = 600;
		vFuelSpace = 775;
        conditions = "";
        isDonator = false;
        price = 600000;
        textures[] = {
            { "Sand", "civ", {"\a3\soft_f_beta\truck_01\data\truck_01_ext_01_co.paa","\a3\soft_f_beta\truck_01\data\truck_01_ext_02_co.paa","\a3\soft_f_gamma\truck_01\data\truck_01_fuel_co.paa"}, "" },
            { "Olive", "civ", {"\a3\soft_f_exp\truck_01\data\truck_01_ext_01_olive_co.paa","\a3\soft_f_exp\truck_01\data\truck_01_ext_02_olive_co.paa","\a3\soft_f_exp\truck_01\data\truck_01_fuel_olive_co.paa"}, "" }
        };
    };
    class B_Truck_01_box_F { // HEMTT Box
        vItemSpace = 800;
        conditions = "";
        isDonator = false;
        price = 800000;
        textures[] = {
            { "Sand", "civ", {"\a3\soft_f_beta\truck_01\data\truck_01_ext_01_co.paa","\a3\soft_f_beta\truck_01\data\truck_01_ext_02_co.paa","\a3\soft_f_gamma\truck_01\data\truck_01_mprimer_co.paa","\a3\structures_f\data\metal\containers\containers_02_set_co.paa"}, "" },
            { "Olive", "civ", {"\a3\soft_f_exp\truck_01\data\truck_01_ext_01_olive_co.paa","\a3\soft_f_exp\truck_01\data\truck_01_ext_02_olive_co.paa","\a3\soft_f_exp\truck_01\data\truck_01_ammo_olive_co.paa","\a3\structures_f\data\metal\containers\containers_02_set_co.paa"}, "" },
            { "TMC", "civ", {"data\textures\Gangs\TMC\TMC_HEMTT_Layer0.paa","data\textures\Gangs\TMC\TMC_HEMTT_Layer1.paa","data\textures\Gangs\TMC\TMC_HEMTT_Layer2.paa","data\textures\Gangs\TMC\TMC_HEMTT_Layer3.paa"}, "['TMC', player] call PHX_fnc_inWhitelistGang" }
        };
    };

    // Boats
    class C_Scooter_Transport_01_F { // Water Scooter
        vItemSpace = 15;
        conditions = "";
        isDonator = false;
        price = 25000;
        textures[] = {
            { "Black", "civ", {"\a3\boat_f_exp\scooter_transport_01\data\scooter_transport_01_black_co.paa","\a3\boat_f_exp\scooter_transport_01\data\scooter_transport_01_vp_black_co.paa"}, "" },
            { "Blue", "civ", {"\a3\boat_f_exp\scooter_transport_01\data\scooter_transport_01_blue_co.paa","\a3\boat_f_exp\scooter_transport_01\data\scooter_transport_01_vp_blue_co.paa"}, "" },
            { "Green", "civ", {"\a3\boat_f_exp\scooter_transport_01\data\scooter_transport_01_Green_co.paa","\a3\boat_f_exp\scooter_transport_01\data\scooter_transport_01_vp_Green_co.paa"}, "" },
            { "Grey", "civ", {"\a3\boat_f_exp\scooter_transport_01\data\scooter_transport_01_Grey_co.paa","\a3\boat_f_exp\scooter_transport_01\data\scooter_transport_01_vp_Grey_co.paa"}, "" },
            { "Red", "civ", {"\a3\boat_f_exp\scooter_transport_01\data\scooter_transport_01_Red_co.paa","\a3\boat_f_exp\scooter_transport_01\data\scooter_transport_01_vp_Red_co.paa"}, "" },
            { "White", "civ", {"\a3\boat_f_exp\scooter_transport_01\data\scooter_transport_01_White_co.paa","\a3\boat_f_exp\scooter_transport_01\data\scooter_transport_01_vp_White_co.paa"}, "" },
            { "Yellow", "civ", {"\a3\boat_f_exp\scooter_transport_01\data\scooter_transport_01_Yellow_co.paa","\a3\boat_f_exp\scooter_transport_01\data\scooter_transport_01_vp_Yellow_co.paa"}, "" },
            { "APC", "cop", {"data\textures\Police\Vehicles\Sea\Police_WaterScooter.paa"}, "" }
        };
    };
    class C_Rubberboat { // Rescue Boat
        vItemSpace = 200;
        conditions = "";
        isDonator = false;
        price = 35000;
        textures[] = { };
    };
    class B_Boat_Transport_01_F { // Assault Boat
        vItemSpace = 200;
        conditions = "";
        isDonator = false;
        price = 30000;
        textures[] = {
            { "APC", "cop", {"#(rgb,8,8,3)color(0.03,0.03,0.03,1)"}, "" },
            { "HAVOC", "havoc", {"data\textures\HAVOC\havocVehicleCamo.paa"}, "" },
            { "S/R Boat", "med", {"#(rgb,8,8,3)color(0.9,0.03,0.03,1)"}, "" }
        };
    };
    class C_Boat_Civil_01_F { // Motorboat
        vItemSpace = 150;
        conditions = "";
        isDonator = false;
        price = 40000;
        textures[] = { };
    };
    class C_Boat_Civil_01_police_F { // Motorboat (Police)
        vItemSpace = 150;
        conditions = "";
        isDonator = false;
        price = 40000;
        textures[] = {
            { "APC", "cop", {"data\textures\Police\Vehicles\Sea\Police_Motorboat.paa"}, "" }
        };
    };
    class C_Boat_Transport_02_F { // RHIB
        vItemSpace = 350;
        conditions = "";
        isDonator = false;
        price = 50000;
        textures[] = {};
    };
    class B_G_Boat_Transport_02_F { // Faction RHIB
        vItemSpace = 350;
        conditions = "";
        isDonator = false;
        price = 50000;
        textures[] = {
            { "APC", "cop", {"data\textures\Police\Vehicles\Sea\Police_RHIB_0.paa", "data\textures\Police\Vehicles\Sea\Police_RHIB_1.paa"}, "" },
            { "HAVOC", "havoc", {"data\textures\HAVOC\havocVehicleCamo.paa"}, "" },
            { "S/R Boats", "med", {"#(rgb,8,8,3)color(0.9,0.03,0.03,1)"}, "" }
        };
    };
    class B_Boat_Armed_01_minigun_F { // Speedboat Minigun
        vItemSpace = 200;
        conditions = "";
        isDonator = false;
        price = 750000;
        textures[] = {
            { "APC", "cop", {"data\textures\Police\Vehicles\Sea\Police_Speedboat_0.paa", "data\textures\Police\Vehicles\Sea\Police_Speedboat_1.paa"}, "" },
            { "HAVOC", "havoc", {"data\textures\HAVOC\havocVehicleCamo.paa"}, "" }
        };
    };
    class B_SDV_01_F { // SDV
        vItemSpace = 100;
        conditions = "";
        isDonator = false;
        price = 100000;
        textures[] = {};
    };

    // Helicopters
    class C_Heli_Light_01_civil_F { // M-900
        vItemSpace = 50;
        conditions = "";
        isDonator = false;
        price = 350000;
        textures[] = {
            { "Sheriff", "civ", {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sheriff_co.paa"}, "" },
            { "Civ Blue", "civ", {"\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa"}, "" },
            { "Civ Red", "civ", {"\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa"}, "" },
            { "Blueline", "civ", {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa"}, "" },
            { "Elliptical", "civ", {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa"}, "" },
            { "Furious", "civ", {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa"}, "" },
            { "Jeans Blue", "civ", {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa"}, "" },
            { "Speedy Redline", "civ", {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa"}, "" },
            { "Sunset", "civ", {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa"}, "" },
            { "Vrana", "civ", {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa"}, "" },
            { "Waves Blue", "civ", {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"}, "" },
            { "Shadow", "civ", {"\a3\air_f\Heli_Light_01\Data\Skins\Heli_Light_01_ext_shadow_co.paa"}, "" },
            { "Gray Watcher", "civ", {"\a3\air_f\Heli_Light_01\Data\Skins\Heli_Light_01_ext_graywatcher_co.paa"}, "" },
            { "Donator", "civ", {"data\textures\Donator\Vehicles\Money.paa"}, "PHX_DonatorLevel > 0" },
            { "Digi Green", "reb", {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa"}, "" },
            { "NHS Hummingbird", "med", {"data\textures\Medic\Vehicles\nhs_humming.paa"}, "" },
            { "Mike-900", "cop", {"data\textures\Police\Vehicles\Police_M900.paa"}, "" },
            { "Crystal", "civ", {"data\textures\Civilian\Vehicles\Prestige\MH9_Crystal.paa"}, "PHX_prestigeLevel >= 3" },
            { "Tiger", "civ", {"data\textures\Civilian\Vehicles\Prestige\MH9_Tiger.paa"}, "PHX_prestigeLevel >= 6" }
        };
    };
    class C_Heli_light_01_blue_F { // M-900 (SO1)
		vItemSpace = 50;
		conditions = "";
        isDonator = false;
		price = 350000;
		textures[] = {
            { "SO1 Hummingbird", "civ", {"data\textures\PM\PMHummingbird.paa"}, "" }
        };
	};
    class B_Heli_Light_01_F { // MH-9 Hummingbird
        vItemSpace = 50;
        conditions = "";
        isDonator = false;
        price = 450000;
        textures[] = {
            { "Sheriff", "civ", {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sheriff_co.paa"}, "" },
            { "Civ Blue", "civ", {"\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa"}, "" },
            { "Civ Red", "civ", {"\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa"}, "" },
            { "Blueline", "civ", {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa"}, "" },
            { "Elliptical", "civ", {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa"}, "" },
            { "Furious", "civ", {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa"}, "" },
            { "Jeans Blue", "civ", {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa"}, "" },
            { "Speedy Redline", "civ", {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa"}, "" },
            { "Sunset", "civ", {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa"}, "" },
            { "Vrana", "civ", {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa"}, "" },
            { "Waves Blue", "civ", {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"}, "" },
            { "Shadow", "civ", {"\a3\air_f\Heli_Light_01\Data\Skins\Heli_Light_01_ext_shadow_co.paa"}, "" },
            { "Gray Watcher", "civ", {"\a3\air_f\Heli_Light_01\Data\Skins\Heli_Light_01_ext_graywatcher_co.paa"}, "" },
            { "Donator", "civ", {"data\textures\Donator\Vehicles\Money.paa"}, "PHX_DonatorLevel > 0" },
            { "Digi Green", "reb", {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa"}, "" },
            { "NHS Hummingbird", "med", {"data\textures\Medic\Vehicles\nhs_humming.paa"}, "" },
            { "Mike-Hotel-9", "cop", {"data\textures\Police\Vehicles\Police_M900.paa"}, "" },
            { "URA MH-9", "OLD", {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"}, "" },
            { "DGN MH-9", "OLD", {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"}, "" },
            { "TIA MH-9", "OLD", {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"}, "" },
            { "SFG MH-9", "OLD", {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"}, "" },
            { "Ares", "OLD", {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa"}, "" },
            { "VENOM", "OLD", {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"}, "" },
            { "BIA", "OLD", {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"}, "" },
            { "SFG", "OLD", {"\a3\air_f\Heli_Light_01\Data\Skins\Heli_Light_01_ext_shadow_co.paa"}, "" },
            { "TFD", "OLD", {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"}, "" },
            { "Arcus", "OLD", {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"}, "" },
			{ "Wasp", "civ", {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wasp_co.paa"}, "" },
            { "BIA MH-9", "OLD", {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"}, "" },
            { "Crystal", "civ", {"data\textures\Civilian\Vehicles\Prestige\MH9_Crystal.paa"}, "PHX_prestigeLevel >= 3" },
            { "Tiger", "civ", {"data\textures\Civilian\Vehicles\Prestige\MH9_Tiger.paa"}, "PHX_prestigeLevel >= 6" },
            { "Red Gang Skin", "reb", {"data\textures\gangs\bases\gangred.paa"}, "['NE'] call PHX_fnc_ownsBase" },
            { "Green Gang Skin", "reb", {"data\textures\gangs\bases\ganggreen.paa"}, "['NW'] call PHX_fnc_ownsBase" },
            { "Blue Gang Skin", "reb", {"data\textures\gangs\bases\gangblue.paa"}, "['SW'] call PHX_fnc_ownsBase" },
            { "Marka", "OLD", {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"}, "" },
            { "Ares", "OLD", {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa"}, "" },
            { "Ares", "reb", {"data\textures\gangs\Ares\ares_hummingbird.paa"}, "['Ares', player] call PHX_fnc_inWhitelistGang" }
        };
    };
    class B_Heli_Light_01_stripped_F { // HAVOC Hummingbird
		vItemSpace = 50;
		conditions = "";
        isDonator = false;
		price = 450000;
		textures[] = {
	    	{ "HAVOC Hummingbird", "havoc", {"data\textures\HAVOC\havocVehicleCamo.paa"}, "" }
        };
	};
    class O_Heli_Light_02_unarmed_F { // Orca (Unarmed)
        vItemSpace = 150;
        conditions = "";
        isDonator = false;
        price = 3000000;
        textures[] = {
            { "White / Blue", "civ", {"\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa"}, "" },
            { "Digi Green", "civ", {"\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa"}, "" },
            { "Desert Digi", "civ", {"\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa"}, "" },
            { "Papa-Oscar-30", "cop", {"data\textures\Police\Vehicles\Police_Orca.paa"}, "" },
            { "HAVOC", "havoc", {"data\textures\HAVOC\havocVehicleCamo.paa"}, "" },
            { "Donator", "civ", {"data\textures\Donator\Vehicles\Money.paa"}, "PHX_DonatorLevel > 0" },
            { "NHS Orca", "med", {"data\textures\Medic\Vehicles\nhs_orca.paa"}, "" },
            { "Black", "reb", {"\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_CO.paa"}, "" },
            { "BIA Orca", "OLD", {"\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa"}, "['bia'] call PHX_fnc_inWhitelistGang" },
            { "Red Gang Skin", "reb", {"data\textures\gangs\bases\gangred.paa"}, "['NE'] call PHX_fnc_ownsBase" },
            { "Green Gang Skin", "reb", {"data\textures\gangs\bases\ganggreen.paa"}, "['NW'] call PHX_fnc_ownsBase" },
            { "Blue Gang Skin", "reb", {"data\textures\gangs\bases\gangblue.paa"}, "['SW'] call PHX_fnc_ownsBase" },
            { "Black / White", "civ", {"\a3\air_f_heli\heli_light_02\data\heli_light_02_ext_opfor_v2_co.paa"}, "" }
        };
    };
    class I_Heli_light_03_unarmed_F { // Hellcat
        vItemSpace = 100;
        conditions = "";
        isDonator = false;
        price = 2500000;
        textures[] = {
            { "Hellcat", "civ", {"\a3\air_f_epb\Heli_Light_03\data\Heli_Light_03_base_CO.paa"}, "" },
        	{ "Donator", "civ", {"data\textures\Donator\Vehicles\Money.paa"}, "PHX_DonatorLevel > 0" },
        	{ "HAVOC Hellcat", "havoc", {"data\textures\HAVOC\havocVehicleCamo.paa"}, "" },
        	{ "India-99", "cop", {"data\textures\Police\Vehicles\Police_Hellcat.paa"}, "" },
            { "Altis News", "OLD", {"\a3\air_f_epb\Heli_Light_03\data\Heli_Light_03_base_CO.paa"}, "" },
            { "Black", "reb", {"#(rgb,8,8,3)color(0.03,0.03,0.03,1)"}, "" },
            { "EAF", "reb", {"\a3\air_f_enoch\heli_light_03\data\heli_light_03_base_eaf_co.paa","\a3\supplies_f_enoch\ammoboxes\data\ammobox_eaf_co.paa","\a3\supplies_f_enoch\ammoboxes\data\ammobox_signs_eaf_ca.paa"}, "" }
        };
    };
    class I_Heli_light_03_F { // Hellcat (Armed)
        vItemSpace = 100;
        conditions = "playerside isequalto west || playerSide isEqualTo east";
        isDonator = false;
        price = 2500000;
        textures[] = {
            { "HAVOC Hellcat", "havoc", {"data\textures\HAVOC\havocVehicleCamo.paa"}, "" },
            { "Lynx-1", "cop", {"data\textures\Police\Vehicles\Police_Hellcat.paa"}, "" }
        };
    };
    class B_Heli_Transport_01_camo_F { // Ghosthawk
        vItemSpace = 175;
        conditions = "";
        isDonator = false;
        price = 5000000;
        textures[] = {
            { "Ghost Hawk", "reb", {"\a3\air_f_beta\heli_transport_01\data\heli_transport_01_ext01_blufor_co.paa", "\a3\air_f_beta\heli_transport_01\data\heli_transport_01_ext02_blufor_co.paa"}, ""},
            { "Ghost Hawk", "LIMITED", {"#(rgb,8,8,3)color(0.97,0.03,0.5,1)", "#(rgb,8,8,3)color(0.97,0.03,0.5,1)"}, ""},
            { "Ghost Hawk", "med", {"data\textures\Medic\vehicles\nhs_ghosthawk_0.paa", "data\textures\Medic\vehicles\nhs_ghosthawk_1.paa"}, ""}
        };
    };
    class B_Heli_Transport_01_F { // APC Ghost Hawk
        vItemSpace = 175;
        conditions = "";
        isDonator = false;
        price = 5000000;
        textures[] = {
            { "APC GhostHawk", "cop", {"data\textures\Police\Vehicles\police_ghosthawk_0.paa", "data\textures\Police\Vehicles\police_ghosthawk_1.paa"}, "" }
        };
    };
    class I_Heli_Transport_02_F { // Mohawk
        vItemSpace = 200;
        conditions = "";
        isDonator = false;
        price = 7500000;
        textures[] = {
            { "Mohawk", "civ", {"\a3\air_f_beta\Heli_Transport_02\Data\Heli_Transport_02_1_INDP_CO.paa","\a3\air_f_beta\Heli_Transport_02\Data\Heli_Transport_02_2_INDP_CO.paa","\a3\air_f_beta\Heli_Transport_02\Data\Heli_Transport_02_3_INDP_CO.paa"}, "" },
            { "NHS Mohawk", "OLD", {"\a3\air_f_beta\Heli_Transport_02\Data\Heli_Transport_02_1_INDP_CO.paa","\a3\air_f_beta\Heli_Transport_02\Data\Heli_Transport_02_2_INDP_CO.paa","\a3\air_f_beta\Heli_Transport_02\Data\Heli_Transport_02_3_INDP_CO.paa"}, "" },
            { "Ion", "civ", {"\a3\air_f_beta\heli_transport_02\data\skins\heli_transport_02_1_ion_co.paa","\a3\air_f_beta\heli_transport_02\data\skins\heli_transport_02_2_ion_co.paa","\a3\air_f_beta\heli_transport_02\data\skins\heli_transport_02_3_ion_co.paa","\a3\air_f_beta\heli_transport_02\data\heli_transport_02_int_02_co.paa"}, "" },
            { "Dahoman", "civ", {"\a3\air_f_beta\heli_transport_02\data\skins\heli_transport_02_1_dahoman_co.paa","\a3\air_f_beta\heli_transport_02\data\skins\heli_transport_02_2_dahoman_co.paa","\a3\air_f_beta\heli_transport_02\data\skins\heli_transport_02_3_dahoman_co.paa","\a3\air_f_beta\heli_transport_02\data\heli_transport_02_int_02_co.paa"}, "" }
        };
    };
    class O_Heli_Transport_04_F { // Taru
        vItemSpace = 50;
        conditions = "";
        isDonator = false;
        price = 10000000;
        textures[] = {};
    };
    class O_Heli_Transport_04_bench_F { // Taru (Bench)
        vItemSpace = 50;
        conditions = "";
        isDonator = false;
        price = 10000000;
        textures[] = {};
    };
    class O_Heli_Transport_04_covered_F { // Taru (Transport)
        vItemSpace = 300;
        conditions = "";
        isDonator = false;
        price = 17500000;
        textures[] = {};
    };
    class O_Heli_Transport_04_box_F { // Taru (Cargo)
        vItemSpace = 350;
        conditions = "";
        isDonator = false;
        price = 20000000;
        textures[] = {};
    };
    class O_Heli_Transport_04_ammo_F { // Taru (Ammo)
        vItemSpace = 250;
        conditions = "";
        isDonator = false;
        price = 15000000;
        textures[] = {};
    };
    class O_Heli_Transport_04_fuel_F { // Taru (Fuel)
        vItemSpace = 250;
        vFuelSpace = 600;
        conditions = "";
        isDonator = false;
        price = 15000000;
        textures[] = {};
    };
    class O_Heli_Transport_04_black_F { // APC Taru
        vItemSpace = 50;
        conditions = "";
        isDonator = false;
        price = 10000000;
        textures[] = {
            { "APC Taru", "cop", {"data\textures\police\vehicles\police_taru_0.paa","data\textures\police\vehicles\police_taru_1.paa"}, "" },
            { "HAVOC Taru", "havoc", {"data\textures\HAVOC\havocVehicleCamo.paa", "data\textures\HAVOC\havocVehicleCamo.paa"}, "" }
        };
    };
    class O_Heli_Transport_04_covered_black_F { // APC Taru (Transport)
        vItemSpace = 300;
        conditions = "";
        isDonator = false;
        price = 17500000;
        textures[] = {
            { "APC Taru", "cop", {"data\textures\police\vehicles\police_taru_0.paa","data\textures\police\vehicles\police_taru_1.paa","data\textures\police\vehicles\police_taru_2.paa"}, "" },
            { "HAVOC Taru", "havoc", {"data\textures\HAVOC\havocVehicleCamo.paa", "data\textures\HAVOC\havocVehicleCamo.paa","data\textures\HAVOC\havocVehicleCamo.paa", "data\textures\HAVOC\havocVehicleCamo.paa"}, "" }
        };
    };
    class O_Heli_Transport_04_box_black_F { // APC Taru (Cargo)
        vItemSpace = 350;
        conditions = "";
        isDonator = false;
        price = 20000000;
        textures[] = {
            { "APC Taru", "cop", {"data\textures\police\vehicles\police_taru_0.paa","data\textures\police\vehicles\police_taru_1.paa","data\textures\police\vehicles\police_taru_2.paa"}, "" }
        };
    };
    class O_Heli_Transport_04_medevac_black_F { // NHS Taru (Medical)
        vItemSpace = 250;
        conditions = "";
        isDonator = false;
        price = 15000000;
        textures[] = {
            { "NHS Taru", "med", { "data\textures\Medic\vehicles\nhs_taru_0.paa", "data\textures\Medic\vehicles\nhs_taru_1.paa", "data\textures\Medic\vehicles\nhs_taru_2.paa", "data\textures\Medic\vehicles\nhs_taru_3.paa"}, "" }
        };
    };
    class B_Heli_Transport_03_unarmed_F { // Huron (Unarmed)
        vItemSpace = 500;
        conditions = "";
        isDonator = false;
        price = 30000000;
        textures[] = {
            { "Black", "civ", {"\a3\air_f_heli\heli_transport_03\data\heli_transport_03_ext01_black_co.paa","\a3\air_f_heli\heli_transport_03\data\heli_transport_03_ext02_black_co.paa"}, "" },
            { "Olive", "civ", {"\a3\air_f_heli\heli_transport_03\data\heli_transport_03_ext01_co.paa","\a3\air_f_heli\heli_transport_03\data\heli_transport_03_ext02_co.paa"}, "" },
            { "APC Huron", "cop", {"data\textures\police\vehicles\police_huron_0.paa","data\textures\police\vehicles\police_huron_1.paa"}, "" }
        };
    };
    class B_Heli_Transport_03_unarmed_green_F { // NHS Huron (Unarmed)
        vItemSpace = 500;
        conditions = "";
        isDonator = false;
        price = 30000000;
        textures[] = {
			{ "NHS Huron", "med", {"data\textures\Medic\Vehicles\nhs_huron_0.paa", "data\textures\Medic\Vehicles\nhs_huron_1.paa"}, "" }
		};
    };
    class B_Heli_Transport_03_F { // HAVOC Huron (Unarmed)
        vItemSpace = 500;
        conditions = "";
        isDonator = false;
        price = 30000000;
        textures[] = {
			{ "HAVOC Huron", "havoc", {"data\textures\HAVOC\havocVehicleCamo.paa", "data\textures\HAVOC\havocVehicleCamo.paa"}, "" }
		};
    };
    class B_UAV_01_F { // AR-2 Darter
        vItemSpace = 0;
        conditions = "";
        isDonator = false;
        price = 0;
        textures[] = {
            { "APC Darter", "cop", {"data\textures\police\vehicles\police_darter.paa"}, "" }
        };
    };
    class O_UAV_01_F : B_UAV_01_F {};

    // Planes
    class C_Plane_Civil_01_F { // Caesar BTT
        vItemSpace = 250;
        conditions = "";
        isDonator = false;
        price = 750000;
        textures[] = {};
    };
    class C_Plane_Civil_01_racing_F { // Caesar BTT (Racing)
        vItemSpace = 250;
        conditions = "";
        isDonator = false;
        price = 750000;
        textures[] = {};
    };
    class B_T_VTOL_01_infantry_F { // Blackfish (Infantry Transport)
        vItemSpace = 550;
        conditions = "";
        isDonator = false;
        price = 50000000;
        textures[] = {};
    };
    class B_T_VTOL_01_vehicle_F { // Blackfish (Vehicle)
        vItemSpace = 600;
        conditions = "";
        isDonator = false;
        price = 80000000;
        textures[] = {};
    };
    class O_T_VTOL_02_infantry_F { // Y-32 Xi'an (Infantry Transport) [CIV]
        vItemSpace = 200;
        conditions = "";
        isDonator = false;
        price = 60000000;
        textures[] = {};
    };
    class O_T_VTOL_02_vehicle_F { // Y-32 Xi'an (Vehicle Transport) [CIV]
        vItemSpace = 250;
        conditions = "";
        isDonator = false;
        price = 90000000;
        textures[] = {};
    };
    class O_T_VTOL_02_infantry_grey_F { // Y-32 Xi'an (Infantry Transport)
        vItemSpace = 200;
        conditions = "playerSide isEqualTo east";
        isDonator = false;
        price = 60000000;
        textures[] = {
            { "Y-32 Xi'an", "havoc", {"data\textures\HAVOC\havocVehicleCamo.paa","data\textures\HAVOC\havocVehicleCamo.paa","data\textures\HAVOC\havocVehicleCamo.paa","data\textures\HAVOC\havocVehicleCamo.paa"}, "" }
        };
    };
    class O_T_VTOL_02_vehicle_grey_F { // Y-32 Xi'an (Vehicle Transport)
        vItemSpace = 250;
        conditions = "";
        isDonator = false;
        price = 90000000;
        textures[] = {
            { "Y-32 Xi'an", "havoc", {"data\textures\HAVOC\havocVehicleCamo.paa","data\textures\HAVOC\havocVehicleCamo.paa","data\textures\HAVOC\havocVehicleCamo.paa","data\textures\HAVOC\havocVehicleCamo.paa"}, "" }
        };
    };
    class I_Plane_Fighter_03_CAS_F { // A-143 Buzzard (CAS)
        vItemSpace = 25;
        conditions = "";
        isDonator = false;
        price = 75000000;
        textures[] = {};
    };
    class I_Plane_Fighter_04_F { // A-149 Gryphon
        vItemSpace = 25;
        conditions = "";
        isDonator = false;
        price = 150000000;
        textures[] = {};
    };
    class B_Plane_CAS_01_F { // A-164 Wipeout (CAS)
        vItemSpace = 25;
        conditions = "";
        isDonator = false;
        price = 110000000;
        textures[] = {};
    };
    class B_Plane_Fighter_01_F { // F/A-181 Black Wasp II
        vItemSpace = 25;
        conditions = "";
        isDonator = false;
        price = 120000000;
        textures[] = {};
    };
    class B_Plane_Fighter_01_Stealth_F { // F/A-181 Black Wasp II (Stealth)
        vItemSpace = 25;
        conditions = "";
        isDonator = false;
        price = 130000000;
        textures[] = {};
    };
    class O_Plane_CAS_02_F { // To-199 Neophron (CAS)
        vItemSpace = 25;
        conditions = "";
        isDonator = false;
        price = 150000000;
        textures[] = {};
    };
    class O_Plane_Fighter_02_F { // To-201 Shikra
        vItemSpace = 25;
        conditions = "";
        isDonator = false;
        price = 120000000;
        textures[] = {};
    };
    class O_Plane_Fighter_02_Stealth_F { // To-201 Shikra (Stealth)
        vItemSpace = 25;
        conditions = "";
        isDonator = false;
        price = 130000000;
        textures[] = {};
    };
    class I_LT_01_cannon_F { // AWC 304 Nyx (Autocannon)
        vItemSpace = 60;
        conditions = "";
        isDonator = false;
        price = 5500000;
        textures[] = {
            { "HAVOC AWC", "havoc", {"data\textures\HAVOC\havocVehicleCamo.paa", "data\textures\HAVOC\havocVehicleCamo.paa"}, "" }
        };
    };
    class I_APC_Wheeled_03_cannon_F { // AFV-4 Gorgon
        vItemSpace = 50;
        conditions = "";
        isDonator = false;
        price = 5000000;
        textures[] = {
            { "Gorgon", "havoc", {"data\textures\HAVOC\havocVehicleCamo.paa","data\textures\HAVOC\havocVehicleCamo.paa"}, "" }
        };
    };

    // Crates
    class Box_IND_Grenades_F {
        vItemSpace = 350;
        conditions = "";
        isDonator = false;
        price = -1;
        textures[] = {};
    };
    class B_supplyCrate_F {
        vItemSpace = 700;
        conditions = "";
        isDonator = false;
        price = -1;
        textures[] = {};
    };
    class Land_Bodybag_01_black_F {
        vItemSpace = 0;
        conditions = "";
        isDonator = false;
        price = -1;
        textures[] = {};
    };
    class Land_CargoBox_V1_F {
        vItemSpace = 0;
        conditions = "";
        isDonator = false;
        price = -1;
        textures[] = {};
    };
    class CargoNet_01_box_F {
        vItemSpace = 0;
        conditions = "";
        isDonator = false;
        price = -1;
        textures[] = {};
    };
    class O_CargoNet_01_ammo_F {
        vItemSpace = 0;
        conditions = "";
        isDonator = false;
        price = -1;
        textures[] = {};
    };
    class B_Slingload_01_Cargo_F {
        vItemSpace = 500;
        conditions = "";
        isDonator = false;
        price = 5000000;
        textures[] = {};
    };

//--- Auction 
    class B_T_Boat_Armed_01_minigun_F { // Speedboat Minigun
        vItemSpace = 200;
        conditions = "";
        isDonator = false;
        price = 0;
        textures[] = {};
    };
    class B_AFV_Wheeled_01_cannon_F { // Rhino MGS	
        vItemSpace = 200;
        conditions = "";
        isDonator = false;
        price = 0;
        textures[] = {};
    };
    class O_Heli_Attack_02_black_F { // Mi-48 Kajman (Black)
        vItemSpace = 200;
        conditions = "";
        isDonator = false;
        price = 0;
        textures[] = {};
    };
    class B_APC_Wheeled_03_cannon_F { // AFV-4 Gorgon
        vItemSpace = 200;
        conditions = "";
        isDonator = false;
        price = 0;
        textures[] = {};
    };
    class B_Heli_Attack_01_F { // AH-99 Blackfoot	
        vItemSpace = 200;
        conditions = "";
        isDonator = false;
        price = 0;
        textures[] = {};
    };
};
