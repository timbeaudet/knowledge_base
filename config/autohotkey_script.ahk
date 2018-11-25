; ! = alt
; + = shift
; ^ = ctrl
; # = win


;
; Typing shortcuts
;

::``tb::Turtle Brains
::``ror::Rally of Rockets
::``ice::Internal Combusion Engine

::``ttv::https://www.twitch.tv/timbeaudet
::``twi::https://www.twitter.com/timbeaudet
::``you::https://www.youtube.com/timbeaudet
::``right::→
::``left::←
::``up::↑
::``down::↓


::``dat::
FormatTime, CurrentDateTime,, yyyy-MM-dd
SendInput %CurrentDateTime%
return

::``dr::
FormatTime, CurrentDateTime,, yyyy-MM-dd
SendInput **%CurrentDateTime% Development Report**
return


; win+alt+C
; Fri 05/04/2018 - 08:44 AM
; Activate TC (for chatting)
#!c::
SetTitleMatchMode, 2 ; Match the title anywhere in the search string
WinActivate, - Tc
Send {Tab} ; seems to be that no matter where you are in TC, pressing "tab" will put the cursor in the chat box
return


; ctrl+alt+M
; Resize active window to top-left of center monitor
^!m::
WinGet, active_id, ID, A
WinRestore, ahk_id %active_id%
WinMove, ahk_id %active_id%, , 1915, 1, 765, 641
return

; ctrl+alt+N
; Resize active window to bottom-left of center monitor
^!n::
WinGet, active_id, ID, A
WinRestore, ahk_id %active_id%
WinMove, ahk_id %active_id%, , 1915, 410, 765, 641
return

; ctrl+alt+V
; Resize active window to fill most of center monitor
^!v::
WinGet, active_id, ID, A
WinRestore, ahk_id %active_id%
WinMove, ahk_id %active_id%, , 1987, 1, 1852, 1047
return

; ctrl+alt+b
; Resize active window to fill center monitor with complete stream view
^!b::
WinGet, active_id, ID, A
WinRestore, ahk_id %active_id%
WinMove, ahk_id %active_id%, , 1987, 1, 1415, 932
return

