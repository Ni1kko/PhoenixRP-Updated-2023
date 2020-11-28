/*
	@File: fn_calSellPrice.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Calculates the "true" sell price of a virtual item
*/
#include "..\..\script_macros.hpp"
if !(params [
	["_buyPrice", -1, [0]],
	["_sellPrice", -1, [0]],
	["_isIllegal", false, [true]],
	["_selling", false, [true]],
	["_amount", 1, [0]]
]) exitWith { -1 };

if (_amount < 1) exitWith { systemChat "Sell Value Calculation Failed"; _sellPrice };

#define CFG missionConfigFile >> "CfgCartel" >> "Altis" >> "Cartels"

if (life_shop_type in ["drug_dealer", "drug_dealer_dorida","drug_dealer_athira"]) then {
    {
        _obj = PHX_capZones select _forEachIndex;

        if !(([_obj, true] call PHX(isZoneOwner)) in [-1, -2]) then {
            if ([_obj] call PHX(isZoneOwner)) then {
                _sellPrice = _sellPrice * 1.1;
            } else {
                _sellPrice = _sellPrice * 0.9;

				if (_selling) then {
					private _gangPrice = _sellPrice * 0.1;
					private _owner = [([_obj, true] call PHX(isZoneOwner))] call PHX_fnc_groupByID;

					// -- Pay the money, log it and send an update to the server
					_owner setVariable ["gang_bank", (round ((_owner getVariable ["gang_bank", 0]) + _gangPrice)), true];
					[player, format ["%1 (%2) recieved %3 in drug money for owning a drug cartel",
						_owner getVariable ["gang_name", "Unknown Group"],
						_owner,
						[_gangPrice] call life_fnc_numberText
					], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
					[1,_owner] remoteExecCall (["fnc_updateGang","TON"] call SOCK_fnc_getRemoteDestination);
				};
            };
        };
    } forEach (("true" configClasses (CFG)) select {getText(_x >> "type") isEqualTo "drug"});
};

if (_isIllegal) then {
	// Increase sell price by 5% for illegal items...
    if (HAS_PERK("shadyTrader")) then {
		_sellPrice = _sellPrice * 1.05;
	};
} else {
	// Increase sell price by 10% for legal items...
    if (HAS_PERK("expertTrader")) then {
		_sellPrice = _sellPrice * 1.1;
	};
	
	// Legal Items are taxed...
	_sellPrice = round (_sellPrice * (1 - (PHX_TaxRate / 100)));
};

if (HAS_PERK("sweetTalker")) then { _sellPrice = _sellPrice * 1.1 }; // Increase sell price by 10%...

if IS_GOAL then { _sellPrice = _sellPrice * (LIFE_SETTINGS(getNumber,"donation_goal_sellprice_multiplier")) };

private _group = grpPlayer;

// Group Tax
if !(isNil {(grpPlayer) getVariable "gang_name"}) then {
    if (_isIllegal) then {
        if (HAS_GANG_PERK("Mafia", (_group))) then {
            _sellPrice = round(_sellPrice * 1.15);
        };
    } else {
        if (HAS_GANG_PERK("Company", (_group))) then {
            _sellPrice = round(_sellPrice * 1.20);
        };
    };

    if !([player, "taxExempt"] call PHX(canDo)) then {
        private _gangFundPrice = _sellPrice;

        _sellPrice = round(_sellPrice * (1 - ((_group getVariable ["gang_tax", 0]) / 100)));

		if (_selling) then {
			_gangFundPrice = _gangFundPrice - _sellPrice;

			_group setVariable ["gang_bank", (round ((_group getVariable ["gang_bank", 0]) + (_gangFundPrice * _amount))), true];
			[1,_group] remoteExecCall (["fnc_updateGang","TON"] call SOCK_fnc_getRemoteDestination);
		};
    };
};

if ((_sellPrice > _buyPrice) && { !(_buyPrice isEqualTo -1) }) then {
  _sellPrice = _buyPrice - 10;
};

_sellPrice