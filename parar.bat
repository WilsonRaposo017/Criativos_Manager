@echo off
echo A terminar processos Node deste projeto...
for /f "tokens=5" %%a in ('netstat -ano ^| findstr ":5173" ^| findstr "LISTENING"') do taskkill /PID %%a /F >nul 2>nul
echo Feito.
