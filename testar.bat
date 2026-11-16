@echo off
chcp 65001 >nul
call npm run typecheck || goto :fail
call npm test || goto :fail
call npm run build || goto :fail
echo Tudo OK: tipos, testes e build.
pause & exit /b 0
:fail
echo [FALHOU] Veja as mensagens acima.
pause & exit /b 1
