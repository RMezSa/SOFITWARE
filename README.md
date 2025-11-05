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

6. **Estructura del Proyecto**

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

### Sobre la Seguridad

⚠️ **ADVERTENCIA:** Este es un proyecto académico de 2022. El código contiene prácticas que **NO son adecuadas para producción**:

**Este proyecto es SOLO para fines educativos y de portafolio.** 

## 🔒 Configuración de Seguridad

### Variables de Entorno

## 🎓 Contexto Académico

Este proyecto fue desarrollado como parte de mi formación en preparatoria, específicamente durante el 5to y 6to semestre en el CECyT 9 del IPN. Representa mi trabajo y aprendizaje en desarrollo web durante ese período.
