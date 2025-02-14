; source code for createmsgbox.exe (made in AutoIt)
#AutoIt3Wrapper_UseX64
#include <GUIConstantsEx.au3>
#include <AVIConstants.au3>
#include <MsgBoxConstants.au3>
#include <TreeViewConstants.au3>
#include "GuiCtrls_HiDpi.au3"

_HiDpi_Ctrl_LazyInit()

; Create gui
GUICreate("Message Box Creator", 400, 200)
GUICtrlCreateLabel("Message:", 20, 20)
$InputMessage = GUICtrlCreateInput("", 100, 20, 280, 20)
GUICtrlCreateLabel("Title:", 20, 50)
$InputTitle = GUICtrlCreateInput("", 100, 50, 280, 20)
GUICtrlCreateLabel("Icon:", 20, 80)
$ComboIcon = GUICtrlCreateCombo("Information", 100, 80, 150, 20)
GUICtrlSetData($ComboIcon, "Information|Question|Exclamation|Error")
GUICtrlCreateLabel("Width:", 20, 110)
$InputWidth = GUICtrlCreateInput("300", 100, 110, 50, 20)
GUICtrlCreateLabel("Height:", 20, 140)
$InputHeight = GUICtrlCreateInput("150", 100, 140, 50, 20)
$BtnCreate = GUICtrlCreateButton("Create", 160, 170, 80, 30)
GUISetState(@SW_SHOW)

While 1
    $Msg = GUIGetMsg()
    Switch $Msg
        Case $GUI_EVENT_CLOSE
            Exit
        Case $BtnCreate
            $sMessage = GUICtrlRead($InputMessage)
            $sTitle = GUICtrlRead($InputTitle)
            $iIcon = GUICtrlRead($ComboIcon)
            $iWidth = GUICtrlRead($InputWidth)
            $iHeight = GUICtrlRead($InputHeight)
            
            ; Map combo box selection to msgbox icon constant
            Switch $iIcon
                Case "Information"
                    $iIcon = $MB_ICONINFORMATION
                Case "Question"
                    $iIcon = $MB_ICONQUESTION
                Case "Exclamation"
                    $iIcon = $MB_ICONEXCLAMATION
                Case "Error"
                    $iIcon = $MB_ICONERROR
            EndSwitch
            
            ; create the message box
            MsgBox($iIcon, $sTitle, $sMessage, 0)
    EndSwitch
WEnd
