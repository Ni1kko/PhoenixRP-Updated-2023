/*
	Author: Ni1kko
	Description: Kicks player from the server
*/
private _ownerID = param [0,-1];
private _steamID = param [1,""];

if((_ownerID == -1) AND {count _steamID isNotEqualTo 17})exitWith{false};

if((_ownerID == -1) AND {count _steamID isEqualTo 17})then{
	{
		if(getPlayerUID _x isEqualTo _steamID)exitWith{
			_ownerID = owner _x;
		};
	}forEach playableUnits;
};

if not(_ownerID > 2)exitWith{false};

[
	[],
	{
		if (call(life_adminlevel) > 0)exitWith{systemChat format["This SteamID %1 is banned from the server! Admin bypass...",getPlayerUID player]};
		closeDialog 0;
		(findDisplay 49) closeDisplay 0;
		endMission "PHXBANNED";
	}
]remoteExecCall ["call", _ownerID];

true