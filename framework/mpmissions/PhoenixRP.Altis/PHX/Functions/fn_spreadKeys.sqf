/*
    @File: fn_spreadKeys.sqf
    @Author: Zyn
    @Description: Gives keys to everyone in the vehicle
*/

if ((lbCursel 23402) isEqualTo -1) exitWith {["You must select something!","red"] call PHX_fnc_notify};
if (vehicle player isEqualTo player) exitWith {["You must be in a vehicle to do this!","red"] call PHX_fnc_notify};

private _index = parseNumber (lbData[23402,lbCurSel 23402]);
private _vehicle = (life_vehicles select _index);

{
	if !(_x isEqualTo player) then {
		[_vehicle,_x,player] remoteExecCall ["LIFE_fnc_clientGetKey",_x];
	};
} forEach (crew (vehicle player));