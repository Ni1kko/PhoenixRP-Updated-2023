/*
*   @File: fn_breathalyse.sqf
*   @Author: Zyn
*   @Editor/True Author: Jack "Scarso" Farhall
*   @Description: Remote execued on target to get how drunk they are...
*/

[
	["Person is not over the legal limit!", "green"] remoteExec ["PHX_fnc_notify", remoteExecutedOwner],
	["Person is over the legal limit!", "red"] remoteExec ["PHX_fnc_notify", remoteExecutedOwner]
] select (life_drunk > 20);