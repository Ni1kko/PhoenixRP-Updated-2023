/*
* @File: fn_isSafeZone.sqf
* @Author: ArrogantBread
* @Desc: Checks if the player is in a certain area
*
* Copyright (C) Nathan "ArrogantBread" Wright  - All Rights Reserved - PhoenixRP
* Unauthorized copying of this file, via any medium is strictly prohibited
* without the express permission of Nathan "ArrogantBread" Wright
*/

[
  "Kavala_Greenzone_Safezone",
  "Athira_Greenzone_Safezone",
  "Pyrgos_Greenzone_Safezone",
  "Athira_Night_Club"
] findIf {player inArea _x} > -1