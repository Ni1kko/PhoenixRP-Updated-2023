/*
	@File: fn_claimMail.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Claims mail...
*/
#include "..\..\..\..\script_macros.hpp"

if !(isNil "isClaimingMail") exitWith { NOTIFY("You're already processing a claim request...", "red") };
isClaimingMail = true;

private _display = findDisplay 35000;
if (isNull _display) exitWith {};

private _itemList = _display displayCtrl 35003;
private _rowIdx = lnbCurSelRow _itemList;

if (_rowIdx < 0) exitWith {};

private _mailID = _itemList lnbValue [_rowIdx, 0];
private _mailType = _itemList lnbText [_rowIdx, 1];

switch (_mailType) do {
	case "Money": {
		private _money = _itemList lnbValue [_rowIdx, 2];

		if !(_money > 0) exitWith { NOTIFY("An issue occured while claiming your money", "red") };

		[_money, 0, 0, "Claimed From Mailbox"] call PHX(handleMoney);
		[format["You've claimed £%1 from your mail", [_money] call LIFE(numberText)]] spawn PHX(notify);
		[player, format ["%1 (%2) claimed from mail %3. Bank Balance: %4 On Hand Balance: %5",profileName,getPlayerUID player,[_money] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
	};

	case "Experiance": {
		private _xp = _itemList lnbValue [_rowIdx, 2];

		if !(_xp > 0) exitWith { NOTIFY("An issue occured while claiming your XP", "red") };

		[_xp, "From Mail"] spawn PHX(handleXP);
		[format["You've claimed %1 XP from your mail", [_xp] call LIFE(numberText)]] spawn PHX(notify);
	};

	case "Virtual Item": {
		private _item = _itemList lnbData [_rowIdx, 2];
		private _amount = _itemList lnbValue [_rowIdx, 1];

		if !(isClass(missionConfigFile >> "CfgItems" >> _item)) exitWith { NOTIFY("An issue occured while claiming your item(s)", "red") };
		if !(_amount > 0) exitWith { NOTIFY("An issue occured while claiming your item(s)", "red") };

		if !([true, _item, _amount] call life_fnc_handleInv) exitWith {
			NOTIFY("You don't have enough space for these items", "red");
		};

		[format["You've claimed %1 x %2 from your mail", ITEM_NAME(_item), [_amount] call LIFE(numberText)]] spawn PHX(notify);
	};

	case "Physical Item": {
		private _item = _itemList lnbData [_rowIdx, 2];
		private _itemInfo = [_item] call life_fnc_fetchCfgDetails;

		if ((_itemInfo select 1) isEqualTo "") exitWith { NOTIFY("An issue occured while claiming your item(s)", "red") };

		private _amount = _itemList lnbValue [_rowIdx, 1];

		if !(_amount > 0) exitWith { NOTIFY("An issue occured while claiming your item(s)", "red") };

		private _notAdded = 0;

		for "_i" from 1 to _amount do {
			if !([_item, false] call PHX(handleGear)) then {
				_notAdded = _notAdded + 1;
			};
		};

		if (_notAdded isEqualTo 0) then {
			[format["You've claimed %1 x %2 from your mail", _itemInfo select 1, [_amount] call LIFE(numberText)]] spawn PHX(notify);

			_itemList lnbDeleteRow _rowIdx;
		} else {
			[format["You've claimed %1 x %2 from your mail but left %3 that you couldn't carry", 
				_itemInfo select 1, 
				[_amount - _notAdded] call LIFE(numberText), 
				[_notAdded] call LIFE(numberText)]
			] spawn PHX(notify);

			_amount = _notAdded;

			_itemList lnbSetText [[_rowIdx, 2], format["%1 x %2", _itemInfo select 1, [_amount] call LIFE(numberText)]];
			_itemList lnbSetValue [[_rowIdx, 1], _amount];
		};

		[_mailID, _notAdded] remoteExecCall (["fnc_updateMail", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
	};

	case "Vehicle": {
		private _vehicle = _itemList lnbData [_rowIdx, 2];
		private _colour = _itemList lnbValue [_rowIdx, 1];

		if !(isClass (missionConfigFile >> "LifeCfgVehicles" >> _vehicle)) exitWith { NOTIFY("An issue occured while claiming your vehicle", "red") };
		if (_colour < 0) exitWith { NOTIFY("An issue occured while claiming your item(s)", "red") };

		private _vehicleInfo = [_vehicle] call life_fnc_fetchVehInfo;

		[(getPlayerUID player), civilian, _vehicle, _colour, 0] remoteExecCall (["fnc_vehicleCreate","TON"] call SOCK_fnc_getRemoteDestination);
		[format["You've claimed your %1 from your mail", (_vehicleInfo select 3)]] spawn PHX(notify);
	};
};

if !(_mailType isEqualTo "Physical Item") then {
	_itemList lnbDeleteRow _rowIdx;
	[_mailID, 0] remoteExecCall (["fnc_updateMail", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
};

isClaimingMail = nil;