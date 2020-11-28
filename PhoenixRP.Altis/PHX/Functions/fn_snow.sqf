/**
 * @File: fn_snow.sqf
 * @Author: ALIAS
 * @Modified: Zyn
 * ----------------------------------
 * Description: Creates snow effect
 */

for "_i" from 0 to 1 step 0 do {
	switch true do {
		case !(player isEqualTo vehicle player): {
			_snow = "#particlesource" createVehicleLocal getPosATL player;
			_snow setParticleCircle [0,[0,0,0]];
			_snow setParticleRandom [0,[20,20,9],[0,0,0],0,0.1,[0,0,0,0.1],0,0];
			_snow setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal.p3d",16,12,8,1],"","Billboard",1,7,[0,0,10],[0,0,0],3,1.7,1,1,[0.1],[[1,1,1,1]],[1],0.3,1,"","",player];
			_snow setDropInterval 0.005;
			waitUntil {(player isEqualTo vehicle player)};
			deleteVehicle _snow;	
		};

		case (underwater player): {  
			_snow = "#particlesource" createVehicleLocal getPosATL player;
			_snow setParticleCircle [0,[0,0,0]];
			_snow setParticleRandom [0,[25,25,0],[0,0,0],0,0.1,[0,0,0,0.1],1,1];
			_snow setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal.p3d",16,12,8,1],"","Billboard",1,4,[0,0,15],[0,0,0],3,2,1,0.7,[0.1],[[1,1,1,1]],[1],1,1,"","",player];
			_snow setDropInterval 0.005;
			waitUntil {!(underwater player)};
			deleteVehicle _snow;
		};

		case ([player] call life_fnc_playerInBuilding): {
			private _house = lineIntersectsSurfaces [getPosWorld player,getPosWorld player vectorAdd [0,0,50],player,objNull,true,1,"GEOM","NONE"];
			private _type = ((_house select 0) select 3);
			private _size = sizeOf (typeOf(_type));
			_snow1 = "#particlesource" createVehicleLocal getPosATL _type;
			_snow1 setParticleCircle [_size,[0,0,0]];
			_snow1 setParticleRandom [0,[5,5,0],[0,0,0],0,0,[0,0,0,0],0,0.5];
			_snow1 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal.p3d",16,12,8,1],"","Billboard",1,0.2,[0,0,1],[0,0,0],3,2,1,0,[0.1],[[1,1,1,1]],[1],0,1,"","",_type,0,true];
			_snow1 setDropInterval 0.01;		
			waitUntil {!([player] call life_fnc_playerInBuilding)};
			deleteVehicle _snow1;
		};

		default {
			_snow = "#particlesource" createVehicleLocal getPosATL player;
			_snow setParticleCircle [0,[0,0,0]];
			_snow setParticleRandom [0,[20,20,9],[0,0,0],0,0.1,[0,0,0,0.1],0,0];
			_snow setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal.p3d",16,12,8,1],"","Billboard",1,7,[0,0,10],[0,0,0],3,1.7,1,1,[0.1],[[1,1,1,1]],[1],0.3,1,"","",player];
			_snow setDropInterval 0.005;
			waitUntil {(!(player isEqualTo vehicle player) || {(underwater player)} || {([player] call life_fnc_playerInBuilding)})};
			deleteVehicle _snow;
		};
	};
};