#include "..\..\..\..\script_macros.hpp"
/*
    File: fn_atmMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Opens and manages the bank menu.
*/
params [
	["_transfer", objNull, [objNull, ""]]
];

if (_transfer isEqualType "") then { _transfer = objNull };

private _gangBank = 0;

if (playerside isEqualTo civilian && !(isCID(player)) && !(isHSS(player)) && !(isSO1(player))) then {
    _gangBank = grpPlayer getVariable ["gang_bank", 0];
} else { 
    _gangBank = 0;
};

if !(life_use_atm) exitWith {
    [format ["Because you robbed the bank you can't use the ATM for %1 minutes.", (LIFE_SETTINGS(getNumber,"atm_cooldown"))]] spawn PHX(notify);
};

if !(dialog) then {
    if !(createDialog "RscATM") exitWith {};
};

waitUntil {!isNull (findDisplay 2700)};

disableSerialization;
private _units = CONTROL(2700,2703);

CONTROL(2700,2701) ctrlSetStructuredText parseText format["<img size='1.6' image='data\icons\ico_bank.paa'/> <t font='RobotoCondensedLight'>£%1</t><br/><img size='1.5' image='data\icons\ico_money.paa'/> <t font='RobotoCondensedLight'>£%2</t>",[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];
CONTROL(2700,2707) ctrlSetStructuredText parseText format["<img size='1.5' image='data\icons\ico_bank.paa'/><t font='RobotoCondensedLight'>£%1</t>",[_gangBank] call life_fnc_numberText];

private _type = "";

lbClear _units;

{
    private _type = switch (side _x) do {
        case west: {"Police"};
        case civilian: {"Civilian"};
        case independent: {"NHS"};
        case east: {"HAVOC"};
    };
    
    _units lbAdd format ["%1 (%2)", _x getVariable ["realname", name _x], _type];
    _units lbSetData [(lbSize _units)-1, str(_x)];
} forEach (playableUnits select {
    alive _x &&
    { !(isDowned(_x)) } &&
    { isPlayer _x }
});

lbSort _units;
lbSetCurSel [2703,0];

_transfer = str(_transfer);
for "_i" from 0 to (lbSize _units) do {
    if ((lbData[2703,_i]) isEqualTo _transfer) exitwith {
        lbSetCurSel [2703,_i];
    };
};

if (isNil {(group player getVariable "gang_bank")} || !(playerSide isEqualTo civilian) || PHX_isPM) then {
    (CONTROL(2700,2705)) ctrlEnable false;
    (CONTROL(2700,2706)) ctrlEnable false;
	(CONTROL(2700,2707)) ctrlEnable false;
};