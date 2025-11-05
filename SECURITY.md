# Advertencia de Seguridad

⚠️ **IMPORTANTE: Este es un proyecto académico de 2022**

## 🔴 Vulnerabilidades Conocidas

Este proyecto contiene **vulnerabilidades de seguridad intencionales** que fueron parte del proceso de aprendizaje. **NO debe usarse en producción** sin antes aplicar las correcciones necesarias.

### Problemas de Seguridad Identificados:

1. **SQL Injection**
   - Las consultas SQL concatenan directamente las entradas del usuario
   - **Solución recomendada:** Usar `PreparedStatement`

2. **Contraseñas en Texto Plano**
   - Las contraseñas se almacenan sin encriptar en la base de datos
   - **Solución recomendada:** Implementar BCrypt o similar

3. **Validación Solo en Frontend**
   - La validación se realiza únicamente con JavaScript
   - **Solución recomendada:** Implementar validación del lado del servidor

4. **Gestión de Sesiones Insegura**
   - No hay protección CSRF
   - Las sesiones no tienen timeout configurado
   - **Solución recomendada:** Implementar tokens CSRF y timeouts

5. **Credenciales Hardcodeadas (Corregido)**
   - ✅ Las credenciales ahora se manejan mediante variables de entorno
   - ✅ El archivo `.env` está en `.gitignore`

## 📚 Propósito Educativo

Este proyecto fue desarrollado en 2022 como parte de mi formación en preparatoria. Las vulnerabilidades mencionadas reflejan mi nivel de conocimiento en ese momento y el enfoque del curso, que priorizaba la funcionalidad sobre la seguridad.

## 🛡️ Recomendaciones para Uso

Si deseas usar este código como base para un proyecto real:

1. ✅ Implementar `PreparedStatement` en todas las consultas SQL
2. ✅ Agregar hash de contraseñas (BCrypt, Argon2)
3. ✅ Implementar validación del lado del servidor
4. ✅ Usar HTTPS en producción
5. ✅ Implementar protección CSRF
6. ✅ Configurar headers de seguridad HTTP
7. ✅ Actualizar todas las dependencias a versiones actuales
8. ✅ Implementar logging y monitoreo de seguridad

## 📞 Contacto

Si encuentras alguna vulnerabilidad adicional o tienes sugerencias de seguridad, por favor abre un issue en el repositorio.

---

**Recuerda:** Este código es solo para fines educativos y de portafolio. Muestra mi progreso como desarrollador desde la preparatoria.
