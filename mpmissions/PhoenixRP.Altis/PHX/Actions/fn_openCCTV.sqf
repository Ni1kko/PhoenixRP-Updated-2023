/*
	@File: fn_openCCTV.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Meh...
*/
#include "..\..\script_macros.hpp"
#define CFG missionConfigFile >> "CfgCameras" >> worldName
if !(params [
    ["_screen", objNull, [objNull]],
    "","",
    ["_params", [], [[]]]
]) exitWith {};

_params	params [["_site", "", [""]],["_camIndex", -1, [0]]];

if !(isNil "cctv_camera") exitWith {
	cctv_camera cameraEffect ["terminate", "back"];
    camDestroy cctv_camera;
    _screen setObjectTexture [0,"data\textures\Map\phoenixrp.paa"];
    cctv_camera = nil;
};

if !(isPiPEnabled) exitWith { ["This system requires PiP to be enabled in your video settings..."] spawn PHX(notify) };
if !(isClass (CFG >> _site)) exitWith {};

private _cfg = CFG >> _site;
private _cameras = (getArray(_cfg >> "cameras"));
if (_camIndex < 0 || { _camIndex >= (count _cameras) }) exitWith {};

private _cam = _cameras select _camIndex;

_cam params ["_name", "_pos", "_tar", "_con"];

cctv_camera = "camera" camCreate [0,0,0];
"rendertarget1" setPiPEffect [0];
cctv_camera camSetFov 1;
cctv_camera camCommit 0;
cctv_camera camSetFocus [9999,0];
cctv_camera cameraEffect ["INTERNAL", "BACK", "rendertarget1"];
_screen setObjectTexture [0,"#(argb,512,512,1)r2t(rendertarget1,100)"];

cctv_camera camSetPos _pos;
cctv_camera camSetTarget _tar;
cctv_camera camCommit 0;

_screen spawn {
	waitUntil {isNil "cctv_camera" || {((position player) distance (position _this)) > 30}};
	if !(isNil "cctv_camera") exitWith {
		cctv_camera cameraEffect ["terminate", "back"];
		camDestroy cctv_camera;
		_this setObjectTexture [0,"data\textures\Map\phoenixrp.paa"];
		cctv_camera = nil;
	};
};