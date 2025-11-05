# 📋 Guía de Configuración - SOFITWARE

## ⚠️ Cambios Necesarios Antes de Ejecutar

Este proyecto requiere configuración manual debido a que las credenciales y rutas absolutas han sido removidas por seguridad.

### 🔧 Pasos de Configuración

#### 1. Variables de Entorno

**Opción A: Usar archivo .env (Recomendado)**

1. Copiar el archivo de ejemplo:
   ```bash
   cp .env.example .env
   ```

2. Editar `.env` con tus credenciales:
   ```properties
   DB_HOST=localhost
   DB_PORT=3306
   DB_NAME=SOFITWARE
   DB_USER=root
   DB_PASSWORD=tu_contraseña_aqui
   FILE_UPLOAD_PATH=C:/ruta/a/tus/archivos
   ```

**Opción B: Variables del sistema**

Configurar variables de entorno en tu sistema operativo:
- Windows: Panel de Control → Sistema → Variables de entorno
- Linux/Mac: Agregar a `.bashrc` o `.zshrc`

#### 2. Configuración de Base de Datos

Como las credenciales fueron removidas del código, necesitas actualizar **manualmente** los archivos JSP:

**Buscar en todos los archivos `.jsp` la línea:**
```java
// LÍNEA REMOVIDA POR SEGURIDAD - CONFIGURAR MANUALMENTE
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SOFITWARE", "usuario", "contraseña");
```

**Reemplazar con tus credenciales:**
```java
con = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/SOFITWARE?useTimeZone=true&serverTimeZone=UTC&autoReconnect=true&useSSL=false",
    "tu_usuario",
    "tu_contraseña"
);
```

**Archivos que requieren actualización:**
- `src/main/webapp/webapp/log-in.jsp`
- `src/main/webapp/webapp/sign-in.jsp`
- `src/main/webapp/webapp/foro.jsp`
- `src/main/webapp/webapp/agregar-entrenador.jsp`
- `src/main/webapp/webapp/loginsoporte.jsp`
- Y todos los demás archivos `.jsp` en `src/main/webapp/webapp/`

#### 3. Rutas de Archivos

En `src/main/java/asignaplan.java`, buscar:
```java
// RUTA REMOVIDA - CONFIGURAR SEGÚN TU SISTEMA
part.write("ruta/a/archivos/" + nombrearchivo);
```

**Reemplazar con tu ruta:**
```java
part.write("C:/tu/ruta/SOFITWARE5TO/src/main/webapp/files/" + nombrearchivo);
```

#### 4. Crear Directorios Necesarios

```bash
mkdir -p src/main/webapp/files
mkdir -p src/main/webapp/pdf
mkdir -p src/main/webapp/IMG
mkdir -p src/main/webapp/imagen
```

#### 5. Base de Datos

Crear la estructura de la base de datos:

```sql
CREATE DATABASE SOFITWARE CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE SOFITWARE;

-- Aquí deberías tener el script SQL con todas las tablas
-- Las tablas incluyen: usuario, entrenador, entrenadortemporal, 
-- personalsoporte, comentario, mensaje, faqs, etc.
```

**Nota:** El script SQL completo no está incluido en este repositorio. Necesitarás:
1. Exportar la estructura de tu base de datos original, o
2. Recrear las tablas basándote en las consultas en los archivos JSP

### 📂 Estructura de Archivos Requerida

```
SOFITWARE5TO/
├── src/main/webapp/
│   ├── files/          # Crear: Archivos subidos por usuarios
│   ├── pdf/            # Crear: PDFs generados
│   ├── IMG/            # Crear: Imágenes (usar placeholders)
│   └── imagen/         # Crear: Más imágenes
```

### 🖼️ Imágenes

Las imágenes originales **NO están incluidas** por copyright. Necesitarás:

**Opción 1: Usar placeholders**
- Descargar imágenes genéricas de [Unsplash](https://unsplash.com)
- Renombrarlas según se requiere: `Coach1.jpg`, `Coach2.png`, etc.

**Opción 2: Desactivar imágenes**
- Comentar las etiquetas `<img>` en los archivos HTML/JSP
- Usar CSS para ocultar las secciones de imágenes

**Imágenes requeridas:**
- `Coach1.jpg` a `Coach8.jpg/png`
- `Logo.jpg`
- `gym.jpg`, `wallpapergym.jfif`
- `Apdroiod.jpg`
- Y otras referenciadas en los archivos HTML/JSP

### 🚀 Compilar y Ejecutar

Después de configurar todo:

```bash
# Compilar
mvn clean install

# El WAR estará en: target/SOFITWARE5TO-1.0-SNAPSHOT.war

# Copiar a Tomcat
cp target/SOFITWARE5TO-1.0-SNAPSHOT.war /path/to/tomcat/webapps/

# Iniciar Tomcat
# Windows: C:\path\to\tomcat\bin\startup.bat
# Linux/Mac: /path/to/tomcat/bin/startup.sh

# Acceder en: http://localhost:8080/SOFITWARE5TO-1.0-SNAPSHOT/
```

### ⚡ Solución Rápida para Testing

Si solo quieres probar el proyecto rápidamente:

1. **Buscar y reemplazar en todo el proyecto:**
   - Buscar: `DriverManager.getConnection(`
   - Reemplazar con tus credenciales en cada ocurrencia

2. **Script de ayuda (PowerShell):**
   ```powershell
   # Listar todos los archivos con conexiones
   Get-ChildItem -Path "src" -Filter "*.jsp" -Recurse | Select-String -Pattern "DriverManager.getConnection"
   ```

### 📞 Problemas Comunes

**Error: "Communications link failure"**
- Verificar que MySQL esté corriendo
- Verificar usuario y contraseña
- Verificar que el puerto 3306 esté abierto

**Error: "ClassNotFoundException: com.mysql.jdbc.Driver"**
- Verificar que `mysql-connector-java` esté en `pom.xml`
- Ejecutar `mvn clean install`

**Error: Página en blanco**
- Verificar logs de Tomcat
- Verificar que la base de datos existe
- Verificar credenciales

---

## 💡 Nota Final

Este proceso de configuración manual es intencional. En un proyecto real, usarías:
- Connection pools (HikariCP, C3P0)
- Frameworks ORM (Hibernate, JPA)
- Inyección de dependencias (Spring)
- Archivos de configuración externos

Este proyecto refleja prácticas de 2022 con fines educativos.
