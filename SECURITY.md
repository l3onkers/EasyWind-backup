# 🔒 Security Policy

## 🛡️ Versiones Soportadas

Utilizamos este proyecto para reportar vulnerabilidades de seguridad. Solo las siguientes versiones están actualmente soportadas con actualizaciones de seguridad:

| Versión | Soportada          |
| ------- | ------------------ |
| 2.0.x   | ✅ Sí              |
| 1.x.x   | ❌ No              |

## 🚨 Reportar una Vulnerabilidad

Si descubres una vulnerabilidad de seguridad en EasyWind Backup, por favor repórtala de manera responsable.

### 📧 Proceso de Reporte

**Para vulnerabilidades críticas o sensibles:**
1. **NO** abras un issue público
2. Envía un email a: [tu-email-de-seguridad] (reemplaza por un email real)
3. Incluye la información detallada de la vulnerabilidad
4. Esperaremos responderte dentro de 48 horas

**Para vulnerabilidades menores:**
- Puedes abrir un issue público usando el label `security`
- Asegúrate de no exponer detalles que puedan ser explotados

### 📋 Información a Incluir

Cuando reportes una vulnerabilidad, incluye:

- **Descripción:** Descripción clara de la vulnerabilidad
- **Impacto:** Qué podría hacer un atacante con esta vulnerabilidad
- **Pasos:** Pasos detallados para reproducir el problema
- **Versión:** Versión afectada de EasyWind Backup
- **Entorno:** Sistema operativo y configuración relevante
- **Evidencia:** Screenshots, logs, o código de prueba (si es seguro compartir)

### 🔍 Tipos de Vulnerabilidades

Estamos particularmente interesados en reportes sobre:

#### 🔴 Críticas
- **Ejecución de código remoto:** Comandos maliciosos ejecutados remotamente
- **Escalación de privilegios:** Obtener permisos no autorizados
- **Inyección de comandos:** Manipulación de comandos del sistema
- **Acceso no autorizado:** Bypass de autenticación o autorización

#### 🟡 Importantes
- **Exposición de credenciales:** Contraseñas o tokens en logs/archivos
- **Path traversal:** Acceso a archivos fuera del directorio objetivo
- **Denial of Service:** Ataques que impiden el funcionamiento normal
- **Información sensible:** Filtración de datos de configuración

#### 🟢 Moderadas
- **Logging inseguro:** Información sensible en logs
- **Configuración insegura:** Defaults que podrían ser problemáticos
- **Validación de entrada:** Manejo inadecuado de entrada de usuario

### ⏱️ Tiempo de Respuesta

- **Confirmación inicial:** 48 horas
- **Análisis preliminar:** 1 semana
- **Fix development:** 2-4 semanas (dependiendo de la complejidad)
- **Release:** Coordinaremos contigo el timing del disclosure

### 🏆 Reconocimiento

Valoramos a los security researchers que nos ayudan a mantener EasyWind Backup seguro:

- **Hall of Fame:** Reconocimiento público en este archivo (con tu permiso)
- **Créditos:** Mención en release notes para fixes de seguridad
- **Colaboración:** Invitación a revisar el fix antes del release

### 🔐 Mejores Prácticas de Seguridad

#### Para Usuarios
- **Credenciales:** Nunca hardcodees contraseñas en scripts
- **Permisos:** Usa cuentas con mínimos privilegios necesarios
- **Updates:** Mantente actualizado con las últimas versiones
- **Config:** Revisa regularmente tu configuración de seguridad

#### Para Desarrolladores
- **Input validation:** Valida toda entrada de usuario
- **Escape sequences:** Maneja apropiadamente caracteres especiales
- **Error handling:** No expongas información sensible en errores
- **Logging:** Evita loguear información sensible

### 📚 Recursos de Seguridad

- [OWASP Top 10](https://owasp.org/www-project-top-ten/)
- [Microsoft Security Guidelines](https://docs.microsoft.com/en-us/windows/security/)
- [Batch Script Security](https://ss64.com/nt/syntax-security.html)

### 🔄 Historial de Seguridad

#### v2.0 (Julio 2025)
- ✅ Implementación de validación de rutas
- ✅ Manejo seguro de credenciales
- ✅ Escape de caracteres especiales en rutas
- ✅ Logging mejorado sin exponer credenciales

---

## 🛡️ Security Hall of Fame

Agradecemos a estos security researchers por ayudarnos a mejorar EasyWind Backup:

<!-- Los nombres se añadirán aquí conforme se reporten vulnerabilidades -->

*Sé el primero en aparecer aquí reportando una vulnerabilidad de manera responsable.*

---

**Última actualización:** Julio 2025
**Próxima revisión:** Enero 2026
