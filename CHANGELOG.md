# 📝 Changelog

Todos los cambios notables de este proyecto serán documentados en este archivo.

El formato está basado en [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
y este proyecto adhiere a [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Planned
- Soporte para múltiples servidores de backup con failover
- Interfaz gráfica opcional (GUI)
- Configuración de notificaciones por email
- Soporte para backup incremental mejorado
- Plugin system para extensiones personalizadas

---

## [2.0.0] - 2025-07-31

### 🚀 Added - Nuevas Características

#### Sistema de Configuración
- **Archivo config.ini externo** - Configuración centralizada y reutilizable
- **Setup.bat interactivo** - Instalador guiado para configuración inicial
- **Validación robusta** - Verificación de rutas y parámetros de entrada
- **Valores por defecto inteligentes** - Fallbacks automáticos para configuraciones faltantes

#### Funcionalidades de Red
- **Autenticación de red automática** - Soporte para credenciales de dominio
- **Manejo de timeouts configurables** - Timeouts de red personalizables
- **Reconexión automática** - Sistema de reintentos con backoff
- **Desconexión automática opcional** - Limpieza de conexiones de red

#### Mejoras de Backup
- **Timestamps mejorados** - Fecha y hora en nombres de carpetas (YYYY-MM-DD_HH-MM-SS)
- **Parámetros Robocopy configurables** - Personalización completa de opciones
- **Limpieza automática configurable** - Eliminación de archivos antiguos por días
- **Códigos de salida estándar** - Compatibilidad con automatización

#### Sistema de Logging
- **Logging detallado opcional** - Control granular de nivel de logs
- **Organización automática** - Carpetas de logs por timestamp
- **Rutas configurables** - Ubicación personalizable de logs
- **Manejo de errores mejorado** - Reporting detallado de errores

### 🛡️ Security - Seguridad
- **Manejo seguro de credenciales** - Credenciales no expuestas en logs
- **Validación de rutas** - Prevención de path traversal
- **Escape de caracteres especiales** - Manejo seguro de caracteres en rutas
- **Template genérico** - Configuración sin información personal

### 🔧 Changed - Cambios

#### Script Principal
- **Reescritura completa** - Código reorganizado y modularizado
- **Interfaz mejorada** - Mensajes claros y códigos de color
- **Manejo de errores robusto** - Recovery automático y mensajes informativos
- **Variables locales** - Uso de `setlocal enabledelayedexpansion`

#### Documentación
- **README.md completamente reescrito** - Documentación profesional completa
- **EXAMPLES.md añadido** - Ejemplos detallados para diferentes escenarios
- **Comentarios mejorados** - Código autodocumentado

### 🐛 Fixed - Correcciones
- **Manejo de rutas con espacios** - Quotes apropiadas en todas las rutas
- **Detección de errores de Robocopy** - Interpretación correcta de códigos de salida
- **Creación de directorios** - Manejo de errores en creación de carpetas
- **Encoding de archivos** - Compatibilidad mejorada con caracteres especiales

### 🗑️ Removed - Eliminado
- **Rutas hardcodeadas** - Eliminación de paths específicos del desarrollador
- **Código comentado** - Limpieza de código obsoleto
- **Variables globales innecesarias** - Simplificación del scope de variables

---

## [1.0.0] - 2024-XX-XX (Legacy)

### Added
- Script básico de backup con Robocopy
- Verificación de conectividad de red
- Logging básico
- Organización por fechas
- Interfaz de usuario simple

### Features Legacy
- Ping automático al servidor
- Creación de carpetas por fecha
- Limpieza de archivos antiguos (30 días fijo)
- Logs básicos en ubicación fija

---

## 📋 Types of Changes

- **Added** para nuevas características
- **Changed** para cambios en funcionalidad existente  
- **Deprecated** para características que serán removidas pronto
- **Removed** para características removidas
- **Fixed** para corrección de bugs
- **Security** para cambios relacionados con seguridad

## 🔗 Links

- [Repository](https://github.com/l3onkers/EasyWind-backup)
- [Issues](https://github.com/l3onkers/EasyWind-backup/issues)
- [Releases](https://github.com/l3onkers/EasyWind-backup/releases)
- [Contributing Guide](CONTRIBUTING.md)

## 📊 Version Comparison

| Feature | v1.0 | v2.0 |
|---------|------|------|
| External Config | ❌ | ✅ |
| Interactive Setup | ❌ | ✅ |
| Network Auth | ❌ | ✅ |
| Path Validation | ❌ | ✅ |
| Configurable Robocopy | ❌ | ✅ |
| Error Handling | Basic | Advanced |
| Documentation | Basic | Complete |
| Security | Basic | Enhanced |
| Automation Ready | Partial | Full |
