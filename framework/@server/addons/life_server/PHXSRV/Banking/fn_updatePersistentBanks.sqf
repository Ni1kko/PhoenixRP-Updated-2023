/*
	Author: Ni1kko
	Description: This file is used to sync the gold bars in the banks to the database.
*/

private _getVaultBars = {
    private _vault = param [0, objNull];
    private _bars = 0;

    {
        _x params ["_className", "_amount"];
        if (_className isEqualTo "goldbar") then {
            _bars = _bars + _amount;
        };
    } forEach (_vault getVariable ["Trunk", []]);

    _bars;
};

while {true} do 
{
    {
        private _bank = missionNamespace getVariable [_x, objNull];
        if not(isNull _bank) then {
            private _bankLastKnownBarsVar = [_x,"lastSyncedBars"] joinString "_";
            private _bankLastSyncCheckVar = [_x,"lastSyncCheck"] joinString "_";

            private _bankLastKnownBars = serverNamespace getVariable [_bankLastKnownBarsVar, 0];
            private _bankLastSyncCheck = serverNamespace getVariable [_bankLastSyncCheckVar, diag_tickTime];

            private _syncIn = [300, 30] select PHX_Restart;
            if(_bankLastSyncCheck < (diag_tickTime - _syncIn)) then 
            {
                private _value = _bank call _getVaultBars;

                if(_value isNotEqualTo _bankLastKnownBars OR _value isEqualTo 0) then {

                    // If the value is 0, we'll just set it to the default value...
                    if(_value isEqualTo 0) then {
                        private _barWeight = getNumber (missionConfigFile >> "CfgItems" >> "goldbar" >> "weight");
                        _value = round((((count playableUnits) / 3)) + (time / 60));
                        _bank setVariable ["Trunk", [[["goldbar", _value]], (_barWeight * _value)], true];
                    };

                    // Update the database...
                    [format["UPDATE phxbanks SET gold_bars = '%1' WHERE object_name = '%2'",_value,_x], 1] call DB_fnc_asyncCall;
                    diag_log format["Updating %1's gold bars to %2",_x,_value];

                    // Update the server variables...
                    serverNamespace setVariable [_bankLastKnownBarsVar, _value];
                    serverNamespace setVariable [_bankLastSyncCheckVar, diag_tickTime];
                };
            };
        };
        uiSleep 15;
    }forEach _this;
};