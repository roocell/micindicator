#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;hue_ip="192.168.1.102"
;hue_user = "ze2dqsTNbtu5dF94FevyWtjHbM3Ax9Elrb4-tVTa"

WinHTTP := ComObjCreate("WinHTTP.WinHttpRequest.5.1")
indicatorlight := 3

; toggle all lights
togglelight(light, state, ByRef WinHTTP)
{
  url := "http://192.168.1.102/api/ze2dqsTNbtu5dF94FevyWtjHbM3Ax9Elrb4-tVTa/lights/" . light . "/state"
	WinHTTP.Open("PUT", url)
  if state = Off
		bodytext = {"on" : true, "sat" : 229, "hue" : 21845}  ;green
	else
		bodytext = {"on" : true, "sat" : 229, "hue" : 0} ;red
  ;ToolTip, %url% . %bodytext%
	WinHTTP.Send(bodytext)
}

lightOff(light, ByRef WinHTTP)
{
  url := "http://192.168.1.102/api/ze2dqsTNbtu5dF94FevyWtjHbM3Ax9Elrb4-tVTa/lights/" . light . "/state"
  WinHTTP.Open("PUT", url)
  bodytext = {"on" : false}
  WinHTTP.Send(bodytext)
}

Pause::  ;Pause Break button is my chosen hotkey
  SoundSet, +1, MASTER, mute,11 ;11 was my mic id number use the code below the dotted line to find your mic id. you need to replace all 11's  <---------IMPORTANT
  SoundGet, master_mute, , mute, 11

  ; get Hue bulb info
  ;WinHTTP.Open("GET", "http://192.168.1.102/api/ze2dqsTNbtu5dF94FevyWtjHbM3Ax9Elrb4-tVTa/lights/3")
  ;WinHTTP.Send()
  ;ret := (WinHTTP.StatusText() = "OK" ? WinHTTP.ResponseText() : WinHTTP.StatusText())
  ;ToolTip, %ret%

  togglelight(indicatorlight, master_mute, WinHTTP)

  ToolTip, Mute %master_mute% ;use a tool tip at mouse pointer to show what state mic is after toggle
  SetTimer, RemoveToolTip, 3000
return

^CtrlBreak::
  lightOff(indicatorlight, WinHTTP)
return

RemoveToolTip:
  SetTimer, RemoveToolTip, Off
  ToolTip
return
