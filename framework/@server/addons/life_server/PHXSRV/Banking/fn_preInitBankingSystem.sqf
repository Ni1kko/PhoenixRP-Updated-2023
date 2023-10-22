/*
	Author: Ni1kko
	Description: init banking system
*/

private _bankVaults = getArray (configFile >> "CfgBanks" >> "objects");

if(count _bankVaults > 0)then
{
    //-- Reset banks gold if above 50 to 50
    ["CALL reset_phxbanks", 1] call DB_fnc_asyncCall;

    //-- Load banks gold
    _bankVaults spawn PHXSVR_fnc_loadPersistentBanks;
};

true