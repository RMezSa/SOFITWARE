# ===================================================================
# Script de Sanitización de Credenciales para SOFITWARE5TO
# ===================================================================
# ADVERTENCIA: Este script modificará archivos. 
# Asegúrate de tener un backup o estar en un repositorio git limpio.
# ===================================================================

Write-Host "================================================" -ForegroundColor Cyan
Write-Host "  SOFITWARE - Script de Sanitización" -ForegroundColor Cyan
Write-Host "================================================" -ForegroundColor Cyan
Write-Host ""

# Verificar si estamos en el directorio correcto
if (-not (Test-Path "pom.xml")) {
    Write-Host "❌ ERROR: Este script debe ejecutarse desde la raíz del proyecto" -ForegroundColor Red
    Write-Host "   (donde está el archivo pom.xml)" -ForegroundColor Red
    exit 1
}

Write-Host "📂 Directorio actual: $PWD" -ForegroundColor Green
Write-Host ""

# Contador de archivos modificados
$filesModified = 0

# Opciones de sanitización
Write-Host "Selecciona el método de sanitización:" -ForegroundColor Yellow
Write-Host "1. Reemplazar con placeholders (Recomendado para GitHub)" -ForegroundColor White
Write-Host "2. Reemplazar con variables de entorno (Más profesional)" -ForegroundColor White
Write-Host "3. Solo listar archivos con credenciales (No modificar)" -ForegroundColor White
Write-Host ""
$choice = Read-Host "Opción (1-3)"

# ===================================================================
# Función para listar archivos con credenciales
# ===================================================================
function List-FilesWithCredentials {
    Write-Host "`n🔍 Buscando archivos con credenciales..." -ForegroundColor Yellow
    
    # Buscar contraseña
    $filesWithPassword = Get-ChildItem -Path "src" -Filter "*.jsp" -Recurse | 
        Select-String -Pattern "sqlwinbrcuarentena21G" | 
        Select-Object -Property Path -Unique
    
    # Buscar rutas absolutas
    $filesWithPaths = Get-ChildItem -Path "src" -Filter "*.java" -Recurse | 
        Select-String -Pattern "C:\\\\CECyT|CECyT 9" | 
        Select-Object -Property Path -Unique
    
    Write-Host "`n📄 Archivos JSP con credenciales:" -ForegroundColor Cyan
    $filesWithPassword | ForEach-Object { Write-Host "   - $($_.Path)" -ForegroundColor White }
    
    Write-Host "`n📄 Archivos Java con rutas absolutas:" -ForegroundColor Cyan
    $filesWithPaths | ForEach-Object { Write-Host "   - $($_.Path)" -ForegroundColor White }
    
    $totalFiles = ($filesWithPassword | Measure-Object).Count + ($filesWithPaths | Measure-Object).Count
    Write-Host "`n📊 Total de archivos a modificar: $totalFiles" -ForegroundColor Yellow
}

# ===================================================================
# Función para sanitizar con placeholders
# ===================================================================
function Sanitize-WithPlaceholders {
    Write-Host "`n🔧 Sanitizando con placeholders..." -ForegroundColor Yellow
    
    $files = Get-ChildItem -Path "src\main\webapp\webapp" -Filter "*.jsp" -Recurse
    
    foreach ($file in $files) {
        $content = Get-Content $file.FullName -Raw -Encoding UTF8
        $originalContent = $content
        
        # Reemplazar credenciales
        $content = $content -replace 'sqlwinbrcuarentena21G', 'YOUR_PASSWORD_HERE'
        
        # Agregar comentario de advertencia si no existe
        if ($content -notmatch "ADVERTENCIA DE SEGURIDAD") {
            $warningComment = @"
<%-- 
    ⚠️ ADVERTENCIA DE SEGURIDAD:
    Este código contiene credenciales hardcodeadas y es vulnerable a SQL Injection.
    Proyecto académico desarrollado en 2022 (Preparatoria - CECyT 9 IPN).
    NO usar en producción. Solo para fines educativos y de portafolio.
    
    Para ejecutar: Reemplazar 'YOUR_PASSWORD_HERE' con tu contraseña de MySQL.
--%>

"@
            # Insertar después de la primera línea
            if ($content -match '(?s)(<%--.*?--%>)(.*)') {
                $content = $matches[1] + "`n" + $warningComment + $matches[2]
            } else {
                $content = $warningComment + $content
            }
        }
        
        # Guardar solo si hubo cambios
        if ($content -ne $originalContent) {
            Set-Content -Path $file.FullName -Value $content -Encoding UTF8
            Write-Host "   ✅ Modificado: $($file.Name)" -ForegroundColor Green
            $script:filesModified++
        }
    }
    
    # Sanitizar archivos Java
    $javaFiles = Get-ChildItem -Path "src\main\java" -Filter "*.java" -Recurse
    
    foreach ($file in $javaFiles) {
        $content = Get-Content $file.FullName -Raw -Encoding UTF8
        $originalContent = $content
        
        # Reemplazar contraseña
        $content = $content -replace 'sqlwinbrcuarentena21G', 'YOUR_PASSWORD_HERE'
        
        # Reemplazar rutas absolutas
        $content = $content -replace 'C:\\\\CECyT 9\\\\5TO SEMESTRE\\\\Proyectos\\\\SOFITWARE5TO\\\\', ''
        $content = $content -replace 'C:/CECyT 9/5TO SEMESTRE/Proyectos/SOFITWARE5TO/', ''
        
        if ($content -ne $originalContent) {
            Set-Content -Path $file.FullName -Value $content -Encoding UTF8
            Write-Host "   ✅ Modificado: $($file.Name)" -ForegroundColor Green
            $script:filesModified++
        }
    }
}

# ===================================================================
# Función para sanitizar con variables de entorno
# ===================================================================
function Sanitize-WithEnvVars {
    Write-Host "`n🔧 Sanitizando con variables de entorno..." -ForegroundColor Yellow
    Write-Host "⚠️  NOTA: Esta opción requiere más trabajo manual." -ForegroundColor Yellow
    Write-Host "   Se recomienda usar la Opción 1 para portafolio." -ForegroundColor Yellow
    Write-Host ""
    
    $confirm = Read-Host "¿Continuar? (s/n)"
    if ($confirm -ne "s") {
        Write-Host "❌ Cancelado" -ForegroundColor Red
        return
    }
    
    # Por ahora, solo muestra instrucciones
    Write-Host @"
    
📋 Para usar variables de entorno, debes:

1. Crear la clase DatabaseConfig.java en src/main/java/config/
2. Modificar cada archivo JSP para importar y usar DatabaseConfig
3. Esto requiere refactorización significativa

Recomendación: Usa la Opción 1 (placeholders) para GitHub.
Si quieres implementar esto, consulta el archivo SANITIZACION.md

"@ -ForegroundColor Cyan
}

# ===================================================================
# Ejecutar según la opción seleccionada
# ===================================================================
switch ($choice) {
    "1" {
        List-FilesWithCredentials
        Write-Host ""
        $confirm = Read-Host "¿Proceder con la sanitización? (s/n)"
        if ($confirm -eq "s") {
            Sanitize-WithPlaceholders
            Write-Host "`n✅ Sanitización completada!" -ForegroundColor Green
            Write-Host "📊 Archivos modificados: $filesModified" -ForegroundColor Cyan
            Write-Host ""
            Write-Host "⚠️  IMPORTANTE: Revisa los cambios antes de hacer commit:" -ForegroundColor Yellow
            Write-Host "   git diff" -ForegroundColor White
            Write-Host ""
        } else {
            Write-Host "❌ Cancelado" -ForegroundColor Red
        }
    }
    "2" {
        Sanitize-WithEnvVars
    }
    "3" {
        List-FilesWithCredentials
    }
    default {
        Write-Host "❌ Opción inválida" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "================================================" -ForegroundColor Cyan
Write-Host "  Script finalizado" -ForegroundColor Cyan
Write-Host "================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "📚 Próximos pasos:" -ForegroundColor Yellow
Write-Host "   1. Revisar cambios: git diff" -ForegroundColor White
Write-Host "   2. Verificar .gitignore: cat .gitignore" -ForegroundColor White
Write-Host "   3. Buscar credenciales restantes: git grep 'sqlwin'" -ForegroundColor White
Write-Host "   4. Agregar al staging: git add ." -ForegroundColor White
Write-Host "   5. Commit: git commit -m 'Initial commit'" -ForegroundColor White
Write-Host ""
