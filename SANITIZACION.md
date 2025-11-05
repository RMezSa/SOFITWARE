# 🔒 Proceso de Sanitización de Credenciales

## ⚠️ IMPORTANTE: Lee esto ANTES de hacer commit

Este documento explica cómo eliminar las credenciales sensibles del código antes de subirlo a GitHub.

## 📋 Checklist Antes del Commit

- [ ] Verificar que `.env` está en `.gitignore`
- [ ] Verificar que `target/` está en `.gitignore`
- [ ] Verificar que las imágenes están en `.gitignore`
- [ ] Revisar que NO hay credenciales en el código
- [ ] Verificar que los archivos de configuración están creados

## 🔍 Archivos con Credenciales

### Credenciales encontradas:
- **Usuario:** `root`
- **Contraseña:** `sqlwinbrcuarentena21G`
- **Ruta absoluta:** `C:\\CECyT 9\\5TO SEMESTRE\\...`

### Archivos que contienen credenciales (>50 archivos):

**Todos los archivos `.jsp` en:**
- `src/main/webapp/webapp/*.jsp`

**Archivos Java:**
- `src/main/java/asignaplan.java`

## 🛠️ Opciones para Sanitizar

### Opción 1: Dejar comentarios indicativos (RECOMENDADO para portafolio)

En cada archivo, reemplazar:
```java
con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/SOFITWARE?useTimeZone=true&serverTimeZone=UTC&autoReconnect=true&useSSL=false","root","sqlwinbrcuarentena21G");
```

Por:
```java
// TODO: Configurar credenciales de base de datos
// Ejemplo: con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SOFITWARE", "usuario", "password");
con = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/SOFITWARE?useTimeZone=true&serverTimeZone=UTC&autoReconnect=true&useSSL=false",
    System.getenv("DB_USER"),     // Configurar variable de entorno
    System.getenv("DB_PASSWORD")  // Configurar variable de entorno
);
```

### Opción 2: Crear clase de configuración

Crear `src/main/java/config/DatabaseConfig.java`:
```java
package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConfig {
    
    private static final String DB_HOST = System.getenv("DB_HOST") != null 
        ? System.getenv("DB_HOST") : "localhost";
    private static final String DB_PORT = System.getenv("DB_PORT") != null 
        ? System.getenv("DB_PORT") : "3306";
    private static final String DB_NAME = System.getenv("DB_NAME") != null 
        ? System.getenv("DB_NAME") : "SOFITWARE";
    private static final String DB_USER = System.getenv("DB_USER");
    private static final String DB_PASSWORD = System.getenv("DB_PASSWORD");
    
    private static final String DB_URL = "jdbc:mysql://" + DB_HOST + ":" + DB_PORT + "/" + DB_NAME 
        + "?useTimeZone=true&serverTimeZone=UTC&autoReconnect=true&useSSL=false";
    
    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }
}
```

Luego en cada JSP:
```java
<%@page import="config.DatabaseConfig"%>

// En lugar de:
// con = DriverManager.getConnection(...);

// Usar:
con = DatabaseConfig.getConnection();
```

### Opción 3: Solo agregar comentario de advertencia (MÁS RÁPIDO)

Si quieres subirlo rápido como proyecto histórico, simplemente agregar al inicio de cada JSP:

```jsp
<%-- 
    ⚠️ ADVERTENCIA DE SEGURIDAD:
    Este código contiene credenciales hardcodeadas y es vulnerable a SQL Injection.
    Fue desarrollado en 2022 como proyecto académico de preparatoria.
    NO usar en producción. Solo para fines educativos y de portafolio.
    
    Las credenciales originales han sido reemplazadas por placeholders.
    Para ejecutar: configurar tus propias credenciales en las líneas indicadas.
--%>
```

Y reemplazar la contraseña por un placeholder:
```java
con = DriverManager.getConnection(
    "jdbc:mysql://127.0.0.1:3306/SOFITWARE?useTimeZone=true&serverTimeZone=UTC&autoReconnect=true&useSSL=false",
    "root",
    "TU_PASSWORD_AQUI"  // ⚠️ Configurar tu contraseña
);
```

## 🚀 Comando PowerShell para Ayudar

### Listar todos los archivos con credenciales:
```powershell
Get-ChildItem -Path "src" -Filter "*.jsp" -Recurse | Select-String -Pattern "sqlwinbrcuarentena21G" | Select-Object -Property Path -Unique
```

### Listar todos los archivos con rutas absolutas:
```powershell
Get-ChildItem -Path "src" -Filter "*.java" -Recurse | Select-String -Pattern "C:\\\\CECyT" | Select-Object -Property Path -Unique
```

## 📝 Después de Sanitizar

1. **Revisar cambios:**
   ```bash
   git status
   git diff
   ```

2. **Verificar que NO hay credenciales:**
   ```bash
   # Buscar la contraseña
   git grep "sqlwinbrcuarentena21G"
   
   # Buscar rutas absolutas
   git grep "CECyT 9"
   ```

3. **Hacer commit:**
   ```bash
   git add .
   git commit -m "Initial commit - Proyecto académico SOFITWARE (2022)"
   git branch -M main
   git remote add origin https://github.com/tu-usuario/SOFITWARE5TO.git
   git push -u origin main
   ```

## ⚡ Script Automático (Usar con cuidado)

**NOTA:** Este script es solo de ejemplo. Revisa manualmente después.

```powershell
# sanitize.ps1
$files = Get-ChildItem -Path "src" -Filter "*.jsp" -Recurse

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw
    
    # Reemplazar contraseña
    $content = $content -replace 'sqlwinbrcuarentena21G', 'TU_PASSWORD_AQUI'
    
    # Guardar
    Set-Content -Path $file.FullName -Value $content
}

Write-Host "✅ Sanitización completada. REVISAR MANUALMENTE antes de commit!"
```

## 🎯 Recomendación Final para Portafolio

Para un proyecto de portafolio que muestre tu trabajo de preparatoria:

1. ✅ Agregar comentarios explicativos sobre las limitaciones
2. ✅ Reemplazar credenciales reales por placeholders
3. ✅ Incluir archivos README, SECURITY.md explicando el contexto
4. ✅ Usar `.gitignore` para excluir imágenes y archivos sensibles
5. ✅ Agregar badge en README: "Proyecto Académico 2022"

Esto demuestra:
- Conciencia de seguridad (aunque no la implementaste en 2022)
- Capacidad de documentación
- Transparencia sobre el nivel del proyecto
- Evolución como desarrollador

---

**¿Necesitas ayuda con algún paso específico?** 
Puedo ayudarte a ejecutar cualquiera de estas opciones.
