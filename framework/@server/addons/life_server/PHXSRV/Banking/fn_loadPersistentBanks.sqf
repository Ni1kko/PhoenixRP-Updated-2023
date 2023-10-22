/*
	Author: Ni1kko
	Description: This file is used to load the banks gold from the database and set it to the bank object.
*/

//-- Re loads gold back to vault
{
    private _bank = missionNamespace getVariable [_x, objNull];
    if not(isNull _bank) then {
        scopeName "PHX_loadBanksLoop";
        private _query = [format["SELECT gold_bars FROM phxbanks WHERE object_name = '%1'",_x], 2] call DB_fnc_asyncCall;
        
        if(_query in ["",[]])then{
            private _value = round((((count playableUnits) / 3)) + (time / 60));
            [format["INSERT INTO phxbanks (object_name, gold_bars) VALUES ('%1', '%2')",_x,_value], 1] call DB_fnc_asyncCall;
            breakTo "PHX_loadBanksLoop";
        };
        
        private _value = _query params [0, 0];
        private _barWeight = getNumber (missionConfigFile >> "CfgItems" >> "goldbar" >> "weight");
        _bank setVariable ["Trunk", [[["goldbar", _value]], (_barWeight * _value)], true];
        serverNamespace setVariable [[_x,"lastSyncedBars"] joinString "_", _value];
        serverNamespace setVariable [[_x,"lastSyncCheck"] joinString "_", diag_tickTime];
    };
}forEach _this;

_this call PHXSVR_fnc_updatePersistentBanks;

true