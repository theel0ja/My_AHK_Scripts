#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
Menu, Tray, Icon, shell32.dll, 44 ;this changes the icon into a little STAR. just useful for making it distinct from the others.
#singleinstance force ;so you can only run 1 script at a time and it doens't bother you about it.

;######## THIS IS THE BEST SCRIPT I'VE EVER WRITTEN. #########

;And also one of the simplest. Basically, If you press the "explorer" key (F1) it will instantly:
; 1. Create an explorer window if one is not already running.
; 2. Open the LAST ACTIVE explorer window if Explorer is not already active
; 3. If you keep pressing the key, it will cycle through Explorer windows in the order they were last activated

;Programs like chrome are a little different. It will open Chrome if it's not already open,
;but when you keep pressing the button, it hits "CTRL TAB" to advance you forwards through your tabs.

;This is all significantly superior to switching between applications by CLICKING on them in the taskbar,
;and also very superior to using WIN 1, WIN 2, WIN 3 etc to switch between applications.

;You will want to tailor this script to launch your own most commonly used applications.
;You can use Window Spy (it comes with autohotkey) to figure out the ahk_exe and ahk_class of your applications.
;There is a video explaining all of this:
; https://www.youtube.com/watch?v=OqyQABySV8k

;If you have a macro keyboard, I reccomend that you add ^ to each of theese shortcuts, and assign you macro
;keys to CTRL F1, CTRL F2 and so on. That way, your Function keys are freed, to be used for other things.




#IfWinActive 

;F1 holds the "BACK" script.
`::
if WinActive("ahk_class MozillaWindowClass")
	Send ^+{tab} ;CTRL SHIFT TAB is the shortcut for "go to previous tab"
Return


CapsLock::
switchToFirefox(){
    sendinput, {SC0E8} ;scan code of an unassigned key. Do I NEED this?
    IfWinNotExist, ahk_class MozillaWindowClass
        Run, firefox.exe
        ;Sleep 3000
    if WinActive("ahk_exe firefox.exe")
        Send ^{tab}
    else
    {
        ;WinRestore ahk_exe firefox.exe
        WinActivate ahk_exe firefox.exe
        ;sometimes winactivate is not enough. the window is brought to the foreground, but not put into FOCUS.
        ;the below code should fix that.
        WinGet, hWnd, ID, ahk_class MozillaWindowClass
        DllCall("SetForegroundWindow", UInt, hWnd) 
    }
}

Return
