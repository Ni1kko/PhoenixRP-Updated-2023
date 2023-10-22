/*
	Author: Ni1kko
	Description: init ban system
*/

addMissionEventHandler ["PlayerConnected", {
    params [
        ["_directPlayID",-100,[0]],          	// Number - is the unique DirectPlay ID. Quite useless as the number is too big for in-built string representation and gets rounded. It is also the same id used for user placed markers.
        ["_steamID","",[""]],               	// String - is getPlayerUID of the joining player. In Arma 3 it is also the same as Steam ID.
        ["_name","",[""]],                      // String - is profileName of the joining player.
        ["_didJIP",false,[false]],              // Boolean - is a flag that indicates whether or not the player joined after the mission has started (Joined In Progress). true when the player is JIP, otherwise false. (since Arma 3 v1.49)
        ["_ownerID",-100,[0]]                   // Number - is owner id of the joining player. Can be used for kick or ban purposes or just for publicVariableClient. (since Arma 3 v1.49) 
    ];

    if([_steamID,_ownerID] call PHXSVR_fnc_checkBanned) then{
        diag_log format["%1 has been kicked for being banned!",_name];
    };
}];

true