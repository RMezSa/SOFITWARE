# 🚀 Guía Paso a Paso: Subir SOFITWARE a GitHub

## ✅ Checklist Pre-Commit

Antes de subir a GitHub, asegúrate de que:

- [x] `.gitignore` está creado
- [x] `.env.example` está creado
- [x] `README.md` está completo
- [x] `SECURITY.md` documenta las vulnerabilidades
- [x] `LICENSE` está creado
- [ ] Las credenciales han sido sanitizadas
- [ ] Las imágenes están en `.gitignore`
- [ ] Has revisado los archivos con `git diff`

---

## 📋 Paso 1: Sanitizar Credenciales

### Opción A: Usar el script automático (Recomendado)

```powershell
# En PowerShell, desde la raíz del proyecto:
.\sanitize.ps1
```

Selecciona la opción **1** (Reemplazar con placeholders)

### Opción B: Manual

Buscar y reemplazar en todos los archivos:
- **Buscar:** `sqlwinbrcuarentena21G`
- **Reemplazar:** `YOUR_PASSWORD_HERE`

---

## 📋 Paso 2: Verificar que NO hay datos sensibles

```powershell
# Buscar contraseña en el código
git grep "sqlwinbrcuarentena21G"

# Si encuentra algo, repite el Paso 1

# Buscar otras posibles credenciales
git grep "root" | Select-String "DriverManager"

# Verificar rutas absolutas
git grep "CECyT 9"
```

**✅ Resultado esperado:** Ningún resultado o solo referencias en README/docs

---

## 📋 Paso 3: Inicializar Git (si aún no lo has hecho)

```bash
# Inicializar repositorio
git init

# Verificar estado
git status
```

---

## 📋 Paso 4: Revisar archivos que se subirán

```bash
# Ver qué archivos se van a incluir
git status

# Verificar que NO aparezcan:
# ❌ target/
# ❌ .env
# ❌ *.jpg, *.png (imágenes)
# ❌ archivos en src/main/webapp/IMG/
# ❌ archivos en src/main/webapp/files/
```

**Si aparecen archivos que no deberían subirse:**
```bash
# Verificar .gitignore
cat .gitignore

# Si falta algo, editar .gitignore y verificar nuevamente
```

---

## 📋 Paso 5: Primer Commit

```bash
# Agregar todos los archivos
git add .

# Verificar qué se agregó
git status

# Hacer el primer commit
git commit -m "Initial commit - Proyecto académico SOFITWARE (2022)

- Sistema de gestión de gimnasio desarrollado en preparatoria
- Incluye gestión de usuarios, entrenadores y planes de entrenamiento
- Stack: Java JSP, MySQL, HTML/CSS/JavaScript
- Proyecto educativo con fines de portafolio"
```

---

## 📋 Paso 6: Crear Repositorio en GitHub

1. Ve a https://github.com/new
2. Configura:
   - **Nombre:** `SOFITWARE5TO` o `gym-management-system`
   - **Descripción:** "🏋️ Sistema de gestión de gimnasio - Proyecto académico 2022 (Preparatoria)"
   - **Visibilidad:** Public (para portafolio) o Private
   - **NO** marcar "Add README" (ya tienes uno)
   - **NO** marcar "Add .gitignore" (ya tienes uno)
   - **NO** marcar "Choose a license" (ya tienes LICENSE)

3. Click en **"Create repository"**

---

## 📋 Paso 7: Conectar y Subir

GitHub te mostrará comandos. Usa estos:

```bash
# Renombrar rama a main (si es necesario)
git branch -M main

# Conectar con GitHub (REEMPLAZAR con tu URL)
git remote add origin https://github.com/TU-USUARIO/SOFITWARE5TO.git

# Subir al repositorio
git push -u origin main
```

---

## 📋 Paso 8: Verificación Post-Upload

1. **Visita tu repositorio en GitHub**
   - URL: `https://github.com/TU-USUARIO/SOFITWARE5TO`

2. **Verifica que NO aparezcan:**
   - ❌ Contraseñas o credenciales reales
   - ❌ Imágenes con copyright
   - ❌ Carpeta `target/`
   - ❌ Archivo `.env`

3. **Verifica que SÍ aparezcan:**
   - ✅ README.md bien formateado
   - ✅ .gitignore
   - ✅ .env.example
   - ✅ SECURITY.md
   - ✅ LICENSE
   - ✅ Código fuente (archivos .jsp, .java)

---

## 📋 Paso 9: Mejorar el README en GitHub

Una vez subido, considera agregar a tu README:

### Badges (opcional)

Agregar al inicio del README:

```markdown
![Java](https://img.shields.io/badge/Java-JSP-orange?logo=java)
![MySQL](https://img.shields.io/badge/Database-MySQL-blue?logo=mysql)
![Status](https://img.shields.io/badge/Status-Academic%20Project-yellow)
![Year](https://img.shields.io/badge/Year-2022-green)
```

### Screenshots (opcional pero recomendado)

Si tienes capturas de pantalla (sin datos sensibles):

```markdown
## 📸 Screenshots

![Login](docs/screenshots/login.png)
![Dashboard](docs/screenshots/dashboard.png)
```

---

## 📋 Paso 10: Configurar GitHub Pages (Opcional)

Si quieres mostrar el proyecto:

1. Ve a **Settings** → **Pages**
2. Source: Deploy from branch → `main` → `/docs`
3. Agrega un `docs/index.html` con información del proyecto

---

## 🔄 Comandos Útiles para el Futuro

### Ver cambios antes de commit
```bash
git status
git diff
```

### Agregar cambios específicos
```bash
git add archivo.jsp
git add src/main/webapp/
```

### Commit con mensaje descriptivo
```bash
git commit -m "Fix: Corregir validación en formulario de registro"
```

### Subir cambios
```bash
git push
```

### Ver historial
```bash
git log --oneline
```

### Deshacer cambios (antes de commit)
```bash
git checkout -- archivo.jsp
```

### Verificar que no hay credenciales
```bash
git grep "password" | grep -v "YOUR_PASSWORD_HERE"
```

---

## ⚠️ Errores Comunes

### Error: "remote origin already exists"
```bash
git remote rm origin
git remote add origin https://github.com/TU-USUARIO/SOFITWARE5TO.git
```

### Error: "failed to push some refs"
```bash
# Si el repositorio remoto tiene archivos que no tienes local
git pull origin main --allow-unrelated-histories
git push -u origin main
```

### Credenciales aparecen en GitHub
```bash
# Eliminar del historial (PELIGROSO - usa con cuidado)
git filter-branch --force --index-filter \
"git rm --cached --ignore-unmatch archivo-con-credenciales.jsp" \
--prune-empty --tag-name-filter cat -- --all

# Forzar push
git push origin --force --all
```

---

## 🎯 Checklist Final

Después de subir, verifica:

- [ ] El README se ve bien en GitHub
- [ ] No hay credenciales visibles
- [ ] Las imágenes NO están subidas
- [ ] .gitignore funciona correctamente
- [ ] El proyecto se ve profesional
- [ ] Agregaste descripción y topics en GitHub
- [ ] (Opcional) Agregaste el proyecto a tu LinkedIn/portafolio

---

## 📞 Siguientes Pasos

1. **Agregar Topics en GitHub:**
   - `java`, `jsp`, `mysql`, `academic-project`, `gym-management`

2. **Agregar Descripción:**
   - "🏋️ Gym Management System - Academic project from high school (2022)"

3. **Pin en tu perfil (si es tu mejor proyecto de esa época)**

4. **Compartir:**
   - LinkedIn: "Recuperé y documenté mi proyecto de preparatoria..."
   - Portfolio: Agregar con contexto académico

---

## 🎓 Mensaje para el README/LinkedIn

```
Este proyecto representa mi trabajo durante la preparatoria (2022) en el 
CECyT 9 "Juan de Dios Bátiz" del IPN. Aunque contiene prácticas que hoy 
reconozco como inseguras, muestra mi capacidad de aprendizaje y evolución 
como desarrollador. He documentado las limitaciones de seguridad para 
demostrar mi conciencia actual sobre mejores prácticas.
```

---

¡Éxito con tu proyecto! 🚀
