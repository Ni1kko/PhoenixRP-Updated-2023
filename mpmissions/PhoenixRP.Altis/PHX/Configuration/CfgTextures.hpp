
/*
    texture : STRING DIRECTORY
*/

class CfgTextures {
    
    /*
    class U_OG_Guerrilla_6_1 {
        textures[] = {
            {"Civilian\Uniforms\Civ_Christmas.jpg", "_side isEqualTo civilian", {0, ""}},
            {"HAVOC\HAVOC_Christmas.jpg", "_side isEqualTo east", {0, ""}}
        };
    };
    */

    // CIV Skins
    class U_Rangemaster {
        textures[] = {
            {"Civilian\Uniforms\civilian_taximan.paa", "true", {1, ""}}
        };
    };

    class U_C_Scientist {
        textures[] = {
            {"Civilian\Uniforms\Prisoner.paa", "true", {1, ""}}
        };
    };

    // APC Skins
    class U_B_CombatUniform_mcam_worn {
        textures[] = {
            {"Police\Uniforms\police_trainee.paa", "_side isEqualTo west && { _level < 3 }", {1, ""}},
            {"Police\Uniforms\police_tpu.paa", "_side isEqualTo west && { _level > 2 }", {1, ""}}
        };
    };
    class U_B_CombatUniform_mcam_vest : U_B_CombatUniform_mcam_worn{};

    // Christmas skin
    class U_BG_Guerrilla_6_1 {
        textures[] = {
            // {"Police\Uniforms\APC_Christmas.jpg", "_side isEqualTo west", {0, ""}},
            {"Police\Uniforms\police_command.paa", "_side isEqualTo west && { _level >= 8 }", {1, ""}},
            {"Police\Uniforms\police_main.paa", "_side isEqualTo west", {1, ""}}
        };
    };


    class U_O_PilotCoveralls {
        textures[] = {
            {"Police\Uniforms\police_npas.paa", "_side isEqualTo west", {1, ""}}
        };
    };

    class U_B_CTRG_Soldier_F {
        textures[] = {
            {"Police\Uniforms\police_ctu.paa", "_side isEqualTo west", {1, ""}},
            {"HAVOC\havoc_HSF.paa", "_side isEqualTo east", {1, ""}},
            {"Gangs\EvolvE\EvolvEUniform.paa", "_side isEqualTo civilian && ['EvolvE', player] call PHX_fnc_inWhitelistGang", {1, ""}},
            {"Gangs\Vanquish\VanquishUniform.paa", "_side isEqualTo civilian && ['Vanq', player] call PHX_fnc_inWhitelistGang", {1, ""}}
        };
    };

    class U_B_CTRG_Soldier_3_F {
        textures[] = {
            {"Gangs\Ares\ares_uniform.paa", "_side isEqualTo civilian && ['Ares', player] call PHX_fnc_inWhitelistGang", {1, ""}}
        };
    };

    class U_C_Man_casual_2_F {
        textures[] = {
            {"Gangs\TMC\TMC_Uniform.paa", "_side isEqualTo civilian && ['TMC', player] call PHX_fnc_inWhitelistGang", {1, ""}}
        };
    };
    
    class U_B_GhillieSuit : U_B_CTRG_Soldier_F{};
    class U_B_T_Soldier_F : U_B_CTRG_Soldier_F{};
    class U_B_T_Soldier_SL_F : U_B_CTRG_Soldier_F{};

    // NHS Skins
    class U_B_CombatUniform_mcam {
        textures[] = {
            {"Medic\Uniforms\medic_command.paa", "_side isEqualTo independent && { _level >= 6 }", {1, ""}},
            {"Medic\Uniforms\medic_standard.paa", "_side isEqualTo independent", {1, ""}}
        };
    };

    class U_I_CombatUniform {
        textures[] = {
            {"Gangs\Temper\TemperUniform.paa", "_side isEqualTo civilian && ['Temper', player] call PHX_fnc_inWhitelistGang", {1, ""}}
        };
    };

    class U_O_Wetsuit {
        textures[] = {
            {"", "_side isEqualTo east", {1, ""}}
        };
    };

    // HAVOC
    class U_I_E_Uniform_01_F {
        textures[] = {
            {"", "_side isEqualTo east", {1, ""}}
        };
    };

    class U_I_E_Uniform_01_shortsleeve_F : U_I_E_Uniform_01_F{};
    class U_I_E_Uniform_01_tanktop_F : U_I_E_Uniform_01_F{};
    class U_I_E_Uniform_01_sweater_F : U_I_E_Uniform_01_F{};
    class U_I_E_Uniform_01_officer_F : U_I_E_Uniform_01_F{};
    class U_I_E_CBRN_Suit_01_EAF_F : U_I_E_Uniform_01_F{};
    class U_I_E_Uniform_01_coveralls_F : U_I_E_Uniform_01_F{};
    class U_B_CombatUniform_mcam_wdl_f : U_I_E_Uniform_01_F{};

    /*
    class U_IG_Guerrilla_6_1 {
        textures[] = {
            {"Medic\Uniforms\NHS_Christmas.jpg", "_side isEqualTo independent", {0, ""}}
        };
    };
    */

    // NHS Haz
    class U_C_CBRN_Suit_01_White_F {
        textures[] = {
            {"", "_side isEqualTo independent", {1, ""}}
        };
    };

    class U_I_HeliPilotCoveralls {
        textures[] = {
            {"Medic\Uniforms\medic_sar.paa", "_side isEqualTo independent", {1, ""}}
        };
    };
};
