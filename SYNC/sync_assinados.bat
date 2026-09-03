@echo off
REM Sincronizacao ZapSign -> Drive (Alves Carneiro Advocacia e Consultoria Jurídica)
REM Agendar no Task Scheduler do Windows (3x ao dia).
REM Ajuste o caminho abaixo para a pasta onde o projeto foi instalado.
set "PROJETO=C:\AUTOMAÇÕES PAB\AUTOMAÇÕES CLIENTES\ALVES_CARNEIRO_ADVOGADOS"
cd /d "%PROJETO%"
"%LOCALAPPDATA%\Microsoft\WindowsApps\py.exe" "%PROJETO%\SYNC\sync_assinados.py"
