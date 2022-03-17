@Echo off
@title Backup Incremental V_1.0
set loop=0

REM ========================================
REM Try to mount network unit
REM ========================================

:BACKUP
color 0f
net use V: \\4poll0.home\Vault
if ERRORLEVEL 1 goto loop
mode 61, 13

REM ============================
REM Date and time config
REM ============================

Set mydate_0=%Date%
Set mydate_1=%mydate_0:/=-%
Set mydate=%mydate_1: =_%

REM ============================
REM Folder selection
REM ============================

mode 116, 29
Set /p SSrv="Source folder:		"							
echo example: 	C:\folder or \\server\resource
Set /p DSrv="Destination Folder:	"					

REM ======================================
REM Name + data folder creation
REM ======================================

if not exist "D:\Personal\Scripts\LOG" mkdir D:\Personal\Scripts\LOG									
Set currBackupDir=%DSrv%\%mydate%
mkdir %currBackupDir%

REM ======================================
REM RoboCopy Options
REM ======================================

Set Opt1=/E /R:3 /W:3 /V /Z /TEE /LOG:D:\Personal\Scripts\LOG\LOG_%mydate%.txt		

REM ======================================
REM RoboCopy Exec
REM ======================================

Robocopy "%SSrv%" "%currBackupDir%" %Opt1%
ForFiles /p "%SSrv%" /s /d -30 /c "cmd /c del @file"				
cd %SSrv%
dir %SSrv% >> D:\Personal\Scripts\LOG\LOG_%mydate%.txt
PING localhost -n 2 >NUL

REM ======================================
REM Log to folder
REM ======================================

if not exist "D:\Personal\Scripts\LOG\LOG_%mydate%" mkdir "D:\Personal\Scripts\LOG\LOG_%mydate%"		
MOVE "D:\Personal\Scripts\LOG\LOG_%mydate%.txt" "D:\Personal\Scripts\LOG\LOG_%mydate%"
MOVE "C:\LOG\LOG_File_Rimasti_%mydate%.txt" "C:\LOG\LOG_%mydate%"
PING localhost -n 2 >NUL

REM ======================================
REM Unmount network unit and exit (optional)
REM ======================================

::net use * /delete /y											

REM ======================================
REM Error connection or problems
REM ======================================

:ERROR
echo Remote server connection error...
timeout /t 3
exit

REM ========================================
REM Check network connection loop
REM ========================================

:loop
color 04
set /a loop=%loop%+1 
::net use * /delete /y
IF NOT ERRORLEVEL 1 goto BACKUP
TIMEOUT /t 2
if "%loop%"=="4" goto error 										
goto loop

REM Different credentials can be used using  "  net use x: \\myserver\fileshare /user:MyID MyPassword  "