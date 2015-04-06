#RequireAdmin
#Region ;**** 参数创建于 ACNWrapper_GUI ****
#AutoIt3Wrapper_Icon=ico.ico
#AutoIt3Wrapper_OutFile=EXTS\RepaikUFDSM.2014v8.57.EXE
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseUPX=n
#AutoIt3Wrapper_UseX64=n
#AutoIt3Wrapper_Res_Comment=睿派克U盘装机秘书
#AutoIt3Wrapper_Res_Description=睿派克U盘装机秘书
#AutoIt3Wrapper_Res_FileVersion=2015.8.57.0329
#AutoIt3Wrapper_Res_LegalCopyright=Copyright (c) 2015 睿派克技术论坛. All Rights Reserved.
#AutoIt3Wrapper_Res_SaveSource=y
#AutoIt3Wrapper_Res_Field=OriginalFilename|睿派克U盘装机秘书
#AutoIt3Wrapper_Res_Field=ProductName|睿派克U盘装机秘书
#AutoIt3Wrapper_Res_Field=ProductVersion|2015.8.57.0329
#AutoIt3Wrapper_Res_Field=InternalName|睿派克U盘装机秘书
#AutoIt3Wrapper_Res_Field=FileDescription|睿派克U盘装机秘书
#AutoIt3Wrapper_Res_Field=Comments|睿派克U盘装机秘书
#AutoIt3Wrapper_Res_Field=LegalTrademarks|睿派克技术论坛
#AutoIt3Wrapper_Res_Field=CompanyName|睿派克技术论坛
#AutoIt3Wrapper_Res_Field=PowerBy|睿派克技术论坛
#AutoIt3Wrapper_Res_Field=Design|roustar31
#AutoIt3Wrapper_Res_Field=SourceCode|roustar31
#AutoIt3Wrapper_Run_Tidy=y
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <GUIEnhance.au3>
#include <_WinSlide.au3>
#include <WinAPIEx.au3>
#include <WinAPI.au3>
#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <ProgressConstants.au3>
#include <StaticConstants.au3>
#include <Constants.au3>
#include <GuiButton.au3>
#include <GuiImageList.au3>
#include <EditConstants.au3>
#include <GDIpProgress.au3>
#include <Date.au3>
#include <waterctrl.dll.au3>
Opt("TrayMenuMode", 1)
Global $showoff = 0
Global $EFIHASH = 0
Global $UEFIYES = 0
If $CmdLine[0] = 1 And $CmdLine[1] = "/export" Then
	export()
	Exit
EndIf
TrayTip("小秘书提示", "程序正在定义环境变量中...", 3, 1)
DirRemove(@TempDir & "\RPK_UPS", 1)
$Kpath = @WindowsDir & "\System32\kernel32.dll"
If FileExists($Kpath) Then
	$OS = StringLeft(FileGetVersion($Kpath), 3)
	Switch $OS
		Case "5.0"
			If @OSArch = "x86" Then
				$OS1 = 50
				$OSVersion = "Microsoft Windows 2000 X86"
			EndIf
		Case "5.1"
			If @OSArch = "x86" Then
				$OS1 = 51
				$OSVersion = "Microsoft Windows XP X86"
			EndIf
			If @OSArch = "x64" Then
				$OS1 = 51
				$OSVersion = "Microsoft Windows XP X64"
			EndIf
		Case "5.2"
			If @OSArch = "x86" Then
				$OS1 = 52
				$OSVersion = "Microsoft Windows 2003 X86"
			EndIf
			If @OSArch = "x64" Then
				$OS1 = 52
				$OSVersion = "Microsoft Windows 2003 X64"
			EndIf
		Case "6.0"
			If @OSArch = "x86" Then
				$OS1 = 60
				$OSVersion = "Microsoft Windows Vista X86"
			EndIf
			If @OSArch = "x64" Then
				$OS1 = 60
				$OSVersion = "Microsoft Windows Vista X64"
			EndIf
		Case "6.1"
			If @OSArch = "x86" Then
				$OS1 = 61
				$OSVersion = "Microsoft Windows 7 X86"
			EndIf
			If @OSArch = "x64" Then
				$OS1 = 61
				$OSVersion = "Microsoft Windows 7 X64"
			EndIf
		Case "6.2"
			If @OSArch = "x86" Then
				$OS1 = 62
				$OSVersion = "Microsoft Windows 8 X86"
			EndIf
			If @OSArch = "x64" Then
				$OS1 = 62
				$OSVersion = "Microsoft Windows 8 X64"
			EndIf
		Case "6.3"
			If @OSArch = "x86" Then
				$OS1 = 63
				$OSVersion = "Microsoft Windows 8.1 X86"
			EndIf
			If @OSArch = "x64" Then
				$OS1 = 63
				$OSVersion = "Microsoft Windows 8.1 X64"
			EndIf
		Case "6.4"
			If @OSArch = "x86" Then
				$OS = 64
				$OSVersion = "Microsoft Windows 10 X86"
			EndIf
			If @OSArch = "x64" Then
				$OS = 64
				$OSVersion = "Microsoft Windows 10 X64"
			EndIf
		Case "10."
			If @OSArch = "x86" Then
				$OS = 100
				$OSVersion = "Microsoft Windows 10 X86"
			EndIf
			If @OSArch = "x64" Then
				$OS = 100
				$OSVersion = "Microsoft Windows 10 X64"
			EndIf
	EndSwitch
EndIf
;MsgBox(64 + 0, "", $OS)
If $OS >= 61 Then
	RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers", @HomeDrive & "\fbinst.exe", "REG_SZ", "RUNASADMIN WINXPSP3")
EndIf
Local $titile = "睿派克U盘装机秘书2014 V8.57 Power By www.repaik.com"
Local $tmpDirs = @TempDir & "\RPK_UPS"
Local $logopic = $tmpDirs & "\LOGO.bmp"
Local $bkpic = $tmpDirs & "\background.gif"
Local $S1 = $tmpDirs & "\S1.bmp"
Local $S2 = $tmpDirs & "\S2.bmp"
Local $P1 = $tmpDirs & "\P1.bmp"
Local $P2 = $tmpDirs & "\P2.bmp"
Local $U1 = $tmpDirs & "\U1.bmp"
Local $U2 = $tmpDirs & "\U2.bmp"
Local $G1 = $tmpDirs & "\G1.bmp"
Local $G2 = $tmpDirs & "\G2.bmp"
Local $E1 = $tmpDirs & "\E1.bmp"
Local $E2 = $tmpDirs & "\E2.bmp"
Local $LS = @DesktopWidth / 2 - 400
Local $HS = -545
Local $HS1 = @DesktopHeight / 2 - 260
Local $LSE = @DesktopWidth + 800
Local $UDUSBYN = "没有U盘含有UD系统区"
If IsAdmin() = "1" Then
	$admin = "（管理员权限）"
Else
	$admin = "（普通用户）"
	MsgBox(64 + 0, "提醒", "  检测到程序运行在非管理员权限环境中" & @CR & "建议退出程序右键本程序选择“以管理员身份运行”")
EndIf
DirCreate($tmpDirs)
Global $tDISK_GEOMETRY_EX, $Drive = 0
Global $CPUpectTF = False
$tDISK_GEOMETRY_EX = _WinAPI_GetDriveGeometryEx($Drive)
While 1
	$tDISK_GEOMETRY_EX = _WinAPI_GetDriveGeometryEx($Drive)
	If @error Then
		ExitLoop
	EndIf
	; ConsoleWrite('-------------------------------' & @CR)
	; ConsoleWrite('Drive: ' & $Drive & @CR)
	; ConsoleWrite('Cylinders: ' & DllStructGetData($tDISK_GEOMETRY_EX, 'Cylinders') & @CR)
	; ConsoleWrite('Tracks per Cylinder: ' & DllStructGetData($tDISK_GEOMETRY_EX, 'TracksPerCylinder') & @CR)
	; ConsoleWrite('Sectors per Track: ' & DllStructGetData($tDISK_GEOMETRY_EX, 'SectorsPerTrack') & @CR)
	; ConsoleWrite('Bytes per Sector: ' & DllStructGetData($tDISK_GEOMETRY_EX, 'BytesPerSector') & ' bytes' & @CR)
	; ConsoleWrite('Total Space: ' & DllStructGetData($tDISK_GEOMETRY_EX, 'DiskSize') & ' bytes' & @CR)
	; ConsoleWrite('-------------------------------' & @CR)
	IniWrite($tmpDirs & "\diskinfo.ini", "disk", $Drive, DllStructGetData($tDISK_GEOMETRY_EX, 'DiskSize'))
	$Drive += 1
WEnd
TrayTip("小秘书提示", "程序正在加载资源文件中...", 3, 1)
Local $HDD = IniReadSection($tmpDirs & "\diskinfo.ini", "disk")
FileInstall("background.gif", $bkpic, 1)
FileInstall("LOGO.bmp", $logopic, 1)
FileInstall("gif\S1.bmp", $S1, 1)
FileInstall("gif\S2.bmp", $S2, 1)
FileInstall("gif\P1.bmp", $P1, 1)
FileInstall("gif\P2.bmp", $P2, 1)
FileInstall("gif\U1.bmp", $U1, 1)
FileInstall("gif\U2.bmp", $U2, 1)
FileInstall("gif\G1.bmp", $G1, 1)
FileInstall("gif\G2.bmp", $G2, 1)
FileInstall("gif\E1.bmp", $E1, 1)
FileInstall("gif\E2.bmp", $E2, 1)
FileInstall("rpkusbinfo.ini", $tmpDirs & "\rpkusbinfo.ini", 1)
FileInstall("gif\404.jpg", $tmpDirs & "\404.jpg", 1)
TrayTip("小秘书提示", "程序正在检查磁盘U盘数量...", 3, 1)
$disk = _disk()
$outdisk = replace0()
$diskarray = StringSplit($outdisk, @CR, 1)
TrayTip("小秘书提示", "程序正在创建窗口控件中...", 3, 1)
$GUI = GUICreate("", 800, 545, -1, $HS, $WS_SIZEBOX + $WS_SYSMENU)
GUISetBkColor(0xf0f2f6, $GUI)
For $i = 1 To $diskarray[0]
	$YESUD = StringInStr($diskarray[$i], "*", 0)
Next
If $YESUD = "0" Then
	$UDUSBYN = "无UD"
EndIf
If $YESUD = "1" Then
	$UDUSBYN = "有UD"
EndIf
If $YESUD <> "1" And $YESUD <> "0" Then
	$UDUSBYN = "有UD"
EndIf
$bk = GUICtrlCreatePic($bkpic, 189, 130, 602, 380)
GUICtrlSetState($bk, $GUI_DISABLE)
_WaterCtrl_Startup($logopic, $GUI, '400,50,20,800')
$picsys1 = GUICtrlCreatePic($S2, 10, 160, 162, 48)
$picsys2 = GUICtrlCreatePic($P2, 10, 160 + (1 * 68), 162, 48)
$picsys3 = GUICtrlCreatePic($U1, 10, 160 + (2 * 68), 180, 48)
$picsys5 = GUICtrlCreatePic($E1, 10, 160 + (3 * 68), 162, 48)
$picsys4 = GUICtrlCreatePic($G2, 10, 160 + (4 * 68), 162, 48)
$group1 = GUICtrlCreateGroup("", 200, 140, 579, 360)
$group2 = GUICtrlCreateGroup("", 220, 160, 530, 120)
$group3 = GUICtrlCreateGroup("", 220, 290, 530, 120)
FileInstall("ICO\system.ico", $tmpDirs & "\system.ico", 1)
FileInstall("ICO\MSHDD1.ico", $tmpDirs & "\MSHDD1.ico", 1)
FileInstall("ICO\USB-HDD1.ico", $tmpDirs & "\USB-HDD1.ico", 1)
$SICOMS = GUICtrlCreateIcon($tmpDirs & "\system.ico", -1, 255, 180, 80, 80)
$SICOUP = GUICtrlCreateIcon($tmpDirs & "\MSHDD1.ico", -1, 255, 310, 80, 80)
$Label1 = GUICtrlCreateLabel("当前操作系统为:  ", 355, 182, 120, 25)
GUICtrlSetFont($Label1, 12, 400)
$Label2 = GUICtrlCreateLabel($OSVersion, 485, 182, 225, 25)
GUICtrlSetFont($Label2, 12, 400)
$Label3 = GUICtrlCreateLabel("当前登陆用户为:  ", 355, 212, 120, 25)
GUICtrlSetFont($Label3, 12, 400)
$Label4 = GUICtrlCreateLabel(@UserName & $admin, 485, 212, 225, 25)
GUICtrlSetFont($Label4, 12, 400)
$Label5 = GUICtrlCreateLabel("程序运行模式为:  ", 355, 242, 130, 25)
GUICtrlSetFont($Label5, 12, 400)
If @OSArch = "x64" Then
	$OSbit = "64位系统"
EndIf
If @OSArch = "x86" Then
	$OSbit = "32位系统"
EndIf
$Label6 = GUICtrlCreateLabel("在" & $OSbit & "下, 运行于32位模式", 485, 242, 225, 25)
GUICtrlSetFont($Label6, 12, 400)
$Label7 = GUICtrlCreateLabel("磁盘数量(含U盘):  ", 355, 312, 130, 25)
GUICtrlSetFont($Label7, 12, 400)
$Label8 = GUICtrlCreateLabel("一共发现" & $HDD[0][0] & "个磁盘", 485, 312, 225, 25)
GUICtrlSetFont($Label8, 12, 400)
$Label9 = GUICtrlCreateLabel("U盘信息:  ", 355, 342, 70, 25)
GUICtrlSetFont($Label9, 12, 400)
$Combo1 = GUICtrlCreateCombo("", 435, 342, 240, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
For $i = 1 To $diskarray[0]
	GUICtrlSetData($Combo1, $diskarray[$i], $diskarray[$i]) ; default 倒数第一个，一般fbinst检测到U盘在后面
Next
$Label10 = GUICtrlCreateLabel("程序检测到共有U盘" & $diskarray[0] & "个," & $UDUSBYN, 355, 372, 365, 25)
GUICtrlSetFont($Label10, 12, 400)
$Label11 = GUICtrlCreateLabel("以上检测信息只供参考, 具体情况以实际情况和Windows下显示为准.", 250, 430, 440, 25)
GUICtrlSetFont($Label11, 10, 400)
$Label12 = GUICtrlCreateLabel("为确保程序运行准确无误,应避免运行本程序时同时连接多个U盘.", 250, 460, 440, 25)
GUICtrlSetFont($Label12, 11, 400)
GUICtrlSetColor($Label12, 0xff7700)
;===>系统信息页面定义完毕
;===>开始定义PE简介页面
$groupP1 = GUICtrlCreateGroup("", 200, 140, 579, 360)
$groupP2 = GUICtrlCreateGroup("什么是Windwos PE?", 220, 160, 530, 150)
$LabelP1 = GUICtrlCreateLabel("Windows PE是英文Windows Preinstallation Environment的简称，意为Windows预安装环境", 245, 185, 480, 25)
$LabelP2 = GUICtrlCreateLabel("其只带有有限服务的最小Win32子系统，基于以保护模式运行的Windows XP SP3及以上内核", 245, 215, 480, 25)
$LabelP3 = GUICtrlCreateLabel("能运行Windows安装程序脚本、连接网络、自动化基本过程及执行硬件验证所需的最小功能", 245, 245, 485, 25)
$LabelP4 = GUICtrlCreateLabel("Windows PE以被OEM和民间技术员广泛使用，以用来快速大量部署及维护计算机硬件和系统", 245, 275, 480, 25)
$groupP3 = GUICtrlCreateGroup("什么是U盘装机秘书?", 220, 330, 530, 150)
$LabelP5 = GUICtrlCreateLabel("U盘装机秘书是基于WinPE和UD及EFI技术的产品，定位为打造电脑装机维护人员的私人秘书", 245, 355, 480, 25)
$LabelP6 = GUICtrlCreateLabel("通过密切了解装机维护人员的需求，对DOS和WinPE下工具进行优选，对PE兼容性进行增强", 245, 385, 480, 25)
$LabelP7 = GUICtrlCreateLabel("扩展WinPE的能力，使功能大大增强，便利性大大增加，且能够防止病毒木马破坏及误删除", 245, 415, 485, 25)
$LabelP8 = GUICtrlCreateLabel("秘书绿色无污染，启动快速、兼容广泛、便捷娇小、纯净稳定，实乃维护人员的私人小秘书", 245, 445, 480, 25)
;===>定义PE简介页面完毕
;===>开始定义U盘启动制作页面
$FBAmake = GUICtrlCreateButton("导出Fba(&P)", 620, 210, 95, 25)
GUICtrlSetFont($FBAmake, 9, 400)
$groupUQ1 = GUICtrlCreateGroup("", 200, 140, 579, 360)
$groupUQ2 = GUICtrlCreateGroup("文件信息", 220, 160, 530, 82)
$groupUQ3 = GUICtrlCreateGroup("启动制作", 220, 252, 530, 200)
FileInstall("ICO\fba.ico", $tmpDirs & "\fba.ico", 1)
$UQFBAICO = GUICtrlCreateIcon($tmpDirs & "\fba.ico", -1, 255, 178, 70, 56)
$UQPEICO = GUICtrlCreateIcon($tmpDirs & "\USB-HDD1.ico", -1, 255, 272, 80, 80)
$LabelUQ1 = GUICtrlCreateLabel("程序内置fba文件名称:  Rpkusbfbasource.fba", 355, 182, 350, 25)
GUICtrlSetFont($LabelUQ1, 12, 400)
$LabelUQ2 = GUICtrlCreateLabel("", 355, 212, 0, 0)
GUICtrlSetFont($LabelUQ2, 12, 400)
$LabelUQ3 = GUICtrlCreateLabel("fba文件包大小: 368mb;WinPE 8.57", 355, 215, 260, 25)
GUICtrlSetFont($LabelUQ3, 12, 400)
$LabelUQ4 = GUICtrlCreateLabel("要制作的U盘", 355, 274, 100, 25)
GUICtrlSetFont($LabelUQ4, 12, 400)
$Combousb = GUICtrlCreateCombo("", 460, 274, 250, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
For $i = 1 To $diskarray[0]
	GUICtrlSetData($Combousb, $diskarray[$i], $diskarray[$i]) ; default 倒数第一个，一般fbinst检测到U盘在后面
Next
$NoMEM = GUICtrlCreateCheckbox("PE加速模式", 617, 330, 105, 25)
GUICtrlSetFont($NoMEM, 12, 400)
$LabelUQ5 = GUICtrlCreateLabel("U盘容量信息", 355, 304, 100, 25)
GUICtrlSetFont($LabelUQ5, 12, 400)
$LabelUQ6 = GUICtrlCreateLabel("", 460, 304, 250, 25)
GUICtrlSetFont($LabelUQ6, 12, 400)
$LabelUQ7 = GUICtrlCreateLabel("启动区信息：", 355, 334, 100, 25)
GUICtrlSetFont($LabelUQ7, 12, 400)
$LabelUQ8 = GUICtrlCreateLabel("", 460, 334, 150, 25)
GUICtrlSetFont($LabelUQ8, 12, 400)
$BITLOCK = GUICtrlCreateCheckbox("BitLocker加密", 260, 368, 130, 25)
GUICtrlSetFont($BITLOCK, 12, 400)
GUICtrlSetState($BITLOCK, $GUI_CHECKED)
$ATHCN = GUICtrlCreateCheckbox("Acronis True Image", 400, 368, 160, 25)
GUICtrlSetFont($ATHCN, 12, 400)
GUICtrlSetState($ATHCN, $GUI_CHECKED)
$InstallHDD = GUICtrlCreateCheckbox("安装到本机系统", 585, 368, 130, 25)
GUICtrlSetFont($InstallHDD, 12, 400)
$USBmake = GUICtrlCreateButton("开始制作(&M)", 265, 410, 100, 32)
GUICtrlSetFont($USBmake, 11, 400)
If GUICtrlRead($Combousb) = "" Then
	GUICtrlSetState($USBmake, $GUI_DISABLE)
EndIf
$USBUpdate = GUICtrlCreateButton("升级PE(&U)", 376, 410, 100, 32)
GUICtrlSetFont($USBUpdate, 11, 400)
If $YESUD = "0" Or $YESUD = "1" Then
	GUICtrlSetState($USBUpdate, $GUI_DISABLE)
EndIf
If $YESUD <> "1" And $YESUD <> "0" Then
	FileInstall("ICO\USB-HDD12.ico", $tmpDirs & "\USB-HDD12.ico", 1)
	GUICtrlSetImage($UQPEICO, $tmpDirs & "\USB-HDD12.ico")
EndIf
$USBReset = GUICtrlCreateButton("还原U盘(&R)", 487, 410, 100, 32)
GUICtrlSetFont($USBReset, 11, 400)
If GUICtrlRead($Combousb) = "" Then
	GUICtrlSetState($USBReset, $GUI_DISABLE)
EndIf
$Exit = GUICtrlCreateButton("退出程序(&E)", 598, 410, 100, 32)
GUICtrlSetFont($Exit, 11, 400)
$LabelTX = GUICtrlCreateLabel("为确保程序运行准确无误,应避免运行本程序时同时连接多个U盘.", 255, 470, 465, 25)
GUICtrlSetFont($LabelTX, 12, 400)
GUICtrlSetColor($LabelTX, 0xff5000)
;===>USB启动制作页面完成
;===>开始制作EFI启动页面
$groupEF1 = GUICtrlCreateGroup("", 200, 133, 579, 369)
$groupEF2 = GUICtrlCreateGroup("什么是UEFI启动?", 220, 153, 530, 120)
$LabelEF2 = GUICtrlCreateLabel("UEFI只支持GUID(全局唯一标志符)磁盘分区结构，不支持从传统的MBR硬盘分区引导系统", 245, 178, 485, 25)
$LabelEF3 = GUICtrlCreateLabel("但目前由于BIOS还在大量使用，故多数OEM厂商的UEFI还预留了BIOS兼容层用以引导MBR", 245, 208, 485, 25)
$LabelEF4 = GUICtrlCreateLabel("本PE能支持UEFI启动进行维护，只需要启动页面制作完后切换到此页面进行对应操作即可", 245, 238, 485, 25)
$groupEF3 = GUICtrlCreateGroup("UEFI启动扩展", 220, 283, 530, 185)
FileInstall("ICO\USB-uefi.ico", $tmpDirs & "\USB-uefi.ico", 1)
$UEFIICO = GUICtrlCreateIcon($tmpDirs & "\USB-uefi.ico", -1, 245, 318, 80, 80)
$UEFIlabelname = GUICtrlCreateLabel("UEFI扩展文件:", 355, 305, 110, 25)
GUICtrlSetFont($UEFIlabelname, 12, 400)
$UEFIInputname = GUICtrlCreateInput("", 470, 302, 250, 22)
GUICtrlSetState(-1, $GUI_DISABLE)
If FileExists(@ScriptDir & "\RPK.efi") = 1 Then
	GUICtrlSetData($UEFIInputname, "UEFI内置于程序主体中")
EndIf
If FileExists(@ScriptDir & "\RPK.efi") = 0 Then
	GUICtrlSetData($UEFIInputname, "UEFI内置于程序主体中")
EndIf
$UEFIlabelinfo = GUICtrlCreateLabel("扩展文件信息:", 355, 335, 110, 25)
GUICtrlSetFont($UEFIlabelinfo, 12, 400)
$UEFIInputinfo = GUICtrlCreateInput("", 470, 332, 250, 22)
GUICtrlSetState(-1, $GUI_DISABLE)
TrayTip("小秘书提示", "程序正在检查UEFI扩展包信息...", 3, 1)
If FileGetSize(@ScriptDir & "\RPK.efi") >= 190 * 1048576 Then
	$UEFIsize = Floor(FileGetSize(@ScriptDir & "\RPK.efi") / 1048576)
	$UEFIYES = 1
	GUICtrlSetData($UEFIInputinfo, "WinPE版本:Win8 X64 EFI 2014.09")
EndIf
If FileGetSize(@ScriptDir & "\RPK.efi") < 190 * 1048576 Then
	$UEFIYES = 0
	GUICtrlSetData($UEFIInputinfo, "WinPE版本:Win8 X64 EFI 2014.09")
EndIf
;HashEFI()
$UEFIlabeexFat = GUICtrlCreateLabel("U盘数据格式:", 355, 365, 110, 25)
GUICtrlSetFont($UEFIlabeexFat, 12, 400)
$UEFIInputexFat = GUICtrlCreateInput("", 470, 362, 250, 22)
GUICtrlSetState(-1, $GUI_DISABLE)
$LabelEF5 = GUICtrlCreateLabel("要制作的U盘:", 355, 398, 100, 25)
GUICtrlSetFont($LabelEF5, 12, 400)
$Combousbefi = GUICtrlCreateCombo("", 470, 398, 250, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
For $i = 1 To $diskarray[0]
	GUICtrlSetData($Combousbefi, $diskarray[$i], $diskarray[$i]) ; default 倒数第一个，一般fbinst检测到U盘在后面
Next
$UEFImake = GUICtrlCreateButton("开始制作(&M)", 415, 429, 95, 28)
GUICtrlSetFont($USBmake, 11, 400)
$UEFIback = GUICtrlCreateButton("返回到启动制作页面(&B)", 245, 429, 160, 28)
GUICtrlSetFont($USBUpdate, 11, 400)
$Exituefi = GUICtrlCreateButton("退出程序(&E)", 520, 429, 95, 28)
GUICtrlSetFont($Exit, 11, 400)
$efimakeISO = GUICtrlCreateButton("导出UEFI PE", 625, 429, 95, 28)
GUICtrlSetState($efimakeISO, $GUI_DISABLE)
GUICtrlSetFont($Exit, 11, 400)
$efitip = GUICtrlCreateLabel("", 230, 480, 500, 20)
GUICtrlSetFont($efitip, 11, 400)
GUICtrlSetColor($efitip, 0xff5000)
;===>EFI启动页面完成
;===>升级及教程页面
$groupUP1 = GUICtrlCreateGroup("", 200, 133, 579, 369)
$groupUP2 = GUICtrlCreateGroup("检查更新", 220, 153, 530, 120)
$EditUP1 = GUICtrlCreateLabel("正在从网络获取是否有新版本发布，请稍后...", 245, 178, 480, 25)
GUICtrlSetFont($EditUP1, 11, 400)
$EditUP2 = GUICtrlCreateLabel("", 245, 208, 480, 25)
GUICtrlSetFont($EditUP2, 11, 400)
$checkUP = GUICtrlCreateButton("检查更新", 255, 238, 80, 26)
$Newweb = GUICtrlCreateButton("访问发布页面", 355, 238, 110, 26)
$Newurl = GUICtrlCreateButton("访问下载地址", 485, 238, 110, 26)
$homepage = GUICtrlCreateButton("访问官方主页", 615, 238, 110, 26)
$groupUP3 = GUICtrlCreateGroup("教程相关", 220, 283, 530, 217)
$Tutorialsjpg = GUICtrlCreatePic($tmpDirs & "\404.jpg", 225, 300, 520, 200)
TrayTip("小秘书提示", "程序正在检查U盘数据文件...", 3, 1)
usbsize()
exfat()
systemhide()
PEinfohide()
UEFIhide()
UPhide()
USBshow()
TrayTip("小秘书提示", "预定义完毕！载入界面...", 3, 1)
_GUIEnhanceAnimateWin($GUI, 400, $GUI_EN_ANI_FADEIN)
GUICtrlSetDefBkColor(0xf0f2f6)
GUISetState()
TrayTip("", "", 1, 0)
_WinSlide($GUI, $LS, $HS1, 30, 20)
_WinSlide($GUI, $LS, $HS1 + 30, 15, 15)
_WinSlide($GUI, $LS, $HS1, 15, 20)
_GUIEnhanceAnimateTitle($GUI, $titile, $GUI_EN_TITLE_SLIDE)
While 1
	$possys1 = GUIGetCursorInfo($GUI)
	If $possys1[2] = 1 And $possys1[4] = $picsys1 And $possys1[4] <> $picsys2 And $possys1[4] <> $picsys3 And $possys1[4] <> $picsys4 And $possys1[4] <> $picsys5 Then
		PEinfohide()
		USBhide()
		UEFIhide()
		UPhide()
		systemshow()
		GUICtrlSetPos($picsys1, 10, 160, 180, 48)
		GUICtrlSetPos($picsys2, 10, 160 + (1 * 68), 162, 48)
		GUICtrlSetPos($picsys3, 10, 160 + (2 * 68), 162, 48)
		GUICtrlSetPos($picsys4, 10, 160 + (4 * 68), 162, 48)
		GUICtrlSetPos($picsys5, 10, 160 + (3 * 68), 162, 48)
		GUICtrlSetImage($picsys1, $S1)
		GUICtrlSetImage($picsys2, $P2)
		GUICtrlSetImage($picsys3, $U2)
		GUICtrlSetImage($picsys4, $G2)
		GUICtrlSetImage($picsys5, $E1)
	EndIf
	If $possys1[2] = 1 And $possys1[4] <> $picsys1 And $possys1[4] = $picsys2 And $possys1[4] <> $picsys3 And $possys1[4] <> $picsys4 And $possys1[4] <> $picsys5 Then
		systemhide()
		UEFIhide()
		USBhide()
		UPhide()
		PEinfoshow()
		GUICtrlSetImage($picsys1, $S2)
		GUICtrlSetImage($picsys2, $P1)
		GUICtrlSetImage($picsys3, $U2)
		GUICtrlSetImage($picsys4, $G2)
		GUICtrlSetImage($picsys5, $E1)
		GUICtrlSetPos($picsys1, 10, 160, 162, 48)
		GUICtrlSetPos($picsys2, 10, 160 + (1 * 68), 180, 48)
		GUICtrlSetPos($picsys3, 10, 160 + (2 * 68), 162, 48)
		GUICtrlSetPos($picsys4, 10, 160 + (4 * 68), 162, 48)
		GUICtrlSetPos($picsys5, 10, 160 + (3 * 68), 162, 48)
	EndIf
	If $possys1[2] = 1 And $possys1[4] <> $picsys1 And $possys1[4] <> $picsys2 And $possys1[4] = $picsys3 And $possys1[4] <> $picsys4 And $possys1[4] <> $picsys5 Then
		systemhide()
		PEinfohide()
		UEFIhide()
		UPhide()
		USBshow()
		GUICtrlSetImage($picsys1, $S2)
		GUICtrlSetImage($picsys2, $P2)
		GUICtrlSetImage($picsys3, $U1)
		GUICtrlSetImage($picsys4, $G2)
		GUICtrlSetImage($picsys5, $E1)
		GUICtrlSetPos($picsys1, 10, 160, 162, 48)
		GUICtrlSetPos($picsys2, 10, 160 + (1 * 68), 162, 48)
		GUICtrlSetPos($picsys3, 10, 160 + (2 * 68), 180, 48)
		GUICtrlSetPos($picsys4, 10, 160 + (4 * 68), 162, 48)
		GUICtrlSetPos($picsys5, 10, 160 + (3 * 68), 162, 48)
	EndIf
	If $possys1[2] = 1 And $possys1[4] <> $picsys1 And $possys1[4] <> $picsys2 And $possys1[4] <> $picsys3 And $possys1[4] = $picsys4 And $possys1[4] <> $picsys5 Then
		systemhide()
		PEinfohide()
		UEFIhide()
		USBhide()
		UPshow()
		GUICtrlSetImage($picsys1, $S2)
		GUICtrlSetImage($picsys2, $P2)
		GUICtrlSetImage($picsys3, $U2)
		GUICtrlSetImage($picsys4, $G1)
		GUICtrlSetImage($picsys5, $E1)
		GUICtrlSetPos($picsys1, 10, 160, 162, 48)
		GUICtrlSetPos($picsys2, 10, 160 + (1 * 68), 162, 48)
		GUICtrlSetPos($picsys3, 10, 160 + (2 * 68), 162, 48)
		GUICtrlSetPos($picsys4, 10, 160 + (4 * 68), 180, 48)
		GUICtrlSetPos($picsys5, 10, 160 + (3 * 68), 162, 48)
		update()
	EndIf
	If $possys1[2] = 1 And $possys1[4] <> $picsys1 And $possys1[4] <> $picsys2 And $possys1[4] <> $picsys3 And $possys1[4] <> $picsys4 And $possys1[4] = $picsys5 Then
		systemhide()
		USBhide()
		PEinfohide()
		UPhide()
		UEFIshow()
		GUICtrlSetImage($picsys1, $S2)
		GUICtrlSetImage($picsys2, $P2)
		GUICtrlSetImage($picsys3, $U2)
		GUICtrlSetImage($picsys4, $G2)
		GUICtrlSetImage($picsys5, $E2)
		GUICtrlSetPos($picsys1, 10, 160, 162, 48)
		GUICtrlSetPos($picsys2, 10, 160 + (1 * 68), 162, 48)
		GUICtrlSetPos($picsys3, 10, 160 + (2 * 68), 162, 48)
		GUICtrlSetPos($picsys4, 10, 160 + (4 * 68), 162, 48)
		GUICtrlSetPos($picsys5, 10, 160 + (3 * 68), 180, 48)
	EndIf
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $InstallHDD
			If GUICtrlRead($InstallHDD) = $GUI_CHECKED Then
				GUICtrlSetState($USBmake, $GUI_ENABLE)
				GUICtrlSetState($USBReset, $GUI_DISABLE)
				GUICtrlSetState($Combousb, $GUI_DISABLE)
				GUICtrlSetState($NoMEM, $GUI_DISABLE)
				GUICtrlSetState($LabelUQ7, $GUI_DISABLE)
				GUICtrlSetState($LabelUQ8, $GUI_DISABLE)
				GUICtrlSetState($ATHCN, $GUI_UNCHECKED)
				GUICtrlSetState($ATHCN, $GUI_DISABLE)
				GUICtrlSetState($BITLOCK, $GUI_UNCHECKED)
				GUICtrlSetState($BITLOCK, $GUI_DISABLE)
			EndIf
			If GUICtrlRead($InstallHDD) = $GUI_UNCHECKED Then
				GUICtrlSetState($USBmake, $GUI_ENABLE)
				GUICtrlSetState($USBReset, $GUI_ENABLE)
				GUICtrlSetState($LabelUQ7, $GUI_ENABLE)
				GUICtrlSetState($LabelUQ8, $GUI_ENABLE)
				GUICtrlSetState($NoMEM, $GUI_ENABLE)
				GUICtrlSetState($Combousb, $GUI_ENABLE)
				GUICtrlSetState($ATHCN, $GUI_CHECKED)
				GUICtrlSetState($ATHCN, $GUI_ENABLE)
				GUICtrlSetState($BITLOCK, $GUI_CHECKED)
				GUICtrlSetState($BITLOCK, $GUI_ENABLE)
				If $OS <= "5.2" Then;如果是NT5.2系统，则简单写boot.ini，拷贝文件就能安装
					FileSetAttrib(@HomeDrive & "\boot.ini", "-HSR")
					FileCopy(@HomeDrive & "\boot.ini.rpk", @HomeDrive & "\boot.ini", 1)
					DirRemove(@HomeDrive & "\RPK", 1)
					FileSetAttrib(@HomeDrive & "\rpkdr", "-HSR")
					FileSetAttrib(@HomeDrive & "\rpkdr.mbr", "-HSR")
					FileDelete(@HomeDrive & "\rpkdr.mbr")
					FileDelete(@HomeDrive & "\rpkdr")
				EndIf
				If $OS > "5.2" Then;如果是Vista及以上系统，则调用BcdEdit来添加启动引导
					If Not FileExists(@WindowsDir & "\Bcdedit.exe") Then FileInstall("Bcdedit.exe", @WindowsDir & "\Bcdedit.exe")
					Local $BCDEDIT = @WindowsDir & "\Bcdedit.exe"
					Local $VID = "{F8271F63-1D7F-46BA-A36D-1D192901D0DC}"
					GUICtrlSetData($LabelTX, "  当前状态：正在添加PE引导菜单到本机系统中，请稍候......")
					RunWait(@ComSpec & " /c " & $BCDEDIT & " /delete " & $VID, "", 0)
					ShellExecuteWait($BCDEDIT, "/create " & $VID & " /d  睿派克维护系统 /application bootsector", @SystemDir, "", 0)
					DirRemove(@HomeDrive & "\RPK", 1)
					FileSetAttrib(@HomeDrive & "\rpkdr", "-HSR")
					FileSetAttrib(@HomeDrive & "\rpkdr.mbr", "-HSR")
					FileDelete(@HomeDrive & "\rpkdr.mbr")
					FileDelete(@HomeDrive & "\rpkdr")
				EndIf
				MsgBox(64 + 0, "提醒", "已经移除安装到本机系统上的睿派克装机秘书PE菜单和相关文件!", 5)
			EndIf
			
		Case $efimakeISO
			$askmakeiso = MsgBox(32 + 1 + 256, "睿派克U盘装机秘书提醒你", "内置的 Win8 X64 PE 可支持使用UltraISO写入/或用于量产" & @CR & "制作过程中将安装UltraISO 9.6 特别版，请尽量不要操作键盘鼠标" & @CR & "你确定要继续导出 Win8 UEFI PE 么？点确定继续，取消返回", 35)
			If $askmakeiso = 1 And FileExists(@ScriptDir & "\RPK.efi") = 1 Then
				$makebt = GUICtrlGetState($UEFImake)
				GUICtrlSetState($efimakeISO, $GUI_DISABLE)
				GUICtrlSetState($Exituefi, $GUI_DISABLE)
				GUICtrlSetState($UEFIback, $GUI_DISABLE)
				GUICtrlSetState($UEFImake, $GUI_DISABLE)
				TrayTip("小秘书提示", "程序正在准备内置的EFI PE文件中，请稍后...", 3, 1)
				FileCopy(@ScriptDir & "\RPK.efi", @HomeDrive & "\RPK.exe", 1)
				TrayTip("小秘书提示", "程序正在展开内置的EFI PE文件中，请稍后...", 3, 1)
				RunWait(@HomeDrive & "\RPK.exe", @HomeDrive, @SW_HIDE)
				FileDelete(@HomeDrive & "\RPK.exe")
				TrayTip("小秘书提示", "程序正在准备UltraISO程序中，请稍后...", 3, 1)
				Sleep(1000)
				TrayTip("小秘书提示", "程序正在展开EFI PE到UltraISO中，请稍后...", 3, 1)
				FileSetAttrib(@HomeDrive & "\UltraISO\BOOTMGR", "-RSH")
				FileSetAttrib(@HomeDrive & "\UltraISO\boot", "-RSH", 1)
				FileSetAttrib(@HomeDrive & "\UltraISO\efi", "-RSH", 1)
				DirRemove(@HomeDrive & "\UltraISO\boot", 1)
				DirRemove(@HomeDrive & "\UltraISO\efi", 1)
				FileDelete(@HomeDrive & "\UltraISO\BOOTMGR")
				FileCopy(@ProgramFilesDir & "\RPKUEFIPE\BOOTMGR", @HomeDrive & "\UltraISO\BOOTMGR", 1)
				DirCopy(@ProgramFilesDir & "\RPKUEFIPE\boot", @HomeDrive & "\UltraISO\boot", 1)
				DirCopy(@ProgramFilesDir & "\RPKUEFIPE\efi", @HomeDrive & "\UltraISO\efi", 1)
				DirRemove(@ProgramFilesDir & "\RPKUEFIPE", 1)
				FileSetAttrib(@HomeDrive & "\UltraISO\BOOTMGR", "-RSH")
				FileSetAttrib(@HomeDrive & "\UltraISO\boot", "-RSH", 1)
				FileSetAttrib(@HomeDrive & "\UltraISO\efi", "-RSH", 1)
				TrayTip("小秘书提示", "程序正在运行UltraISO进行EFI PE制作中，请稍后...", 3, 1)
				ShellExecuteWait(@HomeDrive & "\UltraISO\UltraISO.exe", "-silent -in " & @HomeDrive & "\UltraISO\RPK_WIN8PE_X64.ISO -f  " & @HomeDrive & "\UltraISO\efi -f  " & @HomeDrive & "\UltraISO\boot -f  " & @HomeDrive & "\UltraISO\BOOTMGR -jlong -optimize -volu RPK_UEFI_WIN8X64PE -out " & @HomeDrive & "\UltraISO\RPK_WIN8PE_X64_NEW.ISO", @HomeDrive & "\UltraISO", "")
				Sleep(1000)
				FileDelete(@HomeDrive & "\UltraISO\RPK_WIN8PE_X64.ISO")
				FileDelete(@HomeDrive & "\UltraISO\BOOTMGR")
				DirRemove(@HomeDrive & "\UltraISO\boot", 1)
				DirRemove(@HomeDrive & "\UltraISO\efi", 1)
				TrayTip("小秘书提示", "程序正在将导出的ISO文件复制到桌面，请稍后...", 3, 1)
				FileCopy(@HomeDrive & "\UltraISO\RPK_WIN8PE_X64_NEW.ISO", @DesktopCommonDir & "\RPK_WIN8PE_X64_NEW.ISO", 1)
				FileDelete(@HomeDrive & "\UltraISO\RPK_WIN8PE_X64_NEW.ISO")
				DirRemove(@HomeDrive & "\UltraISO", 1)
				$Newisosizes = FileGetSize(@DesktopCommonDir & "\RPK_WIN8PE_X64_NEW.iso")
				$Newisosize = $Newisosizes / 1048576
				
				If $Newisosize > "207" Then
					TrayTip("小秘书提示", "Win8 EF PE ISO文件导出完成！并放置在桌面名称为RPK_WIN8PE_X64_NEW.iso", 3, 1)
					_WinAPI_ShellChangeNotify($SHCNE_ASSOCCHANGED, $SHCNF_FLUSHNOWAIT)
				Else
					TrayTip("小秘书提示", "抱歉，貌似制作失败，请稍后再试或者以管理员权限运行本程序！", 3, 1)
				EndIf
				If FileExists(@ScriptDir & "\RPK.efi") = 0 Or $EFIHASH = 0 Then
					MsgBox(16 + 0, "睿派克U盘装机秘书", "程序没有在同目录下找到名为“RPK.efi”扩展文件包或扩展包呗非法篡改" & @CR & "请到官方发布页面:http://www.repaik.com/thread-52440-1-1.html下载扩展包" & "下载后放到和本程序同目录下命名为:RPK.efi后再试！", 35)
				EndIf
			EndIf
			GUICtrlSetState($Exituefi, $GUI_ENABLE)
			GUICtrlSetState($UEFIback, $GUI_ENABLE)
			If $makebt = "144" Then
				GUICtrlSetState($UEFImake, $GUI_DISABLE)
			EndIf
			If $makebt = "80" Then
				GUICtrlSetState($UEFImake, $GUI_ENABLE)
			EndIf
			GUICtrlSetState($efimakeISO, $GUI_ENABLE)
		Case $FBAmake
			$fbasavedir = FileSelectFolder("请选择要保存的路径", "", 1)
			If $fbasavedir <> "" And $fbasavedir <> @UserProfileDir Then
				GUICtrlSetState($FBAmake, $GUI_DISABLE)
				TrayTip("小秘书提示", "程序正在准备内置的Fba文件中，请稍后...", 3, 1)
				FileInstall("Rpkusbfbasource.fba", $fbasavedir & "\Rpkusbfbasource.fba", 1)
				TrayTip("小秘书提示", "导出Fba文件完成！", 3, 1)
				ShellExecute($fbasavedir)
				FileDelete(@UserProfileDir & "\Rpkusbfbasource.fba")
				GUICtrlSetState($FBAmake, $GUI_ENABLE)
			Else
				TrayTip("小秘书提示", "没有选择目录或者目录错误，请重新选择目录！", 3, 1)
				GUICtrlSetState($FBAmake, $GUI_ENABLE)
			EndIf
		Case $checkUP
			GUICtrlSetState($checkUP, $GUI_DISABLE)
			update()
			GUICtrlSetState($checkUP, $GUI_ENABLE)
		Case $homepage
			ShellExecute("http://www.repaik.com")
		Case $Newweb
			ShellExecute("http://www.repaik.com/thread-52440-1-1.html")
		Case $Newurl
			ShellExecute("http://down.repaik.com/PESecretary")
		Case $GUI_EVENT_CLOSE
			ExitProgram()
		Case $Combousb
			usbsize()
		Case $Combousbefi
			exfat()
		Case $Exit
			ExitProgram()
		Case $Exituefi
			ExitProgram()
		Case $UEFIback
			systemhide()
			PEinfohide()
			UEFIhide()
			USBshow()
			GUICtrlSetImage($picsys1, $S2)
			GUICtrlSetImage($picsys2, $P2)
			GUICtrlSetImage($picsys3, $U1)
			GUICtrlSetImage($picsys4, $G2)
			GUICtrlSetImage($picsys5, $E1)
			GUICtrlSetPos($picsys1, 10, 160, 162, 48)
			GUICtrlSetPos($picsys2, 10, 160 + (1 * 68), 162, 48)
			GUICtrlSetPos($picsys3, 10, 160 + (2 * 68), 180, 48)
			GUICtrlSetPos($picsys4, 10, 160 + (4 * 68), 162, 48)
			GUICtrlSetPos($picsys5, 10, 160 + (3 * 68), 162, 48)
		Case $UEFImake
			;===>进度条
			exfat()
			$uefistate = GUICtrlRead($UEFIInputname)
			$askuefi = MsgBox(32 + 1 + 256, "睿派克U盘装机秘书提醒你", "制作完成后，U盘将可用从UEFI模式启动，以支持UEFI固件的主板" & @CR & "建议你制作前确保U盘剩余空间至少350MB" & @CR & "你确定要开始制作UEFI扩展启动支持吗？", 35)
			If $askuefi = 1 Then
				;$fbdrives = StringRegExp(GUICtrlRead($Combousbefi), '(?<=\()[^)]+', 1);使用正则表达式处理Combousbefi控件中的字符串，得到类似于hdx这样的字符串
				GUICtrlSetState($UEFImake, $GUI_HIDE)
				GUICtrlSetState($UEFIback, $GUI_HIDE)
				GUICtrlSetState($Exituefi, $GUI_HIDE)
				GUICtrlSetState($efimakeISO, $GUI_HIDE)
				GUICtrlSetState($picsys1, $GUI_DISABLE)
				GUICtrlSetState($picsys2, $GUI_DISABLE)
				GUICtrlSetState($picsys3, $GUI_DISABLE)
				GUICtrlSetState($picsys4, $GUI_DISABLE)
				GUICtrlSetState($picsys5, $GUI_DISABLE)
				GUICtrlSetState($Combousbefi, $GUI_DISABLE)
				
				$uefiprogress = _ProgressCreate(275, 432, 410, 22)
				_ProgressSetText($uefiprogress, "%P%%")
				_ProgressSetImages($uefiprogress, $tmpDirs & "\red.jpg", $tmpDirs & "\bg.jpg")
				_ProgressSetFont($uefiprogress, "", -1, -1, 0x339966)
				_ProgressSet($uefiprogress, 10)
				GUICtrlSetData($efitip, "  当前状态：正在提取UEFI程序包中，请稍后......")
				;$fbdrive = StringRight($fbdrives[0], 1);截取正则处理后的字符串结果从右边开始第一个，一般就是Win下的硬盘编号,也就是fibinst的U盘表示方法
				FileInstall("Rpkusbfbasource.fba", @HomeDrive & "\Rpkusbfbasource.fba", 1)
				_ProgressSet($uefiprogress, 10)
				
				FileInstall("fbinst.exe", @HomeDrive & "\fbinst.exe", 1)
				;运行fbinst.exe从fba源文件中取出来win8 x64 pe的ISO文件，提取到系统盘根目录下（主要为了避免不必要的空格）
				DirRemove(@HomeDrive & "\RPK", 1)
				DirCreate(@HomeDrive & "\RPK")
				RunWait(@HomeDrive & '\fbinst.exe' & @HomeDrive & '/Rpkusbfbasource.fba output boot/08PE.iso ' & @HomeDrive & '/RPK/', @HomeDrive, @SW_HIDE)
				If Not FileExists(@HomeDrive & "\RPK\boot\08PE.iso") Then RunWait(@ComSpec & " /c " & "fbinst.exe Rpkusbfbasource.fba output boot/08PE.iso %SystemDrive%/RPK/", @HomeDrive, @SW_HIDE)
				;RunWait($TempDir & '\7z.exe x "' & $TempDir & '\chrome.7z" -y', $TempDir, @SW_HIDE)
				FileDelete(@HomeDrive & "\fbinst.exe")
				FileDelete(@HomeDrive & "\Rpkusbfbasource.fba")
				GUICtrlSetData($efitip, "  当前状态：正在展开UEFI程序包中，请稍后......")
				;开始使用7z解压取出来的Win8PE的ISO
				FileInstall("7z.exe", @HomeDrive & "\RPK\boot\7z.exe", 1)
				FileInstall("7z.dll", @HomeDrive & "\RPK\boot\7z.dll", 1)
				;注意，工作目录参数必须和7z.exe命令行程序一致，否则不能解压！
				RunWait(@HomeDrive & '\RPK\boot\7z.exe x "' & @HomeDrive & '\RPK\boot\08PE.iso" -y', @HomeDrive & '\RPK\boot', @SW_HIDE)
				FileDelete(@HomeDrive & "\RPK\boot\7z.exe")
				FileDelete(@HomeDrive & "\RPK\boot\7z.dll")
				FileDelete(@HomeDrive & "\RPK\boot\08PE.iso")
				GUICtrlSetData($efitip, "  当前状态：正在读取目标U盘文件系统，请稍后......")
				_ProgressSet($uefiprogress, 20)
				$fbpanfus = StringStripWS(GUICtrlRead($Combousbefi), 8);强制删除读取到的字符串中的所有空格
				$fbpanfu = StringRight($fbpanfus, 2);截取删除空格后的字符串从右边开始的2个字符
				;MsgBox(64 + 0, "", $fbpanfu)
				GUICtrlSetData($efitip, "当前状态：正在处理目标磁盘文件系统，请稍后......")
				FileSetAttrib($fbpanfu & "\BOOTMGR", "-RSH")
				FileSetAttrib($fbpanfu & "\boot", "-RSH", 1)
				FileSetAttrib($fbpanfu & "\SOURCES", "-RSH", 1)
				FileSetAttrib($fbpanfu & "\efi", "-RSH", 1)
				FileDelete($fbpanfu & "\BOOTMGR")
				DirRemove($fbpanfu & "\boot", 1)
				DirRemove($fbpanfu & "\efi", 1)
				DirRemove($fbpanfu & "\SOURCES", 1)
				_ProgressSet($uefiprogress, 30)
				GUICtrlSetData($efitip, "当前状态：正在复制UEFI扩展文件到目标U盘，请稍后......")
				FileCopy(@HomeDrive & "\RPK\boot\BOOTMGR", $fbpanfu & "\BOOTMGR", 1)
				_ProgressSet($uefiprogress, 35)
				DirCopy(@HomeDrive & "\RPK\boot\boot", $fbpanfu & "\boot", 1)
				_ProgressSet($uefiprogress, 45)
				DirCopy(@HomeDrive & "\RPK\boot\efi", $fbpanfu & "\efi", 1)
				_ProgressSet($uefiprogress, 55)
				DirCopy(@HomeDrive & "\RPK\boot\SOURCES", $fbpanfu & "\SOURCES", 1)
				_ProgressSet($uefiprogress, 75)
				FileSetAttrib($fbpanfu & "\boot", "+RSH", 1)
				FileSetAttrib($fbpanfu & "\efi", "+RSH", 1)
				FileSetAttrib($fbpanfu & "\SOURCES", "+RSH", 1)
				FileSetAttrib($fbpanfu & "\BOOTMGR", "+RSH")
				_ProgressSet($uefiprogress, 95)
				Sleep(1000)
				_ProgressSet($uefiprogress, 100)
				GUICtrlSetState($efimakeISO, $GUI_SHOW)
				GUICtrlSetState($UEFImake, $GUI_SHOW)
				GUICtrlSetState($UEFIback, $GUI_SHOW)
				GUICtrlSetState($Exituefi, $GUI_SHOW)
				GUICtrlSetState($picsys1, $GUI_ENABLE)
				GUICtrlSetState($picsys2, $GUI_ENABLE)
				GUICtrlSetState($picsys3, $GUI_ENABLE)
				GUICtrlSetState($picsys4, $GUI_ENABLE)
				GUICtrlSetState($picsys5, $GUI_ENABLE)
				GUICtrlSetState($Combousbefi, $GUI_ENABLE)
				DirRemove(@HomeDrive & "\RPK", 1)
				FileDelete(@ScriptDir & "\Rpkusbfbasource.fba")
				_ProgressDelete($uefiprogress)
				GUICtrlSetData($efitip, "任务全部完成！你可以退出程序后访问睿派克论坛进行交流学习")
				;===>进度条
			EndIf
		Case $USBUpdate
			If GUICtrlRead($ATHCN) = $GUI_CHECKED Then
				Local $ATIHCNYES = 1
			EndIf
			If GUICtrlRead($ATHCN) = $GUI_UNCHECKED Then
				Local $ATIHCNYES = 0
			EndIf
			If GUICtrlRead($BITLOCK) = $GUI_CHECKED Then
				Local $BITLOCKYES = 1
			EndIf
			If GUICtrlRead($BITLOCK) = $GUI_UNCHECKED Then
				Local $BITLOCKYES = 0
			EndIf
			$Driveifstars = GUICtrlRead($Combousb)
			$DriveTsizess = StringRegExp(GUICtrlRead($Combousb), '(?<=\()[^)]+', 1);使用正则表达式处理Combousb控件中的字符串，得到类似于hdx这样的字符串
			$DriveTsizes = StringRight($DriveTsizess[0], 1);截取正则处理后的字符串结果从右边开始第一个，一般就是Win下的硬盘编号;也就是fbinst的硬盘编号
			$panfus = StringStripWS(GUICtrlRead($Combousb), 8);强制删除读取到的字符串中的所有空格
			$panfu = StringRight($panfus, 2);截取删除空格后的字符串从右边开始的2个字符
			$usbsize = Floor(DriveSpaceTotal($panfu));使用AU3获取Win下可见空间大小
			FileInstall("fbinst.exe", @HomeDrive & "\fbinst.exe", 1)
			If FileExists(@HomeDrive & '\udinfos.txt') Then FileDelete(@HomeDrive & '\udinfos.txt')
			If FileExists(@ScriptDir & '\udinfos.txt') Then FileDelete(@ScriptDir & '\udinfos.txt')
			RunWait(@ComSpec & ' /c ' & @HomeDrive & '\fbinst (hd' & $DriveTsizes & ') info > ' & @HomeDrive & '\udinfos.txt', @HomeDrive, @SW_HIDE)
			If FileGetSize(@HomeDrive & '\udinfos.txt') > 10 Then
				Local $fileopen = FileOpen(@HomeDrive & '\udinfos.txt')
				Local $fileread = FileReadLine($fileopen, 5)
				Local $filestrings2 = StringSplit(StringStripWS($fileread, 8), ":")
				Local $USBUDSIZE2 = $filestrings2[2] / 2048
				Local $DriveTsize = $USBUDSIZE2 + 8 + $usbsize
				FileClose($fileopen)
			EndIf
			If FileGetSize(@HomeDrive & '\udinfos.txt') < 10 Then
				Local $USBUDSIZE2 = "0"
				Local $DriveTsize = $usbsize
			EndIf
			;这里只是使用bootice来验证，需要事先复制bootice.exe到C盘根目录下
			;RunWait('cmd.exe  /c  C:\bootice.exe  /DEVICE=' & $panfu & ' /diskinfo /file=C:\diskinfo.ini', "C:\", @SW_HIDE)
			GUICtrlSetData($LabelUQ6, "物理容量" & $DriveTsize & "MB 可见容量" & $usbsize & "MB")
			$fbinstHDx = "(hd" & $DriveTsizes & ")"
			FileInstall("fbinst.exe", @HomeDrive & "\fbinst.exe", 1)
			;$foo=ShellExecuteWait ('C:\fbinst.exe',$fbinstHDx & ' filelist', @ScriptDir,"", @SW_HIDE)
			;$UDtotal = Round($foo/1024);得到UD数据文件总大小
			;MsgBox(64+0,"",$UDtotal)
			;MsgBox(64+0,"",$UDSIZEi)
			If StringInStr($Driveifstars, "*", 0) <> 0 And $USBUDSIZE2 > 380 Then
				$askusb7 = MsgBox(32 + 1 + 256, "提醒", "检测到你的U盘中含有合适空间的UD区，可进行升级安装，不会丢失U盘数据" & @CR & "你确定要继续进行升级制作么？点确定继续，取消返回")
				If $askusb7 = 1 Then
					GUICtrlSetState($USBmake, $GUI_HIDE)
					GUICtrlSetState($USBReset, $GUI_HIDE)
					GUICtrlSetState($USBUpdate, $GUI_HIDE)
					GUICtrlSetState($Exit, $GUI_HIDE)
					GUICtrlSetState($picsys1, $GUI_DISABLE)
					GUICtrlSetState($picsys2, $GUI_DISABLE)
					GUICtrlSetState($picsys3, $GUI_DISABLE)
					GUICtrlSetState($picsys4, $GUI_DISABLE)
					GUICtrlSetState($picsys5, $GUI_DISABLE)
					GUICtrlSetState($Combousb, $GUI_DISABLE)
					GUICtrlSetState($NoMEM, $GUI_DISABLE)
					GUICtrlSetState($InstallHDD, $GUI_DISABLE)
					GUICtrlSetState($BITLOCK, $GUI_DISABLE)
					GUICtrlSetState($ATHCN, $GUI_DISABLE)
					GUICtrlSetState($FBAmake, $GUI_DISABLE)
					FileInstall("gif\red.jpg", $tmpDirs & "\red.jpg", 1)
					FileInstall("gif\bg.jpg", $tmpDirs & "\bg.jpg", 1)
					$uefiprogress = _ProgressCreate(275, 422, 410, 22)
					_ProgressSetText($uefiprogress, "%P%%")
					_ProgressSetImages($uefiprogress, $tmpDirs & "\red.jpg", $tmpDirs & "\bg.jpg")
					_ProgressSetFont($uefiprogress, "", -1, -1, 0x339966)
					_ProgressSet($uefiprogress, 10)
					GUICtrlSetData($LabelTX, "当前状态：正在准备必备数据文件和引导程序中，请稍后......")
					FileInstall("fbinst.exe", @HomeDrive & "\fbinst.exe", 1)
					_ProgressSet($uefiprogress, 35)
					FileInstall("Rpkusbfbasource.fba", @HomeDrive & "\Rpkusbfbasource.fba", 1)
					_ProgressSet($uefiprogress, 45)
					GUICtrlSetData($LabelTX, "当前状态：正在将新PE写入目标U盘UD分区中，请稍后......")
					ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' clear', @HomeDrive, '', @SW_HIDE)
					ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' load ' & @HomeDrive & '/Rpkusbfbasource.fba', @HomeDrive, '', @SW_HIDE)
					GUICtrlSetData($LabelTX, "当前状态：正在将选择的附加功能写入目标U盘中，请稍后......")
					_ProgressSet($uefiprogress, 65)
					If $ATIHCNYES = 1 Then
						FileInstall("ATI5539CN.7z", @HomeDrive & "\ATI5539CN.7z", 1)
						_ProgressSet($uefiprogress, 70)
						ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' add --extended EXTS/ATI5539CN.7z ' & @HomeDrive & '/ATI5539CN.7z', @HomeDrive, '', @SW_HIDE)
						_ProgressSet($uefiprogress, 75)
					EndIf
					If $BITLOCKYES = 1 Then
						FileInstall("BITLOCKER.7z", @HomeDrive & "\BITLOCKER.7z", 1)
						_ProgressSet($uefiprogress, 80)
						ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' add --extended EXTS/BITLOCKER.7z ' & @HomeDrive & '/BITLOCKER.7z', @HomeDrive, '', @SW_HIDE)
						_ProgressSet($uefiprogress, 85)
					EndIf
					If GUICtrlRead($NoMEM) = $GUI_CHECKED Then
						GUICtrlSetData($LabelTX, "当前状态：正在调整PE的加载方式进行加速加载，请稍后......")
						_ProgressSet($uefiprogress, 90)
						FileInstall("menu.lst", @HomeDrive & "\menu.lst", 1)
						ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' add --extended menu.lst ' & @HomeDrive & '/menu.lst', @HomeDrive, '', @SW_HIDE)
						Sleep(1000)
						FileDelete(@HomeDrive & "\menu.lst")
					EndIf
					$NewUDsizes = ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' filelist', @HomeDrive, '', @SW_HIDE)
					$NewUDsize = Round($NewUDsizes / 1024)
					If $NewUDsize < 10 Then
						MsgBox(16 + 0, "抱歉", "制作失败! 请退出程序重新插入U盘再试!", 35)
					Else
						MsgBox(64 + 0, "恭喜", "制作成功！你可以选择安全移除U盘或者进行UEFI启动制作！", 35)
					EndIf
					GUICtrlSetData($LabelTX, "制作成功！你可以安全移除U盘退出程序或进行UEFI启动制作")
					Sleep(1000)
					_ProgressSet($uefiprogress, 100)
					GUICtrlSetState($USBmake, $GUI_SHOW)
					GUICtrlSetState($USBReset, $GUI_SHOW)
					GUICtrlSetState($USBUpdate, $GUI_SHOW)
					GUICtrlSetState($Exit, $GUI_SHOW)
					GUICtrlSetState($picsys1, $GUI_ENABLE)
					GUICtrlSetState($picsys2, $GUI_ENABLE)
					GUICtrlSetState($picsys3, $GUI_ENABLE)
					GUICtrlSetState($picsys4, $GUI_ENABLE)
					GUICtrlSetState($picsys5, $GUI_ENABLE)
					GUICtrlSetState($Combousb, $GUI_ENABLE)
					GUICtrlSetState($NoMEM, $GUI_ENABLE)
					GUICtrlSetState($InstallHDD, $GUI_ENABLE)
					GUICtrlSetState($BITLOCK, $GUI_ENABLE)
					GUICtrlSetState($ATHCN, $GUI_ENABLE)
					GUICtrlSetState($FBAmake, $GUI_ENABLE)
					_ProgressDelete($uefiprogress)
					GUICtrlSetData($LabelUQ8, "UD:420M|已用:" & $NewUDsize & "M");处理后的UD区大小写入label控件
					usbsize()
				Else
				EndIf
			EndIf
			If StringInStr($Driveifstars, "*", 0) <> 0 And $USBUDSIZE2 <= 380 Then
				MsgBox(64 + 0, "提醒", "检测到你的U盘中的UD区大小不适合升级安装！" & @CR & "只能使用全新制作或者导出fba文件包自行升级.", 35)
			EndIf
		Case $USBmake
			If GUICtrlRead($InstallHDD) = $GUI_CHECKED Then
				InstallHDD()
			EndIf
			If GUICtrlRead($InstallHDD) = $GUI_UNCHECKED Then
				If GUICtrlRead($ATHCN) = $GUI_CHECKED Then
					Local $ATIHCNYES = 1
				EndIf
				If GUICtrlRead($ATHCN) = $GUI_UNCHECKED Then
					Local $ATIHCNYES = 0
				EndIf
				If GUICtrlRead($BITLOCK) = $GUI_CHECKED Then
					Local $BITLOCKYES = 1
				EndIf
				If GUICtrlRead($BITLOCK) = $GUI_UNCHECKED Then
					Local $BITLOCKYES = 0
				EndIf
				$Driveifstars = GUICtrlRead($Combousb)
				$DriveTsizess = StringRegExp(GUICtrlRead($Combousb), '(?<=\()[^)]+', 1);使用正则表达式处理Combousb控件中的字符串，得到类似于hdx这样的字符串
				$DriveTsizes = StringRight($DriveTsizess[0], 1);截取正则处理后的字符串结果从右边开始第一个，一般就是Win下的硬盘编号;也就是fbinst的硬盘编号
				$panfus = StringStripWS(GUICtrlRead($Combousb), 8);强制删除读取到的字符串中的所有空格
				$panfu = StringRight($panfus, 2);截取删除空格后的字符串从右边开始的2个字符
				$usbsize = Floor(DriveSpaceTotal($panfu));使用AU3获取Win下可见空间大小
				FileInstall("fbinst.exe", @HomeDrive & "\fbinst.exe", 1)
				If FileExists(@HomeDrive & '\udinfos.txt') Then FileDelete(@HomeDrive & '\udinfos.txt')
				If FileExists(@ScriptDir & '\udinfos.txt') Then FileDelete(@ScriptDir & '\udinfos.txt')
				RunWait(@ComSpec & ' /c ' & @HomeDrive & '\fbinst (hd' & $DriveTsizes & ') info > ' & @HomeDrive & '\udinfos.txt', @HomeDrive, @SW_HIDE)
				If FileGetSize(@HomeDrive & '\udinfos.txt') > 10 Then
					Local $fileopen = FileOpen(@HomeDrive & '\udinfos.txt')
					Local $fileread = FileReadLine($fileopen, 5)
					Local $filestrings2 = StringSplit(StringStripWS($fileread, 8), ":")
					Local $USBUDSIZE2 = $filestrings2[2] / 2048
					Local $DriveTsize = $USBUDSIZE2 + 8 + $usbsize
					FileClose($fileopen)
				EndIf
				If FileGetSize(@HomeDrive & '\udinfos.txt') < 10 Then
					Local $USBUDSIZE2 = "0"
					Local $DriveTsize = $usbsize
				EndIf
				;这里只是使用bootice来验证，需要事先复制bootice.exe到C盘根目录下
				;RunWait('cmd.exe  /c  C:\bootice.exe  /DEVICE=' & $panfu & ' /diskinfo /file=C:\diskinfo.ini', "C:\", @SW_HIDE)
				GUICtrlSetData($LabelUQ6, "物理容量" & $DriveTsize & "MB 可见容量" & $usbsize & "MB")
				$fbinstHDx = "(hd" & $DriveTsizes & ")"
				FileInstall("fbinst.exe", @HomeDrive & "\fbinst.exe", 1)
				;$foo=ShellExecuteWait ('C:\fbinst.exe',$fbinstHDx & ' filelist', @ScriptDir,"", @SW_HIDE)
				;$UDtotal = Round($foo/1024);得到UD数据文件总大小
				;MsgBox(64+0,"",$UDtotal)
				;MsgBox(64+0,"",$UDSIZEi)
				If StringInStr($Driveifstars, "*", 0) <> 0 And $USBUDSIZE2 > 380 Then
					$askusb1 = MsgBox(32 + 1 + 256, "提醒", "检测到你的U盘中含有合适空间的UD区，可进行升级安装" & @CR & "你确定要放弃升级安装，继续进行全新制作么？点确定继续，取消返回")
					If $askusb1 = 1 Then
						GUICtrlSetState($USBmake, $GUI_HIDE)
						GUICtrlSetState($USBReset, $GUI_HIDE)
						GUICtrlSetState($USBUpdate, $GUI_HIDE)
						GUICtrlSetState($Exit, $GUI_HIDE)
						GUICtrlSetState($picsys1, $GUI_DISABLE)
						GUICtrlSetState($picsys2, $GUI_DISABLE)
						GUICtrlSetState($picsys3, $GUI_DISABLE)
						GUICtrlSetState($picsys4, $GUI_DISABLE)
						GUICtrlSetState($picsys5, $GUI_DISABLE)
						GUICtrlSetState($Combousb, $GUI_DISABLE)
						GUICtrlSetState($NoMEM, $GUI_DISABLE)
						GUICtrlSetState($InstallHDD, $GUI_DISABLE)
						GUICtrlSetState($BITLOCK, $GUI_DISABLE)
						GUICtrlSetState($ATHCN, $GUI_DISABLE)
						GUICtrlSetState($FBAmake, $GUI_DISABLE)
						FileInstall("gif\red.jpg", $tmpDirs & "\red.jpg", 1)
						FileInstall("gif\bg.jpg", $tmpDirs & "\bg.jpg", 1)
						$uefiprogress = _ProgressCreate(275, 422, 410, 22)
						_ProgressSetText($uefiprogress, "%P%%")
						_ProgressSetImages($uefiprogress, $tmpDirs & "\red.jpg", $tmpDirs & "\bg.jpg")
						_ProgressSetFont($uefiprogress, "", -1, -1, 0x339966)
						_ProgressSet($uefiprogress, 10)
						GUICtrlSetData($LabelTX, "当前状态：正在准备必备数据文件和引导程序中，请稍后......")
						FileInstall("fbinst.exe", @HomeDrive & "\fbinst.exe", 1)
						_ProgressSet($uefiprogress, 15)
						FileInstall("Rpkusbfbasource.fba", @HomeDrive & "\Rpkusbfbasource.fba", 1)
						_ProgressSet($uefiprogress, 35)
						GUICtrlSetData($LabelTX, "当前状态：正在格式化目标U盘并写入引导数据中，请稍后......")
						ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' format --raw --force', @HomeDrive, '', @SW_HIDE)
						_ProgressSet($uefiprogress, 45)
						GUICtrlSetData($LabelTX, "当前状态：正在将目标U盘分区并写入主要数据中，请稍后......")
						ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' format --extended 420m --force --align --fat32 --primary 8m --archive ' & @HomeDrive & '/Rpkusbfbasource.fba', @HomeDrive, '', @SW_HIDE)
						GUICtrlSetData($LabelTX, "当前状态：正在将选择的附加功能写入目标U盘中，请稍后......")
						_ProgressSet($uefiprogress, 65)
						If $ATIHCNYES = 1 Then
							FileInstall("ATI5539CN.7z", @HomeDrive & "\ATI5539CN.7z", 1)
							_ProgressSet($uefiprogress, 70)
							ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' add --extended EXTS/ATI5539CN.7z ' & @HomeDrive & '/ATI5539CN.7z', @HomeDrive, '', @SW_HIDE)
							_ProgressSet($uefiprogress, 75)
						EndIf
						If $BITLOCKYES = 1 Then
							FileInstall("BITLOCKER.7z", @HomeDrive & "\BITLOCKER.7z", 1)
							_ProgressSet($uefiprogress, 80)
							ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' add --extended EXTS/BITLOCKER.7z ' & @HomeDrive & '/BITLOCKER.7z', @HomeDrive, '', @SW_HIDE)
							_ProgressSet($uefiprogress, 85)
						EndIf
						If GUICtrlRead($NoMEM) = $GUI_CHECKED Then
							GUICtrlSetData($LabelTX, "当前状态：正在调整PE的加载方式进行加速加载，请稍后......")
							_ProgressSet($uefiprogress, 90)
							FileInstall("menu.lst", @HomeDrive & "\menu.lst", 1)
							ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' add --extended menu.lst ' & @HomeDrive & '/menu.lst', @HomeDrive, '', @SW_HIDE)
							Sleep(1000)
							FileDelete(@HomeDrive & "\menu.lst")
							FileDelete(@HomeDrive & "\menu.lst")
						EndIf
						$NewUDsizes = ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' filelist', @HomeDrive, '', @SW_HIDE)
						$NewUDsize = Round($NewUDsizes / 1024)
						If $NewUDsize < 10 Then
							MsgBox(16 + 0, "抱歉", "制作失败! 请退出程序重新插入U盘再试!", 35)
						Else
							MsgBox(64 + 0, "恭喜", "制作成功！你可以选择安全移除U盘或者进行UEFI启动制作！", 35)
						EndIf
						GUICtrlSetData($LabelTX, "制作成功！你可以安全移除U盘退出程序或进行UEFI启动制作")
						Sleep(1000)
						_ProgressSet($uefiprogress, 100)
						GUICtrlSetState($USBmake, $GUI_SHOW)
						GUICtrlSetState($USBReset, $GUI_SHOW)
						GUICtrlSetState($USBUpdate, $GUI_SHOW)
						GUICtrlSetState($Exit, $GUI_SHOW)
						GUICtrlSetState($picsys1, $GUI_ENABLE)
						GUICtrlSetState($picsys2, $GUI_ENABLE)
						GUICtrlSetState($picsys3, $GUI_ENABLE)
						GUICtrlSetState($picsys4, $GUI_ENABLE)
						GUICtrlSetState($picsys5, $GUI_ENABLE)
						GUICtrlSetState($Combousb, $GUI_ENABLE)
						GUICtrlSetState($NoMEM, $GUI_ENABLE)
						GUICtrlSetState($InstallHDD, $GUI_ENABLE)
						GUICtrlSetState($BITLOCK, $GUI_ENABLE)
						GUICtrlSetState($ATHCN, $GUI_ENABLE)
						GUICtrlSetState($FBAmake, $GUI_ENABLE)
						_ProgressDelete($uefiprogress)
						GUICtrlSetData($LabelUQ8, "UD:420M|已用:" & $NewUDsize & "M");处理后的UD区大小写入label控件
						usbsize()
					Else
					EndIf
				EndIf
				If StringInStr($Driveifstars, "*", 0) <> 0 And $USBUDSIZE2 < 380 Then
					$askusb3 = MsgBox(32 + 1 + 256, "提醒", "检测到你的U盘中含有UD启动隐藏分区，但分区大小不适合升级安装" & @CR & "你确定要现在立即开始制作睿派克U盘装机秘书吗？点确定继续，取消返回")
					If $askusb3 = 1 Then
						GUICtrlSetState($USBmake, $GUI_HIDE)
						GUICtrlSetState($USBReset, $GUI_HIDE)
						GUICtrlSetState($USBUpdate, $GUI_HIDE)
						GUICtrlSetState($Exit, $GUI_HIDE)
						GUICtrlSetState($picsys1, $GUI_DISABLE)
						GUICtrlSetState($picsys2, $GUI_DISABLE)
						GUICtrlSetState($picsys3, $GUI_DISABLE)
						GUICtrlSetState($picsys4, $GUI_DISABLE)
						GUICtrlSetState($picsys5, $GUI_DISABLE)
						GUICtrlSetState($Combousb, $GUI_DISABLE)
						GUICtrlSetState($NoMEM, $GUI_DISABLE)
						GUICtrlSetState($InstallHDD, $GUI_DISABLE)
						GUICtrlSetState($BITLOCK, $GUI_DISABLE)
						GUICtrlSetState($ATHCN, $GUI_DISABLE)
						GUICtrlSetState($FBAmake, $GUI_DISABLE)
						FileInstall("gif\red.jpg", $tmpDirs & "\red.jpg", 1)
						FileInstall("gif\bg.jpg", $tmpDirs & "\bg.jpg", 1)
						
						$uefiprogress = _ProgressCreate(275, 422, 410, 22)
						_ProgressSetText($uefiprogress, "%P%%")
						_ProgressSetImages($uefiprogress, $tmpDirs & "\red.jpg", $tmpDirs & "\bg.jpg")
						_ProgressSetFont($uefiprogress, "", -1, -1, 0x339966)
						_ProgressSet($uefiprogress, 10)
						GUICtrlSetData($LabelTX, "当前状态：正在准备必备数据文件和引导程序中，请稍后......")
						FileInstall("fbinst.exe", @HomeDrive & "\fbinst.exe", 1)
						_ProgressSet($uefiprogress, 25)
						FileInstall("Rpkusbfbasource.fba", @HomeDrive & "\Rpkusbfbasource.fba", 1)
						_ProgressSet($uefiprogress, 45)
						GUICtrlSetData($LabelTX, "当前状态：正在格式化目标U盘并写入引导数据中，请稍后......")
						ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' format --raw --force', @HomeDrive, '', @SW_HIDE)
						_ProgressSet($uefiprogress, 65)
						GUICtrlSetData($LabelTX, "当前状态：正在将目标U盘分区并写入主要数据中，请稍后......")
						ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' format --extended 420m --force --align --fat32 --primary 8m --archive ' & @HomeDrive & '/Rpkusbfbasource.fba', @HomeDrive, '', @SW_HIDE)
						GUICtrlSetData($LabelTX, "当前状态：正在将选择的附加功能写入目标U盘中，请稍后......")
						_ProgressSet($uefiprogress, 65)
						If $ATIHCNYES = 1 Then
							FileInstall("ATI5539CN.7z", @HomeDrive & "\ATI5539CN.7z", 1)
							_ProgressSet($uefiprogress, 70)
							ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' add --extended EXTS/ATI5539CN.7z ' & @HomeDrive & '/ATI5539CN.7z', @HomeDrive, '', @SW_HIDE)
							_ProgressSet($uefiprogress, 75)
						EndIf
						If $BITLOCKYES = 1 Then
							FileInstall("BITLOCKER.7z", @HomeDrive & "\BITLOCKER.7z", 1)
							_ProgressSet($uefiprogress, 80)
							ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' add --extended EXTS/BITLOCKER.7z ' & @HomeDrive & '/BITLOCKER.7z', @HomeDrive, '', @SW_HIDE)
							_ProgressSet($uefiprogress, 85)
						EndIf
						If GUICtrlRead($NoMEM) = $GUI_CHECKED Then
							GUICtrlSetData($LabelTX, "当前状态：正在调整PE的加载方式进行加速加载，请稍后......")
							_ProgressSet($uefiprogress, 90)
							FileInstall("menu.lst", @HomeDrive & "\menu.lst", 1)
							ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' add --extended menu.lst ' & @HomeDrive & '/menu.lst', @HomeDrive, '', @SW_HIDE)
							Sleep(1000)
							FileDelete(@HomeDrive & "\menu.lst")
						EndIf
						$NewUDsizes = ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' filelist', @HomeDrive, '', @SW_HIDE)
						$NewUDsize = Round($NewUDsizes / 1024)
						If $NewUDsize < 10 Then
							MsgBox(16 + 0, "抱歉", "制作失败! 请退出程序重新插入U盘再试!", 35)
						Else
							MsgBox(64 + 0, "恭喜", "制作成功！你可以选择安全移除U盘或者进行UEFI启动制作！", 35)
						EndIf
						GUICtrlSetData($LabelTX, "制作成功！你可以安全移除U盘退出程序或进行UEFI启动制作")
						Sleep(1000)
						_ProgressSet($uefiprogress, 100)
						GUICtrlSetState($USBmake, $GUI_SHOW)
						GUICtrlSetState($USBReset, $GUI_SHOW)
						GUICtrlSetState($USBUpdate, $GUI_SHOW)
						GUICtrlSetState($Exit, $GUI_SHOW)
						GUICtrlSetState($picsys1, $GUI_ENABLE)
						GUICtrlSetState($picsys2, $GUI_ENABLE)
						GUICtrlSetState($picsys3, $GUI_ENABLE)
						GUICtrlSetState($picsys4, $GUI_ENABLE)
						GUICtrlSetState($picsys5, $GUI_ENABLE)
						GUICtrlSetState($Combousb, $GUI_ENABLE)
						GUICtrlSetState($NoMEM, $GUI_ENABLE)
						GUICtrlSetState($InstallHDD, $GUI_ENABLE)
						GUICtrlSetState($BITLOCK, $GUI_ENABLE)
						GUICtrlSetState($ATHCN, $GUI_ENABLE)
						GUICtrlSetState($FBAmake, $GUI_ENABLE)
						_ProgressDelete($uefiprogress)
						GUICtrlSetData($LabelUQ8, "UD:420M|已用:" & $NewUDsize & "M");处理后的UD区大小写入label控件
						usbsize()
					Else
					EndIf
				EndIf
				If StringInStr($Driveifstars, "*", 0) = 0 Then
					$askusb2 = MsgBox(32 + 1 + 256, "提醒", "一旦开始制作，U盘数据将全部丢失！建议你事先备份U盘内重要数据！" & @CR & "你确定要现在立即开始制作睿派克U盘装机秘书吗？点确定继续，取消返回")
					If $askusb2 = 1 Then
						GUICtrlSetState($USBmake, $GUI_HIDE)
						GUICtrlSetState($USBReset, $GUI_HIDE)
						GUICtrlSetState($USBUpdate, $GUI_HIDE)
						GUICtrlSetState($Exit, $GUI_HIDE)
						GUICtrlSetState($picsys1, $GUI_DISABLE)
						GUICtrlSetState($picsys2, $GUI_DISABLE)
						GUICtrlSetState($picsys3, $GUI_DISABLE)
						GUICtrlSetState($picsys4, $GUI_DISABLE)
						GUICtrlSetState($picsys5, $GUI_DISABLE)
						GUICtrlSetState($Combousb, $GUI_DISABLE)
						GUICtrlSetState($NoMEM, $GUI_DISABLE)
						GUICtrlSetState($InstallHDD, $GUI_DISABLE)
						GUICtrlSetState($BITLOCK, $GUI_DISABLE)
						GUICtrlSetState($ATHCN, $GUI_DISABLE)
						GUICtrlSetState($FBAmake, $GUI_DISABLE)
						
						FileInstall("gif\red.jpg", $tmpDirs & "\red.jpg", 1)
						FileInstall("gif\bg.jpg", $tmpDirs & "\bg.jpg", 1)
						
						$uefiprogress = _ProgressCreate(275, 422, 410, 22)
						_ProgressSetText($uefiprogress, "%P%%")
						_ProgressSetImages($uefiprogress, $tmpDirs & "\red.jpg", $tmpDirs & "\bg.jpg")
						_ProgressSetFont($uefiprogress, "", -1, -1, 0x339966)
						_ProgressSet($uefiprogress, 10)
						
						GUICtrlSetData($LabelTX, "当前状态：正在准备必备数据文件和引导程序中，请稍后......")
						FileInstall("fbinst.exe", @HomeDrive & "\fbinst.exe", 1)
						_ProgressSet($uefiprogress, 25)
						FileInstall("Rpkusbfbasource.fba", @HomeDrive & "\Rpkusbfbasource.fba", 1)
						_ProgressSet($uefiprogress, 45)
						GUICtrlSetData($LabelTX, "当前状态：正在格式化目标U盘并写入引导数据中，请稍后......")
						ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' format --raw --force', @HomeDrive, '', @SW_HIDE)
						_ProgressSet($uefiprogress, 65)
						GUICtrlSetData($LabelTX, "当前状态：正在将目标U盘分区并写入主要数据中，请稍后......")
						ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' format --extended 420m --force --align --fat32 --primary 8m --archive ' & @HomeDrive & '/Rpkusbfbasource.fba', @HomeDrive, '', @SW_HIDE)
						GUICtrlSetData($LabelTX, "当前状态：正在将选择的附加功能写入目标U盘中，请稍后......")
						_ProgressSet($uefiprogress, 65)
						If $ATIHCNYES = 1 Then
							FileInstall("ATI5539CN.7z", @HomeDrive & "\ATI5539CN.7z", 1)
							_ProgressSet($uefiprogress, 70)
							ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' add --extended EXTS/ATI5539CN.7z ' & @HomeDrive & '/ATI5539CN.7z', @HomeDrive, '', @SW_HIDE)
							_ProgressSet($uefiprogress, 75)
						EndIf
						If $BITLOCKYES = 1 Then
							FileInstall("BITLOCKER.7z", @HomeDrive & "\BITLOCKER.7z", 1)
							_ProgressSet($uefiprogress, 80)
							ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' add --extended EXTS/BITLOCKER.7z ' & @HomeDrive & '/BITLOCKER.7z', @HomeDrive, '', @SW_HIDE)
							_ProgressSet($uefiprogress, 85)
						EndIf
						If GUICtrlRead($NoMEM) = $GUI_CHECKED Then
							GUICtrlSetData($LabelTX, "当前状态：正在调整PE的加载方式进行加速加载，请稍后......")
							_ProgressSet($uefiprogress, 90)
							FileInstall("menu.lst", @HomeDrive & "\menu.lst", 1)
							ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' add --extended menu.lst ' & @HomeDrive & '/menu.lst', @HomeDrive, '', @SW_HIDE)
							Sleep(1000)
							FileDelete(@HomeDrive & "\menu.lst")
						EndIf
						$NewUDsizes = ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' filelist', @HomeDrive, '', @SW_HIDE)
						$NewUDsize = Round($NewUDsizes / 1024)
						FileDelete(@HomeDrive & "\fbinst.exe")
						FileDelete(@HomeDrive & "\Rpkusbfbasource.fba")
						If $NewUDsize < 10 Then
							MsgBox(16 + 0, "抱歉", "制作失败! 请退出程序重新插入U盘再试!", 35)
							GUICtrlSetData($LabelTX, "当前状态：制作失败！没有写入启动文件和数据，请检查U盘")
							_ProgressSet($uefiprogress, 100)
						Else
							MsgBox(64 + 0, "恭喜", "制作成功！你可以选择安全移除U盘或者进行UEFI启动制作！", 35)
							GUICtrlSetData($LabelTX, "制作成功！你可以安全移除U盘退出程序或进行UEFI启动制作")
							_ProgressSet($uefiprogress, 100)
						EndIf
						GUICtrlSetState($USBmake, $GUI_SHOW)
						GUICtrlSetState($USBReset, $GUI_SHOW)
						GUICtrlSetState($USBUpdate, $GUI_SHOW)
						GUICtrlSetState($Exit, $GUI_SHOW)
						GUICtrlSetState($picsys1, $GUI_ENABLE)
						GUICtrlSetState($picsys2, $GUI_ENABLE)
						GUICtrlSetState($picsys3, $GUI_ENABLE)
						GUICtrlSetState($picsys4, $GUI_ENABLE)
						GUICtrlSetState($picsys5, $GUI_ENABLE)
						GUICtrlSetState($Combousb, $GUI_ENABLE)
						GUICtrlSetState($NoMEM, $GUI_ENABLE)
						GUICtrlSetState($InstallHDD, $GUI_ENABLE)
						GUICtrlSetState($BITLOCK, $GUI_ENABLE)
						GUICtrlSetState($ATHCN, $GUI_ENABLE)
						GUICtrlSetState($FBAmake, $GUI_ENABLE)
						_ProgressDelete($uefiprogress)
						GUICtrlSetData($LabelUQ8, "UD:420M|已用:" & $NewUDsize & "M");处理后的UD区大小写入label控件
						usbsize()
					EndIf
				EndIf
			EndIf
		Case $USBReset
			$Driveifstars = GUICtrlRead($Combousb)
			$DriveTsizess = StringRegExp(GUICtrlRead($Combousb), '(?<=\()[^)]+', 1);使用正则表达式处理Combousb控件中的字符串，得到类似于hdx这样的字符串
			$DriveTsizes = StringRight($DriveTsizess[0], 1);截取正则处理后的字符串结果从右边开始第一个，一般就是Win下的硬盘编号;也就是fbinst的硬盘编号
			$fbinstHDx = "(hd" & $DriveTsizes & ")"
			FileInstall("fbinst.exe", @HomeDrive & "\fbinst.exe", 1)
			$askusb5 = MsgBox(32 + 1 + 256, "提醒", "一旦还原，所有U盘可见区和隐藏UD分区数据将全部丢失！建议你备份重要数据后再继续！" & @CR & "你确定要现在立即开始还原U盘到初始状态吗？点确定继续，取消返回")
			If $askusb5 = 1 Then
				GUICtrlSetState($USBmake, $GUI_HIDE)
				GUICtrlSetState($USBReset, $GUI_HIDE)
				GUICtrlSetState($USBUpdate, $GUI_HIDE)
				GUICtrlSetState($Exit, $GUI_HIDE)
				GUICtrlSetState($picsys1, $GUI_DISABLE)
				GUICtrlSetState($picsys2, $GUI_DISABLE)
				GUICtrlSetState($picsys3, $GUI_DISABLE)
				GUICtrlSetState($picsys4, $GUI_DISABLE)
				GUICtrlSetState($picsys5, $GUI_DISABLE)
				GUICtrlSetState($Combousb, $GUI_DISABLE)
				GUICtrlSetState($NoMEM, $GUI_DISABLE)
				GUICtrlSetState($InstallHDD, $GUI_DISABLE)
				GUICtrlSetState($BITLOCK, $GUI_DISABLE)
				GUICtrlSetState($ATHCN, $GUI_DISABLE)
				GUICtrlSetState($FBAmake, $GUI_DISABLE)
				
				FileInstall("gif\red.jpg", $tmpDirs & "\red.jpg", 1)
				FileInstall("gif\bg.jpg", $tmpDirs & "\bg.jpg", 1)
				
				$uefiprogress = _ProgressCreate(275, 422, 410, 22)
				_ProgressSetText($uefiprogress, "%P%%")
				_ProgressSetImages($uefiprogress, $tmpDirs & "\red.jpg", $tmpDirs & "\bg.jpg")
				_ProgressSetFont($uefiprogress, "", -1, -1, 0x339966)
				_ProgressSet($uefiprogress, 10)
				Sleep(2000)
				_ProgressSet($uefiprogress, 45)
				GUICtrlSetData($LabelTX, "当前状态：正在还原目标U盘到初始状态中，请稍后......")
				ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' format --raw --force', @HomeDrive, '', @SW_HIDE)
				_ProgressSet($uefiprogress, 85)
				FileDelete(@HomeDrive & "\fbinst.exe")
				Sleep(2000)
				$panfusnew = StringStripWS(GUICtrlRead($Combousb), 8);强制删除读取到的字符串中的所有空格
				$panfunew = StringRight($panfusnew, 2);截取删除空格后的字符串从右边开始的2个字符
				$usbsizenew = Floor(DriveSpaceTotal($panfunew));使用AU3获取Win下可见空间大小
				MsgBox(64 + 0, "提示", "初始化U盘后，U盘的容量为:" & $usbsizenew & "MB", 35)
				GUICtrlSetState($USBmake, $GUI_SHOW)
				GUICtrlSetState($USBReset, $GUI_SHOW)
				GUICtrlSetState($USBUpdate, $GUI_SHOW)
				GUICtrlSetState($Exit, $GUI_SHOW)
				GUICtrlSetState($picsys1, $GUI_ENABLE)
				GUICtrlSetState($picsys2, $GUI_ENABLE)
				GUICtrlSetState($picsys3, $GUI_ENABLE)
				GUICtrlSetState($picsys4, $GUI_ENABLE)
				GUICtrlSetState($picsys5, $GUI_ENABLE)
				GUICtrlSetState($Combousb, $GUI_ENABLE)
				GUICtrlSetState($NoMEM, $GUI_ENABLE)
				GUICtrlSetState($InstallHDD, $GUI_ENABLE)
				GUICtrlSetState($BITLOCK, $GUI_ENABLE)
				GUICtrlSetState($ATHCN, $GUI_ENABLE)
				GUICtrlSetState($FBAmake, $GUI_ENABLE)
				GUICtrlSetData($LabelTX, "已经成功还原U盘到初始化状态，请退出程序或者进行其他操作")
				usbsize()
			Else
			EndIf
		Case $Exituefi
			ExitProgram()
	EndSwitch
WEnd
Func ExitProgram()
	DirRemove($tmpDirs, 1)
	FileDelete("C:\fbinst.exe")
	FileDelete("C:\Rpkusbfbasource.fba")
	FileDelete(@HomeDrive & "\Rpkusbfbasource.fba")
	FileDelete(@HomeDrive & "\fbinst.exe")
	FileDelete(@HomeDrive & "\udinfos.txt")
	FileDelete(@HomeDrive & "\ATI5539CN.7z")
	FileDelete(@HomeDrive & "\BITLOCKER.7z")
	RegDelete("HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers", @HomeDrive & "\fbinst.exe")
	GUIDelete($GUI)
	_WaterCtrl_Shutdown()
	Exit
EndFunc   ;==>ExitProgram
Func InstallHDD()
	GUICtrlSetState($USBmake, $GUI_DISABLE)
	GUICtrlSetState($USBReset, $GUI_DISABLE)
	GUICtrlSetState($USBUpdate, $GUI_DISABLE)
	GUICtrlSetState($Exit, $GUI_DISABLE)
	GUICtrlSetState($picsys1, $GUI_DISABLE)
	GUICtrlSetState($picsys2, $GUI_DISABLE)
	GUICtrlSetState($picsys3, $GUI_DISABLE)
	GUICtrlSetState($picsys4, $GUI_DISABLE)
	GUICtrlSetState($picsys5, $GUI_DISABLE)
	GUICtrlSetState($Combousb, $GUI_DISABLE)
	GUICtrlSetState($NoMEM, $GUI_DISABLE)
	GUICtrlSetState($InstallHDD, $GUI_DISABLE)
	GUICtrlSetState($BITLOCK, $GUI_DISABLE)
	GUICtrlSetState($ATHCN, $GUI_DISABLE)
	GUICtrlSetState($FBAmake, $GUI_DISABLE)
	GUICtrlSetData($LabelTX, "  当前状态：程序正在准备本机系统及环境中，请稍候......")
	Sleep(1000)
	;$ver = DriveGetDrive("FIXED")
	;$i = $ver[0]
	;$var = StringUpper($ver[$i])
	;$DriveFreeSize = DriveSpaceFree($var & "\")
	;If $var <> @HomeDrive And $DriveFreeSize > "500" Then;不等于系统盘，剩余容量大于500MB
	$PEDrive = @HomeDrive
	Local $FBAFILE = @HomeDrive & '/Rpkusbfbasource.fba'
	If $OS <= "5.2" Then;如果是NT5.2系统，则简单写boot.ini，拷贝文件就能安装
		GUICtrlSetData($LabelTX, "  当前状态：正在处理本机系统的引导文件中，请稍候......")
		;_ProgressSet($uefiprogress, 40)
		Sleep(1000)
		If FileExists(@HomeDrive & "\boot.ini.rpk") Then FileDelete(@HomeDrive & "\boot.ini.rpk")
		FileSetAttrib(@HomeDrive & "\boot.ini", "-HSR")
		FileCopy(@HomeDrive & "\boot.ini", @HomeDrive & "\boot.ini.rpk", 1)
		FileSetAttrib(@HomeDrive & "\boot.ini.rpk", "+HR")
		IniWrite(@HomeDrive & "\boot.ini", "operating systems", $PEDrive & "\rpkdr.mbr", "睿派克维护系统")
		;运行fbinst.exe从fba源文件中取出来本机系统PE的所需文件到检测到的合适的分区下
		DirRemove($PEDrive & "\RPK", 1)
		DirCreate($PEDrive & "\RPK")
		;_ProgressSet($uefiprogress, 50)
		GUICtrlSetData($LabelTX, "  当前状态：正在将PE核心文件复制到特定位置中，请稍候......")
		FileInstall("Rpkusbfbasource.fba", @HomeDrive & "\Rpkusbfbasource.fba", 1)
		FileInstall("fbinst.exe", @HomeDrive & "\fbinst.exe", 1)
		RunWait(@HomeDrive & '\fbinst.exe ' & $FBAFILE & ' output "boot/*.i*" ' & $PEDrive & '/RPK/', @HomeDrive, @SW_HIDE)
		RunWait(@HomeDrive & '\fbinst.exe ' & $FBAFILE & ' output "tools/*.im?*" ' & $PEDrive & '/RPK/', @HomeDrive, @SW_HIDE)
		RunWait(@HomeDrive & '\fbinst.exe ' & $FBAFILE & ' output "message" ' & $PEDrive & '/RPK/', @HomeDrive, @SW_HIDE)
		FileInstall("toolhdd.lst", $PEDrive & "\RPK\TOOLS.LST", 1)
		If FileExists($PEDrive & "\rpkdr.mbr") Then FileSetAttrib($PEDrive & "\rpkdr.mbr", "-HSR")
		FileDelete($PEDrive & "\rpkdr.mbr")
		FileInstall("rpkdr.mbr", $PEDrive & "\rpkdr.mbr", 1)
		If FileExists($PEDrive & "\rpkdr") Then FileSetAttrib($PEDrive & "\rpkdr", "-HSR")
		FileDelete($PEDrive & "\rpkdr")
		FileInstall("rpkdr", $PEDrive & "\rpkdr", 1)
		FileSetAttrib($PEDrive & "\rpkdr", "+HSR")
		FileSetAttrib($PEDrive & "\rpkdr.mbr", "+HSR")
		FileSetAttrib(@HomeDrive & "\boot.ini", "+HSR")
		FileSetAttrib($PEDrive & "\RPK", "+H", 1)
		GUICtrlSetData($LabelTX, "  当前状态：正在检查本机系统的PE文件是否完整，请稍候......")
		Sleep(1000)
		$PEDIRSIZE = Round(DirGetSize($PEDrive & "\RPK") / 1024 / 1024)
		If $PEDIRSIZE < 340 Then
			MsgBox(64 + 0, "提醒", "安装到本机系统的PE文件不完整！" & @CRLF & "建议你退出程序重新安装到本机系统！", 35)
		Else
			MsgBox(64 + 0, "提醒", "将PE维护系统安装到本机系统的启动菜单完成，你可以退出程序享受睿派克秘书的服务！", 35)
		EndIf
		;_ProgressSet($uefiprogress, 90)
	EndIf
	If $OS > "5.2" Then;如果是Vista及以上系统，则调用BcdEdit来添加启动引导
		Sleep(1000)
		If Not FileExists(@WindowsDir & "\Bcdedit.exe") Then FileInstall("Bcdedit.exe", @WindowsDir & "\Bcdedit.exe")
		Local $BCDEDIT = @WindowsDir & "\Bcdedit.exe"
		Local $VID = "{F8271F63-1D7F-46BA-A36D-1D192901D0DC}"
		GUICtrlSetData($LabelTX, "  当前状态：正在添加PE引导菜单到本机系统中，请稍候......")
		RunWait(@ComSpec & " /c " & $BCDEDIT & " /delete " & $VID, "", 0)
		ShellExecuteWait($BCDEDIT, "/create " & $VID & " /d  睿派克维护系统 /application bootsector", @SystemDir, "", 0)
		RunWait(@ComSpec & " /c " & $BCDEDIT & " /set " & $VID & " device boot", "", 0)
		RunWait(@ComSpec & " /c " & $BCDEDIT & " /set " & $VID & " path \rpkdr.mbr", "", 0)
		RunWait(@ComSpec & " /c " & $BCDEDIT & " /displayorder " & $VID & " /addlast", "", 0)
		RunWait(@ComSpec & " /c " & $BCDEDIT & " /timeout 5", "", 0)
		DirRemove($PEDrive & "\RPK", 1)
		DirCreate($PEDrive & "\RPK")
		FileInstall("Rpkusbfbasource.fba", @HomeDrive & "\Rpkusbfbasource.fba", 1)
		FileInstall("fbinst.exe", @HomeDrive & "\fbinst.exe", 1)
		GUICtrlSetData($LabelTX, "  当前状态：正在将PE核心文件复制到特定位置中，请稍候......")
		RunWait(@HomeDrive & '\fbinst.exe ' & $FBAFILE & ' output "boot/*.i*" ' & $PEDrive & '/RPK/', @HomeDrive, @SW_HIDE)
		RunWait(@HomeDrive & '\fbinst.exe ' & $FBAFILE & ' output "tools/*.im?*" ' & $PEDrive & '/RPK/', @HomeDrive, @SW_HIDE)
		RunWait(@HomeDrive & '\fbinst.exe ' & $FBAFILE & ' output "message" ' & $PEDrive & '/RPK/', @HomeDrive, @SW_HIDE)
		FileInstall("toolhdd.lst", $PEDrive & "\RPK\TOOLS.LST", 1)
		If FileExists($PEDrive & "\rpkdr.mbr") Then FileSetAttrib($PEDrive & "\rpkdr.mbr", "-HSR")
		FileDelete($PEDrive & "\rpkdr.mbr")
		FileInstall("rpkdr.mbr", $PEDrive & "\rpkdr.mbr", 1)
		If FileExists($PEDrive & "\rpkdr") Then FileSetAttrib($PEDrive & "\rpkdr", "-HSR")
		FileDelete($PEDrive & "\rpkdr")
		FileInstall("rpkdr", $PEDrive & "\rpkdr", 1)
		FileSetAttrib($PEDrive & "\rpkdr", "+HSR")
		FileSetAttrib($PEDrive & "\rpkdr.mbr", "+HSR")
		FileSetAttrib($PEDrive & "\RPK", "+H", 1)
		GUICtrlSetData($LabelTX, "  当前状态：正在检查本机系统的PE文件是否完整，请稍候......")
		Sleep(1000)
		FileDelete(@HomeDrive & "\fbinst.exe")
		FileDelete(@HomeDrive & "\Rpkusbfbasource.fba")
		FileDelete($BCDEDIT)
		$PEDIRSIZE = Round(DirGetSize($PEDrive & "\RPK") / 1024 / 1024)
		If $PEDIRSIZE < 340 Then
			MsgBox(64 + 0, "提醒", "安装到本机系统的PE文件不完整！" & @CRLF & "建议你退出程序重新安装到本机系统！", 35)
		Else
			MsgBox(64 + 0, "提醒", "将PE维护系统安装到本机系统的启动菜单完成，你可以退出程序享受睿派克秘书的服务！", 35)
		EndIf
		
	EndIf
	;取到第一个就退出循环就行了
	GUICtrlSetData($LabelTX, "制作成功！你可以关闭程序访问睿派克技术论坛进行交流学习！")
	GUICtrlSetState($USBmake, $GUI_ENABLE)
	GUICtrlSetState($USBReset, $GUI_ENABLE)
	GUICtrlSetState($USBUpdate, $GUI_ENABLE)
	GUICtrlSetState($Exit, $GUI_ENABLE)
	GUICtrlSetState($picsys1, $GUI_ENABLE)
	GUICtrlSetState($picsys2, $GUI_ENABLE)
	GUICtrlSetState($picsys3, $GUI_ENABLE)
	GUICtrlSetState($picsys4, $GUI_ENABLE)
	GUICtrlSetState($picsys5, $GUI_ENABLE)
	GUICtrlSetState($Combousb, $GUI_ENABLE)
	GUICtrlSetState($NoMEM, $GUI_ENABLE)
	GUICtrlSetState($InstallHDD, $GUI_ENABLE)
	GUICtrlSetState($BITLOCK, $GUI_ENABLE)
	GUICtrlSetState($ATHCN, $GUI_ENABLE)
	GUICtrlSetState($FBAmake, $GUI_ENABLE)
EndFunc   ;==>InstallHDD
Func usbsize()
	$Driveifstars = GUICtrlRead($Combousb)
	$DriveTsizess = StringRegExp(GUICtrlRead($Combousb), '(?<=\()[^)]+', 1);使用正则表达式处理Combousb控件中的字符串，得到类似于hdx这样的字符串
	$panfus = StringStripWS(GUICtrlRead($Combousb), 8);强制删除读取到的字符串中的所有空格
	$panfu = StringRight($panfus, 2);截取删除空格后的字符串从右边开始的2个字符
	$usbsize = Floor(DriveSpaceTotal($panfu));使用AU3获取Win下可见空间大小
	If $Driveifstars <> "" Then
		$DriveTsizes = StringRight($DriveTsizess[0], 1);截取正则处理后的字符串结果从右边开始第一个，一般就是Win下的硬盘编号
		FileInstall("fbinst.exe", @HomeDrive & "\fbinst.exe", 1)
		If FileExists(@HomeDrive & '\udinfos.txt') Then FileDelete(@HomeDrive & '\udinfos.txt')
		If FileExists(@ScriptDir & '\udinfos.txt') Then FileDelete(@ScriptDir & '\udinfos.txt')
		RunWait(@ComSpec & ' /c ' & @HomeDrive & '\fbinst (hd' & $DriveTsizes & ') info > ' & @HomeDrive & '\udinfos.txt', @HomeDrive, @SW_HIDE)
		If FileGetSize(@HomeDrive & '\udinfos.txt') > 10 Then
			Local $fileopen = FileOpen(@HomeDrive & '\udinfos.txt')
			Local $fileread = FileReadLine($fileopen, 5)
			Local $filestrings2 = StringSplit(StringStripWS($fileread, 8), ":")
			Local $USBUDSIZE2 = $filestrings2[2] / 2048
			Local $DriveTsize = $USBUDSIZE2 + 8 + $usbsize
			FileClose($fileopen)
		EndIf
		If FileGetSize(@HomeDrive & '\udinfos.txt') < 10 Then
			Local $USBUDSIZE2 = "0"
			Local $DriveTsize = $usbsize
		EndIf
		;这里只是使用bootice来验证，需要事先复制bootice.exe到C盘根目录下
		;RunWait('cmd.exe  /c  C:\bootice.exe  /DEVICE=' & $panfu & ' /diskinfo /file=C:\diskinfo.ini', "C:\", @SW_HIDE)
		GUICtrlSetData($LabelUQ6, "物理容量" & $DriveTsize & "MB 可见容量" & $usbsize & "MB")
		$fbinstHDx = "(hd" & $DriveTsizes & ")"
		FileInstall("fbinst.exe", @HomeDrive & "\fbinst.exe", 1)
		$foo = ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' filelist', @HomeDrive, '', @SW_HIDE)
		$UDtotal = Round($foo / 1024);得到UD数据文件总大小
		If $USBUDSIZE2 < 20 Then;较大容量的U盘这个结果可能比较大，故我设置了一个合理的数据
			$UDSIZE = "无UD"
		EndIf
		If $USBUDSIZE2 >= 20 Then;
			$UDSIZE = $USBUDSIZE2 & "M"
			;MsgBox(64 + 0, "", $DriveTsizess[0] & "U盘盘符的FBINST表示方法为：" & $DriveTsizes)
		EndIf
		GUICtrlSetData($LabelUQ8, "UD区:" & $UDSIZE & "|已用" & $UDtotal & "M");处理后的UD区大小写入label控件
	EndIf
	If $Driveifstars = "" Then
		GUICtrlSetData($LabelUQ8, "UD区:无UD启动区");处理后的UD区大小写入label控件
	EndIf
EndFunc   ;==>usbsize
Func _disk()
	Local $foo, $line, $lines
	FileDelete(@HomeDrive & "\fbinst.exe")
	FileInstall("fbinst.exe", @HomeDrive & "\fbinst.exe", 1)
	$foo = Run(@ComSpec & ' /c ' & @HomeDrive & '\fbinst --hdlist "(hd%N) %I %Sg %U %P" --USB', @HomeDrive, @SW_HIDE, $STDOUT_CHILD)
	$lines = ""
	While 1
		$line = StdoutRead($foo)
		If @error Then
			$UDUSBYN = "没有U盘含有UD系统区"
			ExitLoop
		EndIf
		$lines &= $line
	WEnd
	Return $lines
EndFunc   ;==>_disk
;替换fbinst检测磁盘返回值字符串中的空字符
Func replace0()
	$outdisk = StringReplace($disk, @CR, "", -1)
	Return $outdisk
EndFunc   ;==>replace0
Func systemhide()
	GUICtrlSetState($group1, $GUI_HIDE)
	GUICtrlSetState($group2, $GUI_HIDE)
	GUICtrlSetState($group3, $GUI_HIDE)
	GUICtrlSetState($SICOMS, $GUI_HIDE)
	GUICtrlSetState($SICOUP, $GUI_HIDE)
	GUICtrlSetState($Label1, $GUI_HIDE)
	GUICtrlSetState($Label2, $GUI_HIDE)
	GUICtrlSetState($Label3, $GUI_HIDE)
	GUICtrlSetState($Label4, $GUI_HIDE)
	GUICtrlSetState($Label5, $GUI_HIDE)
	GUICtrlSetState($Label6, $GUI_HIDE)
	GUICtrlSetState($Label7, $GUI_HIDE)
	GUICtrlSetState($Label8, $GUI_HIDE)
	GUICtrlSetState($Label9, $GUI_HIDE)
	GUICtrlSetState($Label10, $GUI_HIDE)
	GUICtrlSetState($Label11, $GUI_HIDE)
	GUICtrlSetState($Label12, $GUI_HIDE)
	GUICtrlSetState($Combo1, $GUI_HIDE)
EndFunc   ;==>systemhide
Func systemshow()
	GUICtrlSetState($group1, $GUI_SHOW)
	GUICtrlSetState($group2, $GUI_SHOW)
	GUICtrlSetState($group3, $GUI_SHOW)
	GUICtrlSetState($SICOMS, $GUI_SHOW)
	GUICtrlSetState($SICOUP, $GUI_SHOW)
	GUICtrlSetState($Label1, $GUI_SHOW)
	GUICtrlSetState($Label2, $GUI_SHOW)
	GUICtrlSetState($Label3, $GUI_SHOW)
	GUICtrlSetState($Label4, $GUI_SHOW)
	GUICtrlSetState($Label5, $GUI_SHOW)
	GUICtrlSetState($Label6, $GUI_SHOW)
	GUICtrlSetState($Label7, $GUI_SHOW)
	GUICtrlSetState($Label8, $GUI_SHOW)
	GUICtrlSetState($Label9, $GUI_SHOW)
	GUICtrlSetState($Label10, $GUI_SHOW)
	GUICtrlSetState($Label11, $GUI_SHOW)
	GUICtrlSetState($Label12, $GUI_SHOW)
	GUICtrlSetState($Combo1, $GUI_SHOW)
EndFunc   ;==>systemshow
Func PEinfohide()
	GUICtrlSetState($groupP1, $GUI_HIDE)
	GUICtrlSetState($groupP2, $GUI_HIDE)
	GUICtrlSetState($groupP3, $GUI_HIDE)
	GUICtrlSetState($LabelP1, $GUI_HIDE)
	GUICtrlSetState($LabelP2, $GUI_HIDE)
	GUICtrlSetState($LabelP3, $GUI_HIDE)
	GUICtrlSetState($LabelP4, $GUI_HIDE)
	GUICtrlSetState($LabelP5, $GUI_HIDE)
	GUICtrlSetState($LabelP6, $GUI_HIDE)
	GUICtrlSetState($LabelP7, $GUI_HIDE)
	GUICtrlSetState($LabelP8, $GUI_HIDE)
EndFunc   ;==>PEinfohide
Func PEinfoshow()
	GUICtrlSetState($groupP1, $GUI_SHOW)
	GUICtrlSetState($groupP2, $GUI_SHOW)
	GUICtrlSetState($groupP3, $GUI_SHOW)
	GUICtrlSetState($LabelP1, $GUI_SHOW)
	GUICtrlSetState($LabelP2, $GUI_SHOW)
	GUICtrlSetState($LabelP3, $GUI_SHOW)
	GUICtrlSetState($LabelP4, $GUI_SHOW)
	GUICtrlSetState($LabelP5, $GUI_SHOW)
	GUICtrlSetState($LabelP6, $GUI_SHOW)
	GUICtrlSetState($LabelP7, $GUI_SHOW)
	GUICtrlSetState($LabelP8, $GUI_SHOW)
EndFunc   ;==>PEinfoshow
Func USBhide()
	GUICtrlSetState($groupUQ1, $GUI_HIDE)
	GUICtrlSetState($groupUQ2, $GUI_HIDE)
	GUICtrlSetState($groupUQ3, $GUI_HIDE)
	GUICtrlSetState($LabelUQ1, $GUI_HIDE)
	GUICtrlSetState($LabelUQ2, $GUI_HIDE)
	GUICtrlSetState($LabelUQ3, $GUI_HIDE)
	GUICtrlSetState($LabelUQ4, $GUI_HIDE)
	GUICtrlSetState($LabelUQ5, $GUI_HIDE)
	GUICtrlSetState($LabelUQ6, $GUI_HIDE)
	GUICtrlSetState($LabelUQ7, $GUI_HIDE)
	GUICtrlSetState($LabelUQ8, $GUI_HIDE)
	GUICtrlSetState($UQFBAICO, $GUI_HIDE)
	GUICtrlSetState($UQPEICO, $GUI_HIDE)
	GUICtrlSetState($Combousb, $GUI_HIDE)
	GUICtrlSetState($USBmake, $GUI_HIDE)
	GUICtrlSetState($USBReset, $GUI_HIDE)
	GUICtrlSetState($USBUpdate, $GUI_HIDE)
	GUICtrlSetState($Exit, $GUI_HIDE)
	GUICtrlSetState($LabelTX, $GUI_HIDE)
	GUICtrlSetState($FBAmake, $GUI_HIDE)
	GUICtrlSetState($NoMEM, $GUI_HIDE)
	GUICtrlSetState($InstallHDD, $GUI_HIDE)
	GUICtrlSetState($BITLOCK, $GUI_HIDE)
	GUICtrlSetState($ATHCN, $GUI_HIDE)
EndFunc   ;==>USBhide
Func USBshow()
	GUICtrlSetState($groupUQ1, $GUI_SHOW)
	GUICtrlSetState($groupUQ2, $GUI_SHOW)
	GUICtrlSetState($groupUQ3, $GUI_SHOW)
	GUICtrlSetState($LabelUQ1, $GUI_SHOW)
	GUICtrlSetState($LabelUQ2, $GUI_SHOW)
	GUICtrlSetState($LabelUQ3, $GUI_SHOW)
	GUICtrlSetState($LabelUQ4, $GUI_SHOW)
	GUICtrlSetState($LabelUQ5, $GUI_SHOW)
	GUICtrlSetState($LabelUQ6, $GUI_SHOW)
	GUICtrlSetState($LabelUQ7, $GUI_SHOW)
	GUICtrlSetState($LabelUQ8, $GUI_SHOW)
	GUICtrlSetState($UQFBAICO, $GUI_SHOW)
	GUICtrlSetState($UQPEICO, $GUI_SHOW)
	GUICtrlSetState($Combousb, $GUI_SHOW)
	GUICtrlSetState($USBmake, $GUI_SHOW)
	GUICtrlSetState($USBReset, $GUI_SHOW)
	GUICtrlSetState($USBUpdate, $GUI_SHOW)
	GUICtrlSetState($Exit, $GUI_SHOW)
	GUICtrlSetState($LabelTX, $GUI_SHOW)
	GUICtrlSetState($FBAmake, $GUI_SHOW)
	GUICtrlSetState($NoMEM, $GUI_SHOW)
	GUICtrlSetState($InstallHDD, $GUI_SHOW)
	GUICtrlSetState($BITLOCK, $GUI_SHOW)
	GUICtrlSetState($ATHCN, $GUI_SHOW)
EndFunc   ;==>USBshow
Func UEFIhide()
	GUICtrlSetState($groupEF1, $GUI_HIDE)
	GUICtrlSetState($groupEF2, $GUI_HIDE)
	GUICtrlSetState($groupEF3, $GUI_HIDE)
	GUICtrlSetState($LabelEF2, $GUI_HIDE)
	GUICtrlSetState($LabelEF3, $GUI_HIDE)
	GUICtrlSetState($LabelEF4, $GUI_HIDE)
	GUICtrlSetState($LabelEF5, $GUI_HIDE)
	GUICtrlSetState($UEFIlabeexFat, $GUI_HIDE)
	GUICtrlSetState($UEFIInputexFat, $GUI_HIDE)
	GUICtrlSetState($UEFIICO, $GUI_HIDE)
	GUICtrlSetState($UEFIInputname, $GUI_HIDE)
	GUICtrlSetState($UEFIlabelname, $GUI_HIDE)
	GUICtrlSetState($UEFIInputinfo, $GUI_HIDE)
	GUICtrlSetState($UEFIlabelinfo, $GUI_HIDE)
	GUICtrlSetState($Combousbefi, $GUI_HIDE)
	GUICtrlSetState($UEFIback, $GUI_HIDE)
	GUICtrlSetState($UEFImake, $GUI_HIDE)
	GUICtrlSetState($Exituefi, $GUI_HIDE)
	GUICtrlSetState($efitip, $GUI_HIDE)
	GUICtrlSetState($efimakeISO, $GUI_HIDE)
EndFunc   ;==>UEFIhide
Func UEFIshow()
	GUICtrlSetState($groupEF1, $GUI_SHOW)
	GUICtrlSetState($groupEF2, $GUI_SHOW)
	GUICtrlSetState($groupEF3, $GUI_SHOW)
	GUICtrlSetState($LabelEF2, $GUI_SHOW)
	GUICtrlSetState($LabelEF3, $GUI_SHOW)
	GUICtrlSetState($LabelEF4, $GUI_SHOW)
	GUICtrlSetState($LabelEF5, $GUI_SHOW)
	GUICtrlSetState($UEFIlabeexFat, $GUI_SHOW)
	GUICtrlSetState($UEFIInputexFat, $GUI_SHOW)
	GUICtrlSetState($UEFIICO, $GUI_SHOW)
	GUICtrlSetState($UEFIInputname, $GUI_SHOW)
	GUICtrlSetState($UEFIlabelname, $GUI_SHOW)
	GUICtrlSetState($UEFIInputinfo, $GUI_SHOW)
	GUICtrlSetState($UEFIlabelinfo, $GUI_SHOW)
	GUICtrlSetState($Combousbefi, $GUI_SHOW)
	GUICtrlSetState($UEFIback, $GUI_SHOW)
	GUICtrlSetState($UEFImake, $GUI_SHOW)
	GUICtrlSetState($Exituefi, $GUI_SHOW)
	GUICtrlSetState($efitip, $GUI_SHOW)
	GUICtrlSetState($efimakeISO, $GUI_SHOW)
EndFunc   ;==>UEFIshow
Func UPshow()
	GUICtrlSetState($checkUP, $GUI_SHOW)
	GUICtrlSetState($groupUP1, $GUI_SHOW)
	GUICtrlSetState($groupUP2, $GUI_SHOW)
	GUICtrlSetState($Newweb, $GUI_SHOW)
	GUICtrlSetState($Newurl, $GUI_SHOW)
	GUICtrlSetState($EditUP1, $GUI_SHOW)
	GUICtrlSetState($EditUP2, $GUI_SHOW)
	GUICtrlSetState($homepage, $GUI_SHOW)
	GUICtrlSetState($groupUP3, $GUI_SHOW)
	GUICtrlSetState($Tutorialsjpg, $GUI_SHOW)
EndFunc   ;==>UPshow
Func UPhide()
	GUICtrlSetState($checkUP, $GUI_HIDE)
	GUICtrlSetState($groupUP1, $GUI_HIDE)
	GUICtrlSetState($groupUP2, $GUI_HIDE)
	GUICtrlSetState($Newweb, $GUI_HIDE)
	GUICtrlSetState($Newurl, $GUI_HIDE)
	GUICtrlSetState($EditUP1, $GUI_HIDE)
	GUICtrlSetState($EditUP2, $GUI_HIDE)
	GUICtrlSetState($homepage, $GUI_HIDE)
	GUICtrlSetState($groupUP3, $GUI_HIDE)
	GUICtrlSetState($Tutorialsjpg, $GUI_HIDE)
EndFunc   ;==>UPhide
Func _Setbmp($hWnd, $sFile, $nAlign = 0, $iWidth = 25, $iHeight = 25) ;控件句柄, 图标图像的路径, 图标索引, 图标在控件中的位置, 图标宽度, 图标高度
	$hImage1 = _GUIImageList_Create($iWidth, $iHeight, 5, 1, 0) ;创建图像列表控件
	_GUIImageList_AddBitmap($hImage1, $sFile) ;向图像列表添加图标
	_GUICtrlButton_SetImageList($hWnd, $hImage1, $nAlign) ;分配一个图像列表到按钮控件，$nAlign 是图标位置参数
EndFunc   ;==>_Setbmp
Func exfat()
	$DriveYesNo = StringRegExp(GUICtrlRead($Combousbefi), '(?<=\()[^)]+', 1);使用正则表达式处理Combousb控件中的字符串，得到类似于hdx这样的字符串
	If @error Then
		;MsgBox(64 + 0, "提醒", "请插上U盘再运行本程序！")
		;ExitProgram()
	Else
		$efipan = StringStripWS(GUICtrlRead($Combousbefi), 8);强制删除读取到的字符串中的所有空格
		$efipanfu = StringRight($efipan, 2);截取删除空格后的字符串从右边开始的2个字符
		$efiusbsize = Floor(DriveSpaceTotal($efipanfu));使用AU3获取Win下可见空间大小
		$efiusbfs = DriveGetFileSystem($efipanfu);使用AU3获取Win下可见分区文件系统格式
		;这里只是使用bootice来验证，需要事先复制bootice.exe到C盘根目录下
		;RunWait('cmd.exe  /c  C:\bootice.exe  /DEVICE=' & $efipanfu & ' /diskinfo /file=C:\diskinfo.ini', "C:\", @SW_HIDE)
		GUICtrlSetData($UEFIInputexFat, "文件格式: " & $efiusbfs & ", 容量大小: " & $efiusbsize & "MB.")
		If $efiusbfs = "exFat" Then
			GUICtrlSetData($efitip, "选择的U盘文件格式为exFat,不支持UEFI,请重新选择或退出后格式为U盘为Fat32")
			GUICtrlSetState($UEFImake, $GUI_DISABLE)
		Else
			GUICtrlSetData($efitip, "        为确保程序运行准确无误,应避免运行本程序时同时连接多个U盘.")
			GUICtrlSetState($UEFImake, $GUI_ENABLE)
		EndIf
	EndIf
EndFunc   ;==>exfat
Func _CPUGetIndividualProcessorTimes()
	Local $tagSYSTEM_PROCESSOR_TIMES = "int64 IdleTime;int64 KernelTime;int64 UserTime;int64 DpcTime;int64 InterruptTime;ulong InterruptCount;"
	Local $aRet, $stProcessorTimes, $stBuffer
	Local $i, $nTotalCPUStructs, $pStructPtr
	$stBuffer = DllStructCreate("byte Buffer[12288];")
	Local $aRet = DllCall("ntdll.dll", "long", "NtQuerySystemInformation", "int", 8, "ptr", DllStructGetPtr($stBuffer), "ulong", 12288, "ulong*", 0)
	If @error Then Return SetError(2, @error, "")
	If $aRet[0] Then Return SetError(3, $aRet[0], "")
	If $aRet[4] = 0 Or $aRet[0] > 12288 Or Mod($aRet[4], 48) <> 0 Then Return SetError(4, $aRet[4], "")
	$nTotalCPUStructs = $aRet[4] / 48
	Dim $aRet[$nTotalCPUStructs + 1][3]
	$aRet[0][0] = $nTotalCPUStructs
	$pStructPtr = DllStructGetPtr($stBuffer)
	For $i = 1 To $nTotalCPUStructs
		$stProcessorTimes = DllStructCreate($tagSYSTEM_PROCESSOR_TIMES, $pStructPtr)
		$aRet[$i][0] = DllStructGetData($stProcessorTimes, "IdleTime")
		$aRet[$i][1] = DllStructGetData($stProcessorTimes, "KernelTime")
		$aRet[$i][2] = DllStructGetData($stProcessorTimes, "UserTime")
		$pStructPtr += 48
	Next
	Return SetExtended($nTotalCPUStructs, $aRet)
EndFunc   ;==>_CPUGetIndividualProcessorTimes
Func _CPUsUsageTracker_Create()
	Local $nTotalCPUs, $aCPUTimes, $aCPUsUsage
	$aCPUTimes = _CPUGetIndividualProcessorTimes()
	If @error Then Return SetError(@error, @extended, "")
	$nTotalCPUs = @extended
	Dim $aCPUsUsage[$nTotalCPUs + 1][2]
	$aCPUsUsage[0][0] = $nTotalCPUs
	For $i = 1 To $nTotalCPUs
		$aCPUsUsage[$i][0] = $aCPUTimes[$i][1] + $aCPUTimes[$i][2]
		$aCPUsUsage[$i][1] = $aCPUTimes[$i][1] + $aCPUTimes[$i][2] - $aCPUTimes[$i][0]
	Next
	Return SetExtended($nTotalCPUs, $aCPUsUsage)
EndFunc   ;==>_CPUsUsageTracker_Create
Func _CPUOverallUsageTracker_Create()
	Local $aCPUTimes, $aCPUsUsage[2]
	$aCPUTimes = _CPUGetTotalProcessorTimes()
	If @error Then Return SetError(@error, @extended, "")
	$aCPUsUsage[0] = $aCPUTimes[1] + $aCPUTimes[2]
	$aCPUsUsage[1] = $aCPUTimes[1] + $aCPUTimes[2] - $aCPUTimes[0]
	Return $aCPUsUsage
EndFunc   ;==>_CPUOverallUsageTracker_Create
Func _CPUsUsageTracker_GetUsage(ByRef $aCPUsUsage)
	If Not IsArray($aCPUsUsage) Or UBound($aCPUsUsage, 2) < 2 Then Return SetError(1, 0, "")
	Local $nTotalCPUs, $aUsage, $aCPUsCurInfo
	Local $nTotalActive, $nTotal
	Local $nOverallActive, $nOverallTotal
	$aCPUsCurInfo = _CPUsUsageTracker_Create()
	If @error Then Return SetError(@error, @extended, "")
	$nTotalCPUs = $aCPUsCurInfo[0][0]
	Dim $aUsage[$nTotalCPUs + 1]
	$nOverallActive = 0
	$nOverallTotal = 0
	For $i = 1 To $nTotalCPUs
		$nTotal = $aCPUsCurInfo[$i][0] - $aCPUsUsage[$i][0]
		$nTotalActive = $aCPUsCurInfo[$i][1] - $aCPUsUsage[$i][1]
		$aUsage[$i - 1] = Round($nTotalActive * 100 / $nTotal, 1)
		$nOverallActive += $nTotalActive
		$nOverallTotal += $nTotal
	Next
	$aUsage[$nTotalCPUs] = Round(($nOverallActive / $nTotalCPUs) * 100 / ($nOverallTotal / $nTotalCPUs), 1)
	$aCPUsUsage = $aCPUsCurInfo
	Return SetExtended($nTotalCPUs, $aUsage)
EndFunc   ;==>_CPUsUsageTracker_GetUsage
Func _CPUOverallUsageTracker_GetUsage(ByRef $aCPUsUsage)
	If Not IsArray($aCPUsUsage) Or UBound($aCPUsUsage) < 2 Then Return SetError(1, 0, "")
	Local $aCPUsCurInfo, $fUsage, $nTotalActive, $nTotal
	$aCPUsCurInfo = _CPUOverallUsageTracker_Create()
	If @error Then Return SetError(@error, @extended, 0)
	$nTotal = $aCPUsCurInfo[0] - $aCPUsUsage[0]
	$nTotalActive = $aCPUsCurInfo[1] - $aCPUsUsage[1]
	$aCPUsUsage = $aCPUsCurInfo
	Return Round($nTotalActive * 100 / $nTotal, 1)
EndFunc   ;==>_CPUOverallUsageTracker_GetUsage
Func _CPUGetTotalProcessorTimes()
	Local $aRet, $stSystemTimes
	$stSystemTimes = DllStructCreate("int64 IdleTime;int64 KernelTime;int64 UserTime;")
	$aRet = DllCall("kernel32.dll", "bool", "GetSystemTimes", "ptr", DllStructGetPtr($stSystemTimes, 1), _
			"ptr", DllStructGetPtr($stSystemTimes, 2), "ptr", DllStructGetPtr($stSystemTimes, 3))
	If @error Then Return SetError(2, @error, "")
	If Not $aRet[0] Then Return SetError(3, 0, "")
	Dim $aRet[3] = [ _
			DllStructGetData($stSystemTimes, 1), _
			DllStructGetData($stSystemTimes, 2), _
			DllStructGetData($stSystemTimes, 3)]
	Return $aRet
EndFunc   ;==>_CPUGetTotalProcessorTimes
Func update()
	$getVersion = IniRead($tmpDirs & "\rpkusbinfo.ini", "USB", "version", "-1")
	$getDate = IniRead($tmpDirs & "\rpkusbinfo.ini", "USB", "date", "-1")
	$getSize = IniRead($tmpDirs & "\rpkusbinfo.ini", "USB", "size", "-1")
	$getWeb = IniRead($tmpDirs & "\rpkusbinfo.ini", "USB", "web", "-1")
	$getUrl = IniRead($tmpDirs & "\rpkusbinfo.ini", "USB", "url", "-1")
	$getinfo = InetGet("http://www.repaik.com/rpkusbinfonew.ini", $tmpDirs & "\rpkusbinfonew.ini", 1, 0)
	If $getinfo = 0 And FileGetSize($tmpDirs & "\rpkusbinfonew.ini") = 0 Then
		GUICtrlSetData($EditUP1, "检查新版本失败！网络不通或者论坛服务器繁忙中，请稍后再试")
		GUICtrlSetData($EditUP2, "当前程序版本:" & $getVersion & "  发布日期:" & $getDate & " 程序大小:" & $getSize)
	EndIf
	If $getinfo <> 0 And FileGetSize($tmpDirs & "\rpkusbinfonew.ini") <> 0 Then
		$getnewVersion = IniRead($tmpDirs & "\rpkusbinfonew.ini", "USB", "version", "-1")
		$getnewDate = IniRead($tmpDirs & "\rpkusbinfonew.ini", "USB", "date", "-1")
		$getnewSize = IniRead($tmpDirs & "\rpkusbinfonew.ini", "USB", "size", "-1")
		$getnewWeb = IniRead($tmpDirs & "\rpkusbinfonew.ini", "USB", "web", "-1")
		$getnewUrl = IniRead($tmpDirs & "\rpkusbinfonew.ini", "USB", "url", "-1")
		;
		If $getnewDate <> $getDate Then
			GUICtrlSetData($EditUP1, "恭喜你，程序检查到一个新的睿派克装机秘书程序，请选择是否更新")
			GUICtrlSetData($EditUP2, "检查到新版本：" & $getnewVersion & ",发布日期为" & $getnewDate & ",大小为" & $getnewSize)
		EndIf
		If $getnewDate = $getDate Then
			GUICtrlSetData($EditUP1, "暂时没有新版本发布，请稍后再试！")
			GUICtrlSetData($EditUP2, "当前程序版本:" & $getVersion & "  发布日期:" & $getDate & " 程序大小:" & $getSize)
		EndIf
	EndIf
EndFunc   ;==>update
Func _FileCopy($fromFile, $tofile, $option = 16)
	$winShell = ObjCreate("shell.application")
	$winShell.namespace($tofile).CopyHere($fromFile, $option)
EndFunc   ;==>_FileCopy
Func HashEFI()
	If $UEFIYES = 1 Then
		FileInstall("hash.exe", "C:\hash.exe", 1)
		$file = "C:\RPK.efiinfo.txt"
		FileDelete($file)
		RunWait('cmd.exe  /c  C:\hash.exe  -h   ' & @ScriptDir & "\RPK.efi > " & $file, "C:", @SW_HIDE)
		$EFIread = FileOpen($file)
		$EFIStr = FileReadLine($EFIread, 9)
		$EFIMD5S1 = StringStripWS($EFIStr, 8)
		$EFIMD5 = StringTrimLeft($EFIMD5S1, 4)
		If $EFIMD5 <> "7B56DC4862236F6AE3EC6E77788A2537" Or $EFIMD5 <> "9BB8BD44F36FBB4ABD74D01AE063439C" Then
			$EFIHASH = 0
		EndIf
		If $EFIMD5 = "7B56DC4862236F6AE3EC6E77788A2537" Or $EFIMD5 = "9BB8BD44F36FBB4ABD74D01AE063439C" Then
			$EFIHASH = 1
		EndIf
		FileDelete($file)
		FileDelete("C:\hash.exe")
	EndIf
	If $UEFIYES = 0 Then
		$EFIHASH = 0
	EndIf
EndFunc   ;==>HashEFI

Func export()
	TrayTip("小秘书提示", "程序正在导出fba源文件中...", 6, 1)
	FileInstall("Rpkusbfbasource.fba", @ScriptDir & "\Rpkusbfbasource.fba", 1)
	MsgBox(64 + 0, "恭喜", "导出程序的fba源文件成功！" & @CRLF & "接下来你可以使用fbinstTool进行自己的YY之旅!", 35)
EndFunc   ;==>export
