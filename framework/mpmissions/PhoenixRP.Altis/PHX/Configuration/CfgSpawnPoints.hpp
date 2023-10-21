#define gangBase(name) #[name] call PHX_fnc_ownsBase

class CfgSpawnPoints {
    class Altis {
        class Civilian {
            // Standard Locations
            class Kavala {
                displayName = "Kavala";
                spawnMarker = "civ_spawn_1";
                icon = "data\icons\ico_Kavala.paa";
                conditions = "";
            };
            class Athira {
                displayName = "Athira";
                spawnMarker = "civ_spawn_3";
                icon = "data\icons\ico_Athira.paa";
                conditions = "";
            };
            class Pyrgos {
                displayName = "Pyrgos";
                spawnMarker = "civ_spawn_2";
                icon = "data\icons\ico_Pyrgos.paa";
                conditions = "";
            };

            // Job Locations
            class government_offices {
                displayName = "Government Offices";
                spawnMarker = "so1_offices_spawn";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "PHX_isPM || license_civ_SO1";
            };
            class governors_residence {
                displayName = "Governor's Residence";
                spawnMarker = "governors_residence";
                icon = "data\icons\ico_House.paa";
                conditions = "PHX_isPM || license_civ_SO1";
            };

            class TaxiHQ {
                displayName = "Taxi HQ";
                spawnMarker = "civ_spawn_TaxiHQ";
                icon = "data\ui\taxi.paa";
                conditions = "license_civ_taximan";
            };
            class RepairHQ {
                displayName = "Altis Services HQ";
                spawnMarker = "civ_spawn_repairhq";
                icon = "data\icons\ico_Repair.paa";
                conditions = "license_civ_repair";
            };
            class LawyerHQ {
                displayName = "Altis Lawyers HQ";
                spawnMarker = "civ_spawn_lawyer";
                icon = "data\ui\lawyer.paa";
                conditions = "license_civ_lawyer";
            };
            class AltisNews {
                displayName = "Altis News";
                spawnMarker = "altisnews_spawn";
                icon = "data\icons\ico_News.paa";
                conditions = "license_civ_news";
            };

            // Traveler Perk Locations
            class Sofia {
                displayName = "Sofia";
                spawnMarker = "civ_spawn_4";
                icon = "data\icons\ico_Sofia.paa";
                conditions = "(PHX_Perks findIf { _x isEqualTo ""wideTraveller"" }) > -1";
            };

            class Agios {
                displayName = "Agios";
                spawnMarker = "civ_spawn_5";
                icon = "data\icons\ico_Agios.paa";
                conditions = "(PHX_Perks findIf { _x isEqualTo ""wideTraveller"" }) > -1";
            };

            class Neochori {
                displayName = "Neochori";
                spawnMarker = "civ_spawn_6";
                icon = "data\icons\ico_Agios.paa";
                conditions = "(PHX_Perks findIf { _x isEqualTo ""wideTraveller"" }) > -1";
            };

            class NWBase {
                displayname = "Gang Base";
                spawnMarker = "buy_spawn_1";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                conditions = gangBase("NW");
            };
            class NEBase {
                displayname = "Gang Base";
                spawnMarker = "buy_Spawn_2";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                conditions = gangBase("NE");
            };
            class SWBase {
                displayname = "Gang Base";
                spawnMarker = "buy_Spawn_3";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                conditions = gangBase("SW");
            };

            // Undercover Spawns
            class cid {
                displayname = "CID Base";
                spawnMarker = "cid_spawn";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                conditions = "player getVariable ['isCID', false]";
            };
            class hss {
                displayname = "HSS Base";
                spawnMarker = "hss_spawn";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                conditions = "player getVariable ['isHSS', false]";
            };
        };

        class Cop {
            class Kavala {
                displayName = "Kavala Station";
                spawnMarker = "cop_spawn_1";
                icon = "data\icons\ico_Kavala.paa";
                conditions = "";
            };
            class Athira {
                displayName = "Athira Station";
                spawnMarker = "cop_spawn_3";
                icon = "data\icons\ico_Athira.paa";
                conditions = "";
            };
            class Agios {
                displayName = "Agios Station";
                spawnMarker = "cop_spawn_2";
                icon = "data\icons\ico_Agios.paa";
                conditions = "";
            };
            class Sofia {
                displayName = "Sofia Station";
                spawnMarker = "cop_spawn_4";
                icon = "data\icons\ico_Agios.paa";
                conditions = "";
            };
            class MPU {
                displayName = "MPU HQ";
                spawnMarker = "apc_spawn_MPU";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "call life_mpulevel >= 1";
            };
            class specunits {
                displayName = "Spec. Unit HQ";
                spawnMarker = "apc_spec_spawn";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "call life_npaslevel >= 1 || call life_mpulevel >= 1 || call life_tpulevel >= 1 || call life_ctulevel >= 1";
            };
        };

        class Medic {
            class Kavala {
                displayName = "Kavala Hospital";
                spawnMarker = "medic_spawn_1";
                icon = "data\icons\ico_Kavala.paa";
                conditions = "";
            };
            class Athira {
                displayName = "Athira Hospital";
                spawnMarker = "medic_spawn_2";
                icon = "data\icons\ico_Athira.paa";
                conditions = "";
            };
            class Pyrgos {
                displayName = "Pyrgos Hospital";
                spawnMarker = "havoc_ams";
                icon = "data\icons\ico_Pyrgos.paa";
                conditions = "";
            };
            class specunits {
                displayName = "Spec. Unit HQ";
                spawnMarker = "apc_spec_spawn";
                icon = "\a3\ui_f\Data\map\vehicleIcons\iconHelicopter_ca.paa";
                conditions = "call life_sarlevel >= 1";
            };
        };

        class HAVOC {
            class Base {
                displayName = "Molos HQ";
                spawnMarker = "havoc_basespawn";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                conditions = "";
            };
            class sFob {
                displayName = "Units HQ";
                spawnMarker = "havoc_fob_spawn";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                conditions = "";
            };
            class CP {
                displayName = "Checkpoint";
                spawnMarker = "havoc_cpspawn";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                conditions = "";
            };
        };
    };

    class Tanoa {};
};
