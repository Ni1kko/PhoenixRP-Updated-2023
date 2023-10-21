/*
    File: fn_heroin.sqf
    Author: Conner Merlin
    Description: Creates an effect
*/

"chromAberration" ppEffectEnable true;
"radialBlur" ppEffectEnable true;
enableCamShake true;

private _time = 60;
if ("pettyThief" in PHX_Perks) then { _time = 120; };

for "_i" from 0 to _time do
{
    "chromAberration" ppEffectAdjust [random 1,random 1,true];
    "chromAberration" ppEffectCommit 3;
    "radialBlur" ppEffectAdjust  [random 0.10,random 0.08,0.22,0.15];
    "radialBlur" ppEffectCommit 3;
    addcamShake[random 50, 1, random 15];
    sleep 1;
};

"chromAberration" ppEffectAdjust [0,0,true];
"chromAberration" ppEffectCommit 5;
"radialBlur" ppEffectAdjust  [0,0,0,0];
"radialBlur" ppEffectCommit 5;

"chromAberration" ppEffectEnable false;
"radialBlur" ppEffectEnable false;
resetCamShake;
