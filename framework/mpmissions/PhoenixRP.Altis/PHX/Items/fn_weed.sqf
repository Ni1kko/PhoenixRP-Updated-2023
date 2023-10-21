/*
    File: fn_weed.sqf
    Author: Unknown
    Description: Attaches a smoke and gives the player an effect
*/

//--- Enable the effects
"chromAberration" ppEffectEnable true;
"radialBlur" ppEffectEnable true;
enableCamShake true;

//--- Create the smoke
private _smoke = "SmokeShell" createVehicle position player;
if (vehicle player isEqualTo player) then {
    _smoke attachTo [player, [0,0,0],"Pelvis"];
} else {
    _smoke attachTo [vehicle player, [-0.6,-1,0]];
};

player forceWalk true;
player setCustomAimCoef 100;
private _health = "";

private _time = 60;
if ("pettyThief" in PHX_Perks) then { _time = 120; };

for "_i" from 0 to _time do
{
    "chromAberration" ppEffectAdjust [random 0.25,random 0.25,true];
    "chromAberration" ppEffectCommit 1;
    "radialBlur" ppEffectAdjust  [random 0.02,random 0.02,0.15,0.15];
    "radialBlur" ppEffectCommit 1;
    addcamShake[random 3, 1, random 3];

    if (damage player > 0) then {
        _health = damage player;
        _health = _health - 0.02;
        player setDamage (_health);
    };
    sleep 1;
};

//--- Stop effects
"chromAberration" ppEffectAdjust [0,0,true];
"chromAberration" ppEffectCommit 5;
"radialBlur" ppEffectAdjust  [0,0,0,0];
"radialBlur" ppEffectCommit 5;

//--- Deactivate ppEffects
"chromAberration" ppEffectEnable false;
"radialBlur" ppEffectEnable false;
resetCamShake;
player setCustomAimCoef 1;
player forceWalk false;
