#include "..\..\..\..\..\script_macros.hpp"

private _buttons = [];

if (alive life_vInact_curTarget) then {
	_buttons pushBack ["Repair Vehicle", "[life_vInact_curTarget] spawn life_fnc_repairTruck; closeDialog 0;"];
};

// Get Side...
switch (playerSide) do {
	// Police Actions...
	case west: {
		_buttons pushBack ["Registration", "[life_vInact_curTarget] spawn life_fnc_searchVehAction; closeDialog 0;"];
		_buttons pushBack ["Search Vehicle", "[life_vInact_curTarget] spawn life_fnc_vehInvSearch; closeDialog 0;"];
		_buttons pushBack ["Pullout Players", "[life_vInact_curTarget] spawn life_fnc_pulloutAction; closeDialog 0;"];
		_buttons pushBack ["Impound Vehicle", "[life_vInact_curTarget] spawn life_fnc_impoundAction; closeDialog 0;"];
		_buttons pushBack ["Seize Illegal Items","[life_vInact_curTarget] spawn life_fnc_vehInvSearch; closeDialog 0;"];

		if (FETCH_CONST(life_coplevel) >= 2) then {
			_buttons pushBack ["Break into Vehicle", "[life_vInact_curTarget] spawn PHX_fnc_breakIntoVehicle; closeDialog 0;"];

			if (FETCH_CONST(life_coplevel) >= 5) then {
				_buttons pushBack ["Crush Vehicle", "[life_vInact_curTarget] spawn PHX_fnc_crushVehicle; closeDialog 0;"];
			};
		};
	};
	case independent: {
		_buttons pushBack ["Impound Vehicle", "[life_vInact_curTarget] spawn life_fnc_impoundAction; closeDialog 0;"];
		_buttons pushBack ["Break into Vehicle", "[life_vInact_curTarget] spawn PHX_fnc_breakIntoVehicle; closeDialog 0;"];
	};
	case east: {
		_buttons pushBack ["Pullout Players", "[life_vInact_curTarget] spawn life_fnc_pulloutAction; closeDialog 0;"];
		_buttons pushBack ["Impound Vehicle", "[life_vInact_curTarget] spawn life_fnc_impoundAction; closeDialog 0;"];
	};
	// Civilian Actions...
	case civilian: {
		if (isCID(player) || {(isHSS(player))}) then {
			_buttons pushBack ["Impound Vehicle", "[life_vInact_curTarget] spawn life_fnc_impoundAction; closeDialog 0;"];

			if (isCID(player)) then {
				_buttons pushBack ["Seize Illegal Items","[life_vInact_curTarget] spawn life_fnc_vehInvSearch; closeDialog 0;"];
			};
		};

		if (life_vInact_curTarget in life_vehicles) then {
			_buttons pushBack ["Pullout Players", "[life_vInact_curTarget] spawn life_fnc_pulloutAction; closeDialog 0;"];
		};

		if (typeOf life_vInact_curTarget isEqualTo "O_Truck_03_device_F") then {
			if (isNil {(life_vInact_curTarget getVariable "mining")} || local life_vInact_curTarget && { life_vInact_curTarget in life_vehicles }) then {
				_buttons pushBack ["Mine from device", "[life_vInact_curTarget] spawn life_fnc_deviceMine"];
			};
		};
	};
};

private _id = getObjectDLC life_vInact_curTarget; // Get DLC Id...

if (life_vInact_curTarget isKindOf "Ship" && { local life_vInact_curTarget } && { crew life_vInact_curTarget isEqualTo [] }) then {
	_buttons pushBack ["Push Boat", "[] spawn life_fnc_pushObject; closeDialog 0;"];
} else {
	if !(isNil "_id") then {
		if ((_id in getDLCs 1) && { crew life_vInact_curTarget isEqualTo [] } && { canMove life_vInact_curTarget } && { locked life_vInact_curTarget isEqualTo 0 }) then {
			_buttons pushBack ["Get In Vehicle", "player moveInDriver life_vInact_curTarget; closeDialog 0;"];
		};
	};

	if (alive life_vInact_curTarget && (!(crew life_vInact_curTarget isEqualTo []) || life_vInact_curTarget in life_vehicles) && (isNil "PHX_unflipCool")) then {
		_buttons pushBack ["Unflip Vehicle", "life_vInact_curTarget spawn PHX_fnc_unflipVehicle; closeDialog 0;"];
		[] spawn {
			PHX_unflipCool = true;
			sleep 10;
			PHX_unflipCool = nil;
		};
	};
};

if (player getVariable ['isAdmin',false]) then {
	if !(playerSide isEqualTo west) then {
		_buttons pushBack ["Vehicle Owner", "[life_vInact_curTarget] spawn life_fnc_searchVehAction; closeDialog 0;"];
		_buttons pushBack ["Pullout Players", "[life_vInact_curTarget] spawn life_fnc_pulloutAction; closeDialog 0;"];
		_buttons pushBack ["Impound Vehicle", "[life_vInact_curTarget] spawn life_fnc_impoundAction; closeDialog 0;"];
		_buttons pushBack ["Break into Vehicle", "[life_vInact_curTarget] spawn PHX_fnc_breakIntoVehicle; closeDialog 0;"];
	};
	_buttons pushBack ["Reset Bugged Vehicle", "life_vInact_curTarget setVariable ['trunk_in_use',false,true]; life_vInact_curTarget setVariable ['trunk_in_use_by',false,true]; closeDialog 0;"];
};

["Vehicle Interactions", _buttons]