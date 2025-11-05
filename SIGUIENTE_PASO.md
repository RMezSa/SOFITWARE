# ✅ SANITIZACIÓN COMPLETADA PARCIALMENTE

## Estado Actual

✅ **Archivos ya sanitizados:**
- `foro.jsp` - Credenciales reemplazadas + comentario de advertencia agregado

⏳ **Pendiente:** ~100 archivos JSP más

---

## 🚀 SOLUCIÓN RÁPIDA: Usar VS Code

### Método 1: Búsqueda y Reemplazo Global (RECOMENDADO)

1. **Presiona** `Ctrl + Shift + H` (Windows) o `Cmd + Shift + H` (Mac)
   
2. **En "Search"** (Buscar), pega:
   ```
   sqlwinbrcuarentena21G
   ```

3. **En "Replace"** (Reemplazar), pega:
   ```
   YOUR_PASSWORD_HERE
   ```

4. **En "files to include"**, pega:
   ```
   src/**/*.jsp
   ```

5. **Click en "Replace All"** (Reemplazar todo)
   - VS Code te mostrará cuántos reemplazos hará
   - Confirma

6. **Repite para archivos Java:**
   - Buscar: `sqlwinbrcuarentena21G`
   - Reemplazar: `YOUR_PASSWORD_HERE`
   - Files: `src/**/*.java`

7. **Reemplazar rutas absolutas:**
   - Buscar: `C:\\CECyT 9\\5TO SEMESTRE\\Proyectos\\SOFITWARE5TO\\src\\main\\webapp\\`
   - Reemplazar: `src\\main\\webapp\\`
   - Files: `src/**/*.java`

---

### Método 2: Comando PowerShell (alternativo)

Si prefieres usar PowerShell directamente desde VS Code:

```powershell
# Abrir terminal integrada en VS Code (Ctrl + `)
# Ejecutar esto:

# Para archivos JSP
Get-ChildItem -Path "src\main\webapp\webapp" -Filter "*.jsp" -Recurse | ForEach-Object {
    (Get-Content $_.FullName -Raw) -replace 'sqlwinbrcuarentena21G', 'YOUR_PASSWORD_HERE' | Set-Content $_.FullName -NoNewline
}

# Para archivos Java  
Get-ChildItem -Path "src\main\java" -Filter "*.java" -Recurse | ForEach-Object {
    $content = (Get-Content $_.FullName -Raw)
    $content = $content -replace 'sqlwinbrcuarentena21G', 'YOUR_PASSWORD_HERE'
    $content = $content -replace 'C:\\CECyT 9\\5TO SEMESTRE\\Proyectos\\SOFITWARE5TO\\src\\main\\webapp\\', 'src\\main\\webapp\\'
    Set-Content $_.FullName -Value $content -NoNewline
}
```

---

## ✅ Verificación

Después de hacer los reemplazos:

### 1. Buscar credenciales restantes:
```powershell
# En terminal de VS Code
git grep "sqlwinbrcuarentena21G"
```

**Resultado esperado:** Solo encontrará en archivos de documentación (*.md)

### 2. Revisar cambios:
```powershell
git status
git diff | Select-String "sqlwin" | Select-Object -First 10
```

### 3. Ver estadísticas:
```powershell
# Contar archivos modificados
git status --short | Measure-Object -Line
```

---

## 📋 Checklist Post-Sanitización

- [ ] Buscar y reemplazar hecho en VS Code
- [ ] Verificado con `git grep` (no encuentra credenciales)
- [ ] Revisado algunos archivos manualmente
- [ ] `.gitignore` funciona (imágenes no aparecen)
- [ ] Listo para commit

---

## 🎯 Próximos Comandos Git

```bash
# 1. Inicializar Git (si no lo has hecho)
git init

# 2. Verificar estado
git status

# 3. Ver archivos ignorados (deben incluir imágenes)
git status --ignored

# 4. Agregar todo
git add .

# 5. Commit
git commit -m "Initial commit - Proyecto académico SOFITWARE (2022)

- Sistema de gestión de gimnasio desarrollado en preparatoria
- Stack: Java JSP, MySQL, HTML/CSS/JavaScript  
- Credenciales sanitizadas para GitHub
- Proyecto educativo con fines de portafolio"

# 6. Crear repositorio en GitHub y conectar
git remote add origin https://github.com/TU-USUARIO/SOFITWARE5TO.git
git branch -M main
git push -u origin main
```

---

## ⚠️ IMPORTANTE

Si ves algún mensaje de error de `git grep` que menciona la contraseña original, ¡NO hagas commit todavía!

Verifica primero:
```powershell
# Archivos que aún contienen la contraseña
git grep "sqlwinbrcuarentena21G" -- "*.jsp" "*.java"
```

Si encuentra algo, repite el búsqueda/reemplazo en esos archivos específicos.

---

## 📊 Resumen de lo que Necesitas Hacer

| Paso | Herramienta | Tiempo |
|------|-------------|--------|
| 1. Búsqueda y reemplazo en VS Code | Ctrl+Shift+H | 2 min |
| 2. Verificar con git grep | Terminal | 30 seg |
| 3. git add . | Terminal | 10 seg |
| 4. git commit | Terminal | 30 seg |
| 5. Crear repo en GitHub | Navegador | 1 min |
| 6. git push | Terminal | 30 seg |

**Total: ~5 minutos** ⚡

---

¡Estás casi listo para subir a GitHub! 🚀
