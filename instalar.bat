@echo off
chcp 65001 >nul
echo === Criativos Manager: instalacao ===
where node >nul 2>nul
if errorlevel 1 (
  echo [ERRO] Node.js nao encontrado. Instale a versao LTS em https://nodejs.org e volte a executar.
  pause & exit /b 1
)
node -e "process.exit(parseInt(process.versions.node)>=20?0:1)"
if errorlevel 1 (
  echo [ERRO] Precisa de Node.js 20 ou superior.
  pause & exit /b 1
)
if not exist .env (
  copy .env.example .env >nul
  echo Foi criado o ficheiro .env. Abra-o e preencha VITE_SUPABASE_URL e VITE_SUPABASE_PUBLISHABLE_KEY.
  echo Valores do projeto de desenvolvimento: ver docs\SUPABASE_SETUP.md
)
call npm ci
if errorlevel 1 ( echo [ERRO] Falha ao instalar dependencias. & pause & exit /b 1 )
echo Instalacao concluida. Execute iniciar.bat
pause
