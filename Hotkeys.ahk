; *********************** Change icon ***************************************
#SingleInstance Force ; Force single instance
#Persistent ; Make it persistent
Menu, Tray, Icon, Shell32.dll, 25, 1 ; Change tray icon
return

; *********************** Configuration *************************************
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
setTitleMatchMode, 2 ; set title match mode to "contains"

; *********************** AHK Shortcuts *************************************

; Reload script
#+r::Reload ; win + shift + r

; Edit script
#+e::Edit ; win + shift + e

; *********************** Program Shortcuts *********************************

;Launch windows terminal
#t::ActivateOrOpen("Windows Terminal", "wt") ; win + t

;Launch windows terminal with adl
#a::Run wt adl ; win + a
Return

;Launch brave browser
#b::ActivateOrOpen("- Brave", "C:\Users\Ivica\AppData\Local\BraveSoftware\Brave-Browser\Application\brave.exe") ; win + b

; Launch bitwarden
#+b::ActivateOrOpen("Bitwarden", "C:\Program Files\Bitwarden\Bitwarden.exe")

; Launch msi afterburner
#g::ActivateOrOpen("MSI Afterburner", "C:\Program Files (x86)\MSI Afterburner\MSIAfterburner.exe")

; Launch mega sync
#^m::ActivateOrOpen("MEGAsync", "C:\ProgramData\MEGAsync\MEGAsync.exe")

;Launch vscode
#v::ActivateOrOpen("- Visual Studio Code", "C:\Program Files\Microsoft VS Code\Code.exe") ; win + v

;Launch spofity
#+m::ActivateOrOpen("SpotifyMainWindow", "C:\Users\Ivica\AppData\Roaming\Spotify\Spotify.exe") ; win + m

; *********************** Folder Shortcuts **********************************

; Open Downloads folder
#+d::Run "C:\Users\Ivica\Downloads" ; ctrl + shift + d
return

;Open LightNovels folder
#+l::Run "C:\Users\Ivica\Lightnovels" ; ctrl + shift + l
return

; ********************** Cool Functionality ********************************

; Press middle mouse button to move up a folder in Explorer
#IfWinActive, ahk_class CabinetWClass
~MButton::Send !{Up} 
#IfWinActive
return
 
; Empty trash
#Del::FileRecycleEmpty ; win + del
return

; Always on Top
#SPACE:: Winset, Alwaysontop, , A ; ctrl + space
Return

; Close a window
#+q:: ; win + shift + q
WinGetTitle, Title, A
PostMessage, 0x112, 0xF060,,, %Title%
return

; ******************** Media control **************************************

; mousewheel up volume up
#WheelUp::SoundSet, +2 ; win + wheel down

; mouse wheel down volume down
#WheelDown::SoundSet, -2 ; win + wheel up

; pause play media with middle mouse button
#MButton::Media_Play_Pause ; win + middle mouse button

; Media back with back button on mouse
#XButton1::Media_Prev ; win + mouse back button

; media next with next button on mouse button
#XButton2::Media_Next ; win + mouse next button

; ********************* Ryzenadj profile scripts ***************************

; Run my ryzenadj scripts from desktop
; Ryzenadj fluff profile
#F1::Run C:\Users\Ivica\Desktop\Fluff mode.lnk ; win + F1
return
; Ryzenadj normal profile
#F2::Run C:\Users\Ivica\Desktop\Normal mode.lnk ; win + F2
return
; Ryzenadj light gaming profile
#F3::Run C:\Users\Ivica\Desktop\Light gaming.lnk ; win + F3
return
; Ryzenadj heavy gaming profile
#F4::Run C:\Users\Ivica\Desktop\Heavy gaming.lnk ; win + F4
return
; Ryzenadj heavy programs profile
#F5::Run C:\Users\Ivica\Desktop\Heavy programs.lnk ; win + F5
return
; Ryzenadj heavy gaming pro profile
#F6::Run C:\Users\Ivica\Desktop\Heavy gaming pro.lnk ; win + F6
return

; *********************** Functions ****************************************
ActivateOrOpen(window, program)
{
	; check if window exists
	if WinExist(window)
	{
		WinActivate  ; Uses the last found window.
	}
	else
	{   ; else start requested program
		 Run cmd /c "start ^"^" ^"%program%^"",, Hide ;use cmd in hidden mode to launch requested program
		 WinWait, %window%,,5		; wait up to 5 seconds for window to exist
		 IfWinNotActive, %window%, , WinActivate, %window%
		 {
			  WinActivate  ; Uses the last found window.
		 }
	}
	return
}