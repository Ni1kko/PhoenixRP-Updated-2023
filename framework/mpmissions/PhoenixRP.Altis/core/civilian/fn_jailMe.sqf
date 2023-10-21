#include "..\..\script_macros.hpp"
/*
    File: fn_jailMe.sqf
    Author Bryan "Tonic" Boardwine

    Description:
    Once word is received by the server the rest of the jail execution is completed.
*/

params [
    ["_ret",[],[[]]],
    ["_time", 10, [0]]
];

private _esc = false;
private _bail = false;
private _escDist = 55;
private _countDown = 0;
private _jailMarker = (missionNameSpace getVariable ["PHX_jailMarker","jail_marker"]);
private _releaseMarker = (["jail_release_havoc", "jail_release"] select (_jailMarker isEqualTo "jail_marker"));

if !(_ret isEqualTo []) then {
    life_bail_amount = [((_ret select 2) / 2),((_ret select 2) / 4)] select (HAS_PERK("legalCover"));
} else {
    life_bail_amount = 1500;
};

[] spawn {
    life_canpay_bail = false;
    sleep (life_jail_time / 2);
    life_canpay_bail = true;
};

for "_i" from 0 to 1 step 0 do {
    _countDown = [life_jail_time, "MM:SS"] call BIS_fnc_secondsToString;

    if (_jailMarker isEqualTo "jail_marker") then {
        hintSilent parseText format ["Time Remaining:<br/> <t size='1.7'color='#FF0000'>%1</t><br/><br/>Can pay bail: %3<br/>Bail Price: £%2", _countDown, [life_bail_amount] call life_fnc_numberText, if (life_canpay_bail) then {"Yes"} else {"No"}];
    } else {
        hintSilent parseText format ["Time Remaining:<br/> <t size='1.7'color='#FF0000'>%1</t>", _countDown];
    };

    life_jail_time = life_jail_time - 0.1;
    
    if (player distance (getMarkerPos _jailMarker) > _escDist) exitWith {_esc = true;};
    if (life_bail_paid) exitWith {_bail = true;};

    if (life_jail_time < 0.11 || {!alive player}) exitWith {};
    sleep 0.1;
};

switch (true) do {
    case (_bail && { (_jailMarker isEqualTo "jail_marker") }): {
        life_is_arrested = false;
        life_is_arrested_police = false;
        life_is_arrested_havoc = false;

        life_bail_paid = false;

        NOTIFY("You are now free to go!","green");
        [] call PHX(getDefaultLoadout);
        player setPos (getMarkerPos _releaseMarker);

        [getPlayerUID player] remoteExecCall (["fnc_wantedRemove", "life"] call SOCK_fnc_getRemoteDestination);
    };

    case (_esc): {
        life_is_arrested = false;
        life_is_arrested_police = false;
        life_is_arrested_havoc = false;

         if (_jailMarker isEqualTo "jail_marker") then {
            NOTIFY("You have escaped from the H.M.P, you still retain your previous crimes and now have a count of escaping the HMP.","red");

             if !(playerSide isEqualTo east) then {
                [getPlayerUID player, profileName, "901"] remoteExecCall (["fnc_wantedAdd", "life"] call SOCK_fnc_getRemoteDestination);
            };
        } else {
            NOTIFY("You have escaped from the gulag!","red");
        };
    };

    case (alive player && {!_esc} && {!_bail}): {
        life_is_arrested = false;
        life_is_arrested_police = false;
        life_is_arrested_havoc = false;

        if (_jailMarker isEqualTo "jail_marker") then {
            NOTIFY("You have served your time in the H.M.P and have been released!","green");
            [getPlayerUID player] remoteExecCall (["fnc_wantedRemove", "life"] call SOCK_fnc_getRemoteDestination);
        } else {
            NOTIFY("You have served your time in the gulag and have been released!","green");
        };

        [] call PHX(getDefaultLoadout);
        player setPos (getMarkerPos _releaseMarker);
    };
};

hint "";
[5] call SOCK_fnc_updatePartial;

player forceWalk false;
