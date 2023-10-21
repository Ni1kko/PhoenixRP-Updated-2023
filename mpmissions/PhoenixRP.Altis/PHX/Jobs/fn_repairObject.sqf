/*
*   @File: fn_repairObject.sqf
*   @Author: Zyn
*   @Description: Repairs a map object for the repair job
*/
#include "..\..\script_macros.hpp"

if (!isNil "PHX_repairCool") exitWith {NOTIFY("You can only repair objects every 30 seconds!","red")};

private _level = PROF_LVL("Prof_Repairing");

life_action_inUse = true;

if !(
	[
		"Repairing objects within the area",
		60,
		[],
		([0.01,(0.01 + (_level / 2500))] select (_level > 0))
	] call PHX(handleProgress)
) exitWith { life_action_inUse = false };

life_action_inUse = false;

private _count = 0;

{
	if (((damage _x) > 0.1) && {!([_x, ["AllVehicles","Man"]] call PHX(isKindOf))}) then {
		_x setDamage 0;
		_count = _count + 1;
	};
} forEach (nearestObjects [player, [], 5]);

private _amount = ((3000 * _count) + (random 10000));

[20,"Repairing Objects"] call PHX_fnc_handleXP;
["Prof_Repairing", 1, 50] call PHX(increaseProfession);
[format["You have successfully repaired %1 objects. You have been sent a small paycheck of £%2 by the local town!",_count,[_amount] call life_fnc_numberText],"green"] call PHX_fnc_notify;
[_amount, 0, 0, "Repaired An Object"] call PHX_fnc_handleMoney;
[player, format ["%1 (%2) repaired objects for %3. Bank Balance: %4 On Hand Balance: %5",profileName,getPlayerUID player,[_amount] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);

[] spawn {
	PHX_repairCool = true;
	sleep 30;
	PHX_repairCool = nil;
};