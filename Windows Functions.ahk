#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


;Make a Program Always on top

; Always on Top
^SPACE:: Winset, Alwaysontop, , A ; ctrl + space
Return

;WinKey+Shift automatically opens selected file in Notepad++
#+`::
Send {RButton}
Send {Down}
Send {Down}
Send {Down}
Send {Down}
Send {Down}
Send {Down}
Send {Down}
Send {Down}
Send {Enter}
Return