# Script simple de sanitización masiva
Write-Host "🔧 Sanitizando credenciales en archivos JSP y Java..." -ForegroundColor Yellow

$filesModified = 0

# Obtener todos los archivos JSP
$jspFiles = Get-ChildItem -Path "src\main\webapp\webapp" -Filter "*.jsp" -File

foreach ($file in $jspFiles) {
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    
    if ($content -match "sqlwinbrcuarentena21G") {
        # Reemplazar contraseña
        $content = $content -replace 'sqlwinbrcuarentena21G', 'YOUR_PASSWORD_HERE'
        
        # Guardar
        Set-Content -Path $file.FullName -Value $content -Encoding UTF8 -NoNewline
        Write-Host "   ✅ $($file.Name)" -ForegroundColor Green
        $filesModified++
    }
}

# Obtener archivos Java
$javaFiles = Get-ChildItem -Path "src\main\java" -Filter "*.java" -File -Recurse

foreach ($file in $javaFiles) {
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    
    $modified = $false
    
    if ($content -match "sqlwinbrcuarentena21G") {
        $content = $content -replace 'sqlwinbrcuarentena21G', 'YOUR_PASSWORD_HERE'
        $modified = $true
    }
    
    if ($content -match "C:\\\\CECyT 9") {
        $content = $content -replace 'C:\\\\CECyT 9\\\\5TO SEMESTRE\\\\Proyectos\\\\SOFITWARE5TO\\\\src\\\\main\\\\webapp\\\\', 'src\\main\\webapp\\'
        $modified = $true
    }
    
    if ($modified) {
        Set-Content -Path $file.FullName -Value $content -Encoding UTF8 -NoNewline
        Write-Host "   ✅ $($file.Name)" -ForegroundColor Green
        $filesModified++
    }
}

Write-Host ""
Write-Host "✅ Completado! Archivos modificados: $filesModified" -ForegroundColor Green
Write-Host ""
Write-Host "📝 Próximos pasos:" -ForegroundColor Yellow
Write-Host "   1. git status" -ForegroundColor White
Write-Host "   2. git diff (revisar cambios)" -ForegroundColor White
Write-Host "   3. git add ." -ForegroundColor White
Write-Host "   4. git commit -m 'Initial commit - Proyecto académico 2022'" -ForegroundColor White
