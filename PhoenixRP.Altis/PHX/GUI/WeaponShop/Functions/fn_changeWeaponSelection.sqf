/*
	@File: fn_changeWeaponSelection.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Yes
*/
#include "..\..\..\..\script_macros.hpp"
if !(params [["_sel", "", [""]]]) exitWith {};
if (isNil "WSTORECFG") exitWith {}; // Wtf?

private _display = findDisplay 7400;
if (isNull _display) exitWith {}; // Alright...

private _itemArr = getArray(WSTORECFG >> _sel);

disableSerialization;

ctrlSetText[7402, ""]; // Wipe search box...

private _itemUI = (_display displayCtrl 7403);
tvClear _itemUI;

{
	_x params ["_classname", "_name", "_bPrice", "_sPrice", "_condition"];
	
	if (call compile _condition) then {
		_itemInfo = [_classname] call life_fnc_fetchCfgDetails;
		_itemInfo params ["", "_iName", "_iPic"];

		if (isCID(player) || { isHSS(player) }) then { _bPrice = round(_bPrice * 0.1) };
		if (HAS_GANG_PERK("Gang", (grpPlayer))) then { _bPrice = round(_bPrice * 0.9) };

		_indx = _itemUI tvAdd [[], format["%1 [£%2]", ([_name, _iName] select (_name isEqualTo "")), [_bPrice] call LIFE(numberText)]];
		
		_itemUI tvSetPicture [[_indx], _iPic];
		_itemUI tvSetData [[_indx], _classname];
		_itemUI tvSetValue [[_indx], _bPrice];

		_compatibleItems = [_classname, true] call PHX(getCompatibleItems);

		{
			_x params ["_type", "_title"];

			_accArr = ((getArray(WSTORECFG >> _type)) select { (toLower (_x select 0)) in _compatibleItems });

			if !(_accArr isEqualTo []) then {
				_accIndex = _itemUI tvAdd [[_indx], _title];

				{
					_x params ["_classname", "_name", "_bPrice", "_sPrice", "_condition"];

					if (call compile _condition) then {
						_itemInfo = [_classname] call life_fnc_fetchCfgDetails;
						_itemInfo params ["", "_iName", "_iPic"];

						if (isCID(player) || { isHSS(player) }) then { _bPrice = round(_bPrice * 0.1) };
						if (HAS_GANG_PERK("Gang", (grpPlayer))) then { _bPrice = round(_bPrice * 0.9) };

						_acc = _itemUI tvAdd [[_indx, _accIndex], format["%1 [£%2]", ([_name, _iName] select (_name isEqualTo "")), [_bPrice] call LIFE(numberText)]];

						_itemUI tvSetPicture [[_indx, _accIndex, _acc], _iPic];
						_itemUI tvSetData [[_indx, _accIndex, _acc], _classname];
						_itemUI tvSetValue [[_indx, _accIndex, _acc], _bPrice];
					};
				} forEach _accArr;
			};
		} forEach [["accs", "Attachments"], ["mags", "Magazines"]];
	};
} forEach _itemArr;