class DefaultEventhandlers;
class CfgPatches {
    class life_server {
        units[] = {"C_man_1"};
        weapons[] = {};
        requiredAddons[] = {"A3_Data_F","A3_Soft_F","A3_Soft_F_Offroad_01","A3_Characters_F"};
        fileName = "life_server.pbo";
        author = "Tonic";
    };
};

class CfgFunctions {

    class Headless {
        tag = "HL";

        class Core {
            file = "\life_server\Headless";
            class initHeadless {};
            class setGlobalVars {};
        };

        class HC_Player {
            file = "\life_server\PHXSRV\Database\Player";
            class getPlayerInfo {};
        };

        class HC_MySQL {
            file = "\life_server\Functions\MySQL";
            class updateRequest {};
            class updatePartial {};
        };

        class HC_Systems {
            file = "\life_server\Functions\Systems";
            class getVehicles {};
            class vehicleStore {};
            class spawnVehicle {};
            class vehicleCreate {};
            class vehicleDelete {};
            class managesc {};
        };

        class HC_Gangs {
            file = "\life_server\Functions\Gangs";
            class insertGang {};
            class removeGang {};
            class updateGang {};
        };

        class HC_Wanted_Sys {
            file = "\life_server\Functions\WantedSystem";
            class wantedBounty {};
            class wantedRemove {};
            class wantedAdd {};
            class wantedCrimes {};
            class wantedProfUpdate {};
        };

        class HC_Housing {
            file = "\life_server\Functions\Housing";
            class addHouse {};
            class fetchPlayerHouses {};
            class initHouses {};
            class sellHouse {};
            class updateHouse {};
        };

        class HC_ROOT {
            file = "\life_server\PHXSRV";
            class prestigeWipe {};
            class changeOwner {};
            class sendHook {};
            class logDispute {};
        };

        class HC_Crimes  {
            file = "\life_server\PHXSRV\Crimes";
            class getHMValue {};
            class fillArmoury {};
            class getDestroyerValue {};
            class getLockupValue {};
        };

        class HC_ID {
            file = "\life_server\PHXSRV\ID";
            class insertID {};
            class lookupID {};
        };

        class HC_Loyatly {
            file = "\life_server\PHXSRV\Loyalty";
            class saveRewards {};
        };

        class HC_Government {
            file = "\life_server\PHXSRV\Government";
            class setLegislation {};
            class setLegality {};
            class HandleSO1 {};
        };

        class HC_Government_Polling {
            file = "\life_server\PHXSRV\Government\Polling";
            class addOption {};
            class addVote {};
        };

        class HC_Bases {
            file = "\life_server\PHXSRV\Bases";
            class getBid {};
            class addBid {};
        };

        class HC_PHXSRVHousing {
            file = "\life_server\PHXSRV\Housing";
            class insertCategory {};
            class getCategories {};
            class saveCategory {};
        };

        class HC_Cartel {
            file = "\life_server\PHXSRV\Cartel";
            class insertCapture {};
        };

        class HC_Stats {
            file = "\life_server\PHXSRV\Stats";
            class saveStat {};
        };

        class HC_Mail {
            file = "\life_server\PHXSRV\Mail";
            class updateMail {};
            class sendMail {};
        };
    };

    #include "\life_server\PHXSRV\Functions.h"
    
    class MySQL_Database {
        tag = "DB";
        class MySQL
        {
            file = "\life_server\Functions\MySQL";
            class numberSafe {};
            class mresArray {};
            class asyncCall{};
            class updateRequest{};
            class mresToArray {};
            class insertVehicle {};
            class bool {};
            class mresString {};
            class updatePartial {};
        };
    };

    class Life_System {
        tag = "life";
        class Wanted_Sys {
            file = "\life_server\Functions\WantedSystem";
            class wantedFetch {};
            class wantedPerson {};
            class wantedBounty {};
            class wantedRemove {};
            class wantedAdd {};
            class wantedCrimes {};
            class wantedProfUpdate {};
        };

        class Jail_Sys {
            file = "\life_server\Functions\Jail";
            class jailSys {};
        };

        class Client_Code {
            file = "\life_server\Functions\Client";
        };
    };

    class TON_System {
        tag = "TON";
        class Systems {
            file = "\life_server\Functions\Systems";
            class managesc {};
            class cleanup {};
            class vehicleCreate {};
            class spawnVehicle {};
            class getVehicles {};
            class vehicleStore {};
            class vehicleDelete {};
            class spikeStrip {};
            class chopShopSell {};
            class clientDisconnect {};
            class entityRespawned {};
            class cleanupRequest {};
            class keyManagement {};
            class vehicleUpdate {};
            class recupkeyforHC {};
            class terrainSort {};
            class checkPlate {};
        };

        class Housing {
            file = "\life_server\Functions\Housing";
            class addHouse {};
            class fetchPlayerHouses {};
            class initHouses {};
            class sellHouse {};
            class updateHouse {};
        };

        class Gangs {
            file = "\life_server\Functions\Gangs";
            class insertGang {};
            class queryPlayerGang {};
            class removeGang {};
            class updateGang {};
        };

        class PlayTime {
            file = "\life_server\Functions\PlayTime";
            class setPlayTime {};
            class getPlayTime {};
        };
    };
};

class CfgVehicles {
    class Car_F;
    class CAManBase;
    class Civilian;
    class Civilian_F : Civilian {
        class EventHandlers;
    };
};
