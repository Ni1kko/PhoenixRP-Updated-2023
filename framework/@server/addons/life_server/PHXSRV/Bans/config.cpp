class CfgPatches 
{
    class phxserver_bans 
    {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {"life_server"};
        author = "Ni1kko";
    };
};

//-- Test me 
// ["76561198140826891","Trolling at kavala, banned by Ni1kko! 22.10.2023"] CALL PHXSVR_fnc_addban;

class CfgFunctions 
{ 
    class PHXSVR 
    {
        class Bans 
        {
            file = "\life_server\PHXSRV\Bans";
            class preInitBanSystem {preInit = 1;};
            class addBan {};
            class checkBanned {};
            class kickBanned {};
        };
    }; 
};

 