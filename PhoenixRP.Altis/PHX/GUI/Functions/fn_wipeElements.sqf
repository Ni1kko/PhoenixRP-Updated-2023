/*
	@File: fn_wipeElements.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Deletes all elements...
*/

{
	if !(_x isEqualType "") then {
		if (_x isEqualType []) then {
			for "_i" from 0 to (count (_x) - 1) do {
				if !((_x select _i) isEqualType "") then {
					ctrlDelete (_x select _i);
				};
			};
		} else {
			ctrlDelete _x;
		};
	};
} forEach PHX_createdElements;

PHX_createdElements = []; // Wipe it...