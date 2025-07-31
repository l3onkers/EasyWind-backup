@Echo off
@title EasyWind Backup Incremental V_2.0
setlocal enabledelayedexpansion
set loop=0
set script_dir=%~dp0
set config_file=%script_dir%config.ini

REM ========================================
REM Load configuration from config.ini
REM ========================================

echo Loading configuration...
if not exist "%config_file%" (
    echo ERROR: Configuration file not found: %config_file%
    echo Please ensure config.ini exists in the script directory.
    pause
    exit /b 1
)

REM Read configuration values
for /f "usebackq tokens=1,2 delims==" %%a in ("%config_file%") do (
    set "%%a=%%b"
)

REM Set default values if not configured
if "!backup_server!"=="" set backup_server=backup-server.local
if "!max_retries!"=="" set max_retries=3
if "!retry_delay!"=="" set retry_delay=3
if "!log_base_path!"=="" set log_base_path=C:\BackupLogs
if "!cleanup_days!"=="" set cleanup_days=30
if "!robocopy_retries!"=="" set robocopy_retries=3
if "!robocopy_wait!"=="" set robocopy_wait=10
if "!network_timeout!"=="" set network_timeout=1000

echo Configuration loaded successfully.
echo Backup Server: !backup_server!
echo Max Retries: !max_retries!
echo Log Path: !log_base_path!
TIMEOUT /t 2

REM ========================================
REM Network authentication if configured
REM ========================================

if not "!network_username!"=="" (
    echo Authenticating with network credentials...
    if not "!network_domain!"=="" (
        net use \\!backup_server! /user:!network_domain!\!network_username! !network_password! >NUL 2>&1
    ) else (
        net use \\!backup_server! /user:!network_username! !network_password! >NUL 2>&1
    )
    if ERRORLEVEL 1 (
        echo WARNING: Network authentication failed. Continuing with current credentials.
        TIMEOUT /t 3
    ) else (
        echo Network authentication successful.
    )
)

REM ========================================
REM Try to connect to backup server
REM ========================================

:BACKUP
color 0f
echo Connecting to Backup Server: !backup_server!
TIMEOUT /t 3
Ping !backup_server! -n 1 -w !network_timeout! >NUL
if ERRORLEVEL 1 goto LOOP
mode 61, 13

REM ============================
REM Date and time configuration
REM ============================

Set mydate_0=%Date%
Set mytime_0=%Time%
Set mydate_1=%mydate_0:/=-%
Set mydate=%mydate_1: =_%
Set mytime_1=%mytime_0::=-%
Set mytime=%mytime_1:~0,8%
Set timestamp=%mydate%_%mytime%

echo Backup session started at: %Date% %Time%

REM ============================
REM Folder selection with validation
REM ============================

mode 116, 29
echo Connection to Backup Server established successfully.
echo.

REM Use default paths if configured
if not "!default_source_path!"=="" (
    set "SSrv=!default_source_path!"
    echo Using configured source path: !SSrv!
) else (
    :GET_SOURCE
    echo Please select Source Path for Backup
    Set /p SSrv="Source folder: "
    if "!SSrv!"=="" (
        echo ERROR: Source path cannot be empty.
        goto GET_SOURCE
    )
    if not exist "!SSrv!" (
        echo ERROR: Source path does not exist: !SSrv!
        echo Please verify the path and try again.
        goto GET_SOURCE
    )
)

if not "!default_destination_path!"=="" (
    set "DSrv=!default_destination_path!"
    echo Using configured destination path: !DSrv!
) else (
    :GET_DESTINATION
    echo Please select Destination Path for Backup
    Set /p DSrv="Destination folder: "
    if "!DSrv!"=="" (
        echo ERROR: Destination path cannot be empty.
        goto GET_DESTINATION
    )
    REM Try to create destination if it doesn't exist
    if not exist "!DSrv!" (
        echo Destination path does not exist. Creating: !DSrv!
        mkdir "!DSrv!" 2>NUL
        if ERRORLEVEL 1 (
            echo ERROR: Cannot create destination path: !DSrv!
            goto GET_DESTINATION
        )
    )
)

echo.
echo ========================================
echo BACKUP CONFIGURATION SUMMARY
echo ========================================
echo Source path:      !SSrv!
echo Destination path: !DSrv!
echo Backup server:    !backup_server!
echo Timestamp:        !timestamp!
echo ========================================
echo.
Set /p choice="Proceed with backup? (y/n): "
if /i not "!choice!"=="y" goto BACKUP

REM ======================================
REM Create backup and log directory structure
REM ======================================

echo Creating backup directory structure...
if not exist "!log_base_path!" (
    mkdir "!log_base_path!" 2>NUL
    if ERRORLEVEL 1 (
        echo ERROR: Cannot create log directory: !log_base_path!
        echo Falling back to current directory for logs.
        set "log_base_path=%script_dir%logs"
        mkdir "!log_base_path!" 2>NUL
    )
)

Set currBackupDir=!DSrv!\!timestamp!
mkdir "!currBackupDir!" 2>NUL
if ERRORLEVEL 1 (
    echo ERROR: Cannot create backup directory: !currBackupDir!
    pause
    exit /b 1
)

echo Backup directory created: !currBackupDir!

REM ======================================
REM Configure Robocopy options dynamically
REM ======================================

echo Configuring backup parameters...
Set "Opt1="
if /i "!mirror_mode!"=="true" set "Opt1=!Opt1! /MIR"
if /i "!fat_file_times!"=="true" set "Opt1=!Opt1! /FFT"
set "Opt1=!Opt1! /R:!robocopy_retries! /W:!robocopy_wait! /NP /NDL"
if /i "!enable_detailed_logging!"=="true" (
    set "Opt1=!Opt1! /LOG:!log_base_path!\LOG_!timestamp!.txt /TEE"
) else (
    set "Opt1=!Opt1! /LOG:!log_base_path!\LOG_!timestamp!.txt"
)

echo Robocopy options: !Opt1!		

REM ======================================
REM Execute backup with progress monitoring
REM ======================================

echo.
echo ========================================
echo STARTING BACKUP OPERATION
echo ========================================
echo Start time: %Date% %Time%
echo Source: !SSrv!
echo Destination: !currBackupDir!
echo ========================================
echo.

echo Executing Robocopy backup...
Robocopy "!SSrv!" "!currBackupDir!" !Opt1!
set robocopy_exit_code=!ERRORLEVEL!

echo.
echo Robocopy completed with exit code: !robocopy_exit_code!
if !robocopy_exit_code! geq 8 (
    echo WARNING: Robocopy encountered errors. Check the log for details.
    color 0e
    TIMEOUT /t 5
) else (
    echo Backup completed successfully.
    color 0a
    TIMEOUT /t 2
)

REM ======================================
REM Cleanup old files if enabled
REM ======================================

if /i "!cleanup_enabled!"=="true" (
    echo.
    echo Cleaning up files older than !cleanup_days! days from source...
    ForFiles /p "!SSrv!" /s /d -!cleanup_days! /c "cmd /c del @path" 2>NUL
    if ERRORLEVEL 1 (
        echo No old files found or cleanup failed.
    ) else (
        echo Cleanup completed.
    )
)

REM Generate directory listing
echo.
echo Generating directory listing...
cd /d "!SSrv!"
dir "!SSrv!" /s >> "!log_base_path!\LOG_!timestamp!.txt" 2>&1
echo End time: %Date% %Time% >> "!log_base_path!\LOG_!timestamp!.txt"
PING localhost -n 2 >NUL

REM ======================================
REM Organize log files
REM ======================================

echo Organizing log files...
if not exist "!log_base_path!\LOG_!timestamp!" mkdir "!log_base_path!\LOG_!timestamp!"

if exist "!log_base_path!\LOG_!timestamp!.txt" (
    MOVE "!log_base_path!\LOG_!timestamp!.txt" "!log_base_path!\LOG_!timestamp!\" >NUL 2>&1
)

REM Move any additional log files that might exist
if exist "C:\LOG\LOG_File_Rimasti_!timestamp!.txt" (
    MOVE "C:\LOG\LOG_File_Rimasti_!timestamp!.txt" "!log_base_path!\LOG_!timestamp!\" >NUL 2>&1
)

echo Log files organized in: !log_base_path!\LOG_!timestamp!\
PING localhost -n 2 >NUL

REM ======================================
REM Network cleanup and final status
REM ======================================

if /i "!auto_disconnect!"=="true" (
    echo Disconnecting network drives...
    net use * /delete /y >NUL 2>&1
    echo Network drives disconnected.
)

echo.
echo ========================================
echo BACKUP OPERATION COMPLETED
echo ========================================
echo Session end time: %Date% %Time%
echo Backup location: !currBackupDir!
echo Log location: !log_base_path!\LOG_!timestamp!\
echo ========================================
echo.

color 0f
pause
exit /b 0											

REM ======================================
REM Error handling and connection issues
REM ======================================

:ERROR
color 0c
echo.
echo ########################################
echo    BACKUP OPERATION FAILED
echo ########################################
echo Remote server connection error...
echo Server: !backup_server!
echo Please verify:
echo  - Network connectivity
echo  - Server availability
echo  - Firewall settings
echo  - Credentials (if required)
echo ########################################
echo.
echo Check the configuration in: %config_file%
echo.
pause
exit /b 1

REM ========================================
REM Network connection retry loop
REM ========================================

:LOOP
color 04
Set /a loop=!loop!+1 
echo Connection attempt !loop!/!max_retries! failed. Retrying...
echo Checking connection to: !backup_server!
Ping !backup_server! -n 1 -w !network_timeout! >NUL
IF NOT ERRORLEVEL 1 goto BACKUP
TIMEOUT /t !retry_delay!
if !loop! geq !max_retries! goto ERROR 
goto LOOP

REM Different credentials can be used using  "  net use x: \\myserver\fileshare /user:MyID MyPassword  "