/*
	@File: fn_changePage.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Changes the gang menu page
	@Usage: 
		- [CHANGE_BY] call PHX_fnc_changePage;
	@Returns:
		- None
*/
#include "..\..\..\script_macros.hpp" 
params [
	["_page", 0, [0]],
	["_display", 8000, [0]]
];

private _pages = switch (_display) do {
	case 2800: {
		[
			// Page one
			[
				2802, 2803, 2804, 2805, 2806, 2810
			],
			// Page two
			[
				2802, 2807, 2808, 2809
			]
		];
	};
};

if (isNull (findDisplay _display)) exitWith {};
_display = findDisplay _display;

PHX_curPage = PHX_curPage + _page;

// Stop the values going below what we expect or above...
if(PHX_curPage < 0) then {
	PHX_curPage = 0;
} else {
	if(PHX_curPage > (count(_pages)-1)) then {
		PHX_curPage = (count(_pages)-1);
	};
};

// Hide all
for "_i" from 0 to ((count _pages) - 1) do {
	private _curPage = _pages select _i;
	for "_i" from 0 to ((count _curPage) - 1) do {
		(_display displayCtrl (_curPage select _i)) ctrlShow false;
	};
};

// Show the stuff we want baby!
for "_i" from 0 to ((count (_pages select PHX_curPage)) - 1) do {
	(_display displayCtrl ((_pages select PHX_curPage) select _i)) ctrlShow true;
};