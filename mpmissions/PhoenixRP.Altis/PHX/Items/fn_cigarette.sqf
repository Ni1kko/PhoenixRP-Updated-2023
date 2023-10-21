/*
    File: fn_cigarette.sqf
    Author: Unknown
    Description: Attachs a smoke to the player
*/

private _smoke = "SmokeShell" createVehicle position player;

if (vehicle player isEqualTo player) then {
    _smoke attachTo [player, [0,0,0],"Pelvis"];
} else {
    _smoke attachTo [vehicle player, [-0.6,-1,0]];
};
