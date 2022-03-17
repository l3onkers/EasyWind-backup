@Echo off
@title Backup Incremental V_1.0
set loop=0

REM ========================================
REM Try to mount network unit
REM ========================================

:BACKUP
color 0f
Set host="4poll0.home"
echo Connecting to Backup Server...
TIMEOUT /t 3
Ping %host% -n 1 -w 1000 >NUL
if ERRORLEVEL 1 goto LOOP
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
echo Conection to Backup Server established, select Source Path for Backup
Set /p SSrv="Source folder:	"							
echo Select Destination path Path for Backup
Set /p DSrv="Destination Folder: "
echo Source path: %SSrv%
echo Destination path: %DSrv%
Set /p choice="Confirm? : "
if "%choice%"=="n" goto BACKUP

REM ======================================
REM Name + data folder creation
REM ======================================

if not exist "D:\Personal\Scripts\LOG" mkdir D:\Personal\Scripts\LOG									
Set currBackupDir=%DSrv%\%mydate%
::mkdir %currBackupDir%
::Set currBackupDir=%DSrv%\slayer
mkdir %currBackupDir%

REM ======================================
REM RoboCopy Options
REM ======================================

Set Opt1=/MIR /FFT /R:3 /W:10 /NP /NDL /LOG:D:\Personal\Scripts\LOG\LOG_%mydate%.txt		

REM ======================================
REM RoboCopy Exec
REM ======================================

::xcopy "%SSrv%" "%currBackupDir%" /V /Y /S /I /F /D
Robocopy "%SSrv%" "%currBackupDir%" %Opt1%
::Robocopy "%SSrv%" "%DSrv%" %Opt1%
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
echo #################################
echo Remote server connection error...
echo Verify connection before retry
echo #################################
pause
::timeout /t 3
exit

REM ========================================
REM Check network connection loop
REM ========================================

:LOOP
color 04
Set /a loop=%loop%+1 
echo connection filed. Retrying...
Ping %host% -n 1 -w 1000 >NUL
IF NOT ERRORLEVEL 1 goto BACKUP
TIMEOUT /t 3
if "%loop%"=="2" goto ERROR 										
goto LOOP

REM Different credentials can be used using  "  net use x: \\myserver\fileshare /user:MyID MyPassword  "