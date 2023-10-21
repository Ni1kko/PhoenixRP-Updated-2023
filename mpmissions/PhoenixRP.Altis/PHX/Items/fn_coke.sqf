/*
    File: fn_coke.sqf
    Author: Conner Merlin
    Description: Creates an effect
*/

enableCamShake true;

private _time = 60;
if ("pettyThief" in PHX_Perks) then { _time = 120; };

for "_i" from 0 to _time do
{
    addcamShake[random 10, 1, random 10];
    player setAnimSpeedCoef 1.3;
    sleep 1;
};

resetCamShake;
player setAnimSpeedCoef 1;
