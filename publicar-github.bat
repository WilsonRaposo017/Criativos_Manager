@echo off
chcp 65001 >nul
where git >nul 2>nul || ( echo Instale o Git: https://git-scm.com & pause & exit /b 1 )
if not exist .git (
  git init -b main
  git remote add origin https://github.com/WilsonRaposo017/Criativos_Manager.git
)
git add -A
git status --short
echo.
echo Confirme que NAO aparece .env na lista acima (deve estar ignorado).
pause
git commit -m "Criativos Manager: Fase 1 e 2 (backend Supabase, frontend React PWA, testes, docs)"
git pull origin main --allow-unrelated-histories --no-edit
git push -u origin main
pause
