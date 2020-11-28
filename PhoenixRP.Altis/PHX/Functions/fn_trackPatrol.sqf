/*
	@File: fn_trackPatrol.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Gives the player a patrol mission to complete.
*/
#include "..\..\script_macros.hpp"

if (PHX_Cur_Patrol isEqualTo []) exitWith {}; // Stops us creating loops and stuff when they're not actually needed.

[] spawn {
    waitUntil {!PHX_DoingMission || !alive player};
    if !(alive player) then {
        life_cur_task setTaskState "Failed";
        player removeSimpleTask life_cur_task;
        [format["You've died and so the %1 Assignment failed...", ["Patrol", "Response"] select (playerSide isEqualTo independent)]] spawn PHX(notify);
        PHX_DoingMission = false;
		PHX_Cur_Patrol = [];
		if (PHX_NHS_Responding) then { PHX_NHS_Responding = false }; // If it's true... It's not now...
    };
};

[] spawn {
    for "_i" from 0 to 1 step 0 do {
		if !(alive player) exitWith {}; // Stop this while loop if we've died please.
		
		if (round((position player distance (PHX_Cur_Patrol select 1))) <= 10) exitWith {
			life_cur_task setTaskState "Succeeded";
			player removeSimpleTask life_cur_task;
			
			private _reward = PHX_Patrol_Reward;
			if (playerSide isEqualTo independent) then {
				_reward = round(_reward / 2);
			};
			
			[_reward, 0, 1, "Patrol Mission"] call PHX_fnc_HandleMoney;
			[player, format ["%1 (%2) finished a assignment and received %3. Bank Balance: %4 On Hand Balance: %5",profileName,getPlayerUID player,[_reward] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
			[(((PROF_LVL("Prof_Patrol")) / 5) + 300), "Completed Assignment"] spawn PHX(handleXP);

			[format["You've successfully %3 %1 and received £%2 as a reward!", PHX_Cur_Patrol select 0, _reward, ["patrolled", "responded to"] select (playerSide isEqualTo independent)]] spawn PHX(notify);
			["Prof_Patrol",1,50] call PHX(increaseProfession);

			PHX_DoingMission = false;
			PHX_LastPatrol = PHX_Cur_Patrol; // Save this!
			PHX_Cur_Patrol = [];

			if (PHX_NHS_Responding) then { PHX_NHS_Responding = false }; // If it's true... It's not now...
		};
	};
};