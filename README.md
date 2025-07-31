# EasyWind Backup - Sistema de Backup Incremental Avanzado V2.0

Un sistema de backup automatizado y robusto para Windows que realiza copias de seguridad incrementales con funcionalidades avanzadas de red, logging y configuración.

## 🚀 Nuevas Características V2.0

### ✨ Mejoras Principales
- **Archivo de configuración externo** (`config.ini`)
- **Validación robusta** de rutas y parámetros
- **Manejo de credenciales de red** automático
- **Timestamps con fecha y hora** para mayor precisión
- **Configuración flexible** de todas las opciones
- **Mejor manejo de errores** y retroalimentación
- **Códigos de salida** estándar para automatización

## 📁 Estructura del Proyecto

```
EasyWind-backup/
├── 📄 EasyWInd-backup.bat    # Script principal mejorado
├── ⚙️ config.ini             # Archivo de configuración
├── 🛠️ setup.bat              # Instalador interactivo
├── 📖 README.md              # Esta documentación
├── 📋 EXAMPLES.md            # Ejemplos y casos de uso
├── 🤝 CONTRIBUTING.md        # Guía para contributors
├── 🔒 SECURITY.md            # Política de seguridad
├── 📝 CHANGELOG.md           # Historial de cambios
├── 📄 LICENSE                # Licencia MIT
└── 📂 .github/               # Templates y workflows
    ├── ISSUE_TEMPLATE/       # Templates para issues
    ├── workflows/            # GitHub Actions
    └── pull_request_template.md
```

## ⚙️ Configuración

### Archivo config.ini

El script utiliza un archivo de configuración `config.ini` que debe estar en el mismo directorio:

```ini
[BACKUP_CONFIG]
; Configuración del servidor de backup
backup_server=4poll0.home
max_retries=3
retry_delay=3

; Configuración de rutas (dejar vacío para solicitar al usuario)
default_source_path=
default_destination_path=

; Configuración de logging
log_base_path=D:\Personal\Scripts\LOG
enable_detailed_logging=true

; Configuración de limpieza automática
cleanup_enabled=true
cleanup_days=30

; Configuración de Robocopy
robocopy_retries=3
robocopy_wait=10
mirror_mode=true
fat_file_times=true

; Configuración de red
network_timeout=1000
auto_disconnect=false

; Credenciales de red (opcional)
network_username=
network_password=
network_domain=
```

## 🛠️ Funcionalidades

### 1. **Verificación de Red Inteligente**
- Ping automático al servidor de backup
- Sistema de reintentos configurable
- Manejo de timeouts personalizables
- Indicadores visuales de estado

### 2. **Gestión de Archivos Avanzada**
- Timestamps únicos con fecha y hora
- Validación de rutas de origen y destino
- Creación automática de directorios
- Organización automática por fechas

### 3. **Sistema de Backup Robusto**
- Robocopy con parámetros configurables
- Modo mirror opcional
- Reintentos automáticos
- Logging detallado

### 4. **Limpieza Automática**
- Eliminación de archivos antiguos configurable
- Configuración de días de retención
- Operación opcional

### 5. **Logging Completo**
- Logs organizados por timestamp
- Logging detallado opcional
- Rutas de log configurables
- Códigos de error estándar

### 6. **Autenticación de Red**
- Soporte para credenciales de dominio
- Autenticación automática opcional
- Fallback a credenciales actuales

## 🚀 Uso

### Ejecución Básica
```batch
# Ejecutar con interfaz interactiva
EasyWInd-backup.bat
```

### Configuración Previa
1. Editar `config.ini` con tus parámetros
2. Configurar rutas por defecto (opcional)
3. Establecer credenciales de red (opcional)

### Ejemplo de Uso Automatizado
```batch
# Para uso en scripts automatizados
EasyWInd-backup.bat
# El script usa códigos de salida estándar:
# 0 = Éxito
# 1 = Error
```

## 📋 Parámetros de Robocopy

El script utiliza los siguientes parámetros optimizados:

- `/MIR` - Modo mirror (sincronización completa)
- `/FFT` - Fat File Times (compatibilidad)
- `/R:n` - Número de reintentos configurable
- `/W:n` - Tiempo de espera configurable
- `/NP` - No mostrar progreso de archivos
- `/NDL` - No mostrar nombres de directorios
- `/LOG` - Logging detallado
- `/TEE` - Mostrar salida en consola (opcional)

## 🔧 Personalización

### Modificar Servidor de Backup
```ini
backup_server=tu-servidor.dominio.com
```

### Configurar Rutas por Defecto
```ini
default_source_path=C:\MisCarpetas
default_destination_path=\\servidor\backup
```

### Habilitar Autenticación
```ini
network_username=usuario
network_password=contraseña
network_domain=midominio
```

## 📊 Códigos de Salida

- `0` - Backup completado exitosamente
- `1` - Error en configuración o conexión
- `8+` - Errores de Robocopy (ver documentación de Robocopy)

## 🔍 Solución de Problemas

### Error: "Configuration file not found"
- Asegúrate de que `config.ini` esté en el mismo directorio que el script

### Error: "Network authentication failed"
- Verifica las credenciales en `config.ini`
- Asegúrate de que el servidor sea accesible

### Error: "Cannot create backup directory"
- Verifica permisos en la ruta de destino
- Asegúrate de que la ruta sea válida

## 📝 Registro de Cambios V2.0

- ✅ Archivo de configuración externo
- ✅ Validación robusta de rutas
- ✅ Manejo de credenciales de red
- ✅ Timestamps mejorados
- ✅ Configuración flexible de Robocopy
- ✅ Mejor manejo de errores
- ✅ Códigos de salida estándar
- ✅ Logging mejorado
- ✅ Interfaz de usuario mejorada

## 🤝 Contribuciones

¿Quieres contribuir a EasyWind Backup? ¡Excelente!

- 📖 Lee nuestra [Guía de Contribución](CONTRIBUTING.md)
- 🐛 Reporta bugs usando nuestros [templates de issues](.github/ISSUE_TEMPLATE/)
- ✨ Sugiere nuevas features
- 🔒 Reporta vulnerabilidades siguiendo nuestra [Política de Seguridad](SECURITY.md)
- 📝 Mejora la documentación

Para reportar bugs o sugerir mejoras:
1. Revisa los [issues existentes](https://github.com/l3onkers/EasyWind-backup/issues)
2. Usa los templates apropiados para crear nuevos issues
3. Proporciona información detallada y pasos para reproducir

## 📄 Licencia

Este proyecto está licenciado bajo la Licencia MIT. Ver el archivo [LICENSE](LICENSE) para más detalles.

### Uso Comercial
✅ Permitido para uso comercial sin restricciones
✅ Modificación y redistribución permitidas
✅ Uso privado permitido
❗ Sin garantía - usar bajo tu propio riesgo

## 📚 Recursos Adicionales

- 📝 [Historial de Cambios](CHANGELOG.md) - Ver todas las versiones y cambios
- 📋 [Ejemplos Detallados](EXAMPLES.md) - Configuraciones para diferentes escenarios
- 🔒 [Política de Seguridad](SECURITY.md) - Reportar vulnerabilidades
- 🤝 [Guía para Contributors](CONTRIBUTING.md) - Cómo contribuir al proyecto

## ⭐ ¿Te Gusta el Proyecto?

Si EasyWind Backup te ha sido útil:
- ⭐ Dale una estrella al repositorio
- 🐦 Compártelo con tus colegas
- 🐛 Reporta bugs para mejorarlo
- 💡 Sugiere nuevas características
- 🤝 Contribuye con código o documentación 
equipo como una unidad de red o simplemente tenemos un servidor de datos en la red (como por ejemplo un servidor SAMBA) y queremos pasar datos a este o hacer una copia de seguirdad
de los datos en local a ese servidor de forma simple y desatendida.

La herramiendo de serie permite crear directorios fechados con el día de la copia para tener backups clasificados por días pero tambiénes posible configurarlo para realizar copias de forma incremental sobre los mismo repositorios.

El scrip es modular y se pueden activar o desactivar secciones según lo que queramos hacer y de la forma que se quiera hacer, así como añadir y eliminar funciones y parámetros adicionales segun se requiera.

**IMPORTANTE**: Es necesario en caso de de que tenegamos un servidor de datos securizado disponer de credenciales para hacer login. El scrip está configurado para conectarse a unidades de red ya mapeadas o con credenciales guardadas ya automáticamente, no obstante es posible modificar el comando en el scrip para insertar las credenciales y que el script ejecute la conexión y el mapeo del la unidad de red automaticamente en el proceso.

¿Cómo funciona?
======
La herramienta comienza haciendo una comprobación de que el host de donde posteriormente se mapearán o se conectarán las unidades de red está operativo y tiene conexión directa. 
En caso de fallo, la herramienta devuelve un error de conexión y se cerrará automaticamente.



