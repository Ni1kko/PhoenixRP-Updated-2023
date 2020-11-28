/*
	@File: fn_questionDealer.sqf
	@Author: Bryan "Tonic" Boardwine
	@Description: Question system for dealers
*/
#include "..\..\script_macros.hpp"
params [["_npc", objNull, [objNull]]];

private _sellers = _npc getVariable ["sellers",[]];
if (_sellers isEqualTo []) exitWith {NOTIFY("No one has sold to this dealer recently.","red")};

private _crimes = LIFE_SETTINGS(getArray,"crimes");
private _names = "";
private _val = 0;

life_action_inUse = true;

{
    _x params ["_uid", "_name", "_value"];

    _val = 0;

    if (_value > 150000) then {
        _val = round(_value / 16);
    } else {
        _val = ["483",_crimes] call LIFE_fnc_index;
        _val = ((_crimes select _val) select 1);

        if (_val isEqualType "") then {
            _val = parseNumber _val;
        };
    };

    if (playerSide isEqualTo west) then {
        [_uid,_name,"483",_val] remoteExecCall (["fnc_wantedAdd", "life"] call SOCK_fnc_getRemoteDestination);
    };
    
    _names = _names + format ["%1<br/>",_name];
} forEach _sellers;

if !(
[
    "Questioning Dealer",
    5,
    [],
    0.01,
    ""
] call PHX(handleProgress)
) exitWith { life_action_inUse = false; };

life_action_inUse = false;

[format [("The following people have been selling to this dealer recently.")+ "<br/><br/>%1",_names], "green"] spawn PHX(notify);
_npc setVariable ["sellers",[],true];
life_action_inUse = false;