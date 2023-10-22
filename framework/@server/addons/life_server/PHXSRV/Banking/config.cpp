class CfgPatches 
{
    class phxserver_banking
    {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {"life_server"};
        author = "Ni1kko";
    };
};

class CfgBanks
{
    objects[] = {"fed_bank"};
};

class CfgFunctions 
{ 
    class PHXSVR 
    {
        class Banking 
        {
            file = "\life_server\PHXSRV\Banking";
            class preInitBankingSystem {};
            class loadPersistentBanks {};
            class updatePersistentBanks {};
        };
    }; 
};

 