# Ejemplos de Configuración para EasyWind Backup V2.0

## Configuración Básica (config.ini)

### Ejemplo 1: Backup Local Simple
```ini
[BACKUP_CONFIG]
backup_server=localhost
max_retries=2
retry_delay=2
default_source_path=C:\Documentos
default_destination_path=D:\Backup
log_base_path=D:\Backup\Logs
enable_detailed_logging=true
cleanup_enabled=false
robocopy_retries=2
robocopy_wait=5
mirror_mode=false
fat_file_times=true
network_timeout=500
auto_disconnect=false
```

### Ejemplo 2: Backup de Red Corporativo
```ini
[BACKUP_CONFIG]
backup_server=nas.empresa.com
max_retries=5
retry_delay=5
default_source_path=C:\Proyectos
default_destination_path=\\nas.empresa.com\backup\departamento
log_base_path=\\nas.empresa.com\logs
enable_detailed_logging=true
cleanup_enabled=true
cleanup_days=60
robocopy_retries=5
robocopy_wait=15
mirror_mode=true
fat_file_times=true
network_timeout=2000
auto_disconnect=true
network_username=usuario.backup
network_password=mi_password_seguro
network_domain=EMPRESA
```

### Ejemplo 3: Backup Doméstico NAS
```ini
[BACKUP_CONFIG]
backup_server=192.168.1.100
max_retries=3
retry_delay=3
default_source_path=C:\Users\Usuario\Documentos
default_destination_path=\\192.168.1.100\backup
log_base_path=C:\BackupLogs
enable_detailed_logging=false
cleanup_enabled=true
cleanup_days=30
robocopy_retries=3
robocopy_wait=10
mirror_mode=true
fat_file_times=false
network_timeout=1500
auto_disconnect=false
network_username=backup_user
network_password=nas_password
```

## Scripts de Automatización

### Ejemplo 1: Script Diario (backup_diario.bat)
```batch
@echo off
cd /d "D:\Scripts\EasyWind-backup"
call EasyWInd-backup.bat
if errorlevel 1 (
    echo Backup falló - %date% %time% >> error.log
    exit /b 1
) else (
    echo Backup exitoso - %date% %time% >> success.log
)
```

### Ejemplo 2: Task Scheduler (XML para importar)
```xml
<?xml version="1.0" encoding="UTF-16"?>
<Task version="1.2">
  <Triggers>
    <CalendarTrigger>
      <StartBoundary>2025-07-31T02:00:00</StartBoundary>
      <ScheduleByWeek>
        <DaysOfWeek>
          <Sunday />
        </DaysOfWeek>
        <WeeksInterval>1</WeeksInterval>
      </ScheduleByWeek>
    </CalendarTrigger>
  </Triggers>
  <Actions>
    <Exec>
      <Command>D:\Scripts\EasyWind-backup\EasyWInd-backup.bat</Command>
    </Exec>
  </Actions>
</Task>
```

### Ejemplo 3: PowerShell Wrapper
```powershell
# backup_wrapper.ps1
$backupPath = "D:\Scripts\EasyWind-backup"
$logFile = "$backupPath\wrapper.log"

try {
    Set-Location $backupPath
    $process = Start-Process -FilePath "EasyWInd-backup.bat" -Wait -PassThru
    
    if ($process.ExitCode -eq 0) {
        Write-Output "$(Get-Date): Backup completado exitosamente" | Out-File -Append $logFile
    } else {
        Write-Output "$(Get-Date): Backup falló con código $($process.ExitCode)" | Out-File -Append $logFile
    }
} catch {
    Write-Output "$(Get-Date): Error ejecutando backup: $($_.Exception.Message)" | Out-File -Append $logFile
}
```

## Configuraciones por Escenario

### Oficina Pequeña
- `mirror_mode=true` - Sincronización completa
- `cleanup_enabled=true` con `cleanup_days=45`
- `enable_detailed_logging=true` para auditoría
- Credenciales de dominio configuradas

### Uso Personal
- `mirror_mode=false` - Solo copiar archivos nuevos/modificados
- `cleanup_enabled=false` - Mantener historial completo
- `enable_detailed_logging=false` - Logs básicos
- Sin credenciales especiales

### Servidor de Producción
- `max_retries=5` - Mayor tolerancia a fallos
- `robocopy_retries=5` con `robocopy_wait=30`
- `network_timeout=3000` - Timeout extendido
- `auto_disconnect=true` - Limpiar conexiones

## Monitoreo y Alertas

### Script de Verificación de Logs
```batch
@echo off
set "log_dir=D:\Personal\Scripts\LOG"
set "today=%date:~-4%-%date:~3,2%-%date:~0,2%"

if not exist "%log_dir%\LOG_%today%*" (
    echo ALERTA: No se encontraron logs para hoy
    # Aquí puedes agregar envío de email o notificación
)
```

### Verificación de Espacio en Disco
```batch
@echo off
for /f "tokens=3" %%a in ('dir /-c %SystemDrive%\ ^| find "bytes free"') do set free=%%a
if %free% lss 10737418240 (
    echo ADVERTENCIA: Menos de 10GB libres en disco
)
```

## Mejores Prácticas

1. **Configuración de Rutas**
   - Usar rutas absolutas siempre
   - Verificar permisos antes de configurar
   - Usar variables de entorno cuando sea apropiado

2. **Seguridad**
   - No hardcodear contraseñas en scripts
   - Usar cuentas de servicio dedicadas
   - Configurar permisos mínimos necesarios

3. **Monitoreo**
   - Revisar logs regularmente
   - Configurar alertas para fallos
   - Probar restauraciones periódicamente

4. **Mantenimiento**
   - Limpiar logs antiguos regularmente
   - Verificar espacio en disco
   - Actualizar credenciales según políticas
