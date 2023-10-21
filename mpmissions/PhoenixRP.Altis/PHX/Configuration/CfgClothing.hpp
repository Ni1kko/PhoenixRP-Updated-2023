/*
    @File: CfgClothing.hpp
  	@Author: Lewis Mackinnon
   	@Description: Configures the contents of the clothing stores.
*/

class CfgClothing {

    class Altis {
        // Civilian CLothing Stores
        class general_clothing {
            title = "General Clothing";
            conditions = "playerSide isEqualTo civilian || { (player getVariable ['isCID', false]) || (player getVariable ['isHSS', false])}";
            side = "civ";
            uniforms[] = {
                { "NONE", "Remove Uniform", 0, "true" },
                //{ "U_O_R_Gorka_01_black_F", "(Donator) Tracksuit", 10000, "PHX_DonatorLevel > 0" },
                { "U_C_Man_casual_2_F", "Gang Skin", 200, "['TMC', player] call PHX_fnc_inWhitelistGang" }, // Gang Skin
                { "U_I_C_Soldier_Bandit_4_F", "Bandit Clothes", 200, "true" },
                { "U_I_C_Soldier_Bandit_2_F", "Bandit Clothes (Skull)", 200, "true" },
                { "U_C_Man_casual_4_F", "Summer Clothes (Sky)", 200, "true" },
                { "U_C_Man_casual_5_F", "Summer Clothes (Yellow)", 200, "true" },
                { "U_C_Man_casual_6_F", "Summer Clothes (Red)", 200, "true" },
                { "U_C_Man_casual_2_F", "Casual Clothes (Blue)", 200, "true" },
                { "U_C_Man_casual_1_F", "Casual Clothes (Navy)", 200, "true" },
                { "U_C_man_sport_1_F", "Sport Clothes (Beach)", 200, "true" },
                { "U_C_man_sport_2_F", "Sport Clothes (Orange)", 200, "true" },
                { "U_C_man_sport_3_F", "Sport Clothes (Blue)", 200, "true" },
                { "U_C_Poloshirt_stripped", "Poloshirt stripped", 200, "true" },
                { "U_C_Poloshirt_redwhite", "Poloshirt Red/White", 200, "true" },
                { "U_C_Poloshirt_salmon", "Poloshirt Salmon", 200, "true" },
                { "U_C_Poloshirt_blue", "Poloshirt Blue", 200, "true" },
                { "U_C_Poor_2", "Rag tagged clothes", 250, "true" },
                { "U_C_Poloshirt_burgundy", "Poloshirt Burgundy", 200, "true" },
                { "U_C_Poloshirt_tricolour", "Poloshirt Tricolor", 200, "true" },
                { "U_BG_Guerrilla_6_1", "", 250, "true" },
                { "U_C_IDAP_Man_cargo_F", "", 250, "true" },
                { "U_C_IDAP_Man_Jeans_F", "", 250, "true" },
                { "U_C_IDAP_Man_casual_F", "", 250, "true" },
                { "U_C_IDAP_Man_shorts_F", "", 250, "true" },
                { "U_C_IDAP_Man_Tee_F", "", 250, "true" },
                { "U_C_IDAP_Man_TeeShorts_F", "", 250, "true" },
                { "U_C_Mechanic_01_F", "", 250, "true" },
                { "U_Competitor", "", 250, "true" },
                { "U_IG_Guerilla2_2", "Green stripped shirt & Pants", 650, "true" },
                { "U_IG_Guerilla3_1", "Brown Jacket & Pants", 750, "true" },
                { "U_OrestesBody", "Surfing On Land", 1100, "true" },
                { "U_IG_Guerilla2_3", "The Outback Rangler", 1200, "true" },
                { "U_C_HunterBody_grn", "The Hunters Look", 1500, "true" },
                { "U_C_WorkerCoveralls", "Mechanic Coveralls", 2500, "true" },
                { "U_C_ConstructionCoverall_Red_F", "", 1000, "true" },
                { "U_C_ConstructionCoverall_Black_F", "", 1000, "true" },
                { "U_C_ConstructionCoverall_Blue_F", "", 1000, "true" },
                { "U_C_Uniform_Farmer_01_F", "", 1000, "true" },
                { "U_C_E_LooterJacket_01_F", "", 1000, "true" },
                { "U_I_L_Uniform_01_tshirt_black_F", "", 1000, "true" },
                { "U_I_L_Uniform_01_tshirt_skull_F", "", 1000, "true" },
                { "U_I_L_Uniform_01_tshirt_sport_F", "", 1000, "true" },
                { "U_C_Uniform_Scientist_01_formal_F", "", 1000, "true" },
                { "U_C_Uniform_Scientist_01_F", "", 1000, "true" },
                { "U_C_Uniform_Scientist_02_F", "", 1000, "true" },
                { "U_C_Uniform_Scientist_02_formal_F", "", 1000, "true" }
            };
            headgear[] = {
                { "NONE", "Remove Headgear", 0, "true" },          
                { "H_Bandanna_gry", "", 50, "true" },
                { "H_Bandanna_blu", "", 50, "true" },
                { "H_Bandanna_cbr", "", 50, "true" },
                { "H_Bandanna_khk_hs", "", 50, "true" },
                { "H_Bandanna_khk", "", 50, "true" },
                { "H_Bandanna_sgg", "", 50, "true" },
                { "H_Bandanna_sand", "", 50, "true" },
                { "H_Watchcap_blk", "", 50, "true" },
                { "H_Watchcap_cbr", "", 50, "true" },
                { "H_Watchcap_camo", "", 50, "true" },
                { "H_Watchcap_khk", "", 50, "true" },
                { "H_Booniehat_khk_hs", "", 75, "true" },
                { "H_Booniehat_indp", "", 75, "true" },
                { "H_Booniehat_oli", "", 75, "true" },
                { "H_Booniehat_tan", "", 75, "true" },
                { "H_Booniehat_tna_F", "", 75, "true" },
                { "H_Booniehat_mgrn", "", 80, "true" },
                { "H_Booniehat_taiga", "", 80, "true" },
                { "H_Cap_blk", "", 100, "true" },
                { "H_Cap_blu", "", 100, "true" },
                { "H_Cap_grn", "", 100, "true" },
                { "H_Cap_oli_hs", "", 100, "true" },
                { "H_Cap_red", "", 100, "true" },
                { "H_Cap_tan", "", 100, "true" },
                { "H_Cap_khaki_specops_UK", "", 100, "true" },
                { "H_Cap_usblack", "", 100, "true" },
                { "H_Hat_blue", "", 125, "true" },
                { "H_Hat_brown", "", 125, "true" },
                { "H_Hat_camo", "", 125, "true" },
                { "H_Hat_grey", "", 125, "true" },
                { "H_Hat_tan", "", 125, "true" },
                { "H_StrawHat", "", 125, "true" },
                { "H_StrawHat_dark", "", 125, "true" },
                { "H_Helmet_Skate", "", 250, "true" },
                { "H_Hat_Tinfoil_F", "", 250, "true" },
                { "H_Construction_basic_black_F", "", 2500, "true" },
                { "H_Construction_basic_ornage_F", "", 2500, "true" },
                { "H_Construction_basic_vrana_F", "", 2500, "true" },
                { "H_Construction_basic_red_F", "", 2500, "true" },
                { "H_Construction_basic_yellow_F", "", 2500, "true" },
                { "H_Construction_basic_white_F", "", 2500, "true" },
                { "H_Construction_earprot_yellow_F", "", 2500, "true" },
                { "H_Construction_earprot_white_F", "", 2500, "true" },
                { "H_Construction_earprot_orange_F", "", 2500, "true" },
                { "H_Construction_earprot_red_F", "", 2500, "true" },
                { "H_Construction_earprot_vrana_F", "", 2500, "true" },
                { "H_Construction_earprot_black_F", "", 2500, "true" },
                { "H_Construction_headset_yellow_F", "", 2500, "true" },
                { "H_Construction_headset_white_F", "", 2500, "true" },
                { "H_Construction_headset_orange_F", "", 2500, "true" },
                { "H_Construction_headset_red_F", "", 2500, "true" },
                { "H_Construction_headset_vrana_F", "", 2500, "true" },
                { "H_Construction_headset_black_F", "", 2500, "true" },
                { "H_HeadSet_yellow_F", "", 2500, "true" },
                { "H_HeadSet_white_F", "", 2500, "true" },
                { "H_HeadSet_orange_F", "", 2500, "true" },
                { "H_HeadSet_red_F", "", 2500, "true" },
                { "H_HeadSet_black_F", "", 2500, "true" },
                { "H_Hat_Safari_olive_F", "", 2500, "true" },
                { "H_Hat_Safari_sand_F", "", 2500, "true" }
            };
            goggles[] = {
                { "NONE", "Remove Glasses", 0, "true" },
                { "G_Aviator", "", 20, "true" },
                { "G_Shades_Black", "", 250, "true" },
                { "G_Shades_Blue", "", 250, "true" },
                { "G_Shades_Green", "", 250, "true" },
                { "G_Shades_Red", "", 250, "true" },
                { "G_Spectacles", "", 250, "true" },
                { "G_Sport_Red", "", 250, "true" },
                { "G_Sport_Blackyellow", "", 250, "true" },
                { "G_Sport_BlackWhite", "", 250, "true" },
                { "G_Sport_Checkered", "", 250, "true" },
                { "G_Sport_Blackred", "", 250, "true" },
                { "G_Sport_Greenblack", "", 250, "true" },
                { "G_Squares_Tinted", "", 250, "true" },
                { "G_Squares", "", 250, "true" },
                { "G_Spectacles_Tinted", "", 250, "true" },
                { "H_WirelessEarpiece_F", "", 250, "true" }
            };
            vests[] = {
                { "NONE", "Remove Vest", 0, "true" },
                { "V_LegStrapBag_black_F", "", 3000, "true" },
                { "V_LegStrapBag_coyote_F", "", 3000, "true" },
                { "V_LegStrapBag_olive_F", "", 3000, "true" },
                { "V_Pocketed_black_F", "", 3000, "true" },
                { "V_Pocketed_coyote_F", "", 3000, "true" },
                { "V_pocketed_olive_F", "", 3000, "true" },
                { "V_Safety_blue_F", "", 500, "true" },
                { "V_Safety_orange_F", "", 500, "true" },
                { "V_Safety_yellow_F", "", 500, "true" },
                { "V_DeckCrew_yellow_F", "", 1000, "true" },
                { "V_DeckCrew_green_F", "", 1000, "true" },
                { "V_DeckCrew_red_F", "", 1000, "true" },
                { "V_DeckCrew_white_F", "", 1000, "true" },
                { "V_DeckCrew_brown_F", "", 1000, "true" },
                { "V_DeckCrew_violet_F", "", 1000, "true" },
                { "V_DeckCrew_blue_F", "", 1000, "true" }
            };
            backpacks[] = {
                { "NONE", "Remove Backpacks", 0, "true" },
                { "B_LegStrapBag_black_F", "", 2000, "true" },
                { "B_LegStrapBag_coyote_F", "", 2000, "true" },
                { "B_LegStrapBag_olive_F", "", 2000, "true" },
                { "B_OutdoorPack_blk", "", 3000, "true" },
                { "B_Messenger_Black_F", "", 4000, "true" },
                { "B_Messenger_Coyote_F", "", 4000, "true" },
                { "B_Messenger_Gray_F", "", 4000, "true" },
                { "B_Messenger_Olive_F", "", 4000, "true" },
                { "B_AssaultPack_blk", "", 5000, "true" },
                { "B_AssaultPack_cbr", "", 5000, "true" },
                { "B_AssaultPack_rgr", "", 5000, "true" },
                { "B_AssaultPack_khk", "", 5000, "true" },
                { "B_AssaultPack_sgg", "", 5000, "true" },
                { "B_AssaultPack_dgtl", "", 5000, "true" },
                { "B_AssaultPack_mcamo", "", 5000, "true" },
                { "B_AssaultPack_tna_F", "", 5000, "true" },
                { "B_AssaultPack_eaf_F", "", 5000, "true" },
                { "B_AssaultPack_wdl_F", "", 5000, "true" },
                { "B_FieldPack_blk", "", 6000, "true" },
                { "B_FieldPack_cbr", "", 6000, "true" },
                { "B_FieldPack_khk", "", 6000, "true" },
                { "B_FieldPack_oli", "", 6000, "true" },
                { "B_FieldPack_ocamo", "", 6000, "true" },
                { "B_FieldPack_oucamo", "", 6000, "true" },
                { "B_FieldPack_ghex_F", "", 6000, "true" },
                { "B_TacticalPack_blk", "", 7000, "true" },
                { "B_TacticalPack_rgr", "", 7000, "true" },
                { "B_TacticalPack_oli", "", 7000, "true" },
                { "B_Bergen_blk", "", 8000, "true" },
                { "B_Bergen_rgr", "", 8000, "true" },
                { "B_Bergen_sgg", "", 8000, "true" },
                { "B_Bergen_mcamo", "", 8000, "true" },
                { "B_Kitbag_rgr", "", 8000, "true" },
                { "B_Kitbag_sgg", "", 8000, "true" },
                { "B_Kitbag_cbr", "", 8000, "true" },
                { "B_Kitbag_tan", "", 8000, "true" },
                { "B_Kitbag_mcamo", "", 8000, "true" },
                { "B_Carryall_cbr", "", 10000, "true" },
                { "B_Carryall_ocamo", "", 10000, "true" },
                { "B_Carryall_oucamo", "", 10000, "true" },
                { "B_Carryall_khk", "", 10000, "true" },
                { "B_Carryall_mcamo", "", 10000, "true" },
                { "B_Carryall_oli", "", 10000, "true" },
                { "B_Carryall_ghex_F", "", 10000, "true" },
                { "B_Carryall_eaf_F", "", 10000, "true" },
                { "B_Carryall_green_F", "", 10000, "true" },
                { "B_Carryall_taiga_F", "", 10000, "true" },
                { "B_Carryall_wdl_F", "", 10000, "true" }
            };
        };
        class diving_store {
            title = "Diving Store";
            conditions = "(playerSide isEqualTo civilian && license_civ_dive) || { (player getVariable ['isCID', false]) || (player getVariable ['isHSS', false])}";
            side = "civ";
            uniforms[] = {
                { "NONE", "Remove Uniform", 0, "true" },
                { "U_C_man_sport_1_F", "", 250, "true" },
                { "U_C_man_sport_3_F", "", 250, "true" },
                { "U_O_Wetsuit", "", 7500, "true" },
                { "U_I_Wetsuit", "", 7500, "true" }
            };
            headgear[] = {
                { "NONE", "Remove Headgear", 0, "true" },
                { "H_Bandanna_surfer", "", 50, "true" },
                { "H_Bandanna_surfer_blk", "", 50, "true" },
                { "H_Bandanna_surfer_grn", "", 50, "true" },
                { "H_Cap_surfer", "", 100, "true" }
            };
            goggles[] = {
                { "NONE", "Remove Glasses", 0, "true" },
                { "G_O_Diving", "", 500, "true" },
                { "G_I_Diving", "", 500, "true" }
            };
            vests[] = {
                { "NONE", "Remove Vest", 0, "true" },
                { "V_RebreatherIR", "", 7500, "true" },
                { "V_RebreatherIA", "", 7500, "true" }
            };
            backpacks[] = {
                { "NONE", "Remove Backpacks", 0, "true" },
                { "B_ViperLightHarness_blk_F", "", 5000, "true" },
                { "B_ViperHarness_blk_F", "", 7500, "true" }
            };
        };
        class gokart_store {
            title = "Go-Karting Store";
            conditions = "(playerSide isEqualTo civilian && license_civ_karting) || { (player getVariable ['isCID', false]) || (player getVariable ['isHSS', false])}";
            side = "civ";
            uniforms[] = {
                { "NONE", "Remove Uniform", 0, "true" },
                { "U_C_Driver_1_black", "", 1500, "true" },
                { "U_C_Driver_1_blue", "", 1500, "true" },
                { "U_C_Driver_1_green", "", 1500, "true" },
                { "U_C_Driver_1_orange", "", 1500, "true" },
                { "U_C_Driver_1_red", "", 1500, "true" },
                { "U_C_Driver_1_white", "", 1500, "true" },
                { "U_C_Driver_1_yellow", "", 1500, "true" }
            };
            headgear[] = {
                { "NONE", "Remove Headgear", 0, "true" },
                { "H_RacingHelmet_1_black_F", "", 1000, "true" },
                { "H_RacingHelmet_1_blue_F", "", 1000, "true" },
                { "H_RacingHelmet_1_green_F", "", 1000, "true" },
                { "H_RacingHelmet_1_orange_F", "", 1000, "true" },
                { "H_RacingHelmet_1_red_F", "", 1000, "true" },
                { "H_RacingHelmet_1_white_F", "", 1000, "true" },
                { "H_RacingHelmet_1_yellow_F", "", 1000, "true" }
            };
            goggles[] = {
                { "NONE", "Remove Glasses", 0, "true" }
            };
            vests[] = {
                { "NONE", "Remove Vest", 0, "true" }
            };
            backpacks[] = {
                { "NONE", "Remove Backpacks", 0, "true" }
            };
        };
        class handgun_clothing_store {
            title = "Handgun Store";
            conditions = "(playerSide isEqualTo civilian && license_civ_gun) || { (player getVariable ['isCID', false]) || (player getVariable ['isHSS', false])}";
            side = "civ";
            uniforms[] = {
                { "NONE", "Remove Uniform", 0, "true" },
            };
            headgear[] = {
                { "NONE", "Remove Headgear", 0, "true" },
                { "H_EarProtectors_black_F", "", 250, "true" },
                { "H_EarProtectors_red_F", "", 250, "true" },
                { "H_EarProtectors_yellow_F", "", 250, "true" }
            };
            goggles[] = {
                { "NONE", "Remove Glasses", 0, "true" },
                { "G_Aviator", "", 250, "true" },
                { "G_Shades_Black", "", 250, "true" },
                { "G_Shades_Blue", "", 250, "true" },
                { "G_Shades_Green", "", 250, "true" },
                { "G_Shades_Red", "", 250, "true" }
            };
            vests[] = {
                { "NONE", "Remove Vest", 0, "true" },
                {"V_Rangemaster_belt", "", 3000, "true"}
            };
            backpacks[] = {
                { "NONE", "Remove Backpacks", 0, "true" },
                { "V_LegStrapBag_black_F", "", 2000, "true" },
                { "V_LegStrapBag_coyote_F", "", 2000, "true" },
                { "V_LegStrapBag_olive_F", "", 2000, "true" }
            };
        };
        class rebel_store {
            title = "Rebel Store";
            conditions = "(playerSide isEqualTo civilian && (license_civ_rebel || license_civ_PMC)) || { (player getVariable ['isCID', false]) || (player getVariable ['isHSS', false])}";
            side = "civ";
            uniforms[] = {
                { "NONE", "Remove Uniform", 0, "true" },
                { "U_B_CTRG_Soldier_F", "Gang Skin", 10000, "['EvolvE', player] call PHX_fnc_inWhitelistGang" }, // Gang Skin
                { "U_B_CTRG_Soldier_3_F", "Gang Skin", 10000, "['Ares', player] call PHX_fnc_inWhitelistGang" }, // Gang Skin
                { "U_B_CTRG_Soldier_F", "Gang Skin", 10000, "['Vanq', player] call PHX_fnc_inWhitelistGang" }, // Gang Skin
                { "U_I_CombatUniform", "Gang Skin", 10000, "['Temper', player] call PHX_fnc_inWhitelistGang" }, // Gang Skin
                { "U_C_Man_casual_2_F", "Gang Skin", 200, "['TMC', player] call PHX_fnc_inWhitelistGang" }, // Gang Skin
                // { "U_OG_Guerrilla_6_1", "Christmas Clothing", 10000, "true" },
                { "U_O_Wetsuit", "", 7500, "true" },
                { "U_I_Wetsuit", "", 7500, "true" },
                { "U_I_C_Soldier_Bandit_4_F", "", 10000, "true" },
                { "U_I_C_Soldier_Bandit_1_F", "", 10000, "true" },
                { "U_I_C_Soldier_Bandit_2_F", "", 10000, "true" },
                { "U_I_C_Soldier_Bandit_5_F", "", 10000, "true" },
                { "U_I_C_Soldier_Bandit_3_F", "", 10000, "true" },
                { "U_I_G_resistanceLeader_F", "", 10000, "license_civ_PMC || { (player getVariable ['isCID', false]) || (player getVariable ['isHSS', false])}" },
                { "U_IG_Guerrilla_6_1", "", 10000, "true" },
                { "U_BG_Guerilla1_1", "", 10000, "true" },
                { "U_BG_Guerilla1_2_F", "", 10000, "true" },
                { "U_OG_Guerilla2_2", "", 10000, "true" },
                { "U_IG_Guerilla2_1", "", 10000, "true" },
                { "U_OG_Guerilla2_3", "", 10000, "true" },
                { "U_IG_Guerilla3_1", "", 10000, "true" },
                { "U_IG_leader", "", 10000, "true" },
                { "U_C_HunterBody_grn", "", 10000, "true" },
                { "U_I_C_Soldier_Para_2_F", "", 10000, "true" },
                { "U_I_C_Soldier_Para_3_F", "", 10000, "true" },
                { "U_I_C_Soldier_Para_5_F", "", 10000, "true" },
                { "U_I_C_Soldier_Para_4_F", "", 10000, "true" },
                { "U_I_C_Soldier_Para_1_F", "", 10000, "true" },
                { "U_I_L_Uniform_01_tshirt_olive_F", "", 10000, "true" },
                { "U_I_L_Uniform_01_camo_F", "", 10000, "true" },
                { "U_I_L_Uniform_01_deserter_F", "", 10000, "true" },
                { "U_B_CombatUniform_mcam", "", 10000, "true" },
                { "U_B_CombatUniform_mcam_vest", "", 10000, "true" },
                { "U_B_CombatUniform_mcam_tshirt", "", 10000, "true" },
                { "U_B_CombatUniform_mcam_worn", "", 10000, "true" },
                { "U_B_CTRG_1", "", 10000, "license_civ_PMC || { (player getVariable ['isCID', false]) || (player getVariable ['isHSS', false])}" },
                { "U_B_CTRG_2", "", 10000, "license_civ_PMC || { (player getVariable ['isCID', false]) || (player getVariable ['isHSS', false])}" },
                { "U_B_CTRG_3", "", 10000, "license_civ_PMC || { (player getVariable ['isCID', false]) || (player getVariable ['isHSS', false])}" },
                { "U_I_G_Story_Protagonist_F", "", 10000, "true" },
                { "U_I_CombatUniform", "", 10000, "license_civ_PMC || { (player getVariable ['isCID', false]) || (player getVariable ['isHSS', false])}" },
                { "U_B_survival_uniform", "", 15000, "license_civ_PMC || { (player getVariable ['isCID', false]) || (player getVariable ['isHSS', false])}" },
                { "U_B_PilotCoveralls", "", 15000, "license_civ_PMC || { (player getVariable ['isCID', false]) || (player getVariable ['isHSS', false])}" },
                { "U_I_pilotCoveralls", "", 15000, "license_civ_PMC || { (player getVariable ['isCID', false]) || (player getVariable ['isHSS', false])}" },
                { "U_B_GhillieSuit", "", 50000, "license_civ_PMC || { (player getVariable ['isCID', false]) || (player getVariable ['isHSS', false])}" },
                { "U_I_FullGhillie_ard", "", 100000, "license_civ_PMC || { (player getVariable ['isCID', false]) || (player getVariable ['isHSS', false])}" },
                { "U_I_FullGhillie_sard", "", 100000, "license_civ_PMC || { (player getVariable ['isCID', false]) || (player getVariable ['isHSS', false])}" },
                { "U_I_FullGhillie_lsh", "", 100000, "license_civ_PMC || { (player getVariable ['isCID', false]) || (player getVariable ['isHSS', false])}" },
                { "U_B_CBRN_Suit_01_MTP_F", "Hazmat Suit", 25000, "license_civ_PMC || { (player getVariable ['isCID', false]) || (player getVariable ['isHSS', false])}" }
            };
            headgear[] = {
                { "NONE", "Remove Headgear", 0, "true" },
                { "H_Watchcap_blk", "", 75, "true" },
                { "H_Watchcap_cbr", "", 75, "true" },
                { "H_Watchcap_camo", "", 75, "true" },
                { "H_Watchcap_khk", "", 75, "true" },
                { "H_Cap_blk", "", 60, "true" },
                { "H_Cap_blu", "", 60, "true" },
                { "H_Cap_grn", "", 60, "true" },
                { "H_Cap_oli_hs", "", 60, "true" },
                { "H_Cap_red", "", 60, "true" },
                { "H_Cap_tan", "", 60, "true" },
                { "H_Cap_khaki_specops_UK", "", 60, "true" },
                { "H_Cap_usblack", "", 60, "true" },
                { "H_Shemag_olive", "", 1000, "true" }, // hides identity
                { "H_Shemag_olive_hs", "", 1000, "true" },
                { "H_ShemagOpen_khk", "", 1000, "true" },
                { "H_ShemagOpen_tan", "", 1000, "true" },
                // LVL 1
                { "H_HelmetB_light_grass", "", 2500, "true" }, 
                { "H_HelmetB_light_black", "", 2500, "true" },
                // LVL 2
                { "H_HelmetIA", "", 7500, "true" }, 
                { "H_HelmetB_grass", "", 7500, "true" }, 
                { "H_HelmetB_snakeskin", "", 7500, "true" },
                // LVL 3
                { "H_HelmetHBK_F", "", 15000, "true" }, 
                { "H_HelmetHBK_headset_F", "", 15000, "true" },
                { "H_HelmetHBK_ear_F", "", 15000, "true" },
                { "H_HelmetHBK_chops_F", "", 15000, "true" },
                { "H_HelmetAggressor_F", "", 15000, "true" }, 
                { "H_HelmetAggressor_cover_F", "", 15000, "true" },
                { "H_HelmetAggressor_cover_taiga_F", "", 15000, "true" },
                // LVL 4
                { "H_HelmetSpecB", "", 30000, "license_civ_PMC || { (player getVariable ['isCID', false]) || (player getVariable ['isHSS', false])}" },
                { "H_HelmetSpecB_paint1", "", 30000, "license_civ_PMC || { (player getVariable ['isCID', false]) || (player getVariable ['isHSS', false])}" },
                { "H_HelmetSpecB_paint2", "", 30000, "license_civ_PMC || { (player getVariable ['isCID', false]) || (player getVariable ['isHSS', false])}" },
                { "H_HelmetSpecB_sand", "", 30000, "license_civ_PMC || { (player getVariable ['isCID', false]) || (player getVariable ['isHSS', false])}" },
                { "H_HelmetSpecB_snakeskin", "", 30000, "license_civ_PMC || { (player getVariable ['isCID', false]) || (player getVariable ['isHSS', false])}" }
            };
            goggles[] = {
                { "NONE", "Remove Glasses", 0, "true" },
                { "G_O_Diving", "", 500, "true" },
                { "G_I_Diving", "", 500, "true" },
                { "G_Aviator", "", 250, "true" },
                { "G_Shades_Black", "", 250, "true" },
                { "G_Shades_Blue", "", 250, "true" },
                { "G_Shades_Green", "", 250, "true" },
                { "G_Shades_Red", "", 250, "true" },
                { "G_Spectacles", "", 250, "true" },
                { "G_Sport_Red", "", 250, "true" },
                { "G_Sport_Blackyellow", "", 250, "true" },
                { "G_Sport_BlackWhite", "", 250, "true" },
                { "G_Sport_Checkered", "", 250, "true" },
                { "G_Sport_Blackred", "", 250, "true" },
                { "G_Sport_Greenblack", "", 250, "true" },
                { "G_Squares_Tinted", "", 250, "true" },
                { "G_Squares", "", 250, "true" },
                { "G_Spectacles_Tinted", "", 250, "true" },
                { "G_RegulatorMask_F", "", 3000, "true" }, //nothing
                { "G_AirPurifyingRespirator_02_sand_F", "", 3000, "true" }, // hides identity
                { "G_Balaclava_blk", "", 3000, "true" }, // hides identity
                { "G_Balaclava_oli", "", 3000, "true" }, // hides identity
                { "H_BandMask_khk", "", 3000, "true" }, // hides identity
                { "G_Bandanna_oli", "", 3000, "true" }, // hides identity
                { "G_Bandanna_shades", "", 3000, "true" }, // hides identity
                { "G_Bandanna_sport", "", 3000, "true" }, // hides identity
                { "G_Bandanna_tan", "", 3000, "true" }, // hides identity
                { "G_Bandanna_aviator", "", 3000, "true" }, //iden
                { "G_Balaclava_lowprofile", "", 3000, "true" }, //iden
                { "G_BalaClava_TI_blk_F", "", 3000, "license_civ_PMC || { (player getVariable ['isCID', false]) || (player getVariable ['isHSS', false])}" },
                { "G_BalaClava_TI_tna_F", "", 3000, "license_civ_PMC || { (player getVariable ['isCID', false]) || (player getVariable ['isHSS', false])}" },
                
                { "G_Balaclava_combat", "", 25000, "true" }, //iden+nv
                { "G_Balaclava_TI_G_blk_F", "", 25000, "license_civ_PMC || { (player getVariable ['isCID', false]) || (player getVariable ['isHSS', false])}" },
                { "G_Tactical_Clear", "Night Vision Glasses", 20000, "true" } //nv
            };
            vests[] = {
                { "NONE", "Remove Vest", 0, "true" },
                { "V_RebreatherIA", "", 7500, "true" },
                // LVL 0
                { "V_LegStrapBag_black_F", "", 3000, "true" },
                { "V_LegStrapBag_coyote_F", "", 3000, "true" },
                { "V_LegStrapBag_olive_F", "", 3000, "true" },
                { "V_Pocketed_black_F", "", 3000, "true" },
                { "V_Pocketed_coyote_F", "", 3000, "true" },
                { "V_Pocketed_olive_F", "", 3000, "true" },
                { "V_Rangemaster_belt", "", 3000, "true" },
                { "V_BandollierB_blk", "", 3000, "true" },
                { "V_BandollierB_cbr", "", 3000, "true" },
                { "V_BandollierB_ghex_F", "", 3000, "true" },
                { "V_BandollierB_rgr", "", 3000, "true" },
                { "V_BandollierB_khk", "", 3000, "true" },
                { "V_BandollierB_oli", "", 3000, "true" },
                { "V_Chestrig_blk", "", 3000, "true" },
                { "V_Chestrig_rgr", "", 3000, "true" },
                { "V_Chestrig_khk", "", 3000, "true" },
                { "V_Chestrig_oli", "", 3000, "true" },
                { "V_TacChestrig_cbr_F", "", 3000, "true" },
                { "V_TacChestrig_grn_F", "", 3000, "true" },
                { "V_TacChestrig_oli_F", "", 3000, "true" },
                 { "V_SmershVest_01_F", "", 3000, "true" },
                { "V_SmershVest_01_radio_F", "", 3000, "true" },              
                // LVL 1
                { "V_TacVest_blk", "", 7000, "true" },
                { "V_TacVest_brn", "", 7000, "true" },
                { "V_TacVest_camo", "", 7000, "true" },
                { "V_TacVest_khk", "", 7000, "true" },
                { "V_TacVest_oli", "", 7000, "true" },
                { "V_I_G_resistanceLeader_F", "", 7000, "true" },
                // LVL 3
                { "V_PlateCarrier1_rgr_noflag_F", "", 25000, "true" },
                { "V_PlateCarrierL_CTRG", "", 25000, "true" },
                { "V_PlateCarrierIA2_dgtl", "", 25000, "true" }, 
                { "V_PlateCarrierIA1_dgtl", "", 25000, "true" }, 
                { "V_CarrierRigKBT_01_EAF_F", "", 25000, "true" }, 
                { "V_CarrierRigKBT_01_Olive_F", "", 25000, "true" },
                { "V_CarrierRigKBT_01_light_EAF_F", "", 25000, "true" }, 
                { "V_CarrierRigKBT_01_light_Olive_F", "", 25000, "true" },
                //LVL4
                { "V_PlateCarrierH_CTRG", "", 50000, "license_civ_PMC || { (player getVariable ['isCID', false]) || (player getVariable ['isHSS', false])}" },
                { "V_PlateCarrier2_blk", "", 50000, "(license_civ_PMC || { (player getVariable ['isCID', false]) || (player getVariable ['isHSS', false])}) && PHX_DonatorLevel > 0" },
                { "V_PlateCarrier2_tna_F", "", 50000, "(license_civ_PMC || { (player getVariable ['isCID', false]) || (player getVariable ['isHSS', false])}) && PHX_DonatorLevel > 0" },
                { "V_PlateCarrier2_rgr", "", 50000, "true" }
            };
            backpacks[] = {
                { "NONE", "Remove Backpacks", 0, "true" },
                { "B_LegStrapBag_black_F", "", 1800, "true" },
                { "B_LegStrapBag_coyote_F", "", 1800, "true" },
                { "B_LegStrapBag_olive_F", "", 1800, "true" },
                { "B_OutdoorPack_blk", "", 2700, "true" },
                { "B_Messenger_Black_F", "", 3600, "true" },
                { "B_Messenger_Coyote_F", "", 3600, "true" },
                { "B_Messenger_Gray_F", "", 3600, "true" },
                { "B_Messenger_Olive_F", "", 3600, "true" },
                { "B_AssaultPack_blk", "", 4500, "true" },
                { "B_AssaultPack_cbr", "", 4500, "true" },
                { "B_AssaultPack_rgr", "", 4500, "true" },
                { "B_AssaultPack_khk", "", 4500, "true" },
                { "B_AssaultPack_sgg", "", 4500, "true" },
                { "B_AssaultPack_dgtl", "", 4500, "true" },
                { "B_AssaultPack_mcamo", "", 4500, "true" },
                { "B_AssaultPack_tna_F", "", 4500, "true" },
                { "B_AssaultPack_eaf_F", "", 4500, "true" },
                { "B_AssaultPack_wdl_F", "", 4500, "true" },
                { "B_FieldPack_blk", "", 5400, "true" },
                { "B_FieldPack_cbr", "", 5400, "true" },
                { "B_FieldPack_khk", "", 5400, "true" },
                { "B_FieldPack_oli", "", 5400, "true" },
                { "B_FieldPack_ocamo", "", 5400, "true" },
                { "B_FieldPack_oucamo", "", 5400, "true" },
                { "B_FieldPack_ghex_F", "", 5400, "true" },
                { "B_TacticalPack_blk", "", 6300, "true" },
                { "B_TacticalPack_rgr", "", 6300, "true" },
                { "B_TacticalPack_oli", "", 6300, "true" },
                { "B_Bergen_blk", "", 7200, "true" },
                { "B_Bergen_rgr", "", 7200, "true" },
                { "B_Bergen_sgg", "", 7200, "true" },
                { "B_Bergen_mcamo", "", 7200, "true" },
                { "B_Kitbag_rgr", "", 7200, "true" },
                { "B_Kitbag_sgg", "", 7200, "true" },
                { "B_Kitbag_cbr", "", 7200, "true" },
                { "B_Kitbag_tan", "", 7200, "true" },
                { "B_Kitbag_mcamo", "", 7200, "true" },
                { "B_Carryall_cbr", "", 9000, "true" },
                { "B_Carryall_ocamo", "", 9000, "true" },
                { "B_Carryall_oucamo", "", 9000, "true" },
                { "B_Carryall_khk", "", 9000, "true" },
                { "B_Carryall_mcamo", "", 9000, "true" },
                { "B_Carryall_oli", "", 9000, "true" },
                { "B_Carryall_ghex_F", "", 9000, "true" },
                { "B_Carryall_eaf_F", "", 9000, "true" },
                { "B_Carryall_green_F", "", 9000, "true" },
                { "B_Carryall_taiga_F", "", 9000, "true" },
                { "B_Carryall_wdl_F", "", 9000, "true" },
                { "B_Bergen_dgtl_F", "", 90000, "license_civ_PMC || { (player getVariable ['isCID', false]) || (player getVariable ['isHSS', false])}" },
                { "B_Bergen_hex_F", "", 90000, "license_civ_PMC || { (player getVariable ['isCID', false]) || (player getVariable ['isHSS', false])}" },
                { "B_RadioBag_01_black_F", "", 3500, "true" },
                { "B_RadioBag_01_eaf_F", "", 3500, "true" },
                { "B_RadioBag_01_tropic_F", "", 3500, "true" },
                { "B_RadioBag_01_oucamo_F", "", 3500, "true" },
                { "B_SCBA_01_F", "", 3500, "true" },
                { "B_CombinationUnitRespirator_01_F", "", 3500, "true" },
                { "B_Parachute", "Parachute", 10000, "true" }
            };
        };

        // Civilian Job Clothing
        class news_clothing {
            title = "Altis News Clothing";
            conditions = "playerSide isEqualTo civilian && { player getVariable [""isNEW"", false] } && { license_civ_news }";
            side = "civ";
            uniforms[] = {
                { "NONE", "Remove Uniform", 0, "true" },
                { "U_C_Journalist", "", 0, "true" },
                { "U_B_Wetsuit", "", 0, "true" }
            };
            headgear[] = {
                { "NONE", "Remove Headgear", 0, "true" },
                { "H_Cap_press", "", 0, "true" },
                { "H_PASGT_basic_blue_press_F", "", 0, "true" },
                { "H_PASGT_neckprot_blue_press_F", "", 0, "true" }
            };
            goggles[] = {
                { "NONE", "Remove Glasses", 0, "true" },
                { "G_Aviator", "", 0, "true" },
                { "G_Combat", "", 0, "true" },
                { "G_Sport_Blackred", "", 0, "true" },
                { "G_Lady_Dark", "", 0, "true" },
                { "G_Lowprofile", "", 0, "true" },
                { "G_Spectacles", "", 0, "true" },
                { "G_Shades_Black", "", 0, "true" },
                { "G_Shades_Blue", "", 0, "true" },
                { "G_Shades_Green", "", 0, "true" },
                { "G_Shades_Red", "", 0, "true" },
                { "G_Diving", "", 0, "true" }
            };
            vests[] = {
                { "NONE", "Remove Vest", 0, "true" },
                { "V_Press_F", "", 0, "true" },
                { "V_RebreatherB", "", 0, "true" }
            };
            backpacks[] = {
                { "NONE", "Remove Backpacks", 0, "true" },
                { "B_Messenger_Black_F", "", 0, "true" },
                { "B_Messenger_Coyote_F", "", 0, "true" },
                { "B_Messenger_Gray_F", "", 0, "true" },
                { "B_Messenger_Olive_F", "", 0, "true" }
            };
        };
        class lawyer_clothing {
            title = "Lawyer Clothing Store";
            conditions = "playerSide isEqualTo civilian && { player getVariable [""isLAW"", false] } && { license_civ_lawyer }";
            side = "civ";
            uniforms[] = {
                { "NONE", "Remove Uniform", 0, "true" },
                { "U_NikosAgedBody", "Suit & Tie", 0, "true" }
            };
            headgear[] = {
                { "NONE", "Remove Headgear", 0, "true" },
                { "H_Cap_tan", "", 0, "true" },
                { "H_Hat_brown", "", 0, "true" },
                { "H_Hat_grey", "", 0, "true" },
                { "H_Hat_blue", "", 0, "true" }
            };
            goggles[] = {
                { "NONE", "Remove Glasses", 0, "true" },
                { "G_Aviator", "", 0, "true" }
            };
            vests[] = {
                { "NONE", "Remove Vest", 0, "true" }
            };
            backpacks[] = {
                { "NONE", "Remove Backpacks", 0, "true" }
            };
        };
        class taxi_clothing {
            title = "Taxi Clothing Store";
            conditions = "playerSide isEqualTo civilian && { player getVariable [""isTAX"", false] } && { license_civ_taximan }";
            side = "civ";
            uniforms[] = {
                { "NONE", "Remove Uniform", 0, "true" },
                { "U_Rangemaster", "Taxi Uniform", 0, "true" }
            };
            headgear[] = {
                { "NONE", "Remove Headgear", 0, "true" },
                { "H_Bandanna_gry", "", 50, "true" },
                { "H_Bandanna_blu", "", 50, "true" },
                { "H_Bandanna_cbr", "", 50, "true" },
                { "H_Bandanna_khk_hs", "", 50, "true" },
                { "H_Bandanna_khk", "", 50, "true" },
                { "H_Bandanna_sgg", "", 50, "true" },
                { "H_Bandanna_sand", "", 50, "true" },
                { "H_Watchcap_blk", "", 50, "true" },
                { "H_Watchcap_cbr", "", 50, "true" },
                { "H_Watchcap_camo", "", 50, "true" },
                { "H_Watchcap_khk", "", 50, "true" },
                { "H_Booniehat_khk_hs", "", 75, "true" },
                { "H_Booniehat_indp", "", 75, "true" },
                { "H_Booniehat_oli", "", 75, "true" },
                { "H_Booniehat_tan", "", 75, "true" },
                { "H_Booniehat_tna_F", "", 75, "true" },
                { "H_Cap_blk", "", 100, "true" },
                { "H_Cap_blu", "", 100, "true" },
                { "H_Cap_grn", "", 100, "true" },
                { "H_Cap_oli_hs", "", 100, "true" },
                { "H_Cap_red", "", 100, "true" },
                { "H_Cap_tan", "", 100, "true" },
                { "H_Cap_khaki_specops_UK", "", 100, "true" },
                { "H_Cap_usblack", "", 100, "true" },
                { "H_Hat_blue", "", 125, "true" },
                { "H_Hat_brown", "", 125, "true" },
                { "H_Hat_camo", "", 125, "true" },
                { "H_Hat_grey", "", 125, "true" },
                { "H_Hat_tan", "", 125, "true" },
                { "H_StrawHat", "", 125, "true" },
                { "H_StrawHat_dark", "", 125, "true" },
                { "H_Hat_Safari_olive_F", "", 150, "true" },
                { "H_Hat_Safari_sand_F", "", 150, "true" }
            };
            goggles[] = {
                { "NONE", "Remove Glasses", 0, "true" },
                { "G_Aviator", "", 20, "true" },
                { "G_Shades_Black", "", 25, "true" },
                { "G_Shades_Blue", "", 25, "true" },
                { "G_Shades_Green", "", 25, "true" },
                { "G_Shades_Red", "", 25, "true" },
                { "G_Spectacles", "", 25, "true" },
                { "G_Sport_Red", "", 25, "true" },
                { "G_Sport_Blackyellow", "", 25, "true" },
                { "G_Sport_BlackWhite", "", 25, "true" },
                { "G_Sport_Checkered", "", 25, "true" },
                { "G_Sport_Blackred", "", 25, "true" },
                { "G_Sport_Greenblack", "", 25, "true" },
                { "G_Squares_Tinted", "", 25, "true" },
                { "G_Squares", "", 25, "true" },
                { "G_Spectacles_Tinted", "", 25, "true" },
                { "H_WirelessEarpiece_F", "", 25, "true" }
            };
            vests[] = {
                { "NONE", "Remove Vest", 0, "true" }
            };
            backpacks[] = {
                { "NONE", "Remove Backpacks", 0, "true" }
            };
        };
        class repair_clothing {
            title = "Mechanic Clothing Store";
            conditions = "playerSide isEqualTo civilian && { player getVariable [""isSER"", false] } && { license_civ_repair }";
            side = "civ";
            uniforms[] = {
                { "NONE", "Remove Uniform", 0, "true" },
                { "U_C_ConstructionCoverall_Blue_F", "Altis Services Uniform (Blue)", 0, "true" },
                { "U_C_ConstructionCoverall_Black_F", "Altis Services Uniform (Black)", 0, "true" },
                { "U_C_ConstructionCoverall_Red_F", "Altis Services Uniform (Red)", 0, "true" }
            };
            headgear[] = {
                { "NONE", "Remove Headgear", 0, "true" },
                { "H_Cap_blu", "", 0, "true" },
                { "H_Cap_blk", "", 0, "true" },
                { "H_Cap_red", "", 0, "true" }
            };
            goggles[] = {
                { "NONE", "Remove Glasses", 0, "true" },
                { "G_Respirator_white_F", "", 0, "true" },
                { "G_Respirator_blue_F", "", 0, "true" },
                { "G_Respirator_yellow_F", "", 0, "true" }
            };
            vests[] = {
                { "NONE", "Remove Vest", 0, "true" },
                { "V_Safety_yellow_F", "Altis Services Vest (Yellow)", 0, "true" },
                { "V_Safety_orange_F", "Altis Services Vest (Orange)", 0, "true" },
                { "V_Safety_blue_F", "Altis Services Vest (Blue)", 0, "true" }
            };
            backpacks[] = {
                { "NONE", "Remove Backpacks", 0, "true" }
            };
        };
        class so1_clothing {
            title = "SO1 Clothing Store";
            conditions = "playerSide isEqualTo civilian && { player getVariable [""isSO1"", false] } && { license_civ_so1 }";
            side = "civ";
            uniforms[] = {
                { "NONE", "Remove Uniform", 0, "true" },
                { "U_Marshal", "SO1 Uniform", 0, "true" }
            };
            headgear[] = {
                { "NONE", "Remove Headgear", 0, "true" },
                { "H_Cap_blk", "", 0, "true" }
            };
            goggles[] = {
                { "NONE", "Remove Glasses", 0, "true" },
                { "G_Tactical_Clear", "Night Vision Glasses", 2000, "true" }
            };
            vests[] = {
                { "NONE", "Remove Vest", 0, "true" },
                { "V_PlateCarrier2_blk", "", 0, "true" }
            };
            backpacks[] = {
                { "NONE", "Remove Backpacks", 0, "true" },
                { "B_Carryall_cbr", "Invisible Backpack", 0, "true" }
            };
        };
        class governor_clothing {
            title = "Governor Clothing Store";
            conditions = "playerSide isEqualTo civilian && { player getVariable [""isPM"", false] }";
            side = "civ";
            uniforms[] = {
                { "NONE", "Remove Uniform", 0, "true" },
                { "U_NikosAgedBody", "Suit & Tie", 0, "true" }
            };
            headgear[] = {
                { "NONE", "Remove Headgear", 0, "true" },
                { "H_Cap_tan", "", 0, "true" },
                { "H_Hat_brown", "", 0, "true" },
                { "H_Hat_grey", "", 0, "true" },
                { "H_Hat_blue", "", 0, "true" }
            };
            goggles[] = {
                { "NONE", "Remove Glasses", 0, "true" },
                { "G_Aviator", "", 0, "true" }
            };
            vests[] = {
                { "NONE", "Remove Vest", 0, "true" },
                { "V_EOD_coyote_F", "Emergency Vest", 0, "true" }
            };
            backpacks[] = {
                { "NONE", "Remove Backpacks", 0, "true" }
            };
        };

        // APC Clothing Stores
        class apc_clothing {
            title = "APC Clothing Store";
            conditions = "playerSide isEqualTo west";
            side = "cop";
            uniforms[] = {
                { "NONE", "Remove Uniform", 0, "true" },
                { "U_B_CombatUniform_mcam_worn", "Trainee Uniform (Long Sleeved)", 0, "call life_coplevel < 3" },
                { "U_B_CombatUniform_mcam_vest", "Trainee Uniform (Short Sleeved)", 0, "call life_coplevel < 3" },
                { "U_BG_Guerrilla_6_1", "Police Uniform", 0, "call life_coplevel >= 3" },
                { "U_C_CBRN_Suit_01_Blue_F", "Radiation Suit", 0, "call life_coplevel >= 3" },
                { "U_B_Wetsuit", "Marine Wetsuit", 0, "call life_mpulevel >= 1" },
                { "U_O_PilotCoveralls", "NPAS Coveralls", 0, "call life_npaslevel >= 1" },
                { "U_B_CombatUniform_mcam_worn", "TPU Long Sleeved Uniform", 0, "call life_tpulevel >= 1" },
                { "U_B_CombatUniform_mcam_vest", "TPU Short Sleeved Uniform", 0, "call life_tpulevel >= 1" },
                { "U_B_GhillieSuit", "CTU Ghillie Suit", 0, "call life_ctulevel >= 1" },
                { "U_B_CTRG_Soldier_F", "CTU Stealth Uniform", 0, "call life_ctulevel >= 1" },
                { "U_B_T_Soldier_F", "CTU Long Sleeved Uniform", 0, "call life_ctulevel >= 1" },
                { "U_B_T_Soldier_SL_F", "CTU Short Sleeved Uniform", 0, "call life_ctulevel >= 1" }
            };
            headgear[] = {
                { "NONE", "Remove Headgear", 0, "true" },
                { "H_Cap_blk", "Training Cap", 0, "call life_coplevel < 3" },
                { "H_Beret_blk_POLICE", "Police Beret", 0, "call life_coplevel >= 3" },
                { "H_Watchcap_blk", "Beanie", 0, "call life_coplevel >= 5" },
                { "H_Beret_gen_F", "Command Beret", 0, "call life_coplevel >= 10 || call life_coplevel isEqualTo 8 || call life_academylevel isEqualTo 3 || call life_cidlevel isEqualTo 5 || call life_ctulevel isEqualTo 5 || call life_tpulevel isEqualTo 5 || call life_npaslevel isEqualTo 6" },
                { "H_Cap_police", "Academy Cap", 0, "call life_academylevel >= 2" },
                { "H_PASGT_basic_black_F", "Academy Helmet (Black)", 0, "call life_academylevel >= 2" },
                { "H_PASGT_basic_blue_F", "Academy Helmet (Blue)", 0, "call life_academylevel >= 2" },
                { "H_PilotHelmetHeli_B", "NPAS Pilot Helmet", 0, "call life_npaslevel >= 1" },
                { "H_HelmetSpecB_blk", "Operation Helmet", 0, "call life_tpulevel >= 1 || call life_ctulevel >= 1" },
                { "H_Cap_blk", "", 0, "call life_coplevel >= 3" },
                { "H_Cap_blu", "", 0, "call life_coplevel >= 3" },
                { "H_Cap_grn", "", 0, "call life_coplevel >= 3" },
                { "H_Cap_oli_hs", "", 0, "call life_coplevel >= 3" },
                { "H_Cap_khaki_specops_UK", "", 0, "call life_coplevel >=3" },
                { "H_Cap_red", "", 0, "call life_coplevel >= 3" },
                { "H_Cap_tan", "", 0, "call life_coplevel >= 3" },
                { "H_Hat_blue", "", 0, "call life_coplevel >= 3" },
                { "H_Hat_brown", "", 0, "call life_coplevel >= 3" },
                { "H_Hat_camo", "", 0, "call life_coplevel >= 3" },
                { "H_Hat_grey", "", 0, "call life_coplevel >= 3" },
                { "H_Hat_tan", "", 0, "call life_coplevel >= 3" },
                { "H_StrawHat", "", 0, "call life_coplevel >= 3" },
                { "H_StrawHat_dark", "", 0, "call life_coplevel >= 3" }
            };
            goggles[] = {
                { "NONE", "Remove Glasses", 0, "true" },
                { "G_Aviator", "", 0, "true" },
                { "G_Shades_Black", "", 0, "true" },
                { "G_Shades_Blue", "", 0, "true" },
                { "G_Shades_Green", "", 0, "true" },
                { "G_Shades_Red", "", 0, "true" },
                { "G_Spectacles", "", 0, "true" },
                { "G_Sport_Red", "", 0, "true" },
                { "G_Respirator_white_F", "", 0, "true" },
                { "G_Sport_Blackyellow", "", 0, "true" },
                { "G_Sport_BlackWhite", "", 0, "true" },
                { "G_Sport_Checkered", "", 0, "true" },
                { "G_Sport_Blackred", "", 0, "true" },
                { "G_Sport_Greenblack", "", 0, "true" },
                { "G_Squares_Tinted", "", 0, "true" },
                { "G_Squares", "", 0, "true" },
                { "G_Spectacles_Tinted", "", 0, "true" },
                { "H_WirelessEarpiece_F", "", 0, "true" },
                { "G_Tactical_Clear", "Night Vision Glasses", 0, "true" },
                { "G_AirPurifyingRespirator_01_F", "Radiation Mask", 0, "call life_coplevel >= 3" },
                { "G_Diving", "Diving Goggles", 0, "call life_mpulevel >= 1" },
                { "G_Bandanna_blk", "", 0, "call life_tpulevel >= 1"},
                { "G_Bandanna_beast", "", 0, "call life_tpulevel >= 3"},
                { "G_Balaclava_TI_blk_F", "Operation Balaclava", 0, "call life_npaslevel >= 1 || call life_tpulevel >= 1 || call life_ctulevel >= 1"},
                { "G_Balaclava_TI_G_blk_F", "Operation Balaclava", 0, "call life_npaslevel >= 1 || call life_tpulevel >= 1 || call life_ctulevel >= 1" }
            };
            vests[] = {
                { "NONE", "Remove Vest", 0, "true" },
                { "V_Rangemaster_belt", "Police Ammo Belt", 0, "call life_coplevel >= 1" },
                { "V_BandollierB_blk", "Police Slash", 0, "call life_coplevel >= 1" },
                { "V_TacVest_blk_POLICE", "Police Light Vest", 0, "call life_coplevel >= 1" },
                { "V_PlateCarrier1_blk", "Police Patrol Vest", 0, "call life_coplevel >= 3" },
                { "V_PlateCarrier2_blk", "Police Operation Vest", 0, "call life_coplevel >= 3" },
                { "V_RebreatherB", "Rebreather", 0, "call life_mpulevel >= 1" }
            };
            backpacks[] = {
                { "NONE", "Remove Backpacks", 0, "true" },
                { "B_OutdoorPack_blk", "Invisible Backpack", 0, "call life_coplevel >= 1" },
                { "B_AssaultPack_blk", "Invisible Backpack", 0, "call life_coplevel >= 1" },
                { "B_Kitbag_cbr", "Invisible Backpack", 0, "call life_coplevel >= 1" },
                { "B_FieldPack_blk", "Invisible Backpack", 0, "call life_coplevel >= 1" },
                { "B_Bergen_blk", "Invisible Backpack", 0, "call life_coplevel >= 1" },
                { "B_Carryall_cbr", "Invisible Backpack", 0, "call life_coplevel >= 1" },
                { "B_Parachute", "Parachute", 0, "call life_coplevel >= 1" }
            };
        };

        // NHS Clothing Stores
        class nhs_clothing {
            title = "NHS Clothing Store";
            conditions = "playerSide isEqualTo independent";
            side = "med";
            uniforms[] = {
                { "NONE", "Remove Uniform", 0, "true" },
                { "U_B_CombatUniform_mcam", "Standard Uniform", 0, "call life_mediclevel >= 1" },
                // { "U_IG_Guerrilla_6_1", "Christmas Uniform", 0, "call life_mediclevel >= 1" },
                { "U_I_HeliPilotCoveralls", "Pilot Uniform", 0, "call life_sarlevel >= 1" },
                { "U_C_CBRN_Suit_01_White_F", "Hazmat Suit", 0, "call life_sarlevel >= 1" },
                { "U_B_Wetsuit", "Marine Wetsuit", 0, "call life_sarlevel >= 1" }
            };
            headgear[] = {
                { "NONE", "Remove Headgear", 0, "true" },
                { "H_Bandanna_gry", "", 0, "true" },
                { "H_Bandanna_blu", "", 0, "true" },
                { "H_Bandanna_cbr", "", 0, "true" },
                { "H_Bandanna_khk_hs", "", 0, "true" },
                { "H_Bandanna_khk", "", 0, "true" },
                { "H_Bandanna_sgg", "", 0, "true" },
                { "H_Bandanna_sand", "", 0, "true" },
                { "H_Watchcap_blk", "", 0, "true" },
                { "H_Watchcap_cbr", "", 0, "true" },
                { "H_Watchcap_camo", "", 0, "true" },
                { "H_Watchcap_khk", "", 0, "true" },
                { "H_Booniehat_khk_hs", "", 0, "true" },
                { "H_Booniehat_indp", "", 0, "true" },
                { "H_Booniehat_oli", "", 0, "true" },
                { "H_Booniehat_tan", "", 0, "true" },
                { "H_Booniehat_tna_F", "", 0, "true" },
                { "H_Cap_blk", "", 0, "true" },
                { "H_Cap_blu", "", 0, "true" },
                { "H_Cap_grn", "", 0, "true" },
                { "H_Cap_oli_hs", "", 0, "true" },
                { "H_Cap_red", "", 0, "true" },
                { "H_Cap_tan", "", 0, "true" },
                { "H_Cap_khaki_specops_UK", "", 0, "true" },
                { "H_Cap_usblack", "", 0, "true" },
                { "H_Hat_blue", "", 0, "true" },
                { "H_Hat_brown", "", 0, "true" },
                { "H_Hat_camo", "", 0, "true" },
                { "H_Hat_grey", "", 0, "true" },
                { "H_Hat_tan", "", 0, "true" },
                { "H_StrawHat", "", 0, "true" },
                { "H_StrawHat_dark", "", 0, "true" },
                { "H_Hat_Safari_olive_F", "", 0, "true" },
                { "H_Hat_Safari_sand_F", "", 0, "true" },
                { "H_Helmet_Skate", "", 0, "true" },
                { "H_PilotHelmetFighter_B", "Pilot Helmet", 0, "call life_sarlevel >= 1" },
                { "H_Beret_CSAT_01_F", "CMO Beret", 0, "call life_mediclevel >= 8" }
            };
            goggles[] = {
                { "NONE", "Remove Glasses", 0, "true" },
                { "G_Aviator", "", 0, "true" },
                { "G_Shades_Black", "", 0, "true" },
                { "G_Shades_Blue", "", 0, "true" },
                { "G_Shades_Green", "", 0, "true" },
                { "G_Shades_Red", "", 0, "true" },
                { "G_Spectacles", "", 0, "true" },
                { "G_Sport_Red", "", 0, "true" },
                { "G_Sport_Blackyellow", "", 0, "true" },
                { "G_Sport_BlackWhite", "", 0, "true" },
                { "G_Sport_Checkered", "", 0, "true" },
                { "G_Sport_Blackred", "", 0, "true" },
                { "G_Sport_Greenblack", "", 0, "true" },
                { "G_Squares_Tinted", "", 0, "true" },
                { "G_Squares", "", 0, "true" },
                { "G_Spectacles_Tinted", "", 0, "true" },
                { "H_WirelessEarpiece_F", "", 0, "true" },
                { "H_WirelessEarpiece_F", "", 0, "true" },
                { "G_Respirator_white_F", "", 0, "true" },
                { "G_Respirator_blue_F", "", 0, "true" },
                { "G_Respirator_yellow_F", "", 0, "true" },
                { "G_Tactical_Clear", "Night Vision Glasses", 0, "true" },
                { "G_RegulatorMask_F", "Gas Mask", 0, "true" },
                { "G_Diving", "Diving Goggles", 0, "call life_sarlevel >= 1" }
            };
            vests[] = {
                { "NONE", "Remove Vest", 0, "true" },
                { "V_LegStrapBag_black_F", "Leg Strap", 0, "true" },
                { "V_Safety_yellow_F", "High Vis Jacket", 0, "true" },
                { "V_RebreatherB", "", 0, "call life_sarlevel >= 1" }
            };
            backpacks[] = {
                { "NONE", "Remove Backpacks", 0, "true" },
                { "B_OutdoorPack_blk", "Invisible Backpack", 0, "true" },
                { "B_AssaultPack_blk", "Invisible Backpack", 0, "true" },
                { "B_Kitbag_cbr", "Invisible Backpack", 0, "true" },
                { "B_FieldPack_blk", "Invisible Backpack", 0, "true" },
                { "B_Bergen_blk", "Invisible Backpack", 0, "true" },
                { "B_Carryall_cbr", "Invisible Backpack", 0, "true" }
            };
        };

        // HAVOC Clothing Stores
        class havoc_clothing {
            title = "HAVOC Clothing Store";
            conditions = "playerSide isEqualTo east";
            side = "hav";
            uniforms[] = {
                { "NONE", "Remove Uniform", 0, "true" },
                // { "U_OG_Guerrilla_6_1", "Christmas Uniform", 0, "call life_havoclevel >= 1" },
                { "U_I_E_Uniform_01_tanktop_F", "Private Uniform", 0, "call life_havoclevel >= 1" },
                { "U_I_E_Uniform_01_F", "Standard Uniform", 0, "call life_havoclevel >= 2" },
                { "U_I_E_Uniform_01_shortsleeve_F", "Standard Uniform (Rolled up)", 0, "call life_havoclevel >= 2" },
                { "U_I_E_Uniform_01_sweater_F", "Command Uniform", 0, "call life_havoclevel  >= 7" },
                { "U_I_E_Uniform_01_officer_F", "High Command Uniform", 0, "call life_havoclevel  >= 11" },
                { "U_I_E_CBRN_Suit_01_EAF_F", "Radiation Suit", 0, "call life_havoclevel >= 1" },
                { "U_O_Wetsuit", "HMU Diving Suit", 0, "call life_hmulevel >= 1 || call life_hsflevel >= 1" },
                { "U_I_E_Uniform_01_coveralls_F", "HAD Pilot Coveralls", 0, "call life_hadlevel >= 1 " },
                { "U_B_CTRG_Soldier_F", "HSF Uniform (Long Sleeved)", 0, "call life_hsflevel >= 1" }
            };
            headgear[] = {
                { "NONE", "Remove Headgear", 0, "true" },
                { "H_HelmetB_plain_wdl", "Helmet", 250, "call life_havoclevel >= 1" },
                { "H_HelmetSpecB_wdl", "Command Helmet", 250, "call life_havoclevel >= 7" },
                { "H_Beret_Colonel", "Command Beret", 500, "call life_havoclevel >= 7" },
                { "H_Beret_EAF_01_F", "High Command Beret", 500, "call life_havoclevel >= 11" },
                { "H_HelmetSpecB_wdl", "HSF Helmet", 250, "call life_hsflevel >= 1" },
                { "H_HelmetHBK_F", "HSF Helmet", 250, "call life_hsflevel >= 1" },
                { "H_HelmetHBK_chops_F", "HSF Helmet", 250, "call life_hsflevel >= 1" },
                { "H_CrewHelmetHeli_I_E", "Pilot Helmet", 500, "call life_hadlevel >= 1" },
                { "H_PASGT_basic_olive_F", "", 250, "call life_havoclevel >= 1" },
                { "H_Watchcap_camo", "", 250, "call life_havoclevel >= 1" },
                { "H_Bandanna_sgg", "", 250, "call life_havoclevel >= 1" },
                { "H_Booniehat_wdl", "", 250, "call life_havoclevel >= 1" },
                { "H_Booniehat_eaf", "", 250, "call life_havoclevel >= 1" },
                { "H_Cap_blu", "", 250, "call life_havoclevel >= 1" },
                { "H_Cap_grn", "", 250, "call life_havoclevel >= 1" },
                { "H_Cap_red", "", 250, "call life_havoclevel >= 1" },
                { "H_Cap_surfer", "", 250, "call life_havoclevel >= 1" },
                { "H_Hat_grey", "", 250, "call life_havoclevel >= 1" },
                { "H_Shemag_olive", "", 250, "call life_havoclevel >= 1" },
                { "H_MilCap_wdl", "", 500, "call life_havoclevel >= 5" },
                { "H_MilCap_eaf", "", 500, "call life_havoclevel >= 5" }
            };
            goggles[] = {
                { "NONE", "Remove Glasses", 0, "true" },
                { "G_AirPurifyingRespirator_02_olive_F", "Respirator", 250, "call life_havoclevel >= 1" },
                { "G_Balaclava_combat", "", 100, "call life_havoclevel >= 2" },
                { "G_Balaclava_blk", "", 100, "call life_havoclevel >= 2" },
                { "G_Balaclava_oli", "", 100, "call life_havoclevel >= 2" },
                { "G_Diving", "", 75, "call life_hsflevel >= 1 || call life_hmulevel >= 1" },
                { "G_Bandanna_blk", "", 250, "call life_havoclevel >= 4" },
                { "G_Bandanna_oli", "", 250, "call life_havoclevel >= 4" },
                { "G_Bandanna_aviator", "", 300, "call life_havoclevel >= 4" },
                { "G_Squares", "", 50, "true" },
                { "G_Shades_Blue", "", 50, "true" },
                { "G_Sport_Blackred", "", 50, "true" },
                { "G_Sport_Checkered", "", 50, "true" },
                { "G_Sport_Blackyellow", "", 50, "true" },
                { "G_Sport_BlackWhite", "", 50, "true" },
                { "G_Shades_Black", "", 50, "true" },
                { "G_Lowprofile", "", 50, "true" },
                { "G_Combat", "", 50, "true" },
                { "G_Aviator", "", 50, "true" },
                { "G_Lady_Mirror", "", 50, "true" },
                { "G_Lady_Dark", "", 50, "true" },
                { "G_Lady_Blue", "", 50, "true" },
                { "G_Spectacles", "", 50, "true" },
                { "G_Tactical_Clear", "Night Vision Glasses", 200, "true" }
            };
            vests[] = {
                { "NONE", "Remove Vest", 0, "true" },
                { "V_PlateCarrier1_wdl", "", 15000, "true" },
                { "V_PlateCarrier2_wdl", "", 15000, "call life_havoclevel >= 2" },
                { "V_SmershVest_01_radio_F", "", 15000, "call life_havoclevel >= 11" },
                { "V_RebreatherIR", "", 5000, "call life_hsflevel >= 1 || call life_hmulevel >= 1"}
            };
            backpacks[] = {
                { "NONE", "Remove Backpacks", 0, "true" },
                { "B_OutdoorPack_blk", "Invisible Backpack", 2500, "true" },
                { "B_AssaultPack_blk", "Invisible Backpack", 2500, "true" },
                { "B_Kitbag_cbr", "Invisible Backpack", 2500, "true" },
                { "B_FieldPack_blk", "Invisible Backpack", 2500, "true" },
                { "B_Bergen_blk", "Invisible Backpack", 2500, "true" },
                { "B_Carryall_cbr", "Invisible Backpack", 2500, "true" },
                { "B_Parachute", "Parachute", 10000, "call life_hadlevel >= 1" }
            };
        };
    };
};
