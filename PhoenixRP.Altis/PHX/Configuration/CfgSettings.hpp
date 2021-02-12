/*
	@File: CfgSettings.hpp
	@Author: Jack "Scarso" Farhall & Lewis Mackinnon
	@Description: Configures the overal server settings.
*/
#define true 1
#define false 0

class CfgSettings {
    framework_version = "5.0.0";

    crime_delay = 1200; // Settings...

    statistics[] = {"kills", "deaths", "headshots"};
    baseMarkers[] = {"gang_base", "gang_base_1", "gang_base_2"};
    
    /* Non-Lethal Firearms */
    taserGuns[] = { "hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_01_MRD_F","hgun_Pistol_heavy_01_snds_F" };
    taserAmmo[] = { "B_45ACP_Ball","B_9x21_Ball" };
    rubberGuns[] = { "arifle_Mk20C_plain_F", "arifle_Mk20_plain_F" };

    /* Donation Settings */
    donation_goal_sellprice_multiplier = 1.5; // Multiplier for sell price when donation goal is active (price * multiplier)
    donation_goal_paycheck_multiplier = 1.25; // Multiplier for the paychecks when donation goal is active (paycheck * multiplier)
    
    /* ID System */
    races[] = {"White", "Black", "Asian", "Gypsy", "Mixed", "Other"};
    genders[] = {"Male", "Female", "Transgender", "Other"};
    ageLimits[] = {18, 99};

    /* Data Logging Settings */
    spyGlass_toggle = true;
    battlEye_friendlyLogging = false;
    player_advancedLog = false;
    player_moneyLog = false;
    player_deathLog = false;    

    /* Escape Menu Configuration */
    escapeMenu_timer = 10;
    escapeMenu_displayExtras = true;
    escapeMenu_displayText = "Thanks for playing!";

    /* Main Menu Configuration */
    mainMenu_enabled = true;

    enableUndercover = true;

    // Credit to the ArmaAchilles developers for this list...
    mainMenu_animations[] = {
        "hubbriefing_loop",
        "hubbriefing_loop",
        "hubbriefing_loop",
        "hubbriefing_lookaround1",
        "hubbriefing_lookaround2",
        "hubbriefing_scratch",
        "hubbriefing_stretch",
        "hubbriefing_talkaround"
    };

    // Positions (Class is to allow for multi map support)
    class Altis {
        mainMenu_position[] = {3588.05, 10700.6, 0, 355.685};
        objects[] = {
            {"Land_CratesWooden_F", {3586.36, 10700.8, 0, 303.406}},
            {"Land_Camping_Light_F", {3587.19, 10701.1, 0.73, 0}}
        };
    };

    class Tanoa {
        mainMenu_position[] = {2681.74,9386.79,0,190};
        objects[] = {};
    };

    enableSnow = false;

    /* Player Data Saving */
    disableCommanderView = true;
    player_fatigue = false;
    default_maxWeight = 24;
    save_playerStats = true;
    save_virtualItems = true;
    hm_required_number = 5;
    atm_cooldown = 10;
    perk_removal = 100000;
    premium_membership = false;

    /* Bank System Configurations */
    starting_bank = 250000;

    /* Paycheck System Configurations */
    paycheck_cop = 0;
    paycheck_civ = 0;
    paycheck_med = 0;
    paycheck_hav = 0;
    paycheck_period = 15;

    /* Medical System Configurations */
    bleedout_timer = 1200;
    bleedout_increase = 200;
    respawn_timer = 180;
    revive_fee = 1500;
    hospital_heal_fee = 5000;
    revive_cops = true;

    /* Vehicle Data Saving */
    // "B_G_Offroad_01_armed_F", "I_C_Offroad_02_LMG_F"
    vehicleShop_rentalOnly[] = {"O_T_LSV_02_armed_F","C_IDAP_Van_02_vehicle_F","SUV_01_base_black_F","SUV_01_base_grey_F","C_Offroad_01_repair_F","C_Van_02_service_F","SUV_01_base_red_F","C_Heli_light_01_blue_F","B_T_LSV_01_armed_F"};
    vehicleShop_3D = true;
    save_vehicle_virtualItems = true;
    save_vehicle_inventory = false;
    save_vehicle_fuel = true;
    save_vehicle_damage = true;
    save_vehicle_illegal = false;
    rearmableVehicles[] = { "B_G_Offroad_01_armed_F", "I_C_Offroad_02_LMG_F" };
    fuelTankers[] = { "B_G_Van_01_fuel_F", "B_T_Truck_01_fuel_F", "O_Truck_03_fuel_F", "C_Truck_02_fuel_F" };
    drones[] = { "B_UAV_01_F", "O_UAV_01_F"};

    vehicle_rental_multiplier = 0.5;
    vehicle_sell_multiplier = 0.6;
    vehicle_chop_multiplier = 0.65;
    vehicle_store_multiplier = 0.002;
    vehicle_impound_multiplier = 0.0025;
    vehicle_impound_price = 2000;

    /* Fuel System Configurations */
    pump_service = true;
    fuel_cost = 0;
    service_aircraft = 1000;
    fuelCan_refuel = 250;

    /* Property System Configurations */
    house_limit = 4;
    gang_house_limit = 3;

    categoryCost = 100000;
    categoryStorage = 1000;
    categories[] = {
        {"add", "\A3\ui_f\data\GUI\Rsc\RscDisplayArsenal\cargoMisc_ca.paa"},
        {"Face", "\A3\ui_f\data\GUI\Rsc\RscDisplayArsenal\face_ca.paa"},
        {"Uniform", "\A3\ui_f\data\GUI\Rsc\RscDisplayArsenal\uniform_ca.paa"},
        {"Vest", "\A3\ui_f\data\GUI\Rsc\RscDisplayArsenal\vest_ca.paa"},
        {"Backpack", "\A3\ui_f\data\GUI\Rsc\RscDisplayArsenal\backpack_ca.paa"},
        {"Gun", "\A3\ui_f\data\GUI\Rsc\RscDisplayArsenal\handgun_ca.paa"},
        {"Mag", "\A3\ui_f\data\GUI\Rsc\RscDisplayArsenal\cargoMag_ca.paa"},
        {"Scope", "\A3\ui_f\data\GUI\Rsc\RscDisplayArsenal\itemOptic_ca.paa"},
        {"Muzzle", "\A3\ui_f\data\GUI\Rsc\RscDisplayArsenal\itemMuzzle_ca.paa"},
        {"Bipod", "\A3\ui_f\data\GUI\Rsc\RscDisplayArsenal\itemBipod_ca.paa"},
        {"Laser", "\A3\ui_f\data\GUI\Rsc\RscDisplayArsenal\itemAcc_ca.paa"}
    };

    /* Government */

    // Tax
    baseTax = 5;
    untaxedStores[] = {"so1_equipment", "basic_rebel" , "advanced_rebel", "apc_general_store", "tst_patrol_store", "tst_operation_store", "nhs_general_store", "havoc_general_store","so1_market","drug_dealer","moonshine_dealer","gold_buyer","plutonium_trader","antique_trader","uranium_trader","cigar_exports","ephedrine_dealer","weapon_parts_1","weapon_parts_2","weapon_trader","medical_supplies","hmp_market","rebel_market","apc_market","nhs_market","hav_market","hidden_market","rebel_store","so1_clothing","apc_clothing","nhs_clothing","havoc_clothing"};

    // Limits
    limitTax[] = {1, 10};
    limitPaycheck[] = {1000, 10000};
    limitRevival[] = {5000, 20000};
    limitFuel[] = {10, 250};

    // Other
    so1Tax[] = {3, 1.5};

    /* Organisation System Configurations */
    gang_price = 25000;
    gang_upgradeBase = 10000;
    gang_upgradeMultiplier = 2.5;

    /* Prison System Configurations */
    sendtoJail_locations[] = {"hmp_prison_altis"};
    jail_timeMultiplier = 15;

    /* Search & Seizure System Configurations */
    seize_exempt[] = {};
    seize_uniform[] = {};
    seize_vest[] = {};
    seize_headgear[] = {};
    seize_minimum_rank = 2;

    /* Clothing System Configurations */
    clothing_noTP = false;
    clothing_box = true;
    clothing_masks[] = { "G_AirPurifyingRespirator_02_black_F", "G_AirPurifyingRespirator_02_olive_F", "G_AirPurifyingRespirator_02_sand_F", "G_AirPurifyingRespirator_01_F", "G_RegulatorMask_F", "H_RacingHelmet_1_black_F", "H_RacingHelmet_1_blue_F", "H_RacingHelmet_1_green_F", "H_RacingHelmet_1_orange_F", "H_RacingHelmet_1_red_F",  "H_RacingHelmet_1_white_F", "H_RacingHelmet_1_yellow_F", "G_Balaclava_blk", "G_Balaclava_oli", "G_Bandanna_aviator", "H_BandMask_khk", "G_Bandanna_oli", "G_Bandanna_shades", "G_Bandanna_sport", "G_Bandanna_tan", "G_AirPurifyingRespirator_02_sand_F", "G_RegulatorMask_F", "G_Balaclava_lowprofile", "G_BalaClava_TI_blk_F", "G_Balaclava_TI_G_blk_F", "G_BalaClava_TI_tna_FS", "U_B_GhillieSuit", "H_Shemag_olive", "H_Shemag_olive_hs", "H_ShemagOpen_khk", "H_ShemagOpen_tan", "U_B_GhillieSuit", "G_Balaclava_combat"};
    fullnightvision[] = { "G_Tactical_Clear", "G_Tactical_Black", "G_Goggles_VR", "G_Balaclava_combat", "G_Balaclava_TI_G_blk_F"};
    storesToIgnore[] = { "apc_general_Store", "tpu_general_Store", "ctu_general_Store", "cid_general_store", "nhs_general_store", "news_clothing", "lawyer_clothing", "taxi_clothing", "repair_clothing", "so1_clothing", "governor_clothing", "apc_clothing", "nhs_clothing", "havoc_clothing" };
    
    radiation_masks[] = { "G_AirPurifyingRespirator_02_black_F", "G_AirPurifyingRespirator_02_olive_F", "G_AirPurifyingRespirator_02_sand_F", "G_AirPurifyingRespirator_01_F", "G_RegulatorMask_F"};
    radiation_uniforms[] = {"U_I_Wetsuit", "U_C_CBRN_Suit_01_White_F", "U_C_CBRN_Suit_01_Blue_F", "U_B_CBRN_Suit_01_MTP_F", "U_I_CBRN_Suit_01_AFF_F", "U_I_E_CBRN_Suit_01_EAF_F"};

    /* Player Job System Configurations */
    delivery_points[] = { "dp_1", "dp_2", "dp_3", "dp_4", "dp_5", "dp_6", "dp_7", "dp_8", "dp_9", "dp_10", "dp_11", "dp_12", "dp_13", "dp_14", "dp_15", "dp_15", "dp_16", "dp_17", "dp_18", "dp_19", "dp_20" };
    petrol_stations[] = { "Fuel_1", "Fuel_2", "Fuel_3", "Fuel_4","Fuel_5", "Fuel_6", "Fuel_7", "Fuel_8", "Fuel_9", "Fuel_10", "Fuel_11", "Fuel_12", "Fuel_13", "Fuel_14", "Fuel_15", "Fuel_16", "Fuel_17", "Fuel_18", "Fuel_19", "Fuel_20" };

    /* Hunting & Fishing System Configurations */
    animaltypes_fish[] = { "Salema_F", "Ornate_random_F", "Mackerel_F", "Tuna_F", "Mullet_F", "CatShark_F", "Turtle_F" };
    animaltypes_hunting[] = { "Sheep_random_F", "Goat_random_F", "Hen_random_F", "Cock_random_F", "Rabbit_F" };

    /* Patrol Missions */
    Police_Missions[] = {
        {"Kavala", {3642.73,13111.9,0}},
        {"Athira", {14044,18746.7,0}},
        {"Agios", {9385.24,15885.9,0}},
        {"Neochori", {12476.9,14316.4,0}},
        {"Zaros", {9045.39,11960.7,0}},
        {"Telos", {16300.6,17301,0}},
        {"Pyrgos", {16820.8,12712.3,0}},
        {"Sofia", {25709.8,21383.3,0}},
        {"Paros", {20963.8,16971,0}},
        {"Dorida", {19369.1,13229.5,0}},

        {"Coral Reef", {2835.39,9461.92}},
        {"Tobacco Field", {11165.7,17502.4}},
        {"Oil Field", {9255,13864.2}},
        {"Weed Field", {6510.51,14377.7}},
        {"Heroin Field", {22874,20525.4}}, // fix
        {"Cocaine Field", {6919.56,19276,0}}, // fix
        {"Meth Dispensary", {18329.7,15649.4}}, // fix
        {"Corn Field", {17647.1,12248.6}},
        {"Exctasy Field", {19158.5,12849.9}},

        {"Sand Mine", {8124.81,22550.5}}, // fix
        {"Copper Mine", {4415.97,12598.7}},
        {"Iron Mine", {5108.12,16134.4}},
        {"Silicon Mine", {11638.5,18744.4}},
        {"Aluminium Mine", {5483.09,10874.3}},
        {"Salt Mine", {24560.4,19255}},
        {"Silver Mine", {21482.2,18335.2}}, // fix
        {"Diamond Mine", {18441.7,14278.3}}, // fix
        {"Uranium Mine", {22501.8,19618.4}}, // fix

        {"Tobacco Processing", {12599,15378}},
        {"Oil Processing", {6261.47,16261.7}},
        {"Weed Processing", {5106.89,16796.5}},
        {"Cocaine Processing", {17560.8,18907.4}},
        {"Meth Lab", {10390.3,17204.3}},
        {"Salt Processing", {27371.8,24468.8}},
        {"Silver Processing", {17012.5,15227.4}},
        {"Heroin Processing", {20889.6,14629.5}},
        {"Multi-Drug Processing", {25284.9,22652,0}}, // new
        {"Sand Processing", {5391.68,17903.2}}, // fix
        {"Copper Processing", {7860.3,16144.8}},
        {"Iron Processing", {9541.94,15093.3}},
        {"Silicon Processing", {13331.1,16902.2}},
        {"Aluminium Processing", {4170.94,15069.7}},
        {"Uranium Processing", {16144.1,18342.1}},

        {"Weapon Parts-1", {23646.1,21792.1}},
        {"Weapon Parts-2", {26028.5,19724,0}}, //fix
        {"Weapon Parts Processing", {19080.734,17572.758}}, //fix name

        {"Goldsmith", {20601.5,20128.6}}, //fix
        {"Abandoned Reactor", {8224.75,10910.9}}, //new
        {"Crafting Site", {27817.6,22245.6}}, //fix
        {"Kavala Metal Exports", {5309.67,14475.8}},
        {"Athira Metal Exports", {17821,18114}},
        {"Cigarette Exporter", {6815.87,15852.3}},
        {"Oil Trader", {13629.1,14950.2}}, //fix name
        {"Glass Trader", {8585.15,18282}},
        {"Silicon Exporter", {12692.8,14724.8}},
        {"Diamond Trader", {14491.4,17593.4}},
        {"Gem Trader", {9017.05,12146.1}},
        {"Cigar Exporter", {16546.4,15533.8}},
        {"Salt Trader", {25958.2,21375.3}},
        {"Coral Exports", {3891.54,17335.8}},

        {"Kavala Drug Dealer", {3935.7,13858.9}}, //fix
        {"Athira Drug Dealer", {14451.7,17451.6}},
        {"Dorida Drug Dealer", {19287.3,13188.6}}, // fix name
        {"Kavala Turtle Dealer", {3293.36,14104.5}},
        {"Athira Turtle Dealer", {13359.2,14513.1}},
        
        {"Western Gold Buyer", {4190.14,11782.2}},
        {"Eastern Gold Buyer", {22763.5,13572.5}}, // fix

        {"Kavala Chop Shop", {3048.03,18471.9}},
        {"Pyrgos Chop Shop", {21358.4,12942.3}},
        {"Sofia Chop Shop", {24661,23164.1}},

        {"Vehicle Rearm Point", {15310.7,15853.8}}, // fix
        {"Forger", {25337,22012.9}}, //new

        {"HM. Treasury", {16083.8,17000}},
        {"HM. Prison Altis", {12150.4,14067.6}},
        {"APC Evidence Locker", {12640.8,16412.7}},
        {"Governor's Residence", {3595.23,14408.7,0}},
        {"Abandoned Checkpoint", {21331.8,17222.3,0}} //fix
    };

    /* 
    Havoc_Missions[] = {
        {"Pyrgos", {16820.8,12712.3,0}},
        {"Sofia", {25709.8,21383.3,0}},
        {"Paros", {20963.8,16971,0}},
        {"Dorida", {19369.1,13229.5,0}},

        {"Corn Field", {17647.1,12248.6}},
        {"Exctasy Field", {19158.5,12849.9}},

        {"Salt Mine", {24560.4,19240.6}},
        {"Silver Mine", {19692.4,12371.2}},
        {"Diamond Mine", {17012.5,15227.4}},
        {"Uranium Mine", {19861,17877.8}},

        {"Salt Processing", {27371.8,24468.8}},
        {"Silver Processing", {17012.5,15227.4}},
        {"Heroin Processing", {20889.6,14629.5}},

        {"Goldsmith", {20623.2,17203.2}},
        {"Crafting Site", {20614.2,15605.5,0}},

        {"Weapon Parts-1", {23646.1,21792.1}},
        {"Weapon Parts-2", {25571.5,19700.1}},
        {"Weapon Parts Processing", {22617.5,16810.7}},

        {"Cigar Exporter", {16546.4,15533.8}},
        {"Salt Trader", {25958.2,21375.3}},
        {"Plutonium Dealer", {22772.4,13573.2}},
        {"Eastern Gold Buyer", {23994.5,15444}},
        {"Eastern Drug Dealer", {19287.3,13188.6}},

        {"Southern Chop Shop", {21358.4,12942.3}},
        {"Northern Chop Shop", {24661,23164.1}},

        {"HAVOC Armoury", {20955.3,19250.7}},

        {"Ammo Refill Point", {26722.1,22794.6}}
    };
    */ 

    NHS_Missions[] = {
        {"Kavala", {3642.73,13111.9,0}},
        {"Athira", {14044,18746.7,0}},
        {"Agios", {9385.24,15885.9,0}},
        {"Neochori", {12476.9,14316.4,0}},
        {"Zaros", {9045.39,11960.7,0}},
        {"Telos", {16300.6,17301,0}},
        {"Pyrgos", {16820.8,12712.3,0}},
        {"Sofia", {25709.8,21383.3,0}},
        {"Paros", {20963.8,16971,0}},
        {"Dorida", {19369.1,13229.5,0}},

        {"Coral Reef", {2835.39,9461.92}},
        {"Tobacco Field", {11165.7,17502.4}},
        {"Oil Field", {9255,13864.2}},
        {"Weed Field", {6510.51,14377.7}},
        {"Heroin Field", {22874,20525.4}}, // fix
        {"Cocaine Field", {6919.56,19276,0}}, // fix
        {"Meth Dispensary", {18329.7,15649.4}}, // fix
        {"Corn Field", {17647.1,12248.6}},
        {"Exctasy Field", {19158.5,12849.9}},

        {"Sand Mine", {8124.81,22550.5}}, // fix
        {"Copper Mine", {4415.97,12598.7}},
        {"Iron Mine", {5108.12,16134.4}},
        {"Silicon Mine", {11638.5,18744.4}},
        {"Aluminium Mine", {5483.09,10874.3}},
        {"Salt Mine", {24560.4,19255}},
        {"Silver Mine", {21482.2,18335.2}}, // fix
        {"Diamond Mine", {18441.7,14278.3}}, // fix
        {"Uranium Mine", {22501.8,19618.4}}, // fix

        {"Tobacco Processing", {12599,15378}},
        {"Oil Processing", {6261.47,16261.7}},
        {"Weed Processing", {5106.89,16796.5}},
        {"Cocaine Processing", {17560.8,18907.4}},
        {"Meth Lab", {10390.3,17204.3}},
        {"Salt Processing", {27371.8,24468.8}},
        {"Silver Processing", {17012.5,15227.4}},
        {"Heroin Processing", {20889.6,14629.5}},
        {"Multi-Drug Processing", {25284.9,22652,0}}, // new
        {"Sand Processing", {5391.68,17903.2}}, // fix
        {"Copper Processing", {7860.3,16144.8}},
        {"Iron Processing", {9541.94,15093.3}},
        {"Silicon Processing", {13331.1,16902.2}},
        {"Aluminium Processing", {4170.94,15069.7}},
        {"Uranium Processing", {16144.1,18342.1}},

        {"Weapon Parts-1", {23646.1,21792.1}},
        {"Weapon Parts-2", {26028.5,19724,0}}, //fix
        {"Weapon Parts Processing", {19080.734,17572.758}}, //fix name

        {"Goldsmith", {20601.5,20128.6}}, //fix
        {"Abandoned Reactor", {8224.75,10910.9}}, //new
        {"Crafting Site", {27817.6,22245.6}}, //fix
        {"Kavala Metal Exports", {5309.67,14475.8}},
        {"Athira Metal Exports", {17821,18114}},
        {"Cigarette Exporter", {6815.87,15852.3}},
        {"Oil Trader", {13629.1,14950.2}}, //fix name
        {"Glass Trader", {8585.15,18282}},
        {"Silicon Exporter", {12692.8,14724.8}},
        {"Diamond Trader", {14491.4,17593.4}},
        {"Gem Trader", {9017.05,12146.1}},
        {"Cigar Exporter", {16546.4,15533.8}},
        {"Salt Trader", {25958.2,21375.3}},
        {"Coral Exports", {3891.54,17335.8}},

        {"Kavala Drug Dealer", {3935.7,13858.9}}, //fix
        {"Athira Drug Dealer", {14451.7,17451.6}},
        {"Dorida Drug Dealer", {19287.3,13188.6}}, // fix name
        {"Kavala Turtle Dealer", {3293.36,14104.5}},
        {"Athira Turtle Dealer", {13359.2,14513.1}},
        
        {"Western Gold Buyer", {4190.14,11782.2}},
        {"Eastern Gold Buyer", {22763.5,13572.5}}, // fix

        {"Kavala Chop Shop", {3048.03,18471.9}},
        {"Pyrgos Chop Shop", {21358.4,12942.3}},
        {"Sofia Chop Shop", {24661,23164.1}},

        {"Vehicle Rearm Point", {15310.7,15853.8}}, // fix
        {"Forger", {25337,22012.9}}, //new

        {"HM. Treasury", {16083.8,17000}},
        {"HM. Prison Altis", {12150.4,14067.6}},
        {"APC Evidence Locker", {12640.8,16412.7}},
        {"Governor's Residence", {3595.23,14408.7,0}},
        {"Abandoned Checkpoint", {21331.8,17222.3,0}} //fix
    };

    weed_markers[] = { "weed_field", "weed_processing" };
    fish_markers[] = { "fish_market_kavala", "fish_market_2", "fishing_zone_1", "fishing_zone_2", "fishing_zone_3", "fishing_zone_4", "fishing_zone_5", "fishing_area_1", "fishing_area_2", "fishing_area_3", "fishing_area_4", "fishing_area_5" };
    turtle_markers[] = { "turtle_dealer_neochori", "turtle_dealer_kavala", "turtle_poaching_1", "turtle_poaching_2","turtle_area_1", "turtle_area_2" };
    oil_markers[] = { "oil_field", "oil_processing", "oil_trader" };
    coral_markers[] = { "coral_reef", "coral_exports" };
    cigarette_markers[] = { "cigarette_exporter" };
    cigar_markers[] = { "cigar_exports" };

    bidLimits[] = {5000000, 1000000};
    
    /* Wanted System Settings */
    crimes[] = {
        {"Murder","0","187", true},
        {"Attempted Murder","0","1", false},
        {"Conspiracy to Commit Murder","0","2", false},
        {"Manslaughter","0","3", false},
        {"Threats to Kill","0","4", false},

        {"Perverting the Course of Justice","0","5", false},
        {"Failure to Disclose Information","0","6", false},
        {"Aiding and Abetting","0","7", false},
        {"Escape from custody","0","901", true},

        {"Common Assault","0","8", false},
        {"Verbal Assault","0","9", false},
        {"Violent Disorder","0","10", false},
        {"Hostage-Taking","0","11", false},
        {"Criminal Damage","0","12", false},
        {"Fear or Provocation of Violence","0","13", false},

        {"Going Equipped","0","14", false},
        {"Attempted Vehicle Theft","0","215", true},
        {"Vehicle Theft","0","487", true},
        {"Attempted Burglary","0","15", false},
        {"Burglary","0","459", true},
        {"Attempted Robbery","0","16", false},
        {"Robbery","0","211", true},

        {"Carrying a Firearm in a Public Place","0","17", false},
        {"Carrying a Firearm with Criminal Intent","0","18", false},
        {"Possession of a Weapon Subject to General Prohibition","0","19", false},
        {"Possession of Ammunition Subject to General Prohibition","0","20", false},
        {"Possession of an Attachment Subject to General Prohibition","0","21", false},
        {"Purchasing or Possessing Firearms or Ammunition without Certificate","0","22", false},
        {"Unauthorised Supply of Firearms or Ammunition","0","23", false},

        {"Possession of a Contraband with intent of personal use","0","24", false},
        {"Possession of a Contraband with Intent to Supply","0","25", false},
        {"Trafficing of Contraband with Intent to Supply","0","483", true},

        {"Speeding","0","26", false},
        {"Misuse of Horn","0","27", false},
        {"Driving without Lights","0","28", false},
        {"Driving Elsewhere than on Roads","0","29", false},
        {"Driving without Due Care of Attention","0","30", false},
        {"Driving Otherwise than in Accordance with a Licence","0","31", false},
        {"Driving a Vehicle Subject to Lethal Authorisation","0","32", false},
        {"Failing to Stop for Police","0","33", false}
    }; 
};

class Parties {
    class AIP {
        name = "Altis National Party";
        icon = "data\perks\mindfulPlanner.paa";
    };
    class ANP {
        name = "Altis Independence Party";
        icon = "data\perks\mindfulPlanner.paa";
    };
    class Ind {
        name = "Independent";
        icon = "data\perks\mindfulPlanner.paa";
    };
};

#include "CfgClothing.hpp"
#include "CfgLicenses.hpp"
#include "CfgVehicles.hpp"
#include "CfgItems.hpp"
#include "CfgWeapons.hpp"
#include "CfgSpawnPoints.hpp"
#include "CfgProcess.hpp"
#include "CfgShops.hpp"
#include "CfgTextures.hpp"
#include "CfgProfessions.hpp"
#include "CfgLevels.hpp"
#include "CfgPerks.hpp"
#include "CfgGathering.hpp"
#include "CfgActions.hpp"
#include "CfgJobs.hpp"
#include "CfgContacts.hpp"
#include "CfgAchievements.hpp"
#include "CfgColours.hpp"
#include "CfgDonatorIcons.hpp"
#include "CfgHousing.hpp"
#include "CfgGangs.hpp"
#include "CfgStores.hpp"
#include "CfgBlueprints.hpp"
#include "CfgMedical.hpp"
#include "CfgCameras.hpp"
#include "CfgPlaceables.hpp"
#include "CfgMap.hpp"
#include "CfgArmoury.hpp"
#include "CfgSmuggle.hpp"
#include "CfgWhitelistedGangs.hpp"
#include "CfgShipwrecks.hpp"
#include "CfgTitles.hpp"
#include "CfgUpgrades.hpp"
#include "CfgVehicleUpgrades.hpp"
#include "..\Cartel\Configuration\CfgCartel.hpp"
#include "..\Airdrop\Configuration\CfgAirdrop.hpp"
#include "..\Admin\Configuration\CfgPowers.hpp"
#include "..\Loyalty\Configuration\CfgLoyalty.hpp"
#include "..\GUI\MovesMenu\Configuration\CfgMoves.hpp"
