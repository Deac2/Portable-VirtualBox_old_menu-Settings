; Language       : multilanguage
; Author         : Michael Meyer (michaelm_007) et al.
; e-Mail         : email.address@gmx.de
; License        : http://creativecommons.org/licenses/by-nc-sa/3.0/
; Version        : 6.4.9.1
; Download       : http://www.vbox.me
; Support        : http://www.win-lite.de/wbb/index.php?page=Board&boardID=153

If NOT @Compiled Then Opt("TrayIconDebug", 1)
#pragma compile(Icon, VirtualBox.ico)
#pragma compile(UPX, false)
#pragma compile(FileDescription, Oracle VM VirtualBox)
#pragma compile(ProductName, Portable VirtualBox)
#pragma compile(ProductVersion, 6.4.9.1)
#pragma compile(FileVersion, 1.0.0.0)
#pragma compile(AutoItExecuteAllowed, true)

#include <GUIConstantsEx.au3>
#include <RecFileListToArray.au3>
#include <language.au3>
#include <SingleTon.au3>

_SingleTon(@ScriptName)
#RequireAdmin

Opt("GUIOnEventMode", 1)
Opt("TrayAutoPause", 0)
Opt("TrayMenuMode", 11)
Opt("TrayOnEventMode", 1)

TraySetClick(16)
TraySetState()
TraySetToolTip("Portable-VirtualBox")

Global $version = "6.4.9.1"
Global $var1 = @ScriptDir&"\data\settings\settings.ini"
Global $var2 = @ScriptDir&"\data\settings\vboxinstall.ini"
Global $lng = IniRead($var1, "language", "key", "NotFound")
Global $pwd = @ScriptDir
Global $DefaultUserHome = @ScriptDir&"\.VirtualBox"
Global $DefaultMachineFolder = @ScriptDir&"\.VirtualBox\Machines"
Global $32Bit = "6.0.24"

    Global $Radio1, $Radio2, $Radio3, $Radio4, $Radio5, $Radio6, $Radio7, $Radio8, $Radio9, $Radio10, $Radio11, $Radio12, $Radio13, $Radio14
    Global $Checkbox01, $Checkbox02, $Checkbox03, $Checkbox04, $Checkbox05, $Checkbox06, $Checkbox07, $Checkbox08, $Checkbox09
    Global $Checkbox10, $Checkbox11, $Checkbox12, $Checkbox13, $Checkbox14, $Checkbox15, $Checkbox16, $Checkbox17, $Checkbox18
    Global $Checkbox19, $Checkbox20, $Checkbox21, $Checkbox22, $Checkbox23, $Checkbox24
    Global $Input1, $Input2, $Input3, $Input4, $Input5, $Input6
	Global $BTNUserHome, $BTNMachineFolder, $BTNStartVM
    Global $HomeRoot, $MachineRoot, $VMStart, $StartLng

Global $new1 = 0, $new2 = 0, $Settings = 0, $iSort, $CBS_DROPDOWNLIST = 0x3

_IniWrite($var1, "hotkeys", "key", "1")
_IniWrite($var1, "hotkeys", "userkey", "0")
_IniWrite($var1, "hotkeys", "01", "^")
_IniWrite($var1, "hotkeys", "02", "^")
_IniWrite($var1, "hotkeys", "03", "^")
_IniWrite($var1, "hotkeys", "04", "^")
_IniWrite($var1, "hotkeys", "05", "^")
_IniWrite($var1, "hotkeys", "06", "^")
_IniWrite($var1, "hotkeys", "07", "")
_IniWrite($var1, "hotkeys", "08", "")
_IniWrite($var1, "hotkeys", "09", "")
_IniWrite($var1, "hotkeys", "10", "")
_IniWrite($var1, "hotkeys", "11", "")
_IniWrite($var1, "hotkeys", "12", "")
_IniWrite($var1, "hotkeys", "13", "")
_IniWrite($var1, "hotkeys", "14", "")
_IniWrite($var1, "hotkeys", "15", "")
_IniWrite($var1, "hotkeys", "16", "")
_IniWrite($var1, "hotkeys", "17", "")
_IniWrite($var1, "hotkeys", "18", "")
_IniWrite($var1, "hotkeys", "19", "1")
_IniWrite($var1, "hotkeys", "20", "2")
_IniWrite($var1, "hotkeys", "21", "3")
_IniWrite($var1, "hotkeys", "22", "4")
_IniWrite($var1, "hotkeys", "23", "5")
_IniWrite($var1, "hotkeys", "24", "6")
_IniWrite($var1, "usb", "key", "0")
_IniWrite($var1, "net", "key", "0")
_IniWrite($var1, "language", "key", "english")
_IniWrite($var1, "userhome", "key", $DefaultUserHome)
_IniWrite($var1, "userhome", "sort", "1")
_IniWrite($var1, "machinefolder", "key", $DefaultMachineFolder)
_IniWrite($var1, "startvm", "key", "")
_IniWrite($var1, "lang", "key", "0")
_IniWrite($var1, "version", "key", "")
_IniWrite($var1, "starter", "key", "")

_IniWrite($var2, "download", "key1", "http://download.virtualbox.org/virtualbox/7.0.22/VirtualBox-7.0.22-165102-Win.exe")
_IniWrite($var2, "download", "key2", "http://download.virtualbox.org/virtualbox/7.0.22/Oracle_VM_VirtualBox_Extension_Pack-7.0.22.vbox-extpack")

If NOT FileExists(@ScriptDir&"\data\tools") Then DirCreate(@ScriptDir&"\data\tools")
If NOT FileExists(@ScriptDir&"\data\settings\SplashScreen.jpg") Then DownloadGithub("http://raw.githubusercontent.com/Deac2/Portable-VirtualBox/refs/heads/master/data/settings/SplashScreen.jpg", "data/settings/SplashScreen.jpg")
If NOT FileExists(@ScriptDir&"\data\tools\7za.exe") Then DownloadGithub("http://raw.githubusercontent.com/Deac2/Portable-VirtualBox/refs/heads/master/data/tools/7za.exe", "data/tools/7za.exe")
If @OSArch = "x86" AND NOT FileExists(@ScriptDir&"\data\tools\snetcfg_x86.exe") Then DownloadGithub("http://raw.githubusercontent.com/Deac2/Portable-VirtualBox/refs/heads/master/data/tools/snetcfg_x86.exe", "data/tools/snetcfg_x86.exe")
If @OSArch = "x64" AND NOT FileExists(@ScriptDir&"\data\tools\snetcfg_x64.exe") Then DownloadGithub("http://raw.githubusercontent.com/Deac2/Portable-VirtualBox/refs/heads/master/data/tools/snetcfg_x64.exe", "data/tools/snetcfg_x64.exe")
If @OSArch = "x86" AND NOT FileExists(@ScriptDir&"\data\tools\devcon_x86.exe") Then DownloadGithub("http://raw.githubusercontent.com/Deac2/Portable-VirtualBox/refs/heads/master/data/tools/devcon_x86.exe", "data/tools/devcon_x86.exe")
If @OSArch = "x64" AND NOT FileExists(@ScriptDir&"\data\tools\devcon_x64.exe") Then DownloadGithub("http://raw.githubusercontent.com/Deac2/Portable-VirtualBox/refs/heads/master/data/tools/devcon_x64.exe", "data/tools/devcon_x64.exe")

	Global $UserHome = IniRead($var1, "userhome", "key", "NotFound")
	Global $MachineFolder = IniRead($var1, "machinefolder", "key", "NotFound")

	IniWrite($var1, "userhome", "key", ValidatePath($UserHome, $DefaultUserHome))
	IniWrite($var1, "MachineFolder", "key", ValidatePath($MachineFolder, $DefaultMachineFolder))

; Использование для $UserHome
;ValidateAndSavePath($UserHome, "userhome", "key", $DefaultUserHome)

; Использование для $MachineFolder
;ValidateAndSavePath($MachineFolder, "MachineFolder", "key", $DefaultMachineFolder)

If IniRead($var1, "lang", "key", "NotFound") = 0 Then
  Global $cl = 1, $StartLng

  Local $WS_POPUP

  GUICreate("Language", 300, 136, -1, -1, $WS_POPUP)
  GUISetFont(9, 400, 0, "Arial")
  GUISetBkColor(0xFFFFFF)
  GUISetFont(10, 400, 0, "Arial")
  ;GUICtrlSetFont(-1, 10, 800, 0, "Arial")

  GUICtrlCreateLabel("Please select your language", 14, 8, 260, 16)
  ;GUICtrlSetFont(-1, 9, 800, "Arial")

  $FileList = _FileListToArray($Dir_Lang, "*", 1)
  Local $sfilelist
  For $i = 1 to $FileList[0]
  $sfilelist &= StringReplace($FileList[$i], ".ini", "")&"|"
  Next
  $sfilelist = StringTrimRight($sfilelist, 1)
  
  $StartLng = GUICtrlCreateCombo("", 31, 34, 100, 0, $CBS_DROPDOWNLIST)
  GUICtrlSetData(-1, $sfilelist, "english")

  GUICtrlCreateButton("OK", 30, 66, 100, 28, 0)
  GUICtrlSetOnEvent(-1, "OKLanguage")
  GUICtrlCreateButton("Exit", 162, 66, 100, 28, 0)
  GUICtrlSetOnEvent(-1, "ExitGUI")

  GUISetState()

  While 1
    If $cl = 0 Then ExitLoop
  WEnd

  GUIDelete()

  IniWrite($var1, "lang", "key", "1")
EndIf

$lng = IniRead($var1, "language", "key", "NotFound")
$UserHome = IniRead($var1, "userhome", "key", "NotFound")

EnvSet("VBOX_USER_HOME", $UserHome)
; Thibaut : use Hybrid Mode if available
If $CmdLine[0] = 1 AND $CmdLine[1]="noportable" Then
HybridMode()
Endif

If NOT (FileExists(@ScriptDir&"\app32\VirtualBox.exe") OR FileExists(@ScriptDir&"\app64\VirtualBox.exe")) Then
  Global $Checkbox100, $Checkbox110, $Checkbox120
  Global $Input100, $Input200, $Button100, $Button200
  Global $install = 1

      If IniRead($var1, "hotkeys", "key", "NotFound") = 1 Then
        HotKeySet(IniRead($var1, "hotkeys", "05", "NotFound") & IniRead($var1, "hotkeys", "11", "NotFound") & IniRead($var1, "hotkeys", "17", "NotFound") & IniRead($var1, "hotkeys", "23", "NotFound"), "Settings")
        HotKeySet(IniRead($var1, "hotkeys", "06", "NotFound") & IniRead($var1, "hotkeys", "12", "NotFound") & IniRead($var1, "hotkeys", "18", "NotFound") & IniRead($var1, "hotkeys", "24", "NotFound"), "ExitExtraction")
      EndIf

        Local $ctrl5, $ctrl6
        Local $alt5, $alt6
        Local $shift5, $shift6
        Local $plus11, $plus12, $plus17, $plus18

        If IniRead($var1, "hotkeys", "05", "NotFound") = "^" Then
          $ctrl5  = "CTRL"
          $plus05 = "+"
        EndIf
        If IniRead($var1, "hotkeys", "06", "NotFound") = "^" Then
          $ctrl6  = "CTRL"
          $plus06 = "+"
        EndIf

        If IniRead($var1, "hotkeys", "11", "NotFound") = "!" Then
          $alt5   = "ALT"
          $plus11 = "+"
        EndIf
        If IniRead($var1, "hotkeys", "12", "NotFound") = "!" Then
          $alt6   = "ALT"
          $plus12 = "+"
        EndIf

        If IniRead($var1, "hotkeys", "17", "NotFound") = "+" Then
          $shift5 = "SHIFT"
          $plus17 = "+"
        EndIf
        If IniRead($var1, "hotkeys", "18", "NotFound") = "+" Then
          $shift6 = "SHIFT"
          $plus18 = "+"
        EndIf

  TrayCreateItem(IniRead($Dir_Lang & $lng &".ini", "tray", "05", "NotFound") &" (" & $ctrl5 & $plus05 & $alt5 & $plus11 & $shift5 & $plus17 & IniRead($var1, "hotkeys", "23", "NotFound") & ")")
  TrayItemSetOnEvent(-1, "Settings")
  TrayCreateItem("")
  TrayCreateItem(IniRead($Dir_Lang & $lng &".ini", "tray", "06", "NotFound") &" (" & $ctrl6 & $plus06 & $alt6 & $plus12 & $shift6 & $plus18 & IniRead($var1, "hotkeys", "24", "NotFound") & ")")
  TrayItemSetOnEvent(-1, "ExitExtraction")
  TraySetState()
  TraySetToolTip(IniRead($Dir_Lang & $lng &".ini", "tray", "07", "NotFound"))
  TrayTip("", IniRead($Dir_Lang & $lng &".ini", "tray", "07", "NotFound"), 5)

  ;Local $WS_POPUP

  Global $Gui_Setup = GUICreate(IniRead($Dir_Lang & $lng &".ini", "download", "01", "NotFound"), 542, 380, -1, -1, BitOR($WS_SYSMENU, $WS_MINIMIZEBOX))
  GUISetOnEvent($GUI_EVENT_CLOSE, "ExitExtraction")
  GUISetFont(10, 400, 0, "Arial")
  GUISetBkColor(0xFFFFFF)
  ;GUICtrlSetFont(-1, 10, 800, 0, "Arial")

  GUICtrlCreateLabel(IniRead($Dir_Lang & $lng &".ini", "download", "02", "NotFound"), 32, 8, 476, 60)
  GUICtrlSetFont(-1, 10, 400, "Arial")

  $Button100 = GUICtrlCreateButton(IniRead($Dir_Lang & $lng &".ini", "download", "03", "NotFound"), 32, 62, 473, 33)
  GUICtrlSetFont(-1, 12, 400, "Arial")
  GUICtrlSetOnEvent(-1, "DownloadFile")

  GUICtrlCreateLabel(IniRead($Dir_Lang & $lng &".ini", "download", "04", "NotFound"), 250, 101, 80, 40)
  GUICtrlSetFont(-1, 10, 400, "Arial")

  $Input100 = GUICtrlCreateInput(IniRead($Dir_Lang & $lng &".ini", "download", "05", "NotFound"), 32, 124, 373, 21)
  GUICtrlCreateButton(IniRead($Dir_Lang & $lng &".ini", "download", "06", "NotFound"), 412, 122, 93, 25, 0)
  GUICtrlSetOnEvent(-1, "SearchFile")

  $Checkbox100 = GUICtrlCreateCheckbox(IniRead($Dir_Lang & $lng &".ini", "download", "07", "NotFound"), 32, 151, 460, 26)
  $Checkbox110 = GUICtrlCreateCheckbox(IniRead($Dir_Lang & $lng &".ini", "download", "08", "NotFound"), 32, 175, 460, 26)
  $Checkbox120 = GUICtrlCreateCheckbox(IniRead($Dir_Lang & $lng &".ini", "download", "10", "NotFound"), 32, 199, 460, 26)

  GUICtrlCreateLabel(IniRead($Dir_Lang & $lng &".ini", "download", "11", "NotFound"), 32, 223, 436, 26)
  GUICtrlSetFont(-1, 9, 400, 0,"Arial")
  $Input200 = GUICtrlCreateLabel("", 32, 240, 476, 47)
  GUICtrlSetFont(-1, 9, 400, 0,"Arial")

  $Button200 = GUICtrlCreateButton(IniRead($Dir_Lang & $lng &".ini", "download", "12", "NotFound"), 52, 308, 129, 33, 0)
  GUICtrlSetState($Button200, $GUI_DISABLE)
  GUICtrlSetOnEvent(-1, "UseSettings")
  GUICtrlCreateButton(IniRead($Dir_Lang & $lng &".ini", "download", "13", "NotFound"), 194, 308, 149, 33, 0)
  GUICtrlSetOnEvent(-1, "Licence")
  GUICtrlCreateButton(IniRead($Dir_Lang & $lng &".ini", "download", "14", "NotFound"), 356, 308, 129, 33, 0)
  GUICtrlSetOnEvent(-1, "ExitExtraction")

  If FileExists(@ScriptDir&"\virtualbox.exe") Then
    GUICtrlSetData($Input100, @ScriptDir&"\virtualbox.exe")
    GUICtrlSetState($Button200,$GUI_ENABLE)
	CheckExeFile(@ScriptDir&"\VirtualBox.exe")
  EndIf

  GUISetState()

  While 1
    If $install = 0 Then ExitLoop
  WEnd

  Global $startvbox = 0
Else
  Global $startvbox = 1
EndIf

If (FileExists(@ScriptDir&"\app32\virtualbox.exe") OR FileExists(@ScriptDir&"\app64\virtualbox.exe")) AND ($startvbox = 1 OR IniRead(@ScriptDir&"\data\settings\vboxinstall.ini", "startvbox", "key", "NotFound") = 1) Then
  IniDelete(@ScriptDir&"\data\settings\vboxinstall.ini", "startvbox")
  If FileExists(@ScriptDir&"\app32\") AND FileExists(@ScriptDir&"\app64\") Then
    If @OSArch = "x86" Then
      Global $arch = "app32"
    EndIf
    If @OSArch = "x64" Then
      Global $arch = "app64"
    EndIf
  Else
    If FileExists(@ScriptDir&"\app32\") AND NOT FileExists(@ScriptDir&"\app64\") Then
      Global $arch = "app32"
    EndIf
    If NOT FileExists(@ScriptDir&"\app32\") AND FileExists(@ScriptDir&"\app64\") Then
      Global $arch = "app64"
    EndIf
  EndIf

#cs
  Global $Manager = IniRead($Dir_Lang & $lng &".ini", "tray", "08", "NotFound")
  if NOT $Manager="NotFound" then
	$Manager = $Manager
	Else
	$Manager = "Manager"
  EndIf
#ce
  Global $Manager = StringSplit(IniRead($Dir_Lang & $lng &".ini", "startvm-settings", "01", "NotFound"), "-")
  if $Manager[0]>1 then
	$Manager = $Manager[2]
	MsgBox(0, "", $Manager)
	Else
	$Manager = "Manager"
  EndIf

    Local $sFileVer = StringRegExpReplace(FileGetVersion(@ScriptDir&"\"&$arch&"\VirtualBox.exe"), "^(\d+\.\d+.\d+)?.*", "\1")
  If $sFileVer>="7.1.0" Then
    Global $VMTitle = "Oracle VirtualBox"
  Else
    Global $VMTitle = "Oracle VM VirtualBox"
  EndIf

  If FileExists($UserHome&"\VirtualBox.xml-prev") Then
    FileDelete($UserHome&"\VirtualBox.xml-prev")
  EndIf

  If FileExists($UserHome&"\VirtualBox.xml-tmp") Then
    FileDelete($UserHome&"\VirtualBox.xml-tmp")
  EndIf

  If NOT FileExists($UserHome&"\VirtualBox.xml") Then
	$filexml = FileOpen($UserHome&"\VirtualBox.xml", 2)
	FileWrite($filexml, "<?xml version=""1.0""?>"&@LF&"<VirtualBox xmlns=""http://www.virtualbox.org"" version=""1.12-windows"">"&@LF&"<Global>"&@LF&"<ExtraData>"&@LF&"</ExtraData>"&@LF&"<MachineRegistry/>"&@LF&"<NetserviceRegistry>"&@LF&"</NetserviceRegistry>"&@LF&"</Global>"&@LF&"</VirtualBox>")
	FileClose($filexml)
	Run('cmd /c ""'&@ScriptDir&'\'&$arch&'\VBoxManage.exe" setproperty machinefolder "'&$UserHome&'\Machines""', @ScriptDir, @SW_HIDE)
	Else
	If NOT FileExists($MachineFolder) Then
	Run('cmd /c ""'&@ScriptDir&'\'&$arch&'\VBoxManage.exe" setproperty machinefolder "'&$MachineFolder&'""', @ScriptDir, @SW_HIDE)
	EndIf
  EndIf

  If FileExists($UserHome&"\VirtualBox.xml") Then
    Local $values0, $values1, $values2, $values3, $values4, $values5, $values6, $values7, $values8, $values9, $values10, $values11, $values12, $values13
    Local $line, $content, $i, $j, $k, $l, $m, $n
    Local $file = FileOpen($UserHome&"\VirtualBox.xml", 128)
    If $file <> -1 Then
      $line    = FileRead($file)
      $values0 = _StringBetween($line, '<MachineRegistry>', '</MachineRegistry>')
      If $values0 = 0 Then
        $values1 = 0
      Else
        $values1 = _StringBetween($values0[0], 'src="', '"')
      EndIf
      $values10 = _StringBetween($line, '<Global>', '</Global>')
      If $values10 = 0 Then
        $values11 = 0
      Else
        $values11 = _StringBetween($values10[0], '<SystemProperties', '/>')
      EndIf

     $aArray = _RecFileListToArray($UserHome, "*.vbox", 1, 1, $iSort, 2)
     If IsArray($aArray) Then
     For $i = 1 To $aArray[0]
		If NOT StringRegExp($aArray[$i], ".bin") Then
		  $line = FileRead(FileOpen($aArray[$i], 128))
		  If StringRegExp($line, "VirtualBox") and StringRegExp($line, "Machine") and StringRegExp($line, "HardDisks") and StringRegExp($line, "Hardware") Then
			$values2 = _StringBetween($line, '<Machine', '>')
			If $values2<>0 Then
		    $values3 = _StringBetween($line, 'uuid="', '"')
			EndIf
		  If $values3<>0 and FileExists($aArray[$i]) Then
		  $values4 &= "<MachineEntry uuid="""&$values3[0]&""" src="""&$aArray[$i]&"""/>" & @LF
		  EndIf
		  EndIf
		EndIf
     Next
     EndIf

	FileDelete(@ScriptDir&"\Portable-VirtualBox.error.txt")
	$values4 = StringTrimRight($values4, 1)
	$a = stringsplit($values4, @LF, 2)
	local $b = 0
    for $i = ubound($a) - 1 to 0 step - 1
		$uuid1 = _StringBetween($a[$i], 'uuid="', '"')
        For $x = $i - 1 to 0 step - 1
			$uuid2 = _StringBetween($a[$x], 'uuid="', '"')
			If $uuid1[0] = $uuid2[0] Then
			$b += 1
			$values4 = StringReplace($values4, $a[$i], "")
			if $i>=$b Then
            $filetxt = FileOpen(@ScriptDir&"\Portable-VirtualBox.error.txt", 1)
            FileWrite($filetxt, "List of duplicate machines with the same uuid:" &@LF)
			EndIf
            $filetxt = FileOpen(@ScriptDir&"\Portable-VirtualBox.error.txt", 1)
			FileWrite($filetxt, $a[$x] &@LF& $a[$i] &@LF&@LF)
			if $i<=1 Then
			$filetxt = FileOpen(@ScriptDir&"\Portable-VirtualBox.error.txt", 1)
			FileWrite($filetxt, "To eliminate errors, only one of the duplicates was added to VirtualBox.xml"&@LF& $values4 &@LF&@LF)
			FileClose($filetxt)
			EndIf
			$x = 0
			EndIf
		Next
    Next

      $content = FileRead(FileOpen($UserHome&"\VirtualBox.xml", 128))
      $values6 = _StringBetween($content, "</ExtraData>", "<NetserviceRegistry>")
	  if $values6 <> 0 Then
      Local $xmlfile = FileOpen($UserHome&"\VirtualBox.xml", 2)
      FileWrite($xmlfile, StringReplace($content, $values6[0], @LF &"<MachineRegistry>"&$values4&"</MachineRegistry>"& @LF))
      FileClose($xmlfile)
	  EndIf

      For $m = 0 To UBound($values11) - 1
        $values12 = _StringBetween($values11[$m], 'defaultMachineFolder="', '"')
        If $values12 <> 0 Then
		  If NOT FileExists(StringLeft($values12[0], 2)) or Not FileExists($values12[0]) Then
            $content = FileRead(FileOpen($UserHome&"\VirtualBox.xml", 128))
            $filexml = FileOpen($UserHome&"\VirtualBox.xml", 2)
            FileWrite($filexml, StringReplace($content, $values12[0], $UserHome&"\Machines"))
            FileClose($filexml)
          EndIf
        EndIf
      Next

      FileClose($file)
    EndIf
  Else
    MsgBox(0+262144, IniRead($Dir_Lang & $lng &".ini", "download", "15", "NotFound"), IniRead($Dir_Lang & $lng &".ini", "download", "16", "NotFound"))
EndIf

  If FileExists(@ScriptDir&"\"&$arch&"\VirtualBox.exe") AND FileExists(@ScriptDir&"\"&$arch&"\VBoxSVC.exe") AND FileExists(@ScriptDir&"\"&$arch&"\VBoxC.dll") Then
    If NOT ProcessExists("VirtualBox.exe") OR NOT ProcessExists("VBoxManage.exe") Then
      If FileExists(@ScriptDir&"\data\settings\SplashScreen.jpg") Then
        SplashImageOn("Portable-VirtualBox", @ScriptDir&"\data\settings\SplashScreen.jpg", 480, 360, -1, -1, 1)
      Else
        SplashTextOn("Portable-VirtualBox", IniRead($Dir_Lang & $lng &".ini", "messages", "06", "NotFound"), 220, 40, -1, -1, 1, "arial", 12)
      EndIf

      If IniRead($var1, "hotkeys", "key", "NotFound") = 1 Then
        HotKeySet(IniRead($var1, "hotkeys", "01", "NotFound") & IniRead($var1, "hotkeys", "07", "NotFound") & IniRead($var1, "hotkeys", "13", "NotFound") & IniRead($var1, "hotkeys", "19", "NotFound"), "ShowWindows_VM")
        HotKeySet(IniRead($var1, "hotkeys", "02", "NotFound") & IniRead($var1, "hotkeys", "08", "NotFound") & IniRead($var1, "hotkeys", "14", "NotFound") & IniRead($var1, "hotkeys", "20", "NotFound"), "HideWindows_VM")
        HotKeySet(IniRead($var1, "hotkeys", "03", "NotFound") & IniRead($var1, "hotkeys", "09", "NotFound") & IniRead($var1, "hotkeys", "15", "NotFound") & IniRead($var1, "hotkeys", "21", "NotFound"), "ShowWindows")
        HotKeySet(IniRead($var1, "hotkeys", "04", "NotFound") & IniRead($var1, "hotkeys", "10", "NotFound") & IniRead($var1, "hotkeys", "16", "NotFound") & IniRead($var1, "hotkeys", "22", "NotFound"), "HideWindows")
        HotKeySet(IniRead($var1, "hotkeys", "05", "NotFound") & IniRead($var1, "hotkeys", "11", "NotFound") & IniRead($var1, "hotkeys", "17", "NotFound") & IniRead($var1, "hotkeys", "23", "NotFound"), "Settings")
        HotKeySet(IniRead($var1, "hotkeys", "06", "NotFound") & IniRead($var1, "hotkeys", "12", "NotFound") & IniRead($var1, "hotkeys", "18", "NotFound") & IniRead($var1, "hotkeys", "24", "NotFound"), "ExitScript")

        Local $ctrl1, $ctrl2, $ctrl3, $ctrl4, $ctrl5, $ctrl6
        Local $alt1, $alt2, $alt3, $alt4, $alt5, $alt6
        Local $shift1, $shift2, $shift3, $shift4, $shift5, $shift6
        Local $plus01, $plus02, $plus03, $plus04, $plus05, $plus06, $plus07, $plus08, $plus09, $plus10, $plus11, $plus12, $plus13, $plus14, $plus15, $plus16, $plus17, $plus18

	If IniRead($var1, "hotkeys", "01", "NotFound") = "^" Then
          $ctrl1  = "CTRL"
          $plus01 = "+"
        EndIf
        If IniRead($var1, "hotkeys", "02", "NotFound") = "^" Then
          $ctrl2  = "CTRL"
          $plus02 = "+"
        EndIf
        If IniRead($var1, "hotkeys", "03", "NotFound") = "^" Then
          $ctrl3  = "CTRL"
          $plus03 = "+"
        EndIf
        If IniRead($var1, "hotkeys", "04", "NotFound") = "^" Then
          $ctrl4  = "CTRL"
          $plus04 = "+"
        EndIf
        If IniRead($var1, "hotkeys", "05", "NotFound") = "^" Then
          $ctrl5  = "CTRL"
          $plus05 = "+"
        EndIf
        If IniRead($var1, "hotkeys", "06", "NotFound") = "^" Then
          $ctrl6  = "CTRL"
          $plus06 = "+"
        EndIf

        If IniRead($var1, "hotkeys", "07", "NotFound") = "!" Then
          $alt1   = "ALT"
          $plus07 = "+"
        EndIf
        If IniRead($var1, "hotkeys", "08", "NotFound") = "!" Then
          $alt2   = "ALT"
          $plus08 = "+"
        EndIf
        If IniRead($var1, "hotkeys", "09", "NotFound") = "!" Then
          $alt3   = "ALT"
          $plus09 = "+"
        EndIf
        If IniRead($var1, "hotkeys", "10", "NotFound") = "!" Then
          $alt4   = "ALT"
          $plus10 = "+"
        EndIf
        If IniRead($var1, "hotkeys", "11", "NotFound") = "!" Then
          $alt5   = "ALT"
          $plus11 = "+"
        EndIf
        If IniRead($var1, "hotkeys", "12", "NotFound") = "!" Then
          $alt6   = "ALT"
          $plus12 = "+"
        EndIf

        If IniRead($var1, "hotkeys", "13", "NotFound") = "+" Then
          $shift1 = "SHIFT"
          $plus13 = "+"
        EndIf
        If IniRead($var1, "hotkeys", "14", "NotFound") = "+" Then
          $shift2 = "SHIFT"
          $plus14 = "+"
        EndIf
        If IniRead($var1, "hotkeys", "15", "NotFound") = "+" Then
          $shift3 = "SHIFT"
          $plus15 = "+"
        EndIf
        If IniRead($var1, "hotkeys", "16", "NotFound") = "+" Then
          $shift4 = "SHIFT"
          $plus16 = "+"
        EndIf
        If IniRead($var1, "hotkeys", "17", "NotFound") = "+" Then
          $shift5 = "SHIFT"
          $plus17 = "+"
        EndIf
        If IniRead($var1, "hotkeys", "18", "NotFound") = "+" Then
          $shift6 = "SHIFT"
          $plus18 = "+"
        EndIf

        TrayCreateItem(IniRead($Dir_Lang & $lng &".ini", "tray", "01", "NotFound") &" (" & $ctrl1 & $plus01 & $alt1 & $plus07 & $shift1 & $plus13 & IniRead($var1, "hotkeys", "19", "NotFound") & ")")
        TrayItemSetOnEvent(-1, "ShowWindows_VM")
        TrayCreateItem(IniRead($Dir_Lang & $lng &".ini", "tray", "02", "NotFound") &" (" & $ctrl2 & $plus02 & $alt2 & $plus08 & $shift2 & $plus14 & IniRead($var1, "hotkeys", "20", "NotFound") & ")")
        TrayItemSetOnEvent(-1, "HideWindows_VM")
        TrayCreateItem("")
        TrayCreateItem(IniRead($Dir_Lang & $lng &".ini", "tray", "03", "NotFound") &" (" & $ctrl3 & $plus03 & $alt3 & $plus09 & $shift3 & $plus15 & IniRead($var1, "hotkeys", "21", "NotFound") & ")")
        TrayItemSetOnEvent(-1, "ShowWindows")
        TrayCreateItem(IniRead($Dir_Lang & $lng &".ini", "tray", "04", "NotFound") &" (" & $ctrl4 & $plus04 & $alt4 & $plus10 & $shift4 & $plus16 & IniRead($var1, "hotkeys", "22", "NotFound") & ")")
        TrayItemSetOnEvent(-1, "HideWindows")
        TrayCreateItem("")
        TrayCreateItem(IniRead($Dir_Lang & $lng &".ini", "tray", "05", "NotFound") &" (" & $ctrl5 & $plus05 & $alt5 & $plus11 & $shift5 & $plus17 & IniRead($var1, "hotkeys", "23", "NotFound") & ")")
        TrayItemSetOnEvent(-1, "Settings")
        TrayCreateItem("")
        TrayCreateItem(IniRead($Dir_Lang & $lng &".ini", "tray", "06", "NotFound") &" (" & $ctrl6 & $plus06 & $alt6 & $plus12 & $shift6 & $plus18 & IniRead($var1, "hotkeys", "24", "NotFound") & ")")
        TrayItemSetOnEvent(-1, "ExitScript")
        TraySetState()
        TraySetToolTip(IniRead($Dir_Lang & $lng &".ini", "tray", "07", "NotFound"))
        TrayTip("", IniRead($Dir_Lang & $lng &".ini", "tray", "07", "NotFound"), 5)
      Else
        TrayCreateItem(IniRead($Dir_Lang & $lng &".ini", "tray", "01", "NotFound"))
        TrayItemSetOnEvent(-1, "ShowWindows_VM")
        TrayCreateItem(IniRead($Dir_Lang & $lng &".ini", "tray", "02", "NotFound"))
        TrayItemSetOnEvent(-1, "HideWindows_VM")
        TrayCreateItem("")
        TrayCreateItem(IniRead($Dir_Lang & $lng &".ini", "tray", "03", "NotFound"))
        TrayItemSetOnEvent(-1, "ShowWindows")
        TrayCreateItem(IniRead($Dir_Lang & $lng &".ini", "tray", "04", "NotFound"))
        TrayItemSetOnEvent(-1, "HideWindows")
        TrayCreateItem("")
        TrayCreateItem(IniRead($Dir_Lang & $lng &".ini", "tray", "05", "NotFound"))
        TrayItemSetOnEvent(-1, "Settings")
        TrayCreateItem("")
        TrayCreateItem(IniRead($Dir_Lang & $lng &".ini", "tray", "06", "NotFound"))
        TrayItemSetOnEvent(-1, "ExitScript")
        TraySetState()
        TraySetToolTip(IniRead($Dir_Lang & $lng &".ini", "tray", "07", "NotFound"))
        TrayTip("", IniRead($Dir_Lang & $lng &".ini", "tray", "07", "NotFound"), 5)
      EndIf

      If @OSArch = "x86" Then
        If NOT FileExists(@SystemDir&"\msvcp71.dll") OR NOT FileExists(@SystemDir&"\msvcr71.dll") OR NOT FileExists(@SystemDir&"\msvcrt.dll") Then
          FileCopy(@ScriptDir&"\app32\msvcp71.dll", @SystemDir, 9)
          FileCopy(@ScriptDir&"\app32\msvcr71.dll", @SystemDir, 9)
          FileCopy(@ScriptDir&"\app32\msvcrt.dll", @SystemDir, 9)
          Local $msv = 1
        Else
          Local $msv = 0
        EndIf
      EndIf

      If @OSArch = "x64" Then
        If NOT FileExists(@SystemDir&"\msvcp80.dll") OR NOT FileExists(@SystemDir&"\msvcr80.dll") Then
          FileCopy(@ScriptDir&"\app64\msvcp80.dll", @SystemDir, 9)
          FileCopy(@ScriptDir&"\app64\msvcr80.dll", @SystemDir, 9)
          Local $msv = 2
        Else
          Local $msv = 0
        EndIf
      EndIf

      If FileExists(@ScriptDir&"\"&$arch&"\") AND FileExists(@ScriptDir&"\vboxadditions\") Then
        DirMove(@ScriptDir&"\vboxadditions\doc", @ScriptDir&"\"& $arch, 1)
        DirMove(@ScriptDir&"\vboxadditions\ExtensionPacks", @ScriptDir&"\"& $arch, 1)
        DirMove(@ScriptDir&"\vboxadditions\nls", @ScriptDir&"\"& $arch, 1)
        FileMove(@ScriptDir&"\vboxadditions\guestadditions\*.*", @ScriptDir&"\"&$arch&"\", 9)
      Endif

      ;RunWait($arch&"\VBoxSVC.exe /reregserver", @ScriptDir, @SW_HIDE)
      ;RunWait(@SystemDir&"\regsvr32.exe /S "&$arch&"\VBoxC.dll", @ScriptDir, @SW_HIDE)
      ;DllCall($arch&"\VBoxRT.dll", "hwnd", "RTR3Init")

      SplashOff()

      If FileExists(@ScriptDir&"\"&$arch&"\drivers\VBoxDrv") AND RegRead("HKLM\SYSTEM\CurrentControlSet\Services\VBoxDRV", "DisplayName") <> "VirtualBox Service" Then
        RunWait("cmd /c sc create VBoxDRV binpath= ""%CD%\"&$arch&"\drivers\VBoxDrv\VBoxDrv.sys"" type= kernel start= auto error= normal displayname= PortableVBoxDRV", @ScriptDir, @SW_HIDE)
        Local $DRV = 1
      Else
        Local $DRV = 0
      EndIf

      If FileExists(@ScriptDir&"\"&$arch&"\drivers\vboxsup") AND RegRead("HKLM\SYSTEM\CurrentControlSet\Services\VBoxSUP", "DisplayName") <> "VirtualBox Service" Then
        RunWait("cmd /c sc create VBoxSUP binpath= ""%CD%\"&$arch&"\drivers\VBoxSup\VBoxSup.sys"" type= kernel start= auto error= normal displayname= PortableVBoxSUP", @ScriptDir, @SW_HIDE)
        Local $SUP = 1
      Else
        Local $SUP = 0
      EndIf

      If IniRead($var1, "usb", "key", "NotFound") = 1 Then
        If RegRead("HKLM\SYSTEM\CurrentControlSet\Services\VBoxUSB", "DisplayName") <> "VirtualBox USB" Then
          If @OSArch = "x86" Then
            RunWait(@ScriptDir&"\data\tools\devcon_x86.exe install "&$arch&"\drivers\USB\device\VBoxUSB.inf ""USB\VID_80EE&PID_CAFE""", @ScriptDir, @SW_HIDE)
          EndIf
          If @OSArch = "x64" Then
            RunWait(@ScriptDir&"\data\tools\devcon_x64.exe install "&$arch&"\drivers\USB\device\VBoxUSB.inf ""USB\VID_80EE&PID_CAFE""", @ScriptDir, @SW_HIDE)
          EndIf
          FileCopy(@ScriptDir&"\"&$arch&"\drivers\USB\device\VBoxUSB.sys", @SystemDir&"\drivers", 9)
          Local $USB = 1
        Else
          Local $USB = 0
        EndIf
      Else
        Local $USB = 0
      EndIf

      If RegRead("HKLM\SYSTEM\CurrentControlSet\Services\VBoxUSBMon", "DisplayName") <> "VirtualBox USB Monitor Driver" Then
        RunWait("cmd /c sc create VBoxUSBMon binpath= ""%CD%\"&$arch&"\drivers\USB\filter\VBoxUSBMon.sys"" type= kernel start= auto error= normal displayname= PortableVBoxUSBMon", @ScriptDir, @SW_HIDE)
        Local $MON = 1
      Else
        Local $MON = 0
      EndIf

      If IniRead($var1, "net", "key", "NotFound") = 1 Then
        If NOT FileExists(@ScriptDir&"\"&$arch&"\drivers\network\netadp6") Then
        Local $ADPVER = ""
        Else
        Local $ADPVER = 6
        EndIf
        If RegRead("HKLM\SYSTEM\CurrentControlSet\Services\VBoxNetAdp", "DisplayName") <> "VirtualBox Host-Only Network Adapter" Then
          If @OSArch = "x86" Then
            RunWait(@ScriptDir&"\data\tools\devcon_x86.exe install "&$arch&"\drivers\network\netadp"&$ADPVER&"\VBoxNetAdp"&$ADPVER&".inf ""sun_VBoxNetAdp""", @ScriptDir, @SW_HIDE)
          EndIf
          If @OSArch = "x64" Then
            RunWait(@ScriptDir&"\data\tools\devcon_x64.exe install "&$arch&"\drivers\network\netadp"&$ADPVER&"\VBoxNetAdp"&$ADPVER&".inf ""sun_VBoxNetAdp""", @ScriptDir, @SW_HIDE)
          EndIf
          FileCopy(@ScriptDir&"\"&$arch&"\drivers\network\netadp"&$ADPVER&"\VBoxNetAdp"&$ADPVER&".sys", @SystemDir&"\drivers", 9)
          Local $ADP = 1
        Else
          Local $ADP = 0
        EndIf
      Else
        Local $ADP = 0
      EndIf

      If IniRead($var1, "net", "key", "NotFound") = 1 Then
        If RegRead("HKLM\SYSTEM\CurrentControlSet\Services\VBoxNetFlt", "DisplayName") <> "VBoxNetFlt Service" Then
          If @OSArch = "x86" Then
            ;RunWait(@ScriptDir&"\data\tools\snetcfg_x86.exe -v -u ""sun_VBoxNetFlt""", @ScriptDir, @SW_HIDE)
            ;RunWait("cmd /c start /b """" """&(@ScriptDir&"\data\tools\snetcfg_x86.exe"" -v -l "&$arch&"\drivers\network\netflt\VBoxNetFlt.inf -m "&$arch&"\drivers\network\netflt\VBoxNetFlt.inf -c s -i ""sun_VBoxNetFlt""", @ScriptDir, @SW_HIDE)
            RunWait(@ScriptDir&"\data\tools\snetcfg_x86.exe -v -u ""oracle_VBoxNetLwf""", @ScriptDir, @SW_HIDE)
            RunWait("cmd /c start /b """" """&@ScriptDir&"\data\tools\snetcfg_x86.exe"" -v -l "&$arch&"\drivers\network\netlwf\VBoxNetLwf.inf -m "&$arch&"\drivers\network\netlwf\VBoxNetLwf.inf -c s -i ""oracle_VBoxNetLwf""", @ScriptDir, @SW_HIDE)
          EndIf
          If @OSArch = "x64" Then
            ;RunWait(@ScriptDir&"\data\tools\snetcfg_x64.exe -v -u ""sun_VBoxNetFlt""", @ScriptDir, @SW_HIDE)
			;RunWait("cmd /c start /b """" """&@ScriptDir&"\data\tools\snetcfg_x64.exe"" -v -l "&$arch&"\drivers\network\netflt\VBoxNetFlt.inf -m "&$arch&"\drivers\network\netflt\VBoxNetFlt.inf -c s -i ""sun_VBoxNetFlt""", @ScriptDir, @SW_HIDE)
            RunWait(@ScriptDir&"\data\tools\snetcfg_x64.exe -v -u ""oracle_VBoxNetLwf""", @ScriptDir, @SW_HIDE)
            RunWait("cmd /c start /b """" """&@ScriptDir&"\data\tools\snetcfg_x64.exe"" -v -l "&$arch&"\drivers\network\netlwf\VBoxNetLwf.inf -m "&$arch&"\drivers\network\netlwf\VBoxNetLwf.inf -c s -i ""oracle_VBoxNetLwf""", @ScriptDir, @SW_HIDE)
          EndIf
          ;FileCopy(@ScriptDir&"\"&$arch&"\drivers\network\netflt\VBoxNetFltNobj.dll", @SystemDir, 9)
          ;FileCopy(@ScriptDir&"\"&$arch&"\drivers\network\netflt\VBoxNetFlt.sys", @SystemDir&"\drivers", 9)
          ;RunWait(@SystemDir&"\regsvr32.exe /S "&@SystemDir&"\VBoxNetFltNobj.dll", @ScriptDir, @SW_HIDE)
          FileCopy(@ScriptDir&"\"&$arch&"\drivers\network\netlwf\VBoxNetLwf.sys", @SystemDir&"\drivers", 9)
          Local $NET = 1
        Else
          Local $NET = 0
        EndIf
      Else
        Local $NET = 0
      EndIf
#cs
      If IniRead($var1, "net", "key", "NotFound") = 1 Then
        If RegRead("HKLM\SYSTEM\CurrentControlSet\Services\VBoxNetFlt", "DisplayName") <> "VBoxNetFlt Service" Then
          If @OSArch = "x86" Then
            ;RunWait(@ScriptDir&"\data\tools\snetcfg_x86.exe -v -u ""sun_VBoxNetFlt""", @ScriptDir, @SW_HIDE)
            ;RunWait("cmd /c start /b """" """&(@ScriptDir&"\data\tools\snetcfg_x86.exe"" -v -l "&$arch&"\drivers\network\netflt\VBoxNetFlt.inf -m "&$arch&"\drivers\network\netflt\VBoxNetFlt.inf -c s -i ""sun_VBoxNetFlt""", @ScriptDir, @SW_HIDE)
            RunWait(@ScriptDir&"\data\tools\snetcfg_x86.exe -v -u ""oracle_VBoxNetLwf""", @ScriptDir, @SW_HIDE)
            RunWait("cmd /c start /b """" """&@ScriptDir&"\data\tools\snetcfg_x86.exe"" -v -l "&$arch&"\drivers\network\netlwf\VBoxNetLwf.inf -m "&$arch&"\drivers\network\netlwf\VBoxNetLwf.inf -c s -i ""oracle_VBoxNetLwf""", @ScriptDir, @SW_HIDE)
          EndIf
          If @OSArch = "x64" Then
            ;RunWait(@ScriptDir&"\data\tools\snetcfg_x64.exe -v -u ""sun_VBoxNetFlt""", @ScriptDir, @SW_HIDE)
			;RunWait("cmd /c start /b """" """&@ScriptDir&"\data\tools\snetcfg_x64.exe"" -v -l "&$arch&"\drivers\network\netflt\VBoxNetFlt.inf -m "&$arch&"\drivers\network\netflt\VBoxNetFlt.inf -c s -i ""sun_VBoxNetFlt""", @ScriptDir, @SW_HIDE)
            RunWait(@ScriptDir&"\data\tools\snetcfg_x64.exe -v -u ""oracle_VBoxNetLwf""", @ScriptDir, @SW_HIDE)
            RunWait("cmd /c start /b """" """&@ScriptDir&"\data\tools\snetcfg_x64.exe"" -v -l "&$arch&"\drivers\network\netlwf\VBoxNetLwf.inf -m "&$arch&"\drivers\network\netlwf\VBoxNetLwf.inf -c s -i ""oracle_VBoxNetLwf""", @ScriptDir, @SW_HIDE)
          EndIf
          ;FileCopy(@ScriptDir&"\"&$arch&"\drivers\network\netflt\VBoxNetFltNobj.dll", @SystemDir, 9)
          ;FileCopy(@ScriptDir&"\"&$arch&"\drivers\network\netflt\VBoxNetFlt.sys", @SystemDir&"\drivers", 9)
          ;RunWait(@SystemDir&"\regsvr32.exe /S "&@SystemDir&"\VBoxNetFltNobj.dll", @ScriptDir, @SW_HIDE)
          FileCopy(@ScriptDir&"\"&$arch&"\drivers\network\netlwf\VBoxNetLwf.sys", @SystemDir&"\drivers", 9)
          Local $NET = 1
        Else
          Local $NET = 0
        EndIf
      Else
        Local $NET = 0
      EndIf
#ce

      RunWait($arch&"\VBoxSVC.exe /reregserver", @ScriptDir, @SW_HIDE)
	  RunWait(@SystemDir&"\regsvr32.exe /S "&$arch&"\VBoxC.dll", @ScriptDir, @SW_HIDE)
	  RunWait(@SystemDir&"\regsvr32.exe /S "&$arch&"\VBoxProxyStub.dll", @ScriptDir, @SW_HIDE)
      DllCall($arch&"\VBoxRT.dll", "hwnd", "RTR3Init")

	If $DRV = 1 Then
		RunWait("sc start VBoxDRV", @ScriptDir, @SW_HIDE)
	EndIf

      If $SUP = 1 Then
        RunWait("sc start VBoxSUP", @ScriptDir, @SW_HIDE)
      EndIf

      If $USB = 1 Then
        RunWait("sc start VBoxUSB", @ScriptDir, @SW_HIDE)
      EndIf

      If $MON = 1 Then
        RunWait("sc start VBoxUSBMon", @ScriptDir, @SW_HIDE)
      EndIf

      If $ADP = 1 Then
        RunWait("sc start VBoxNetAdp", @ScriptDir, @SW_HIDE)
      EndIf

      If $NET = 1 Then
        ;RunWait("sc start VBoxNetFlt", @ScriptDir, @SW_HIDE)
		;RunWait("sc start VBoxNetLwf", @ScriptDir, @SW_HIDE)
      EndIf

      #clear log
      If FileExists($UserHome) Then
      FileDelete($UserHome&"\*.log")
      FileDelete($UserHome&"\*.log.*")
      EndIf

      #clear log Machines
      If FileExists($UserHome&"\VirtualBox.xml") Then
		For $i = 0 To UBound($values1) - 1
		Local $Result = StringSplit(StringReplace($values1[$i], ".vbox", ""), "\")
		Local $ResultName = $Result[$Result[0]]
		$aArray = _RecFileListToArray($UserHome, "*"&$ResultName&".vbox", 1, 1, 0, 2)
		If IsArray($aArray) Then
		For $j = 1 To $aArray[0]
		If FileExists($aArray[$j]) Then
		Local $Patch = StringRegExpReplace($aArray[$j], "[^\\]+$", "")
		FileDelete($Patch&"Logs\*.log")
		FileDelete($Patch&"Logs\*.log.*")
		EndIf
		Next
		EndIf
		Next
      EndIf

  ;If NOT FileExists($UserHome&"\VirtualBox.xml") Then
	;Run('cmd /c ""'&@ScriptDir&'\'&$arch&'\VBoxManage.exe" setproperty machinefolder "'&$UserHome&'\Machines""', @ScriptDir, @SW_HIDE)
  ;EndIf

      If $CmdLine[0] = 1 Then
        If FileExists($UserHome) Then
          Local $StartVM = $CmdLine[1]
		  Local $Patch = ""
          $VMStartSearch = StringRegExpReplace($StartVM, "\h*[{}\[\]]+\h*", "_")
          $aArray = _RecFileListToArray($UserHome, "*"&$VMStartSearch&".vdi", 1, 1, 0, 2)
          If IsArray($aArray) Then
			For $i = 1 To $aArray[0]
			$Patch = $aArray[$i]
			Next
          Endif
		  If IniRead($var1, "userhome", "key", "NotFound") = $UserHome Then
			Run("cmd /c set VBOX_USER_HOME="&$UserHome&"& "&$arch&"\VirtualBox.exe", @ScriptDir, @SW_HIDE)
			RunWait("cmd /c set VBOX_USER_HOME="&$UserHome&"& "&$arch&"\VBoxManage.exe startvm """&$StartVM&"""" , @ScriptDir, @SW_HIDE)
          Else
            RunWait("cmd /c set VBOX_USER_HOME="&$UserHome&"& "&$arch&"\VirtualBox.exe", @ScriptDir, @SW_HIDE)
          EndIf
        Else
          RunWait("cmd /c set VBOX_USER_HOME="&$UserHome&"& "&$arch&"\VirtualBox.exe", @ScriptDir, @SW_HIDE)
        EndIf

        ProcessWaitClose("VirtualBox.exe")
        ProcessWaitClose("VBoxManage.exe")
      Else
        If FileExists($UserHome) Then
          Local $StartVM  = IniRead($var1, "startvm", "key", "NotFound")
		  If NOT FileExists($UserHome&"\Machines\"&$StartVM) Then
		  IniWrite($var1, "startvm", "key", "")
		  $VirtualBoxPid = RunWait("cmd /c set VBOX_USER_HOME="&$UserHome&"& "&$arch&"\VirtualBox.exe", @ScriptDir, @SW_HIDE)
		  Else
			$VirtualBoxPid = RunWait("cmd /c set VBOX_USER_HOME="&$UserHome&"& "&$arch&"\VirtualBox.exe", @ScriptDir, @SW_HIDE)
			Run("cmd /C set VBOX_USER_HOME="&$UserHome&"& "&$arch&"\VBoxManage.exe startvm """& $StartVM &"""" , @ScriptDir, @SW_HIDE)
          EndIf
        Else
          $VirtualBoxPid = RunWait("cmd /c set VBOX_USER_HOME="&$DefaultUserHome&"& "&$arch&"\VirtualBox.exe", @ScriptDir, @SW_HIDE)
        EndIf

        ProcessWaitClose("VirtualBox.exe") ;WaitClose
        ProcessWaitClose("VBoxManage.exe")
      EndIf

      ProcessWaitClose("VirtualBoxVM.exe")

      SplashTextOn("Portable-VirtualBox", IniRead($Dir_Lang & $lng &".ini", "messages", "07", "NotFound"), 220, 40, -1, -1, 1, "arial", 12)

      ExitScript()

      ProcessWaitClose("VBoxSVC.exe")
      ProcessWaitClose("VBoxSDS.exe")

      EnvSet("VBOX_USER_HOME")

      RunWait($arch&"\VBoxSVC.exe /unregserver", @ScriptDir, @SW_HIDE)
      RunWait(@SystemDir&"\regsvr32.exe /S /U "&$arch&"\VBoxC.dll", @ScriptDir, @SW_HIDE)
	If FileExists(@ScriptDir&"\app32\") AND FileExists(@ScriptDir&"\app64\") Then
		If @OSArch = "x64" Then
		$append_arch = "64"
		$append_wow = ""
		Else
		$append_arch = ""
		$append_wow = "\WOW6432Node"
		EndIf
	Else
		If FileExists(@ScriptDir&"\app32\") AND NOT FileExists(@ScriptDir&"\app64\") Then
		$append_arch = ""
		$append_wow = "\WOW6432Node"
		EndIf
		If NOT FileExists(@ScriptDir&"\app32\") AND FileExists(@ScriptDir&"\app64\") Then
		$append_arch = "64"
		$append_wow = ""
		EndIf
	EndIf

	While 1
	Local $VBoxProxyStub = RegRead("HKLM"&$append_arch&"\SOFTWARE\Classes"&$append_wow&"\CLSID\{0BB3B78C-1807-4249-5BA5-EA42D66AF0BF}\InProcServer32", "")
    If StringRegExp($VBoxProxyStub, "VBoxProxyStub") Then
		Local $Filename = StringRegExpReplace($VBoxProxyStub, "^.*\\", "")
		RunWait(@SystemDir&"\regsvr32.exe /s /u """&$VBoxProxyStub&"""", @ScriptDir, @SW_HIDE) ;COM_API
		;RunWait(@SystemDir&"\regsvr32.exe /s /u """&$arch&"\"&$Filename&"""", @ScriptDir, @SW_HIDE) ;COM_API
	EndIf
	If NOT $VBoxProxyStub Then ExitLoop
	WEnd

      If $DRV = 1 Then
        RunWait("sc stop VBoxDRV", @ScriptDir, @SW_HIDE)
      EndIf

      If $SUP = 1 Then
        RunWait("sc stop VBoxSUP", @ScriptDir, @SW_HIDE)
      EndIf

      If $USB = 1 Then
        RunWait("sc stop VBoxUSB", @ScriptDir, @SW_HIDE)
        If @OSArch = "x86" Then
          RunWait(@ScriptDir &"\data\tools\devcon_x86.exe remove ""USB\VID_80EE&PID_CAFE""", @ScriptDir, @SW_HIDE)
        EndIf
        If @OSArch = "x64" Then
          RunWait(@ScriptDir &"\data\tools\devcon_x64.exe remove ""USB\VID_80EE&PID_CAFE""", @ScriptDir, @SW_HIDE)
        EndIf
        FileDelete(@SystemDir&"\drivers\VBoxUSB.sys")
      EndIf

      If $MON = 1 Then
        RunWait("sc stop VBoxUSBMon", @ScriptDir, @SW_HIDE)
      EndIf

      If $ADP = 1 Then
        RunWait("sc stop VBoxNetAdp", @ScriptDir, @SW_HIDE)
        If @OSArch = "x86" Then
          RunWait(@ScriptDir &"\data\tools\devcon_x86.exe remove ""sun_VBoxNetAdp""", @ScriptDir, @SW_HIDE)
        EndIf
        If @OSArch = "x64" Then
          RunWait(@ScriptDir &"\data\tools\devcon_x64.exe remove ""sun_VBoxNetAdp""", @ScriptDir, @SW_HIDE)
        EndIf
        FileDelete(@SystemDir&"\drivers\VBoxNetAdp"&$ADPVER&".sys")
      EndIf

      If $NET = 1 Then
        ;RunWait("sc stop VBoxNetFlt", @ScriptDir, @SW_HIDE)
        RunWait("sc stop VBoxNetLwf", @ScriptDir, @SW_HIDE)
        If @OSArch = "x86" Then
          ;RunWait(@ScriptDir&"\data\tools\snetcfg_x86.exe -v -u ""sun_VBoxNetFlt""", @ScriptDir, @SW_HIDE)
          RunWait(@ScriptDir&"\data\tools\snetcfg_x86.exe -v -u ""oracle_VBoxNetLwf""", @ScriptDir, @SW_HIDE)
        EndIf
        If @OSArch = "x64" Then
          ;RunWait(@ScriptDir&"\data\tools\snetcfg_x64.exe -v -u ""sun_VBoxNetFlt""", @ScriptDir, @SW_HIDE)
          RunWait(@ScriptDir&"\data\tools\snetcfg_x64.exe -v -u ""oracle_VBoxNetLwf""", @ScriptDir, @SW_HIDE)
        EndIf
        ;RunWait(@SystemDir&"\regsvr32.exe /S /U "&@SystemDir&"\VBoxNetFltNobj.dll", @ScriptDir, @SW_HIDE)
        ;RunWait("sc delete VBoxNetFlt", @ScriptDir, @SW_HIDE)
        RunWait("sc delete VBoxNetLwf", @ScriptDir, @SW_HIDE)
        ;FileDelete(@SystemDir&"\VBoxNetFltNobj.dll")
        ;FileDelete(@SystemDir&"\drivers\VBoxNetFlt.sys")
        FileDelete(@SystemDir & "\drivers\VBoxNetLwf.sys")
      EndIf

      If FileExists(@ScriptDir&"\"&$arch&"\") AND FileExists(@ScriptDir&"\vboxadditions\") Then
        DirMove(@ScriptDir&"\"&$arch&"\doc", @ScriptDir&"\vboxadditions\", 1)
        DirMove(@ScriptDir&"\"&$arch&"\ExtensionPacks", @ScriptDir&"\vboxadditions\", 1)
        DirMove(@ScriptDir&"\"&$arch&"\nls", @ScriptDir&"\vboxadditions\", 1)
        FileMove(@ScriptDir&"\"&$arch&"\*.iso", @ScriptDir&"\vboxadditions\guestadditions\", 9)
      EndIf

      If $msv = 1 Then
        FileDelete(@SystemDir&"\msvcp71.dll")
        FileDelete(@SystemDir&"\msvcr71.dll")
        FileDelete(@SystemDir&"\msvcrt.dll")
      EndIf

      If $msv = 2 Then
        FileDelete(@SystemDir&"\msvcp80.dll")
        FileDelete(@SystemDir&"\msvcr80.dll")
      EndIf

      If $DRV = 1 Then
        RunWait("sc delete VBoxDRV", @ScriptDir, @SW_HIDE)
      EndIf

      If $SUP = 1 Then
        RunWait("sc delete VBoxSUP", @ScriptDir, @SW_HIDE)
      EndIf

      If $USB = 1 Then
        RunWait("sc delete VBoxUSB", @ScriptDir, @SW_HIDE)
      EndIf

      If $MON = 1 Then
        RunWait("sc delete VBoxUSBMon", @ScriptDir, @SW_HIDE)
      EndIf

      If $ADP = 1 Then
        RunWait("sc delete VBoxNetAdp", @ScriptDir, @SW_HIDE)
      EndIf

      If $NET = 1 Then
        ;RunWait("sc delete VBoxNetFlt", @ScriptDir, @SW_HIDE)
        RunWait("sc delete VBoxNetLwf", @ScriptDir, @SW_HIDE)
      EndIf

      RunWait("sc delete VBoxSDS", @ScriptDir, @SW_HIDE)
      SplashOff()
    Else
      WinSetState(""&$VMTitle&" "&$Manager&"", "", BitAND(@SW_SHOW, @SW_RESTORE))
      WinSetState("] - "&$VMTitle&"", "", BitAND(@SW_SHOW, @SW_RESTORE))
    EndIf
  Else
    SplashOff()
    MsgBox(0, IniRead($Dir_Lang & $lng &".ini", "messages", "01", "NotFound"), IniRead($Dir_Lang & $lng &".ini", "start", "01", "NotFound"))
  EndIf
EndIf

Break(1)
Exit

Func ValidatePath($Path, $DefaultPath)
    ; Проверка диска и создание папки
    If FileExists(StringLeft($Path, 2)) Then DirCreate($Path)

    ; Проверка, что путь существует и является папкой
    If FileExists($Path) And StringInStr(FileGetAttrib($Path), "D") And Not StringInStr(FileGetAttrib($Path), "R") Then
			$Path = StringReplace($Path, "/", "\")
			$Path = StringRegExpReplace($Path, "\\{2,}", "\\")
			return $Path
    Else
        ; Если путь не существует или не папка, устанавливаем значение по умолчанию
        If FileExists(StringRegExp(StringLeft($Path, 2), ":")) Then
			$Path = StringReplace($Path, "/", "\")
			$Path = StringRegExpReplace($Path, "\\{2,}", "\\")
			return $DefaultPath
        Else
			$Path = StringReplace($Path, "/", "\")
			$Path = StringRegExpReplace($Path, "\\{2,}", "\\")
			return $DefaultPath
        EndIf
        ; Проверка существования пути
        If Not FileExists($Path) Then
			$Path = StringReplace($Path, "/", "\")
			$Path = StringRegExpReplace($Path, "\\{2,}", "\\")
            return $DefaultPath
        EndIf
    EndIf
EndFunc

Func ValidateAndSavePath222($Path, $iniSection, $iniKey, $DefaultPath)
    ; Проверка диска и создание папки
    If FileExists(StringLeft($Path, 2)) Then DirCreate($Path)

    ; Проверка, что путь существует и является папкой
    If FileExists($Path) And StringInStr(FileGetAttrib($Path), "D") And Not StringInStr(FileGetAttrib($Path), "R") Then
			$Path = StringReplace($Path, "/", "\")
			$Path = StringRegExpReplace($Path, "\\{2,}", "\\")
            IniWrite($var1, $iniSection, $iniKey, $Path)
    Else
        ; Если путь не существует или не папка, устанавливаем значение по умолчанию
        If FileExists(StringRegExp(StringLeft($Path, 2), ":")) Then
			$Path = StringReplace($Path, "/", "\")
			$Path = StringRegExpReplace($Path, "\\{2,}", "\\")
            IniWrite($var1, $iniSection, $iniKey, $DefaultPath)
        Else
			$Path = StringReplace($Path, "/", "\")
			$Path = StringRegExpReplace($Path, "\\{2,}", "\\")
            IniWrite($var1, $iniSection, $iniKey, $DefaultPath)
        EndIf
        ; Проверка существования пути
        If Not FileExists($Path) Then
			$Path = StringReplace($Path, "/", "\")
			$Path = StringRegExpReplace($Path, "\\{2,}", "\\")
            IniWrite($var1, $iniSection, $iniKey, $DefaultPath)
        EndIf
    EndIf
EndFunc

#cs
Func ValidateAndSavePath($Path, $iniSection, $iniKey, $DefaultPath)
    ; Проверка диска и создание папки
    If FileExists(StringLeft($Path, 2)) Then DirCreate($Path)

    ; Проверка, что путь существует и является папкой
    If FileExists($Path) And StringInStr(FileGetAttrib($Path), "D") And Not StringInStr(FileGetAttrib($Path), "R") Then
        ; Обработка пути без диска
        ;If StringRegExp(StringLeft($Path, 2), ":") Then
		If Not StringRegExp(StringLeft($Path, 3), ":\\") Then
            $Path = StringRegExpReplace($Path, "\h*[\/\\]+\h*", "\\")
            $Path = StringRegExpReplace($Path, "\\+$", "")
			$Path = StringRegExpReplace($Path, ":", ":\\")
			MsgBox(0, "", $Path)
            IniWrite($var1, $iniSection, $iniKey, $Path)
        Else
            $Path = StringRegExpReplace($Path, "\h*[\/\\]+\h*", "\\")
            $Path = StringRegExpReplace($Path, "\\+$", "")
            IniWrite($var1, $iniSection, $iniKey, $Path)
        EndIf
    Else
        ; Если путь не существует или не папка, устанавливаем значение по умолчанию
        If FileExists(StringRegExp(StringLeft($Path, 2), ":")) Then
            $Path = StringRegExpReplace($Path, "\h*[\/\\]+\h*", "\\")
            $Path = StringRegExpReplace($Path, "\\+$", "")
            IniWrite($var1, $iniSection, $iniKey, $DefaultPath)
        Else
            $Path = StringRegExpReplace($Path, "\h*[\/\\]+\h*", "\\")
            $Path = StringRegExpReplace($Path, "\\+$", "")
            IniWrite($var1, $iniSection, $iniKey, $DefaultPath)
        EndIf
        ; Проверка существования пути
        If Not FileExists($Path) Then
            $Path = StringRegExpReplace($Path, "\h*[\/\\]+\h*", "\\")
            $Path = StringRegExpReplace($Path, "\\+$", "")
            IniWrite($var1, $iniSection, $iniKey, $DefaultPath)
        EndIf
    EndIf
EndFunc
#ce

Func ValidateAndSavePath3333333($Path, $iniSection, $iniKey, $DefaultPath)
    ; Проверка диска и создание папки
	If FileExists(StringLeft($UserHome, 2)) Then DirCreate($UserHome)
		If FileExists($UserHome) AND StringInStr(FileGetAttrib($UserHome), "D") AND NOT StringInStr(FileGetAttrib($UserHome), "R") Then
			If NOT StringRegExp(StringLeft($UserHome, 3),":\\") Then
			$UserHome = StringRegExpReplace($UserHome, "\h*[\/\\]+\h*", "\\")
			$UserHome = StringRegExpReplace($UserHome, ":", ":\\")
			$UserHome = StringRegExpReplace($UserHome, "\\+$", "")
			IniWrite($var1, "userhome", "key", $UserHome)
			Else
			$UserHome = StringRegExpReplace($UserHome, "\h*[\/\\]+\h*", "\\")
			$UserHome = StringRegExpReplace($UserHome, "\\+$", "")
			IniWrite($var1, "userhome", "key", $UserHome)
			EndIf
		Else
			If FileExists(StringRegExp(StringLeft($UserHome, 2),":")) Then
			$UserHome = StringRegExpReplace($UserHome, "\h*[\/\\]+\h*", "\\")
			$UserHome = StringRegExpReplace($UserHome, "\\+$", "")
			IniWrite($var1, "userhome", "key", $DefaultUserHome)
			Else
			$UserHome = StringRegExpReplace($UserHome, "\h*[\/\\]+\h*", "\\")
			$UserHome = StringRegExpReplace($UserHome, "\\+$", "")
			IniWrite($var1, "userhome", "key", $DefaultUserHome)
			EndIf
			If NOT FileExists($UserHome) Then
			$UserHome = StringRegExpReplace($UserHome, "\h*[\/\\]+\h*", "\\")
			$UserHome = StringRegExpReplace($UserHome, "\\+$", "")
			IniWrite($var1, "userhome", "key", $DefaultUserHome)
			EndIf
	EndIf

	If FileExists(StringLeft($MachineFolder, 2)) Then DirCreate($MachineFolder)
		If FileExists($MachineFolder) AND StringInStr(FileGetAttrib($MachineFolder), "D") AND NOT StringInStr(FileGetAttrib($MachineFolder), "R") Then
			If NOT StringRegExp(StringLeft($MachineFolder, 3),":\\") Then
			$MachineFolder = StringRegExpReplace($MachineFolder, "\h*[\/\\]+\h*", "\\")
			$MachineFolder = StringRegExpReplace($MachineFolder, ":", ":\\")
			$MachineFolder = StringRegExpReplace($MachineFolder, "\\+$", "")
			IniWrite($var1, "MachineFolder", "key", $MachineFolder)
			Else
			$MachineFolder = StringRegExpReplace($MachineFolder, "\h*[\/\\]+\h*", "\\")
			$MachineFolder = StringRegExpReplace($MachineFolder, "\\+$", "")
			IniWrite($var1, "MachineFolder", "key", $MachineFolder)
			EndIf
		Else
			If FileExists(StringRegExp(StringLeft($MachineFolder, 2),":")) Then
			$MachineFolder = StringRegExpReplace($MachineFolder, "\h*[\/\\]+\h*", "\\")
			$MachineFolder = StringRegExpReplace($MachineFolder, "\\+$", "")
			IniWrite($var1, "MachineFolder", "key", $DefaultMachineFolder)
			Else
			$MachineFolder = StringRegExpReplace($MachineFolder, "\h*[\/\\]+\h*", "\\")
			$MachineFolder = StringRegExpReplace($MachineFolder, "\\+$", "")
			IniWrite($var1, "MachineFolder", "key", $DefaultMachineFolder)
			EndIf
			If NOT FileExists($MachineFolder) Then
			$MachineFolder = StringRegExpReplace($MachineFolder, "\h*[\/\\]+\h*", "\\")
			$MachineFolder = StringRegExpReplace($MachineFolder, "\\+$", "")
			IniWrite($var1, "MachineFolder", "key", $DefaultMachineFolder)
			EndIf
	EndIf
EndFunc

Func ShowWindows_VM()
  Opt("WinTitleMatchMode", 2)
  WinSetState("] - "&$VMTitle&"", "", BitAND(@SW_SHOW, @SW_RESTORE))
EndFunc

Func HideWindows_VM()
  Opt("WinTitleMatchMode", 2)
  WinSetState("] - "&$VMTitle&"", "", @SW_HIDE)
EndFunc

Func ShowWindows()
  Opt("WinTitleMatchMode", 3)
  WinSetState(""&$VMTitle&" "&$Manager&"", "", BitAND(@SW_SHOW, @SW_RESTORE))
EndFunc

Func HideWindows()
  Opt("WinTitleMatchMode", 3)
  WinSetState(""&$VMTitle&" "&$Manager&"", "", @SW_HIDE)
EndFunc

Func _IniWrite($filename, $section, $key, $value, $encoding = 256)
    If BitOR($encoding, 16, 32, 64, 128, 256, 512) <> Number(16+32+64+128+256+512) Then
        $encoding = 256
    EndIf
	If NOT IniRead($filename, $section, $key, "") Then
		$sDir = StringRegExpReplace($filename, "[^\\]+$", "")
		If NOT FileExists($sDir) Then DirCreate($sDir)
		FileOpen($filename, 1 + $encoding)
		FileClose($filename)
		IniWrite($filename, $section, $key, $value)
	EndIf
EndFunc

Func CheckExeFile($Directory)
	Local $sFileVer = StringRegExpReplace(FileGetVersion($Directory), "^(\d+\.\d+.\d+)?.*", "\1")
	If Not StringRegExp(FileRead(FileOpen($Directory, 16), 180), "5669727475616C426F782065786563757461626C65") Then
		GUICtrlSetData($Input100, IniRead($Dir_Lang & $lng &".ini", "download", "05", "NotFound"))
		Else
		WinSetTitle($Gui_Setup, "", IniRead($Dir_Lang & $lng &".ini", "download", "01", "NotFound")&" "&$sFileVer&"")
	EndIf
	If $sFileVer<=$32Bit Then
		GUICtrlSetData($Checkbox100, IniRead($Dir_Lang & $lng &".ini", "download", "07", "NotFound"))
		GUICtrlSetState($Checkbox100, $GUI_ENABLE)
		Else
		If @OSArch="x86" Then
		GUICtrlSetData($Checkbox100, IniRead($Dir_Lang & $lng &".ini", "download", "07", "NotFound")&" "&$sFileVer&">"&$32Bit&"")
		EndIf
		GUICtrlSetState($Checkbox100, $GUI_UNCHECKED)
		GUICtrlSetState($Checkbox100, $GUI_DISABLE)
	EndIf
	If @OSArch="x86" Then
		GUICtrlSetState($Checkbox110, $GUI_UNCHECKED)
		GUICtrlSetState($Checkbox110, $GUI_DISABLE)
		Else
		GUICtrlSetState($Checkbox100, $GUI_UNCHECKED)
		GUICtrlSetState($Checkbox100, $GUI_DISABLE)
	EndIf
EndFunc

Func _FileListToArray($sFilePath, $sFilter = "*", $iFlag = $FLTA_FILESFOLDERS, $bReturnPath = False)
	Local $sDelimiter = "|", $sFileList = "", $sFileName = "", $sFullPath = ""

	$sFilePath = StringRegExpReplace($sFilePath, "[\\/]+$", "") & "\" ; Ensure a single trailing backslash
	If $iFlag = Default Then $iFlag = $FLTA_FILESFOLDERS
	If $bReturnPath Then $sFullPath = $sFilePath
	If $sFilter = Default Then $sFilter = "*"

	If NOT FileExists($sFilePath) Then Return SetError(1, 0, 0)
	If StringRegExp($sFilter, "[\\/:><\|]|(?s)^\s*$") Then Return SetError(2, 0, 0)
	If NOT ($iFlag = 0 Or $iFlag = 1 Or $iFlag = 2) Then Return SetError(3, 0, 0)
	Local $hSearch = FileFindFirstFile($sFilePath & $sFilter)
	If @error Then Return SetError(4, 0, 0)
	While 1
		$sFileName = FileFindNextFile($hSearch)
		If @error Then ExitLoop
		If ($iFlag + @extended = 2) Then ContinueLoop
		$sFileList &= $sDelimiter & $sFullPath & $sFileName
	WEnd
	FileClose($hSearch)
	If $sFileList = "" Then Return SetError(4, 0, 0)
	Return StringSplit(StringTrimLeft($sFileList, 1), $sDelimiter)
EndFunc

Func _StringBetween($s_String, $s_Start, $s_End, $v_Case = -1)

	; Set case type
	Local $s_case = ""
	If $v_Case = Default Or $v_Case = -1 Then $s_case = "(?i)"

	; Escape characters
	Local $s_pattern_escape = "(\.|\||\*|\?|\+|\(|\)|\{|\}|\[|\]|\^|\$|\\)"
	$s_Start = StringRegExpReplace($s_Start, $s_pattern_escape, "\\$1")
	$s_End = StringRegExpReplace($s_End, $s_pattern_escape, "\\$1")

	; If you want data from beginning then replace blank start with beginning of string
	If $s_Start = "" Then $s_Start = "\A"

	; If you want data from a start to an end then replace blank with end of string
	If $s_End = "" Then $s_End = "\z"

	Local $a_ret = StringRegExp($s_String, "(?s)" & $s_case & $s_Start & "(.*?)" & $s_End, 3)

	If @error Then Return SetError(1, 0, 0)
	Return $a_ret
EndFunc   ;==>_StringBetween

Func Wm_List()
     $values5 = ""
     $aArray = _RecFileListToArray($UserHome, "*.vbox", 1, 1, $iSort, 2)
     If IsArray($aArray) Then
     For $i = 1 To $aArray[0]
		If Not StringRegExp($aArray[$i], ".bin") Then
		  $line = FileRead(FileOpen($aArray[$i], 128))
		  If StringRegExp($line, "VirtualBox") and StringRegExp($line, "Machine") and StringRegExp($line, "HardDisks") and StringRegExp($line, "Hardware") Then
			$values2 = _StringBetween($line, '<Machine', '>')
			If $values2<>0 Then
		    $values3 = _StringBetween($line, 'name="', '"')
			EndIf
		  If $values3<>0 and FileExists($aArray[$i]) Then
		  $values5 &= ""&$values3[0]&"|"
		  EndIf
		  EndIf
		EndIf
     Next
	 FileClose($line)
     EndIf
	 $values5 = StringTrimRight($values5, 1)
	 Return $values5
EndFunc

Func Wm_List_Update()
    Local $sList = Wm_List()
    Local $aList = StringSplit($sList, "|", 1)
    
    ; Читаем сохранённое имя из ini
    Local $VMStartName = IniRead($var1, "startvm", "key", "")
    
    ; Проверяем существование файла
    If Not FileExists($UserHome & "\Machines\" & $VMStartName) Then
        $VMStartName = ""
        IniWrite($var1, "startvm", "key", "")
    EndIf
    
    ; Получаем текущий выбранный элемент
    Local $currentSelection = GUICtrlRead($VMStart)
    
    ; Обновляем список только если он изменился
    If $sList <> $prevList Then
        GUICtrlSetData($VMStart, "") ; очистить список
        GUICtrlSetData($VMStart, $sList) ; заполнить новый список
        $prevList = $sList
    Else
        ; Если список не изменился, ничего не делаем — чтобы не дергать ComboBox
        Return
    EndIf
    
    ; Проверяем, есть ли текущий выбор в списке
    Local $foundCurrent = False
    For $i = 1 To $aList[0]
        If $aList[$i] = $currentSelection Then
            $foundCurrent = True
            ExitLoop
        EndIf
    Next
    
    ; Если текущий выбор есть в списке, оставляем его
    If $foundCurrent Then
        If (GUICtrlRead($Checkbox24)=4) Then
			GUICtrlSetData($VMStart, $aList[1])
        Else
			GUICtrlSetData($VMStart, $currentSelection)
        EndIf
        ;GUICtrlSetData($VMStart, $currentSelection)
    Else
        ; Если нет, пытаемся выбрать сохранённое имя из ini, если оно есть в списке
        Local $foundSaved = False
        For $i = 1 To $aList[0]
            If $aList[$i] = $VMStartName And $VMStartName <> "" Then
                GUICtrlSetData($VMStart, $VMStartName)
                $foundSaved = True
                ExitLoop
            EndIf
        Next
        
        ; Если и сохранённого имени нет, выбираем первый элемент списка
        If Not $foundSaved And $aList[0] > 0 Then
            GUICtrlSetData($VMStart, $aList[1])
        EndIf
    EndIf
EndFunc

Func Settings()
	If NOT $Settings Then
	Global $prevList = ""
    Opt("GUIOnEventMode", 1)
	AdlibRegister("Wm_List_Update", 1000)

#cs
    Global $Radio1, $Radio2, $Radio3, $Radio4, $Radio5, $Radio6, $Radio7, $Radio8, $Radio9, $Radio10, $Radio11, $Radio12, $Radio13, $Radio14
    Global $Checkbox01, $Checkbox02, $Checkbox03, $Checkbox04, $Checkbox05, $Checkbox06, $Checkbox07, $Checkbox08, $Checkbox09
    Global $Checkbox10, $Checkbox11, $Checkbox12, $Checkbox13, $Checkbox14, $Checkbox15, $Checkbox16, $Checkbox17, $Checkbox18
    Global $Checkbox19, $Checkbox20, $Checkbox21, $Checkbox22, $Checkbox23, $Checkbox24
    Global $Input1, $Input2, $Input3, $Input4, $Input5, $Input6
	Global $BTNUserHome, $BTNMachineFolder, $BTNStartVM
    Global $HomeRoot, $MachineRoot, $VMStart, $StartLng
#ce
    
	Local $WS_SYSMENU = 0x80000
    
	$Settings = GUICreate(IniRead($Dir_Lang & $lng &".ini", "settings", "01", "NotFound"), 580, 380, 193, 125, $WS_SYSMENU)
	GUISetOnEvent($GUI_EVENT_CLOSE, "ExitGUI")
    GUISetFont(9, 400, 0, "Arial")
	GUISetBkColor(0xFFFFFF)
	GUICtrlCreateTab(0, 0, 577, 358)
    
	GUICtrlCreateTabItem(IniRead($Dir_Lang & $lng &".ini", "settings", "01", "NotFound"))
	$Checkbox19 = GUICtrlCreateCheckbox("", 16, 40, 14, 14)
	GUICtrlCreateLabel(IniRead($Dir_Lang & $lng &".ini", "settings", "02", "NotFound"), 32, 39, 546, 14)
	$Checkbox20 = GUICtrlCreateCheckbox("", 16, 60, 14, 14)
	GUICtrlCreateLabel(IniRead($Dir_Lang & $lng &".ini", "settings", "03", "NotFound"), 32, 59, 546, 14)
	$Checkbox21 = GUICtrlCreateCheckbox("", 16, 80, 14, 14)
	GUICtrlCreateLabel(IniRead($Dir_Lang & $lng &".ini", "settings", "04", "NotFound"), 32, 79, 546, 14)
	If IniRead($var1, "net", "key", "NotFound") = 1 Then GUICtrlSetState($Checkbox19, $GUI_CHECKED)
	If IniRead($var1, "usb", "key", "NotFound") = 1 Then GUICtrlSetState($Checkbox20, $GUI_CHECKED)
	If IniRead($var1, "hotkeys", "key", "NotFound") = 1 Then GUICtrlSetState($Checkbox21, $GUI_CHECKED)

    GUICtrlCreateLabel(IniRead($Dir_Lang & $lng &".ini", "settings", "05", "NotFound"), 32, 102, 110, 14)
    $FileList = _FileListToArray($Dir_Lang, "*", 1)
    Local $sfilelist
    For $i = 1 to $FileList[0]
    $sfilelist &= StringReplace($FileList[$i], ".ini", "")&"|"
    Next
    $sfilelist = StringTrimRight($sfilelist, 1)
    $StartLng = GUICtrlCreateCombo("", 142, 100, 100, 0, $CBS_DROPDOWNLIST)
    GUICtrlSetData($StartLng, $sfilelist, IniRead($var1, "language", "key", "NotFound"))

	GuiCtrlCreateGroup("", 14, 120, 451, 60)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", 0, "wstr", 0)
	$Checkbox22 = GUICtrlCreateCheckbox(IniRead($Dir_Lang & $lng &".ini", "settings", "06", "NotFound"), 16, 130, 442, 14)
	GUICtrlSetOnEvent(-1, "CheckboxSettings")
	$User_Home = IniRead($var1, "userhome", "key", "NotFound")
	$HomeRoot = GUICtrlCreateInput($User_Home, 33, 148, 332, 21)

    $BTNUserHome = GUICtrlCreateButton(IniRead($Dir_Lang & $lng &".ini", "settings", "10", "NotFound"), 370, 147, 81, 23, 0)
    GUICtrlSetOnEvent(-1, "SRCUserHome")
    If IniRead($var1, "userhome", "key", "NotFound") = $DefaultUserHome Then
	GUICtrlSetState($HomeRoot, $GUI_DISABLE)
	GUICtrlSetState($BTNUserHome, $GUI_DISABLE)
	Else
	GUICtrlSetState($HomeRoot, $GUI_ENABLE)
	GUICtrlSetState($BTNUserHome, $GUI_ENABLE)
	GUICtrlSetState($Checkbox22, $GUI_CHECKED)
	Endif

	GuiCtrlCreateGroup("", 14, 178, 451, 60)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", 0, "wstr", 0)
	$Checkbox23 = GUICtrlCreateCheckbox(IniRead($Dir_Lang & $lng &".ini", "settings", "07", "NotFound"), 16, 190, 442, 14)
	GUICtrlSetOnEvent(-1, "CheckboxSettings")
	$MachineDir = IniRead($var1, "machinefolder", "key", "NotFound")
	$MachineRoot = GUICtrlCreateInput($MachineDir, 33, 208, 332, 21)
    $BTNMachineFolder = GUICtrlCreateButton(IniRead($Dir_Lang & $lng &".ini", "settings", "10", "NotFound"), 370, 207, 81, 23, 0)
    If IniRead($var1, "machinefolder", "key", "NotFound") = $DefaultMachineFolder Then
	GUICtrlSetState($MachineRoot, $GUI_DISABLE)
	GUICtrlSetState($BTNMachineFolder, $GUI_DISABLE)
	Else
	GUICtrlSetState($MachineRoot, $GUI_ENABLE)
	GUICtrlSetState($BTNMachineFolder, $GUI_ENABLE)
	GUICtrlSetState($Checkbox23, $GUI_CHECKED)
	Endif
    GUICtrlSetOnEvent(-1, "SRCMachineFolder")

	GuiCtrlCreateGroup("", 14, 236, 451, 60)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", 0, "wstr", 0)
	$Checkbox24 = GUICtrlCreateCheckbox(IniRead($Dir_Lang & $lng &".ini", "settings", "08", "NotFound"), 16, 250, 442, 14)
	GUICtrlSetOnEvent(-1, "CheckboxSettings")
	If IniRead($var1, "startvm", "key", "NotFound") = false Then
	$VMStart = GUICtrlCreateCombo("", 33, 268, 417, 21, $CBS_DROPDOWNLIST) ; стиль не редактируемого списка
	Wm_List_Update()
	Else
	$VMStart = GUICtrlCreateCombo("", 33, 268, 417, 21, $CBS_DROPDOWNLIST) ; стиль не редактируемого списка
	Wm_List_Update()
	Endif
    If IniRead($var1, "startvm", "key", "NotFound") = false Then
	GUICtrlSetState($VMStart, $GUI_DISABLE)
	Else
	GUICtrlSetState($VMStart, $GUI_ENABLE)
	GUICtrlSetState($Checkbox24, $GUI_CHECKED)
	Endif

    GUICtrlCreateButton(IniRead($Dir_Lang & $lng &".ini", "messages", "02", "NotFound"), 112, 302, 129, 27)
    GUICtrlSetOnEvent(-1, "SaveSettings")
    GUICtrlCreateButton(IniRead($Dir_Lang & $lng &".ini", "messages", "03", "NotFound"), 336, 302, 129, 27)
    GUICtrlSetOnEvent(-1, "ExitGUI")


    GUICtrlCreateTabItem(IniRead($Dir_Lang & $lng &".ini", "hotkey-settings", "01", "NotFound"))
    GUICtrlCreateLabel(IniRead($Dir_Lang & $lng &".ini", "hotkey-settings", "02", "NotFound"), 16, 40, 546, 60)

    $Radio7 = GUICtrlCreateRadio("Radio7", 20, 115, 14, 14)
    If IniRead($var1, "hotkeys", "userkey", "NotFound") = 0 Then
      GUICtrlSetState(-1, $GUI_CHECKED)
    EndIf

    $Radio8 = GUICtrlCreateRadio("Radio8", 154, 115, 14, 14)
    If IniRead($var1, "hotkeys", "userkey", "NotFound") = 1 Then
      GUICtrlSetState(-1, $GUI_CHECKED)
    EndIf

    GUICtrlCreateLabel(IniRead($Dir_Lang & $lng &".ini", "hotkey-settings", "03", "NotFound"), 38, 113, 100, 122)

    GUICtrlCreateLabel(IniRead($Dir_Lang & $lng &".ini", "tray", "01", "NotFound") &":", 172, 113, 120, 17)
    GUICtrlCreateLabel(IniRead($Dir_Lang & $lng &".ini", "tray", "02", "NotFound") &":", 172, 133, 120, 17)
    GUICtrlCreateLabel(IniRead($Dir_Lang & $lng &".ini", "tray", "03", "NotFound") &":", 172, 153, 120, 17)
    GUICtrlCreateLabel(IniRead($Dir_Lang & $lng &".ini", "tray", "04", "NotFound") &":", 172, 173, 120, 17)
    GUICtrlCreateLabel(IniRead($Dir_Lang & $lng &".ini", "tray", "05", "NotFound") &":", 172, 193, 120, 17)
    GUICtrlCreateLabel(IniRead($Dir_Lang & $lng &".ini", "tray", "06", "NotFound") &":", 172, 213, 120, 17)

    GUICtrlCreateLabel("CTRL +", 318, 113, 44, 17)
    GUICtrlCreateLabel("CTRL +", 318, 133, 44, 17)
    GUICtrlCreateLabel("CTRL +", 318, 153, 44, 17)
    GUICtrlCreateLabel("CTRL +", 318, 173, 44, 17)
    GUICtrlCreateLabel("CTRL +", 318, 193, 44, 17)
    GUICtrlCreateLabel("CTRL +", 318, 213, 44, 17)

    GUICtrlCreateLabel("ALT +", 395, 113, 44, 17)
    GUICtrlCreateLabel("ALT +", 395, 133, 44, 17)
    GUICtrlCreateLabel("ALT +", 395, 153, 44, 17)
    GUICtrlCreateLabel("ALT +", 395, 173, 44, 17)
    GUICtrlCreateLabel("ALT +", 395, 193, 44, 17)
    GUICtrlCreateLabel("ALT +", 395, 213, 44, 17)

    GUICtrlCreateLabel("SHIFT +", 460, 113, 44, 17)
    GUICtrlCreateLabel("SHIFT +", 460, 133, 44, 17)
    GUICtrlCreateLabel("SHIFT +", 460, 153, 44, 17)
    GUICtrlCreateLabel("SHIFT +", 460, 173, 44, 17)
    GUICtrlCreateLabel("SHIFT +", 460, 193, 44, 17)
    GUICtrlCreateLabel("SHIFT +", 460, 213, 44, 17)

    $Checkbox01 = GUICtrlCreateCheckbox("Checkbox01", 302, 112, 14, 14)
    If IniRead($var1, "hotkeys", "01", "NotFound") = "^" Then
      GUICtrlSetState(-1, $GUI_CHECKED)
    EndIf
    $Checkbox02 = GUICtrlCreateCheckbox("Checkbox02", 302, 132, 14, 14)
    If IniRead($var1, "hotkeys", "02", "NotFound") = "^" Then
      GUICtrlSetState(-1, $GUI_CHECKED)
    EndIf
    $Checkbox03 = GUICtrlCreateCheckbox("Checkbox03", 302, 152, 14, 14)
    If IniRead($var1, "hotkeys", "03", "NotFound") = "^" Then
      GUICtrlSetState(-1, $GUI_CHECKED)
    EndIf
    $Checkbox04 = GUICtrlCreateCheckbox("Checkbox04", 302, 172, 14, 14)
    If IniRead($var1, "hotkeys", "04", "NotFound") = "^" Then
      GUICtrlSetState(-1, $GUI_CHECKED)
    EndIf
    $Checkbox05 = GUICtrlCreateCheckbox("Checkbox05", 302, 192, 14, 14)
    If IniRead($var1, "hotkeys", "05", "NotFound") = "^" Then
      GUICtrlSetState(-1, $GUI_CHECKED)
    EndIf
    $Checkbox06 = GUICtrlCreateCheckbox("Checkbox06", 302, 212, 14, 14)
    If IniRead($var1, "hotkeys", "06", "NotFound") = "^" Then
      GUICtrlSetState(-1, $GUI_CHECKED)
    EndIf

    $Checkbox07 = GUICtrlCreateCheckbox("Checkbox07", 378, 112, 14, 14)
    If IniRead($var1, "hotkeys", "07", "NotFound") = "!" Then
      GUICtrlSetState(-1, $GUI_CHECKED)
    EndIf
    $Checkbox08 = GUICtrlCreateCheckbox("Checkbox08", 378, 132, 14, 14)
    If IniRead($var1, "hotkeys", "08", "NotFound") = "!" Then
      GUICtrlSetState(-1, $GUI_CHECKED)
    EndIf
    $Checkbox09 = GUICtrlCreateCheckbox("Checkbox09", 378, 152, 14, 14)
    If IniRead($var1, "hotkeys", "09", "NotFound") = "!" Then
      GUICtrlSetState(-1, $GUI_CHECKED)
    EndIf
    $Checkbox10 = GUICtrlCreateCheckbox("Checkbox10", 378, 172, 14, 14)
    If IniRead($var1, "hotkeys", "10", "NotFound") = "!" Then
      GUICtrlSetState(-1, $GUI_CHECKED)
    EndIf
    $Checkbox11 = GUICtrlCreateCheckbox("Checkbox11", 378, 192, 14, 14)
    If IniRead($var1, "hotkeys", "11", "NotFound") = "!" Then
      GUICtrlSetState(-1, $GUI_CHECKED)
    EndIf
    $Checkbox12 = GUICtrlCreateCheckbox("Checkbox12", 378, 212, 14, 14)
    If IniRead($var1, "hotkeys", "12", "NotFound") = "!" Then
      GUICtrlSetState(-1, $GUI_CHECKED)
    EndIf

    $Checkbox13 = GUICtrlCreateCheckbox("Checkbox13", 444, 112, 14, 14)
    If IniRead($var1, "hotkeys", "13", "NotFound") = "+" Then
      GUICtrlSetState(-1, $GUI_CHECKED)
    EndIf
    $Checkbox14 = GUICtrlCreateCheckbox("Checkbox14", 444, 132, 14, 14)
    If IniRead($var1, "hotkeys", "14", "NotFound") = "+" Then
      GUICtrlSetState(-1, $GUI_CHECKED)
    EndIf
    $Checkbox15 = GUICtrlCreateCheckbox("Checkbox15", 444, 152, 14, 14)
    If IniRead($var1, "hotkeys", "15", "NotFound") = "+" Then
      GUICtrlSetState(-1, $GUI_CHECKED)
    EndIf
    $Checkbox16 = GUICtrlCreateCheckbox("Checkbox16", 444, 172, 14, 14)
    If IniRead($var1, "hotkeys", "16", "NotFound") = "+" Then
      GUICtrlSetState(-1, $GUI_CHECKED)
    EndIf
    $Checkbox17 = GUICtrlCreateCheckbox("Checkbox17", 444, 192, 14, 14)
    If IniRead($var1, "hotkeys", "17", "NotFound") = "+" Then
      GUICtrlSetState(-1, $GUI_CHECKED)
    EndIf
    $Checkbox18 = GUICtrlCreateCheckbox("Checkbox18", 444, 212, 14, 14)
    If IniRead($var1, "hotkeys", "18", "NotFound") = "+" Then
      GUICtrlSetState(-1, $GUI_CHECKED)
    EndIf

    $Input1 = GUICtrlCreateInput(IniRead($var1, "hotkeys", "19", "NotFound"), 524, 111, 24, 21)
    $Input2 = GUICtrlCreateInput(IniRead($var1, "hotkeys", "20", "NotFound"), 524, 131, 24, 21)
    $Input3 = GUICtrlCreateInput(IniRead($var1, "hotkeys", "21", "NotFound"), 524, 151, 24, 21)
    $Input4 = GUICtrlCreateInput(IniRead($var1, "hotkeys", "22", "NotFound"), 524, 171, 24, 21)
    $Input5 = GUICtrlCreateInput(IniRead($var1, "hotkeys", "23", "NotFound"), 524, 191, 24, 21)
    $Input6 = GUICtrlCreateInput(IniRead($var1, "hotkeys", "24", "NotFound"), 524, 211, 24, 21)

    GUICtrlCreateButton(IniRead($Dir_Lang & $lng &".ini", "messages", "02", "NotFound"), 112, 240, 129, 27)
    GUICtrlSetOnEvent(-1, "OKHotKeysSet")
    GUICtrlCreateButton(IniRead($Dir_Lang & $lng &".ini", "messages", "03", "NotFound"), 336, 240, 129, 27)
    GUICtrlSetOnEvent(-1, "ExitGUI")


    GUICtrlCreateTabItem(IniRead($Dir_Lang & $lng &".ini", "about", "01", "NotFound"))
    GUICtrlCreateLabel(". : Portable-VirtualBox Launcher v"& $version &" : .", 100, 40, 448, 26)
	GUICtrlSetOnEvent(-1, "github")
    GUICtrlSetFont(-1, 14, 800, 4, "Arial")
    GUICtrlCreateLabel("Download and Support: http://github.com/Deac2/Portable-VirtualBox", 40, 70, 500, 20)
	GUICtrlSetOnEvent(-1, "github")
    GUICtrlSetFont(-1, 8, 800, 0, "Arial")
    GUICtrlCreateLabel("VirtualBox is a family of powerful x86 virtualization products for enterprise as well as home use. Not only is VirtualBox an extremely feature rich, high performance product for enterprise customers, it is also the only professional solution that is freely available as Open Source Software under the terms of the GNU General Public License(GPL).", 16, 94, 546, 55)
    GUICtrlSetFont(-1, 8, 400, 0, "Arial")
    GUICtrlCreateLabel("Download and Support: http://www.virtualbox.org", 88, 133, 300, 14)
    GUICtrlSetFont(-1, 8, 800, 0, "Arial")
    GUICtrlCreateLabel("Presently, VirtualBox runs on Windows, Linux, Macintosh and OpenSolaris hosts and supports a large number of guest operating systems including but not limited to Windows(NT 4.0, 2000, XP, Server 2003, Vista), DOS/Windows 3.x, Linux(2.4 and 2.6), and OpenBSD.", 16, 149, 546, 40)
    GUICtrlSetFont(-1, 8, 400, 0, "Arial")
    GUICtrlCreateLabel("VirtualBox is being actively developed with frequent releases and has an ever growing list of features, supported guest operating systems and platforms it runs on. VirtualBox is a community effort backed by a dedicated company: everyone is encouraged to contribute while Sun ensures the product always meets professional quality criteria.", 16, 192, 546, 40)
    GUICtrlSetFont(-1, 8, 400, 0, "Arial")

    GUICtrlCreateButton(IniRead($Dir_Lang & $lng &".ini", "messages", "03", "NotFound"), 236, 240, 129, 27)
    GUICtrlSetOnEvent(-1, "ExitGUI")

    GUISetState()
	Endif
EndFunc

Func SRCUserHome()
  Local $PathHR = FileSelectFolder(IniRead($Dir_Lang & $lng &".ini", "settings", "11", "NotFound"), "", 1+4)
  If NOT @error Then
    GUICtrlSetData($HomeRoot, $PathHR)
  EndIf
EndFunc

Func SRCMachineFolder()
  Local $PathHR = FileSelectFolder(IniRead($Dir_Lang & $lng &".ini", "srcmachinefolder", "01", "NotFound"), "", 1+4)
  If NOT @error Then
    GUICtrlSetData($MachineRoot, $PathHR)
  EndIf
EndFunc

Func SaveSettings()
$error = 0
Local $Net = GUICtrlRead($Checkbox19)
If Not ($Net=1) Then
IniWrite($var1, "net", "key", "0")
Else
IniWrite($var1, "net", "key", "1")
EndIf

Local $USB = GUICtrlRead($Checkbox20)
If Not ($USB=1) Then
IniWrite($var1, "usb", "key", "0")
Else
IniWrite($var1, "usb", "key", "1")
EndIf

Local $hotkeys = GUICtrlRead($Checkbox21)
If Not ($hotkeys=1) Then
IniWrite($var1, "hotkeys", "key", "0")
Else
IniWrite($var1, "hotkeys", "key", "1")
EndIf

    $FileList = _FileListToArray($Dir_Lang, "*", 1)
    Local $Lang, $sfilelist
    For $i = 1 to $FileList[0]
    $sfilelist = StringReplace($FileList[$i], ".ini", "")
    If GUICtrlRead($StartLng) = $sfilelist Then
    $Lang = $sfilelist
    EndIf
    Next
    If $Lang = "" AND NOT IniRead($var1, "language", "key", "")=GUICtrlRead($StartLng) Then
	Else
		IniWrite($var1, "language", "key", GUICtrlRead($StartLng))
	EndIf

	Local $CheckHomeRoot = GUICtrlRead($Checkbox22)
	Local $homedir = GUICtrlRead($HomeRoot)
	If Not ($CheckHomeRoot = 1) Then
    IniWrite($var1, "userhome", "key", $DefaultUserHome)
    GUICtrlSetData($HomeRoot, $DefaultUserHome)
	Else
	GUICtrlSetData($HomeRoot, ValidatePath($homedir, $DefaultUserHome))
	IniWrite($var1, "userhome", "key", ValidatePath($homedir, $DefaultUserHome))
	EndIf

	Local $CheckMachineRoot = GUICtrlRead($Checkbox23)
	Local $MachineDir = GUICtrlRead($MachineRoot)
	If Not ($CheckMachineRoot = 1) Then
    IniWrite($var1, "machinefolder", "key", $DefaultMachineFolder)
    GUICtrlSetData($MachineRoot, $DefaultMachineFolder)
	Else
	GUICtrlSetData($MachineRoot, ValidatePath($MachineDir, $DefaultMachineFolder))
	IniWrite($var1, "machinefolder", "key", ValidatePath($MachineDir, $DefaultMachineFolder))
	EndIf

	Local $CheckVMStart = GUICtrlRead($Checkbox24)
	Local $VMStartName = GUICtrlRead($VMStart)
	If Not ($CheckVMStart=1) Then
    IniWrite($var1, "startvm", "key", "")
	Else
	Local $Patch = ""
	$VMStartSearch = StringRegExpReplace($VMStartName, "\h*[{}\[\]]+\h*", "_")
	$aArray = _RecFileListToArray($UserHome, "*"&$VMStartSearch&".vbox", 1, 1, 0, 2)
    If IsArray($aArray) Then
		For $i = 1 To $aArray[0]
		local $Patch = $aArray[$i]
		Next
    Endif

	if StringRegExp($VMStartName, "{[[:xdigit:]]{8}-[[:xdigit:]]{4}-[34][[:xdigit:]]{3}-[89abAB][[:xdigit:]]{3}-[[:xdigit:]]{12}}") Then
	IniWrite($var1, "startvm", "key", $VMStartName)
	Else
	If FileExists($Patch) Then
      IniWrite($var1, "startvm", "key", $VMStartName)
	Else
	  Wm_List_Update()
	EndIf
	EndIf
  EndIf
	if not $error then
	MsgBox(0, IniRead($Dir_Lang & $lng &".ini", "messages", "04", "NotFound"), IniRead($Dir_Lang & $lng &".ini", "messages", "05", "NotFound"))
	EndIf
EndFunc

Func CheckboxSettings111()
    Local $CheckHomeRoot = GUICtrlRead($Checkbox22)
    If $CheckHomeRoot <> $prevCheckHomeRoot Then
        If $CheckHomeRoot <> 4 Then
            GUICtrlSetState($HomeRoot, $GUI_ENABLE)
            GUICtrlSetState($BTNUserHome, $GUI_ENABLE)
        Else
            GUICtrlSetState($HomeRoot, $GUI_DISABLE)
            GUICtrlSetState($BTNUserHome, $GUI_DISABLE)
        EndIf
        $prevCheckHomeRoot = $CheckHomeRoot
    EndIf

    Local $CheckMachineRoot = GUICtrlRead($Checkbox23)
    If $CheckMachineRoot <> $prevCheckMachineRoot Then
        If $CheckMachineRoot <> 4 Then
            GUICtrlSetState($MachineRoot, $GUI_ENABLE)
            GUICtrlSetState($BTNMachineFolder, $GUI_ENABLE)
        Else
            GUICtrlSetState($MachineRoot, $GUI_DISABLE)
            GUICtrlSetState($BTNMachineFolder, $GUI_DISABLE)
        EndIf
        $prevCheckMachineRoot = $CheckMachineRoot
    EndIf

    Local $CheckVMStart = GUICtrlRead($Checkbox24)
    If $CheckVMStart <> $prevCheckVMStart Then
        If $CheckVMStart <> 4 Then
            GUICtrlSetState($VMStart, $GUI_ENABLE)
            GUICtrlSetState($BTNStartVM, $GUI_ENABLE)
        Else
            GUICtrlSetState($VMStart, $GUI_DISABLE)
            GUICtrlSetState($BTNStartVM, $GUI_DISABLE)
        EndIf
        $prevCheckVMStart = $CheckVMStart
    EndIf
EndFunc

Func CheckboxSettings()
;Wm_List_Update()

Local $CheckHomeRoot = GUICtrlRead($Checkbox22)
If Not ($CheckHomeRoot=4) Then
GUICtrlSetState($HomeRoot, $GUI_ENABLE)
GUICtrlSetState($BTNUserHome, $GUI_ENABLE)
Else
GUICtrlSetState($HomeRoot, $GUI_DISABLE)
GUICtrlSetState($BTNUserHome, $GUI_DISABLE)
EndIf

Local $CheckMachineRoot = GUICtrlRead($Checkbox23)
If Not ($CheckMachineRoot=4) Then
GUICtrlSetState($MachineRoot, $GUI_ENABLE)
GUICtrlSetState($BTNMachineFolder, $GUI_ENABLE)
Else
GUICtrlSetState($MachineRoot, $GUI_DISABLE)
GUICtrlSetState($BTNMachineFolder, $GUI_DISABLE)
EndIf

Local $CheckVMStart = GUICtrlRead($Checkbox24)
If Not ($CheckVMStart=4) Then
GUICtrlSetState($VMStart, $GUI_ENABLE)
Else
GUICtrlSetState($VMStart, $GUI_DISABLE)
EndIf
EndFunc

Func OKHotKeysSet()
  If GUICtrlRead($Radio7) = $GUI_CHECKED Then
    IniWrite($var1, "hotkeys", "userkey", "0")
    IniWrite($var1, "hotkeys", "01", "^")
    IniWrite($var1, "hotkeys", "02", "^")
    IniWrite($var1, "hotkeys", "03", "^")
    IniWrite($var1, "hotkeys", "04", "^")
    IniWrite($var1, "hotkeys", "05", "^")
    IniWrite($var1, "hotkeys", "06", "^")

    IniWrite($var1, "hotkeys", "07", "")
    IniWrite($var1, "hotkeys", "08", "")
    IniWrite($var1, "hotkeys", "09", "")
    IniWrite($var1, "hotkeys", "10", "")
    IniWrite($var1, "hotkeys", "11", "")
    IniWrite($var1, "hotkeys", "12", "")

    IniWrite($var1, "hotkeys", "13", "")
    IniWrite($var1, "hotkeys", "14", "")
    IniWrite($var1, "hotkeys", "15", "")
    IniWrite($var1, "hotkeys", "16", "")
    IniWrite($var1, "hotkeys", "17", "")
    IniWrite($var1, "hotkeys", "18", "")

    IniWrite($var1, "hotkeys", "19", "1")
    IniWrite($var1, "hotkeys", "20", "2")
    IniWrite($var1, "hotkeys", "21", "3")
    IniWrite($var1, "hotkeys", "22", "4")
    IniWrite($var1, "hotkeys", "23", "5")
    IniWrite($var1, "hotkeys", "24", "6")
    MsgBox(0, IniRead($Dir_Lang & $lng &".ini", "messages", "04", "NotFound"), IniRead($Dir_Lang & $lng &".ini", "messages", "05", "NotFound"))
  Else
    If GUICtrlRead($Input1) = false OR GUICtrlRead($Input2) = false OR GUICtrlRead($Input3) = false OR GUICtrlRead($Input4) = false OR GUICtrlRead($Input5) = false OR GUICtrlRead($Input6) = false Then
      MsgBox(0, IniRead($Dir_Lang & $lng &".ini", "messages", "01", "NotFound"), IniRead($Dir_Lang & $lng &".ini", "hotkey-settings", "04", "NotFound"))
    Else
      IniWrite($var1, "hotkeys", "userkey", "1")
      If GUICtrlRead($CheckBox01) = $GUI_CHECKED Then
        IniWrite($var1, "hotkeys", "01", "^")
      Else
        IniWrite($var1, "hotkeys", "01", "")
      EndIf
      If GUICtrlRead($CheckBox02) = $GUI_CHECKED Then
        IniWrite($var1, "hotkeys", "02", "^")
      Else
        IniWrite($var1, "hotkeys", "02", "")
      EndIf
      If GUICtrlRead($CheckBox03) = $GUI_CHECKED Then
        IniWrite($var1, "hotkeys", "03", "^")
      Else
        IniWrite($var1, "hotkeys", "03", "")
      EndIf
      If GUICtrlRead($CheckBox04) = $GUI_CHECKED Then
        IniWrite($var1, "hotkeys", "04", "^")
      Else
        IniWrite($var1, "hotkeys", "04", "")
      EndIf
      If GUICtrlRead($CheckBox05) = $GUI_CHECKED Then
        IniWrite($var1, "hotkeys", "05", "^")
      Else
        IniWrite($var1, "hotkeys", "05", "")
      EndIf
      If GUICtrlRead($CheckBox06) = $GUI_CHECKED Then
        IniWrite($var1, "hotkeys", "06", "^")
      Else
        IniWrite($var1, "hotkeys", "06", "")
      EndIf

      If GUICtrlRead($CheckBox07) = $GUI_CHECKED Then
        IniWrite($var1, "hotkeys", "07", "!")
      Else
        IniWrite($var1, "hotkeys", "07", "")
      EndIf
      If GUICtrlRead($CheckBox08) = $GUI_CHECKED Then
        IniWrite($var1, "hotkeys", "08", "!")
      Else
        IniWrite($var1, "hotkeys", "08", "")
      EndIf
      If GUICtrlRead($CheckBox09) = $GUI_CHECKED Then
        IniWrite($var1, "hotkeys", "09", "!")
      Else
        IniWrite($var1, "hotkeys", "09", "")
      EndIf
      If GUICtrlRead($CheckBox10) = $GUI_CHECKED Then
        IniWrite($var1, "hotkeys", "10", "!")
      Else
        IniWrite($var1, "hotkeys", "10", "")
      EndIf
      If GUICtrlRead($CheckBox11) = $GUI_CHECKED Then
        IniWrite($var1, "hotkeys", "11", "!")
      Else
        IniWrite($var1, "hotkeys", "11", "")
      EndIf
      If GUICtrlRead($CheckBox12) = $GUI_CHECKED Then
        IniWrite($var1, "hotkeys", "12", "!")
      Else
        IniWrite($var1, "hotkeys", "12", "")
      EndIf

      If GUICtrlRead($CheckBox13) = $GUI_CHECKED Then
        IniWrite($var1, "hotkeys", "13", "+")
      Else
        IniWrite($var1, "hotkeys", "13", "")
      EndIf
      If GUICtrlRead($CheckBox14) = $GUI_CHECKED Then
        IniWrite($var1, "hotkeys", "14", "+")
      Else
        IniWrite($var1, "hotkeys", "14", "")
      EndIf
      If GUICtrlRead($CheckBox15) = $GUI_CHECKED Then
        IniWrite($var1, "hotkeys", "15", "+")
      Else
        IniWrite($var1, "hotkeys", "15", "")
      EndIf
      If GUICtrlRead($CheckBox16) = $GUI_CHECKED Then
        IniWrite($var1, "hotkeys", "16", "+")
      Else
        IniWrite($var1, "hotkeys", "16", "")
      EndIf
      If GUICtrlRead($CheckBox17) = $GUI_CHECKED Then
        IniWrite($var1, "hotkeys", "17", "+")
      Else
        IniWrite($var1, "hotkeys", "17", "")
      EndIf
      If GUICtrlRead($CheckBox18) = $GUI_CHECKED Then
        IniWrite($var1, "hotkeys", "18", "+")
      Else
        IniWrite($var1, "hotkeys", "18", "")
      EndIf

      IniWrite($var1, "hotkeys", "19", GUICtrlRead($Input1))
      IniWrite($var1, "hotkeys", "20", GUICtrlRead($Input2))
      IniWrite($var1, "hotkeys", "21", GUICtrlRead($Input3))
      IniWrite($var1, "hotkeys", "22", GUICtrlRead($Input4))
      IniWrite($var1, "hotkeys", "23", GUICtrlRead($Input5))
      IniWrite($var1, "hotkeys", "24", GUICtrlRead($Input6))
      MsgBox(0, IniRead($Dir_Lang & $lng &".ini", "messages", "04", "NotFound"), IniRead($Dir_Lang & $lng &".ini", "messages", "05", "NotFound"))
    EndIf
  EndIf
EndFunc

Func OKLanguage()
    $FileList = _FileListToArray($Dir_Lang, "*", 1)
    Local $Lang, $sfilelist
    For $i = 1 to $FileList[0]
    $sfilelist = StringReplace($FileList[$i], ".ini", "")
    If GUICtrlRead($StartLng) = $sfilelist Then
    $Lang = $sfilelist
    EndIf
    Next

  If $Lang = "" Then
    MsgBox(0, IniRead($Dir_Lang & $lng &".ini", "messages", "01", "NotFound"), IniRead($Dir_Lang & $lng &".ini", "oklanguage", "01", "NotFound"))
  Else
    IniWrite($var1, "language", "key", GUICtrlRead($StartLng))
	If IniRead($var1, "lang", "key", "NotFound") = 1 Then
      MsgBox(0, IniRead($Dir_Lang & $lng &".ini", "messages", "04", "NotFound"), IniRead($Dir_Lang & $lng &".ini", "messages", "05", "NotFound"))
	EndIf
	$cl = 0
  EndIf
EndFunc

Func ExitGUI()
  AdlibUnRegister("Wm_List_Update")
  GUIDelete()
  $cl = 0
  $Settings = 0
EndFunc

Func ExitScript()
  AdlibUnRegister("Wm_List_Update")
  Opt("WinTitleMatchMode", 2)
  WinClose("VirtualBoxVM", "")
  WinWaitClose("VirtualBoxVM", "")
  WinClose("] - "&$VMTitle&"")
  WinWaitClose("] - "&$VMTitle&"")
  WinClose($VMTitle, "")
  ProcessNameClose("VirtualBox.exe")
  ProcessNameClose("VBoxManage.exe")
  ProcessNameClose("VirtualBoxVM.exe")
  ProcessNameClose("VBoxSVC.exe")
  ProcessNameClose("VBoxSDS.exe")
EndFunc

Func ProcessNameClose($Process)
	Local $ListArray = ProcessList($Process)
	For $i = 0 To $ListArray[0][0]
	If ProcessExists($ListArray[$i][1]) Then
	ProcessClose($ListArray[$i][1])
	EndIf
	Next
EndFunc

Func DownloadFile()
  GUICtrlSetState($Button100, $GUI_DISABLE)
  GUICtrlSetState($Button200, $GUI_DISABLE)
  Local $download1 = InetGet(IniRead(@ScriptDir&"\data\settings\vboxinstall.ini", "download", "key1", "NotFound"), $pwd&"\VirtualBox.exe", 8, 1)
  Local $download2 = IniRead(@ScriptDir&"\data\settings\vboxinstall.ini", "download", "key1", "NotFound")
  Do
    Sleep(250)
    Local $bytes = 0
    $bytes = InetGetInfo($download1, 0)
	$total_bytes = InetGetInfo($download1, 1)
    GUICtrlSetData($Input200, IniRead($Dir_Lang & $lng &".ini", "status", "01", "NotFound") &" "& $download2 & @LF & DisplayDownloadStatus($bytes,$total_bytes) )
	;GUICtrlSetData($ProgressBar1,Round(100*$bytes/$total_bytes)) ; <<<TODO: Ticket 3509714
  Until InetGetInfo($download1, 2)
  InetClose($download1)
  Local $download3 = InetGet(IniRead(@ScriptDir&"\data\settings\vboxinstall.ini", "download", "key2", "NotFound"), $pwd&"\Extension", 8, 1)
  Local $download4 = IniRead(@ScriptDir&"\data\settings\vboxinstall.ini", "download", "key2", "NotFound")
  $total_bytes = InetGetInfo($download3, 1)
  Do
    Sleep(250)
    Local $bytes = 0
    $bytes = InetGetInfo($download3, 0)
	$total_bytes = InetGetInfo($download3, 1)
    GUICtrlSetData($Input200, $download4 & @LF & DisplayDownloadStatus($bytes,$total_bytes))
  Until InetGetInfo($download3, 2)
  InetClose($download3)
  If FileExists(@ScriptDir&"\virtualbox.exe") Then
    GUICtrlSetData($Input100, @ScriptDir&"\virtualbox.exe")
    CheckExeFile(@ScriptDir&"\VirtualBox.exe")
  EndIf
  GUICtrlSetData($Input200, @LF & IniRead($Dir_Lang & $lng &".ini", "status", "02", "NotFound"))
  GUICtrlSetState($Button100, $GUI_ENABLE)
  GUICtrlSetState($Button200, $GUI_ENABLE)
  $bytes = 0
EndFunc

Func DownloadGithub($File, $Save)
  Local $download = InetGet($File, @ScriptDir&"\"&$Save, 8, 1)
  Do
    Sleep(250)
  Until InetGetInfo($download, 2)
  InetClose($download)
EndFunc

Func DisplayDownloadStatus($downloaded_bytes,$total_bytes)
	if $total_bytes > 0 Then
		Return RoundForceDecimalMB($downloaded_bytes)& "MB / "&RoundForceDecimalMB($total_bytes)&"MB ("&Round(100*$downloaded_bytes/$total_bytes)&"%)"
	Else
		Return RoundForceDecimalMB($downloaded_bytes)& "MB"
	EndIf
EndFunc

Func RoundForceDecimalMB($number)
	$rounded = Round($number/1048576, 1)
	If NOT StringInStr($rounded, ".") Then
		Return $rounded & ".0"
	Else
		Return $rounded
	EndIf
EndFunc   ;==>RoundForceDecimal

Func SearchFile()
  Local $FilePath = FileOpenDialog(IniRead($Dir_Lang & $lng &".ini", "status", "03", "NotFound"), @ScriptDir, "(*Box*.exe)", 1+2)
  If NOT @error Then
    GUICtrlSetData($Input100, $FilePath)
    GUICtrlSetState($Button200,$GUI_ENABLE)
	CheckExeFile($FilePath)
  EndIf
EndFunc

Func UseSettings()
  If GUICtrlRead($Input100) = "" OR GUICtrlRead($Input100) = IniRead($Dir_Lang & $lng &".ini", "download", "05", "NotFound") Then
    Local $SourceFile = @ScriptDir&"\forgetit"
  Else
    Local $SourceFile = GUICtrlRead($Input100)
	Local $SourceDir = StringRegExpReplace($SourceFile, "[^\\]+$", "")
  EndIf

  If NOT (FileExists(@ScriptDir&"\virtualbox.exe") OR FileExists($SourceFile) AND (GUICtrlRead($Checkbox100) = $GUI_CHECKED OR GUICtrlRead($Checkbox110) = $GUI_CHECKED)) Then
    Break(1)
    Exit
  EndIf

  If (FileExists(@ScriptDir&"\virtualbox.exe") OR FileExists($SourceFile)) AND (GUICtrlRead($Checkbox100) = $GUI_CHECKED OR GUICtrlRead($Checkbox110) = $GUI_CHECKED) Then
    GUICtrlSetData($Input200, @LF & IniRead($Dir_Lang & $lng &".ini", "status", "04", "NotFound"))
    If FileExists(@ScriptDir&"\virtualbox.exe") Then
      Run(@ScriptDir& "\virtualbox.exe -x -p temp", @ScriptDir, @SW_HIDE)
      Opt("WinTitleMatchMode", 2)
      WinWait("VirtualBox Installer", "")
      ControlClick("VirtualBox Installer", "OK", "TButton1")
      WinClose("VirtualBox Installer", "")
    EndIf

    If FileExists($SourceFile) Then
      Run($SourceFile & " -x -p temp", @ScriptDir, @SW_HIDE)
      Opt("WinTitleMatchMode", 2)
      WinWait("VirtualBox Installer", "")
      ControlClick("VirtualBox Installer", "OK", "TButton1")
      WinClose("VirtualBox Installer", "")
    EndIf
  EndIf

	Local $Patch = ""
	$aArray = _RecFileListToArray($SourceDir, "*Extension*", 1, 1, 0, 2)
	If IsArray($aArray) Then
      For $i = 1 To $aArray[0]
      $PatchExtension = $aArray[$i]
      Next
	Endif
    If FileExists($PatchExtension) Then
      RunWait('"'&@ScriptDir&'\data\tools\7za.exe"'&" x -o"&'"'&@ScriptDir&'\temp\"'&" "&'"'&$PatchExtension&'"', @ScriptDir, @SW_HIDE)
      RunWait('"'&@ScriptDir&'\data\tools\7za.exe"'&" x -o"&'"'&@ScriptDir&'\temp\ExtensionPacks\Oracle_VM_VirtualBox_Extension_Pack\"'&" "&'"'&@ScriptDir&'\temp\Extension~"', @ScriptDir, @SW_HIDE)
    EndIf

  If GUICtrlRead($Checkbox100) = $GUI_CHECKED AND FileExists(@ScriptDir&"\temp") Then
    GUICtrlSetData($Input200, @LF & IniRead($Dir_Lang & $lng &".ini", "status", "05", "NotFound"))
    RunWait("cmd /c ren ""%CD%\temp\*_x86.msi"" x86.msi", @ScriptDir, @SW_HIDE)
    RunWait("cmd /c msiexec.exe /quiet /a ""%CD%\temp\x86.msi"" TARGETDIR=""%CD%\temp\x86""", @ScriptDir, @SW_HIDE)
    DirCopy(@ScriptDir&"\temp\x86\PFiles\Oracle\VirtualBox", @ScriptDir&"\app32", 1)
    FileCopy(@ScriptDir&"\temp\x86\PFiles\Oracle\VirtualBox\*", @ScriptDir&"\app32", 9)
    DirRemove(@ScriptDir&"\temp\ExtensionPacks\Oracle_VM_VirtualBox_Extension_Pack\darwin.amd64", 1)
    DirRemove(@ScriptDir&"\temp\ExtensionPacks\Oracle_VM_VirtualBox_Extension_Pack\darwin.arm64", 1)
    DirRemove(@ScriptDir&"\temp\ExtensionPacks\Oracle_VM_VirtualBox_Extension_Pack\linux.amd64", 1)
    DirRemove(@ScriptDir&"\temp\ExtensionPacks\Oracle_VM_VirtualBox_Extension_Pack\solaris.amd64", 1)
    DirCopy(@ScriptDir&"\temp\ExtensionPacks\Oracle_VM_VirtualBox_Extension_Pack", @ScriptDir&"\app32\ExtensionPacks\Oracle_VM_VirtualBox_Extension_Pack", 1)
    FileDelete(@ScriptDir&"\app32\*.rtf")
    FileDelete(@ScriptDir&"\app32\*.chm")
    FileDelete(@ScriptDir&"\app32\VirtualBox.*.xml")
    FileDelete(@ScriptDir&"\app32\VirtualBox*.png")
    DirRemove(@ScriptDir&"\app32\doc", 1)
    DirRemove(@ScriptDir&"\app32\UnattendedTemplates", 1)
    DirRemove(@ScriptDir&"\app32\accessible", 1)
    DirRemove(@ScriptDir&"\app32\sdk", 1)
  EndIf

  If GUICtrlRead($Checkbox110) = $GUI_CHECKED AND FileExists(@ScriptDir&"\temp") Then
    GUICtrlSetData($Input200, @LF & IniRead($Dir_Lang & $lng &".ini", "status", "05", "NotFound"))
    RunWait("cmd /c ren ""%CD%\temp\*.msi"" amd64.msi", @ScriptDir, @SW_HIDE)
    RunWait("cmd /c msiexec.exe /quiet /a ""%CD%\temp\amd64.msi"" TARGETDIR=""%CD%\temp\x64""", @ScriptDir, @SW_HIDE)
    DirCopy(@ScriptDir&"\temp\x64\PFiles\Oracle\VirtualBox", @ScriptDir&"\app64", 1)
    FileCopy(@ScriptDir&"\temp\x64\PFiles\Oracle\VirtualBox\*", @ScriptDir&"\app64", 9)
    DirRemove(@ScriptDir&"\temp\ExtensionPacks\Oracle_VM_VirtualBox_Extension_Pack\darwin.amd64", 1)
    DirRemove(@ScriptDir&"\temp\ExtensionPacks\Oracle_VM_VirtualBox_Extension_Pack\darwin.arm64", 1)
    DirRemove(@ScriptDir&"\temp\ExtensionPacks\Oracle_VM_VirtualBox_Extension_Pack\linux.amd64", 1)
    DirRemove(@ScriptDir&"\temp\ExtensionPacks\Oracle_VM_VirtualBox_Extension_Pack\solaris.amd64", 1)
    DirCopy(@ScriptDir&"\temp\ExtensionPacks\Oracle_VM_VirtualBox_Extension_Pack", @ScriptDir&"\app64\ExtensionPacks\Oracle_VM_VirtualBox_Extension_Pack", 1)
    FileDelete(@ScriptDir&"\app64\*.rtf")
    FileDelete(@ScriptDir&"\app64\*.chm")
    FileDelete(@ScriptDir&"\app64\VirtualBox.*.xml")
    FileDelete(@ScriptDir&"\app64\VirtualBox*.png")
    DirRemove(@ScriptDir&"\app64\doc", 1)
    DirRemove(@ScriptDir&"\app64\UnattendedTemplates", 1)
    DirRemove(@ScriptDir&"\app64\accessible", 1)
    DirRemove(@ScriptDir&"\app64\sdk", 1)
  EndIf

  If FileExists(@ScriptDir&"\temp") Then
    DirRemove(@ScriptDir&"\temp", 1)
    FileDelete(@ScriptDir&"\virtualbox.exe")
    FileDelete(@ScriptDir&"\extension")
    RunWait("cmd /c taskkill /im msiexec.exe /f", @ScriptDir, @SW_HIDE)
  EndIf

  If GUICtrlRead($Checkbox120) = $GUI_CHECKED Then
    IniWrite(@ScriptDir&"\data\settings\vboxinstall.ini", "startvbox", "key", "1")
  Else
    IniWrite(@ScriptDir&"\data\settings\vboxinstall.ini", "startvbox", "key", "0")
  EndIf

  if (FileExists(@ScriptDir&"\virtualbox.exe") OR FileExists($SourceFile)) AND (GUICtrlRead($Checkbox100) = $GUI_CHECKED OR GUICtrlRead($Checkbox110) = $GUI_CHECKED) Then
    GUICtrlSetData($Input200, @LF & IniRead($Dir_Lang & $lng &".ini", "status", "08", "NotFound"))
    Sleep(2000)
  EndIf

  GUIDelete()
  $install = 0
EndFunc

Func github()
ShellExecute("http://github.com/Deac2/Portable-VirtualBox")
EndFunc

Func Licence()
  ShellExecute("http://www.virtualbox.org/wiki/VirtualBox_PUEL")
EndFunc

Func ExitExtraction()
  AdlibUnRegister("Wm_List_Update")
  GUIDelete()
  $install = 0
  Exit
EndFunc

; Check if virtualbox is installed and run from it
Func HybridMode()
	if @OSArch="X64" Then
		$append_arch="64"
	Else
		$append_arch=""
	EndIf

	; Version of VirtualBox 4.X
	$version_new = RegRead("HKLM"&$append_arch&"\SOFTWARE\Oracle\VirtualBox","Version")

	; Since 4.0.8 ... Version is in VersionExt key in registry
	if $version_new = "%VER%" Then
		$version_new = RegRead("HKLM"&$append_arch&"\SOFTWARE\Oracle\VirtualBox","VersionExt")
	EndIf

	; Version of VirtualBox 3.X if any is installed => Cannot run Portable 4.X or it will corrupt it
	$version_old = RegRead("HKLM"&$append_arch&"\SOFTWARE\Sun\VirtualBox","Version")

	; if old version => Exit to avoid corruption of services
	if ($version_new <> "" AND Int(StringLeft($version_new,1))<4 ) OR $version_old <> "" Then
		MsgBox(16,"Sorry","Please update your version of VirtualBox to 4.X or uninstall it from your computer to be able to run this portable version"&@CRLF&@CRLF&"This is a security in order to avoid corrupting your current installed version."&@CRLF&@CRLF &"Thank you for your comprehension.")
		Exit
	EndIf

	; Setting VBOX_USER_HOME to portable virtualbox directory(VM settings stays in this one)
	EnvSet("VBOX_USER_HOME", $UserHome)

	; Testing if major version of regular vbox is 4 then running from it
	If $version_new <> "" AND StringLeft($version_new,1)>=4 Then

		; Getting the installation directory of regular VirtualBox from registry
		$nonportable_install_dir=RegRead("HKLM"&$append_arch&"\SOFTWARE\Oracle\VirtualBox","InstallDir")

		if $CmdLine[0] = 1 Then
			Run('cmd /c ""'&$nonportable_install_dir&'VBoxManage.exe" startvm "'&$CmdLine[1]&'""', @ScriptDir, @SW_HIDE)
		Else
			Run($nonportable_install_dir&"VirtualBox.exe")
		EndIf

		; Does not need to wait since it's a regular version of VirtualBox
		Exit
	EndIf
EndFunc