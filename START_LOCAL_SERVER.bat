@echo off
setlocal
cd /d "%~dp0"
title Supercapacitor Student Guide Server

echo ============================================================
echo  SUPERCAPACITOR STUDENT GUIDE - LOCAL BACKUP SERVER
echo ============================================================
echo.
echo 1. Connect this computer and all student phones to the SAME Wi-Fi.
echo 2. If Windows Firewall asks, allow access on PRIVATE networks.
echo 3. In another Command Prompt, run: ipconfig
echo 4. Find the IPv4 Address under the active Wi-Fi adapter.
echo 5. Students open: http://YOUR-IPv4-ADDRESS:8000/
echo.
echo This window must stay open. Press Ctrl+C to stop the server.
echo ============================================================
echo.

start "" http://localhost:8000/
where py >nul 2>&1
if %errorlevel%==0 (
    py -m http.server 8000 --bind 0.0.0.0
    goto :end
)
where python >nul 2>&1
if %errorlevel%==0 (
    python -m http.server 8000 --bind 0.0.0.0
    goto :end
)

echo ERROR: Python was not found on this computer.
echo Install Python or use the recommended GitHub Pages method.
pause
:end
endlocal
