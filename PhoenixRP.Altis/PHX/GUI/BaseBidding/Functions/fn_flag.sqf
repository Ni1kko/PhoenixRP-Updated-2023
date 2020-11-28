params [
	["_base", "", [""]]	
];

[_base] remoteExecCall (["fnc_getBid", "PHXSRV"] call SOCK_fnc_getRemoteDestination);