/*
    @File: fn_setLegality.sqf
    @Author: Jack "Scarso" Farhall
    @Description: Sets each item's new legality setting...
*/
if !(params [["_items", [], [[]]]]) exitWith {};

if (_items isEqualTo []) exitWith { ["You've not changed the legality of any items!"] remoteExec ["PHX_fnc_notify", remoteExecutedOwner] };

private _changed = "";
private _notChanged = "";

// Update server settings and check if already changed...
{
	_x params [["_item", "", [""]], ["_val", false, [false]]];

	private _illegal = format["legality_%1",_item];

	private _result = [format["SELECT restart FROM serversettings WHERE name = '%1'", _illegal], 2] call DB_fnc_asyncCall;
	if ([_result param [0, 0, [0]], 1] call DB_fnc_bool) then { _notChanged = _notChanged + " " + _item; } else {

		[format ["UPDATE serversettings SET value = '%1', restart = '1' WHERE name='%2'", 
			[_val] call DB_fnc_bool, 
			_illegal
		], 1] call DB_fnc_asyncCall;
		
		if (_item in PHX_IllegalItems) then {
			PHX_IllegalItems deleteAt (PHX_IllegalItems find _item);
		} else {
			PHX_IllegalItems pushBackUnique _item;
		};

		_changed = _changed + " " + _item; 

		private _marker = getArray(missionConfigFile >> "CfgSettings" >> (format["%1_markers",_item]));
		if !(_marker isEqualTo []) then {
			{
				[
					_x, 
					([
						"ColorCIV",
						"ColorEAST"
					] select (_val))
				] call PHXSRV_fnc_changeMarker;
			} forEach _marker;
		};
	};
} forEach _items;

if !(_notChanged isEqualTo "") then {
	[format["The legality of%1 has already been changed once this restart...", _notChanged]] remoteExec ["PHX_fnc_notify", remoteExecutedOwner];
};

if !(_changed isEqualTo "") then {
	[format["The Governor has changed the legality of %1", _changed]] remoteExec ["PHX_fnc_notify", -2];
};

[PHX_IllegalItems] remoteExecCall ["PHX_fnc_setIllegalItems",-2];