#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



;Instant Application Switcher__________________________


;Google Chrome

+`::
IfWinNotExist, ahk_class Chrome_WidgetWin_1
	Run, chrome.exe
if WinActive("ahk_class Chrome_WidgetWin_1")
	Send ^{tab}
else
	WinActivate ahk_class Chrome_WidgetWin_1
Return

;Explorer

^`::
IfWinNotExist, ahk_class CabinentWClass
	Run, explorer.exe
GroupAdd, kexplorers, ahk_class CabinentWClass
if WinActive("ahk_exe explorer.exe")
	GroupActivate, kexplorers, r
else
	WinActivate ahk_class CabinentWClass
Return

