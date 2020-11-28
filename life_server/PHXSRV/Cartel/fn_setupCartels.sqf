/*
	@File: fn_setupCartels.sqf
	@Author: Jack "Scarso" Farhall
	@Credit: Sig 
	@Description: Setup each cartel point...
*/
#define CFG missionConfigFile >> "CfgCartel" >> worldName

private _capZones = [];

{
	_x params [
		["_configName", "", [""]],
		["_displayName", "", [""]],
		["_position", [], [[]]],
		["_kosRadius", -1, [0]],
		["_capRadius", -1, [0]],
		["_showKOS", 0, [0]]
	];

	private _zonesToCreate = [[_capRadius, "ColorYellow", "CAP", ""]];
	if (_showKOS isEqualTo 1) then { _zonesToCreate pushback [_kosRadius, "ColorRed", "KOS", "Redzone_"] };

	private _zoneN = format ["cartel_%1", _configName];

	{
		_x params ["_radius", "_color", "_type", "_pre"];
		private _zone = createMarker [format ["%1%2_%3", _pre, _zoneN, _type], _position];
		_zone setMarkerShape "Ellipse";
		_zone setMarkerColor _color;
		_zone setMarkerSize [_radius, _radius];
		_zone setMarkerBrush "FDIAGONAL";
	} forEach _zonesToCreate;

	private _displayMarker = createMarker [_zoneN, _position];
	_displayMarker setMarkerType "mil_triangle";
	_displayMarker setMarkerColor "ColorRed";
	_displayMarker setMarkerText _displayName;

	private _obj = createVehicle ["Land_HelipadEmpty_F", _position, [], 0, "NONE"];
	_obj setVariable ["zCFG", _configName, true];

	_capZones pushBackUnique _obj;
} forEach (("getNumber (_x >> 'active') isEqualTo 1" configClasses (CFG >> "Cartels")) apply {
  [
	configName _x,
    getText (_x >> "displayName"),
    getArray (_x >> "position"),
    getNumber (_x >> "kosRadius"),
    getNumber (_x >> "capRadius"),
	getNumber (_x >> "showKosMarker")
  ]
});

missionNameSpace setVariable ["PHX_capZones", _capZones, true];

if !(PHX_capZones isEqualTo []) then {
	[] call PHXSRV_fnc_captureLoop;
	[] spawn PHXSRV_fnc_cartelCash;
};