#include "..\..\..\..\..\script_macros.hpp"

private _buttons = [];

_buttons pushBack ["Add To Watchlist", "[life_vInact_curTarget] call PHX_fnc_addWatchlist; closeDialog 0;"];

if (playerSide in [west, east]) then {
	_buttons append ([] call PHX_fnc_getBuildingInteractions);

	if !(isNil {life_vInact_curTarget getVariable 'house_owner'}) then {
		_buttons pushBack ["Lockup House", "[life_vInact_curTarget] spawn PHX_fnc_lockHouse; closeDialog 0;"];
		_buttons pushBack ["Break Door Lock", "[life_vInact_curTarget] spawn PHX_fnc_forceEntry; closeDialog 0;"];
		_buttons pushBack ["House Owner", "[life_vInact_curTarget] spawn life_fnc_copHouseOwner; closeDialog 0;"];

		if (life_vInact_curTarget getVariable ["robbed",false] || {(life_vInact_curTarget in life_vehicles)}) then {
			_buttons pushBack ["Open Storage", "closeDialog 0; [life_vInact_curTarget] remoteExecCall ([""fnc_getCategories"",""PHXSRV""] call SOCK_fnc_getRemoteDestination);"];
		};
	};
	
} else {
	if !(playerSide isEqualTo independent) then {
		if (player getVariable ["isAdmin", false]) then {
			if !(isNil {life_vInact_curTarget getVariable 'house_owner'}) then {
				_buttons pushBack ["Open Storage", "closeDialog 0; [life_vInact_curTarget] remoteExecCall ([""fnc_getCategories"",""PHXSRV""] call SOCK_fnc_getRemoteDestination);"];
				_buttons pushBack ["House Owner", "[life_vInact_curTarget] spawn life_fnc_copHouseOwner; closeDialog 0;"];
			} else {
				_buttons append ([] call PHX_fnc_getBuildingInteractions);
			};
		} else {
			if (isNil { life_vInact_curTarget getVariable "bType" }) then {
				// Buy House...
				if ((isNil {life_vInact_curTarget getVariable 'house_owner'}) && { playerSide isEqualTo civilian }) exitWith {
					_buttons pushBack ["Buy House", "closeDialog 0; createDialog ""RscBuyHouse"";"];
				};

				// House Owner / Gang Member
				if (life_vInact_curTarget in life_vehicles || { (((life_vInact_curTarget getVariable 'house_owner') select 0) isEqualTo (getPlayerUID player) || (((life_vInact_curTarget getVariable 'house_owner') select 2) && { (((life_vInact_curTarget getVariable 'house_owner') select 0) isEqualTo (player getVariable ["gang_uid", -1])) })) }) exitWith {
					_buttons pushBack ["Rename House", "[life_vInact_curTarget] spawn PHX_fnc_nameHouse; closeDialog 0;"];
					_buttons pushBack ["Print Upkeep Cost", "[format[""This house has an upkeep cost of £%1"", [(getNumber(missionConfigFile >> ""CfgHousing"" >> worldName >> (typeOf life_vInact_curTarget) >> ""rent""))] call life_fnc_numberText], ""red""] spawn PHX_fnc_notify;"];

					if ((getNumber(missionConfigFile >> "CfgHousing" >> worldName >> typeOf (life_vInact_curTarget) >> "isGarage")) isEqualTo 1) then {
						_buttons pushBack ["Open Garage", "[life_vInact_curTarget,""Car""] spawn life_fnc_vehicleGarage; closeDialog 0;"];
						_buttons pushBack ["Store Vehicle", "[life_vInact_curTarget,player,"""",""Car""] spawn life_fnc_storeVehicle; closeDialog 0;"];
					} else {
						_buttons pushBack ["Open Storage", "closeDialog 0; [life_vInact_curTarget] remoteExecCall ([""fnc_getCategories"",""PHXSRV""] call SOCK_fnc_getRemoteDestination);"];
					};

					if (isNull (life_vInact_curTarget getVariable ['lightSource',objNull])) then {
						_buttons pushBack ["Turn Lights On", "[life_vInact_curTarget] call life_fnc_lightHouseAction; closeDialog 0;"];
					} else {
						_buttons pushBack ["Turn Lights Off", "[life_vInact_curTarget] call life_fnc_lightHouseAction; closeDialog 0;"];
					};

					if ("ATM" in ((cursorObject getVariable ["house_upgrades",[]]) select 2)) then {
						_buttons pushBack ["ATM", "closeDialog 0; [] spawn PHX_fnc_atmMenu;"];
					};

					if ("Clothing" in ((cursorObject getVariable ["house_upgrades",[]]) select 2)) then {
						_buttons pushBack ["Clothing Store", "closeDialog 0; ['','','','general_clothing'] spawn LIFE_fnc_clothingMenu;"];
					};

					if ("Garage" in ((cursorObject getVariable ["house_upgrades",[]]) select 2)) then {
						_buttons pushBack ["Garage", "closeDialog 0; [cursorObject,'Car'] spawn life_fnc_vehicleGarage;"];
						_buttons pushBack ["Store Vehicle", "[life_vInact_curTarget,player,"""",""Car""] spawn life_fnc_storeVehicle; closeDialog 0;"];
					};

					_buttons pushBack ["Lockup House", "[life_vInact_curTarget] spawn PHX_fnc_lockHouse; closeDialog 0;"];
					_buttons pushBack ["Upgrades", "closeDialog 0; createDialog 'RscUpgrades';"];
					_buttons pushBack ["Sell House", "[life_vInact_curTarget] spawn PHX_fnc_sellHouse; closeDialog 0;"];
				};

				// Vistor...
				if (life_vInact_curTarget in life_vehicles) then {
					_buttons pushBack ["Open Storage", "closeDialog 0; [life_vInact_curTarget] remoteExecCall ([""fnc_getCategories"",""PHXSRV""] call SOCK_fnc_getRemoteDestination);"];
					if (isNull (life_vInact_curTarget getVariable ['lightSource',objNull])) then {
						_buttons pushBack ["Turn Lights On", "[life_vInact_curTarget] call life_fnc_lightHouseAction; closeDialog 0;"];
					} else {
						_buttons pushBack ["Turn Lights Off", "[life_vInact_curTarget] call life_fnc_lightHouseAction; closeDialog 0;"];
					};
				};

				if (life_vInact_curTarget getVariable ["robbed",false] && !(life_vInact_curTarget in life_vehicles)) then {
					_buttons pushBack ["Open Storage", "closeDialog 0; [life_vInact_curTarget] remoteExecCall ([""fnc_getCategories"",""PHXSRV""] call SOCK_fnc_getRemoteDestination);"];
				};
			};
		};
	};
};

["House Interactions", _buttons]