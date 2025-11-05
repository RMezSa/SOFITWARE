# SOFITWARE - Sistema de Gestión de Gimnasio

> 💡 **Proyecto académico desarrollado durante preparatoria (2022)**  
> Este proyecto fue creado como parte de mi formación en el CECyT 9 "Juan de Dios Bátiz" del IPN.

## 📝 Descripción

SOFITWARE es una plataforma web para la gestión de un gimnasio que incluye:

- ✅ Sistema de registro y autenticación de usuarios
- ✅ Gestión de entrenadores y clientes
- ✅ Asignación de planes de entrenamiento
- ✅ Foro de discusión
- ✅ Sistema de mensajería directa
- ✅ FAQs y soporte técnico
- ✅ Panel de administración

## 🛠️ Tecnologías Utilizadas

- **Backend:** Java (JSP/Servlets)
- **Frontend:** HTML5, CSS3, JavaScript
- **Base de Datos:** MySQL
- **Servidor:** Apache Tomcat
- **Build Tool:** Maven

## ⚙️ Configuración del Proyecto

### Prerequisitos

- Java JDK 7 o superior
- Apache Tomcat 7+
- MySQL 5.7+
- Maven 3.x

### Instalación

1. **Clonar el repositorio**
   ```bash
   git clone https://github.com/tu-usuario/SOFITWARE5TO.git
   cd SOFITWARE5TO
   ```

2. **Configurar la base de datos**
   
   Crear la base de datos MySQL:
   ```sql
   CREATE DATABASE SOFITWARE;
   ```
   
   Ejecutar el script SQL para crear las tablas (ubicado en `database/schema.sql` - si existe)

3. **Configurar variables de entorno**
   
   Copiar el archivo de ejemplo:
   ```bash
   cp .env.example .env
   ```
   
   Editar `.env` con tus credenciales:
   ```properties
   DB_HOST=localhost
   DB_PORT=3306
   DB_NAME=SOFITWARE
   DB_USER=tu_usuario
   DB_PASSWORD=tu_contraseña
   ```

4. **Compilar el proyecto**
   ```bash
   mvn clean install
   ```

5. **Desplegar en Tomcat**
   
   Copiar el archivo WAR generado a la carpeta `webapps` de Tomcat:
   ```bash
   cp target/SOFITWARE5TO-1.0-SNAPSHOT.war /path/to/tomcat/webapps/
   ```

6. **Acceder a la aplicación**
   
   Abrir en el navegador: `http://localhost:8080/SOFITWARE5TO-1.0-SNAPSHOT/`

## 📁 Estructura del Proyecto

```
SOFITWARE5TO/
├── src/
│   └── main/
│       ├── java/              # Servlets y clases Java
│       └── webapp/
│           ├── css/           # Hojas de estilo
│           ├── webapp/        # Páginas JSP
│           ├── files/         # Archivos subidos (no en Git)
│           ├── IMG/           # Imágenes (no en Git - copyright)
│           └── WEB-INF/       # Configuración web
├── pom.xml                    # Configuración Maven
├── .gitignore                 # Archivos ignorados por Git
└── README.md                  # Este archivo
```

## ⚠️ Notas Importantes

### Sobre las Imágenes

Por motivos de copyright, las imágenes originales **NO están incluidas** en este repositorio. 

Si deseas ejecutar el proyecto, necesitarás:
- Reemplazar las imágenes en `src/main/webapp/IMG/` con tus propias imágenes o usar placeholders
- Las imágenes esperadas incluyen: `Coach1.jpg`, `Coach2.png`, `Logo.jpg`, etc.

### Sobre la Seguridad

⚠️ **ADVERTENCIA:** Este es un proyecto académico de 2022. El código contiene prácticas que **NO son adecuadas para producción**:

- Las consultas SQL son vulnerables a inyección SQL
- Las contraseñas se almacenan en texto plano
- No hay validación del lado del servidor
- Falta manejo de sesiones seguras

**Este proyecto es SOLO para fines educativos y de portafolio.** No debe usarse en producción sin antes aplicar las mejoras de seguridad necesarias.

## 🔒 Configuración de Seguridad

### Variables de Entorno

Este proyecto requiere un archivo `.env` que **NO debe ser versionado**. 

**✅ Incluido en el repositorio:** `.env.example` (plantilla)  
**❌ NO incluido:** `.env` (con credenciales reales)

Asegúrate de:
1. Copiar `.env.example` a `.env`
2. Actualizar con tus credenciales
3. **NUNCA** hacer commit del archivo `.env`

## 👤 Autor

**[Tu Nombre]**
- Estudiante del CECyT 9 "Juan de Dios Bátiz" - IPN
- Proyecto desarrollado en 5to semestre (2022)

## 📄 Licencia

Este proyecto es de código abierto y está disponible bajo la [Licencia MIT](LICENSE).

---

## 🎓 Contexto Académico

Este proyecto fue desarrollado como parte de mi formación en preparatoria, específicamente durante el 5to semestre en el CECyT 9 del IPN. Representa mi trabajo y aprendizaje en desarrollo web durante ese período.

**Año de desarrollo:** 2022  
**Institución:** CECyT 9 "Juan de Dios Bátiz" - IPN  
**Nivel:** Preparatoria (5to Semestre)

---

⭐ **Nota:** Si encuentras este proyecto útil para aprender, no dudes en darle una estrella en GitHub!
