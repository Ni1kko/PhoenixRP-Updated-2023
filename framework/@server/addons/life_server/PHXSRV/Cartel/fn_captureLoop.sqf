/*
	@File: fn_captureLoop.sqf
	@Author: Jack "Scarso" Farhall
	@Credit: Sig 
	@Description: Setup each cartel point...
*/
#include "\life_server\script_macros.hpp"
#define CFG missionConfigFile >> "CfgCartel" >> worldName >> "Cartels"
#define PHX(func) PHX_fnc_##func

{
	private _thread = _x spawn {
		if !(params [["_obj", objNull, [objNull]]]) exitWith {};

		private _zone = _obj getVariable ["zCFG", ""];

		private _displayName = getText (CFG >> _zone >> "displayName");
		private _sleep = (getNumber (CFG >> _zone >> "capTime")) / 100;

		for "_i" from 0 to 1 step 0 do {
			sleep _sleep;

			private _zoneOwner = [_obj, true] call PHX_fnc_isZoneOwner;
			private _captured = !(_zoneOwner in [-1, -2]) || { _zoneOwner in [west, east] };
			private _objMarker = format["cartel_%1", _zone];
			private _capZone = format["%1_CAP", _objMarker];

			private _dominatingGroup = (
				[
					_capZone,
					independent,
					false,
					"!isNil {(group _x) getVariable 'gang_name'} || {(side _x) in [west, east]}"
				] call PHX(unitsInZone) apply {group _x}
			) param [0, grpNull];

			if (!isNull _dominatingGroup && {
				count ([
					_capZone,
					_dominatingGroup,
					false,
					"(!isNil {(group _x) getVariable 'gang_name'} || (side _x) in [west, east]) && {!(side _x isEqualTo independent)}"
				] call PHX(unitsInZone)) isEqualTo 0
				}) then {

				private _isZoneOwner = [_obj, false, _dominatingGroup] call PHX(isZoneOwner);
				private _zoneProgress = _obj getVariable ["zProgress", 0];
				private _contestedFormat = format ["%1 | Contested", _displayName];

				switch true do {
					case ((!_captured || {_isZoneOwner}) && {_zoneProgress >= 1}): {
						if !(_isZoneOwner) then {
							private _gID = switch (side _dominatingGroup) do {
								case west : { west };
								case east : { east };
								case civilian : { (_dominatingGroup getVariable ["gang_id", -1]) };
							};

							_obj setVariable ["zOwner", _gID, true];
							_obj setVariable ["zOwnerName", switch (side _dominatingGroup) do {case west: {"The APC"}; case east: {"HAVOC"}; default {_dominatingGroup getVariable ["gang_name", "Unknown Group"]};}, true];

							[3, format [
								"<t color='#ff0000' size='1.4px'>%1</t><br/><t color='#ffffff' size='1px'>%2 have taken control over the %1!</t>",
								_displayName,
								switch (side _dominatingGroup) do {case west: {"The APC"}; case east: {"HAVOC"}; default {_dominatingGroup getVariable ['gang_name', "An unknown group"]}}
							]] remoteExecCall ["life_fnc_broadcast", RCLIENT];

							private _captors = [_capZone, _dominatingGroup, true] call PHX(unitsInZone);
							[2, format ["Your group has succesfully taken over the %1!", _displayName]] remoteExecCall ["life_fnc_broadcast", _captors];
							["Prof_Capturing", 3, 50] remoteExecCall ["PHX_fnc_increaseProfession", _captors];
							[500, format["Capturing %1", _displayName]] remoteExec ["PHX_fnc_handleXP", _captors];

							// Insert into database
							if !((_dominatingGroup getVariable ["gang_name", "Unknown Group"]) isEqualTo "Unknown Group") then {
								[
									_dominatingGroup getVariable ["gang_id", -1],
									_zone
								] remoteExecCall (["fnc_insertCapture", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
							};
						};

						// -- Update the marker
						private _markerFormat = format [
							"%1 | %2",
							_displayName,
							switch (side _dominatingGroup) do {case west: {"APC"}; case east: {"HAVOC"}; default {_dominatingGroup getVariable ['gang_name', "Unknown Group"]}}
						];

						if !(_markerFormat isEqualTo (markerText _objMarker)) then {
							_objMarker setMarkerText _markerFormat;
						};

						// -- Cap the progress at 1
						if !(_zoneProgress isEqualTo 1) then {
							_obj setVariable ["zProgress", 1, true];
						};
					};

					case (_captured && {_zoneProgress <= 0.009}): {
						_obj setVariable ["zOwner", nil, true];
						_obj setVariable ["zProgress", 0.01, true];

						if !((markerText _objMarker) isEqualTo _contestedFormat) then {
							_objMarker setMarkerText _contestedFormat
						};
					};

					case ((_captured && {!_isZoneOwner}) && {_zoneProgress > 0}): {
						_obj setVariable ["zProgress", _zoneProgress - 0.01, true];

						if !(markerText _objMarker isEqualTo _contestedFormat) then {
							_objMarker setMarkerText _contestedFormat
						};
					};

					default {
						_obj setVariable ["zProgress", _zoneProgress + 0.01, true];

						if !(markerText _objMarker isEqualTo _contestedFormat) then {
							_objMarker setMarkerText _contestedFormat
						};
					};
				};
			} else {
				if (isNull _dominatingGroup) then {
					private _text = [_displayName, format ["%1 | %2", _displayName, _obj getVariable ["zOwnerName", "Unknown Group"]]] select _captured;
					if !((markerText _objMarker) isEqualTo _text) then {
						_objMarker setMarkerText _text
					};
				};
			};
		};
	};

	PHX_CartelLoops pushBack _thread;
} forEach PHX_capZones;
