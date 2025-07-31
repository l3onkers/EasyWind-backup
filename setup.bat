@echo off
@title EasyWind Backup - Instalación y Configuración V2.0
setlocal enabledelayedexpansion

echo ========================================
echo  EasyWind Backup - Configuración Rápida
echo ========================================
echo.

REM Verificar que estamos en el directorio correcto
if not exist "EasyWInd-backup.bat" (
    echo ERROR: No se encuentra EasyWInd-backup.bat
    echo Este script debe ejecutarse desde el directorio de EasyWind Backup
    pause
    exit /b 1
)

REM Verificar si ya existe config.ini
if exist "config.ini" (
    echo Se encontró un archivo config.ini existente.
    set /p overwrite="¿Desea sobrescribirlo? (s/n): "
    if /i not "!overwrite!"=="s" (
        echo Instalación cancelada.
        pause
        exit /b 0
    )
)

echo Creando configuración personalizada...
echo.

REM Solicitar configuración básica
set /p backup_server="Servidor de backup (ej: nas.local o 192.168.1.100): "
if "!backup_server!"=="" set backup_server=localhost

set /p source_path="Ruta de origen por defecto (dejar vacío para solicitar siempre): "
set /p dest_path="Ruta de destino por defecto (dejar vacío para solicitar siempre): "
set /p log_path="Ruta para logs (por defecto: C:\BackupLogs): "
if "!log_path!"=="" set log_path=C:\BackupLogs

echo.
echo ¿Configurar credenciales de red?
set /p use_creds="(s/n): "
if /i "!use_creds!"=="s" (
    set /p net_user="Usuario de red: "
    set /p net_pass="Contraseña: "
    set /p net_domain="Dominio (opcional): "
) else (
    set net_user=
    set net_pass=
    set net_domain=
)

echo.
echo ¿Habilitar limpieza automática de archivos antiguos?
set /p cleanup="(s/n): "
if /i "!cleanup!"=="s" (
    set cleanup_enabled=true
    set /p cleanup_days="Días de retención (por defecto 30): "
    if "!cleanup_days!"=="" set cleanup_days=30
) else (
    set cleanup_enabled=false
    set cleanup_days=30
)

echo.
echo ¿Habilitar modo mirror (sincronización completa)?
set /p mirror="(s/n): "
if /i "!mirror!"=="s" (
    set mirror_mode=true
) else (
    set mirror_mode=false
)

echo.
echo Generando archivo config.ini...

REM Crear config.ini
(
echo [BACKUP_CONFIG]
echo ; Configuración del servidor de backup
echo backup_server=!backup_server!
echo max_retries=3
echo retry_delay=3
echo.
echo ; Configuración de rutas
echo default_source_path=!source_path!
echo default_destination_path=!dest_path!
echo.
echo ; Configuración de logging
echo log_base_path=!log_path!
echo enable_detailed_logging=true
echo.
echo ; Configuración de limpieza automática
echo cleanup_enabled=!cleanup_enabled!
echo cleanup_days=!cleanup_days!
echo.
echo ; Configuración de Robocopy
echo robocopy_retries=3
echo robocopy_wait=10
echo mirror_mode=!mirror_mode!
echo fat_file_times=true
echo.
echo ; Configuración de red
echo network_timeout=1000
echo auto_disconnect=false
echo.
echo ; Credenciales de red
echo network_username=!net_user!
echo network_password=!net_pass!
echo network_domain=!net_domain!
) > config.ini

REM Crear directorio de logs si no existe
if not "!log_path!"=="" (
    if not exist "!log_path!" (
        echo Creando directorio de logs: !log_path!
        mkdir "!log_path!" 2>NUL
        if ERRORLEVEL 1 (
            echo ADVERTENCIA: No se pudo crear el directorio de logs
        )
    )
)

echo.
echo ========================================
echo  Configuración completada exitosamente
echo ========================================
echo.
echo Archivo creado: config.ini
echo Servidor: !backup_server!
echo Logs: !log_path!
echo Limpieza: !cleanup_enabled!
echo Mirror: !mirror_mode!
echo.
echo Para ejecutar el backup:
echo   EasyWInd-backup.bat
echo.
echo Para configuración avanzada:
echo   Editar config.ini manualmente
echo.

set /p test_run="¿Desea probar la configuración ahora? (s/n): "
if /i "!test_run!"=="s" (
    echo.
    echo Ejecutando prueba de configuración...
    call EasyWInd-backup.bat
)

echo.
echo Instalación completada.
pause
