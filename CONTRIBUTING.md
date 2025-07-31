# 🤝 Contributing to EasyWind Backup

¡Gracias por tu interés en contribuir a EasyWind Backup! Este documento te guiará a través del proceso de contribución.

## 📋 Tabla de Contenidos
- [Code of Conduct](#code-of-conduct)
- [¿Cómo Puedo Contribuir?](#cómo-puedo-contribuir)
- [Reportar Bugs](#reportar-bugs)
- [Sugerir Features](#sugerir-features)
- [Contribuir con Código](#contribuir-con-código)
- [Style Guidelines](#style-guidelines)
- [Proceso de Pull Request](#proceso-de-pull-request)

## 📜 Code of Conduct

Este proyecto adhiere a un código de conducta. Al participar, se espera que mantengas un ambiente respetuoso y profesional.

### Nuestras Expectativas
- **Sé respetuoso:** Trata a todos con respeto y cortesía
- **Sé constructivo:** Proporciona feedback constructivo y útil
- **Sé inclusivo:** Damos la bienvenida a contribuciones de todos
- **Sé paciente:** Recuerda que todos estamos aprendiendo

## 🛠️ ¿Cómo Puedo Contribuir?

### 🐛 Reportar Bugs
- Usa el [template de bug report](.github/ISSUE_TEMPLATE/bug_report.md)
- Busca primero si el bug ya fue reportado
- Incluye toda la información relevante del sistema
- Proporciona pasos claros para reproducir el problema

### ✨ Sugerir Features
- Usa el [template de feature request](.github/ISSUE_TEMPLATE/feature_request.md)
- Explica claramente el problema que resolvería
- Describe la solución propuesta
- Considera alternativas y casos de uso

### 📚 Mejorar Documentación
- Usa el [template de documentation](.github/ISSUE_TEMPLATE/documentation.md)
- Identifica qué documentación falta o está incorrecta
- Sugiere mejoras específicas
- Considera la audiencia objetivo

### 💻 Contribuir con Código

#### Prerequisitos
- Conocimiento básico de Batch scripting
- Familiarity con Git y GitHub
- Sistema Windows para testing

#### Configuración del Entorno
1. Fork el repositorio
2. Clone tu fork localmente
3. Crea una branch para tu feature/fix
4. Configura tu entorno de testing

```batch
git clone https://github.com/tu-usuario/EasyWind-backup.git
cd EasyWind-backup
git checkout -b feature/mi-nueva-feature
```

## 📝 Style Guidelines

### Batch Script Style
- **Encoding:** UTF-8 sin BOM
- **Line Endings:** CRLF (Windows style)
- **Indentation:** Usar tabs o 4 espacios (ser consistente)
- **Comments:** En español, claros y descriptivos

#### Convenciones de Naming
```batch
REM Variables en minúsculas con underscore
set "my_variable=value"

REM Variables de configuración en minúsculas
set "backup_server=server.local"

REM Labels en MAYÚSCULAS
:BACKUP
:ERROR
:LOOP
```

#### Estructura de Código
```batch
REM ======================================
REM Sección descriptiva clara
REM ======================================

echo Mensaje informativo claro
REM Código con comentarios cuando sea necesario
if ERRORLEVEL 1 (
    echo Error handling con mensajes claros
    goto ERROR
)
```

### Documentation Style
- **Idioma:** Español para documentación principal
- **Formato:** Markdown con emojis para claridad
- **Estructura:** Headers claros y tabla de contenidos
- **Ejemplos:** Siempre incluir ejemplos prácticos

## 🔄 Proceso de Pull Request

### 1. Antes de Empezar
- [ ] Revisa issues existentes
- [ ] Discute grandes cambios en un issue primero
- [ ] Asegúrate de que tu idea es bienvenida

### 2. Desarrollo
- [ ] Crea una branch descriptiva
- [ ] Haz commits pequeños y descriptivos
- [ ] Incluye tests/validación manual
- [ ] Actualiza documentación relevante

### 3. Testing
- [ ] Prueba en diferentes versiones de Windows
- [ ] Prueba diferentes escenarios de red
- [ ] Verifica compatibilidad con config existentes
- [ ] Documenta casos de prueba

### 4. Submission
- [ ] Usa el [PR template](.github/pull_request_template.md)
- [ ] Incluye descripción clara de cambios
- [ ] Referencia issues relacionados
- [ ] Incluye screenshots si es relevante

### 5. Review Process
- Mantén la branch actualizada con main
- Responde a feedback constructivamente
- Haz cambios solicitados promptamente
- Sé paciente durante el proceso de review

## 🏷️ Commit Messages

### Format
```
type(scope): descripción corta

Descripción más detallada si es necesario.

- Bullet points para múltiples cambios
- Referencias a issues: Closes #123
```

### Types
- `feat`: Nueva feature
- `fix`: Bug fix
- `docs`: Cambios en documentación
- `style`: Formatting, espacios, etc.
- `refactor`: Refactoring código
- `test`: Añadir tests
- `chore`: Mantenimiento

### Examples
```
feat(config): añadir soporte para múltiples servidores backup

- Permitir lista de servidores en config.ini
- Implementar failover automático
- Actualizar documentación

Closes #45
```

## 📊 Development Workflow

### Branch Strategy
- `main`: Código estable y releases
- `develop`: Desarrollo activo (si se usa)
- `feature/xxx`: Nuevas features
- `fix/xxx`: Bug fixes
- `docs/xxx`: Mejoras de documentación

### Release Process
1. Features se desarrollan en branches separadas
2. PR review y merge a main
3. Tags para releases importantes
4. Actualización de changelog

## 🧪 Testing Guidelines

### Manual Testing
- [ ] Windows 10/11 compatibility
- [ ] Local backup scenarios
- [ ] Network backup scenarios
- [ ] Error handling scenarios
- [ ] Different config.ini configurations

### Test Cases to Cover
- **Setup:** Nuevo instalación con setup.bat
- **Config:** Diferentes combinaciones de configuración
- **Networks:** Local, domain, workgroup scenarios
- **Errors:** Network failures, permission issues
- **Edge Cases:** Empty configs, invalid paths

## 📚 Resources

### Learning Resources
- [Batch Scripting Tutorial](https://www.tutorialspoint.com/batch_script/)
- [Git Handbook](https://guides.github.com/introduction/git-handbook/)
- [Markdown Guide](https://www.markdownguide.org/)

### Project Resources
- [README.md](README.md) - Documentación principal
- [EXAMPLES.md](EXAMPLES.md) - Ejemplos de configuración
- [Issues](https://github.com/l3onkers/EasyWind-backup/issues) - Bug reports y feature requests

## ❓ Questions?

¿Tienes preguntas sobre cómo contribuir? 

- 📧 Crea un [question issue](.github/ISSUE_TEMPLATE/question.md)
- 💬 Inicia una [GitHub Discussion](https://github.com/l3onkers/EasyWind-backup/discussions)
- 📖 Revisa documentación existente

---

¡Gracias por contribuir a EasyWind Backup! 🎉
