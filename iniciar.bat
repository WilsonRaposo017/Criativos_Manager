@echo off
chcp 65001 >nul
if not exist node_modules ( echo Execute primeiro instalar.bat & pause & exit /b 1 )
if not exist .env ( echo Falta o ficheiro .env. Execute instalar.bat & pause & exit /b 1 )
echo A iniciar em http://localhost:5173 (Ctrl+C para parar)
call npm run dev -- --host
