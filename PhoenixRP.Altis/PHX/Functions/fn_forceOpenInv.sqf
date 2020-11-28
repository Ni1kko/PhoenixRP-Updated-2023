params [
	["_target", cursorObject, [objNull]],
	["_grave", false, [true]]
];

if (isNull _target || player distance _target > 5 ) exitWith {closeDialog 0;};

if (_grave) then {
	[(format["%1 has accessed your inventory",(player getVariable ["realname", name player])]),"cyan"] remoteExec ["PHX_fnc_notify",_target];
};

player action ["Gear", _target];
