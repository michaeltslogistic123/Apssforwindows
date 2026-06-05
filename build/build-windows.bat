@echo off
REM ============================================================
REM PILAR ERP — Windows Native Build Script
REM PT. PILAR METALINDO BERKAT | OZTECH
REM
REM Run this script on a Windows 10/11 machine to build:
REM   - Pilar-ERP-Setup-x64.exe   (NSIS Installer)
REM   - Pilar-ERP-Portable-x64.exe (Portable)
REM   - Pilar-ERP-Windows-x64.zip  (ZIP)
REM
REM Requirements:
REM   - Node.js 20+ (https://nodejs.org)
REM   - pnpm 9+ (npm install -g pnpm)
REM ============================================================

setlocal EnableDelayedExpansion
title PILAR ERP - Windows Build

echo.
echo  ╔════════════════════════════════════════════════════╗
echo  ║       PILAR ERP — Windows Installer Builder        ║
echo  ║       PT. PILAR METALINDO BERKAT ^| OZTECH          ║
echo  ╚════════════════════════════════════════════════════╝
echo.

REM ── Navigate to workspace root ──
cd /d "%~dp0"
cd ..\..
set "WORKSPACE=%CD%"
echo [INFO] Workspace: %WORKSPACE%
echo.

REM ── Check Node.js ──
where node >nul 2>&1 || (
    echo [ERROR] Node.js not found. Install from https://nodejs.org
    pause & exit /b 1
)
for /f "tokens=*" %%v in ('node -v') do set NODE_VER=%%v
echo [OK] Node.js %NODE_VER%

REM ── Check pnpm ──
where pnpm >nul 2>&1 || (
    echo [INFO] Installing pnpm...
    npm install -g pnpm
)
for /f "tokens=*" %%v in ('pnpm -v') do set PNPM_VER=%%v
echo [OK] pnpm %PNPM_VER%
echo.

REM ── Download Visual C++ Redistributable 2022 ──
set "VC_DEST=%WORKSPACE%\artifacts\electron-desktop\build-resources\vc_redist.x64.exe"
if not exist "%VC_DEST%" (
    echo [INFO] Downloading Visual C++ 2022 Redistributable...
    powershell -Command "Invoke-WebRequest -Uri 'https://aka.ms/vs/17/release/vc_redist.x64.exe' -OutFile '%VC_DEST%' -UseBasicParsing"
    if exist "%VC_DEST%" (
        echo [OK] vc_redist.x64.exe downloaded
    ) else (
        echo [WARN] Failed to download vc_redist.x64.exe - VC++ check will be skipped
    )
) else (
    echo [OK] vc_redist.x64.exe already present
)
echo.

REM ── Install dependencies ──
echo [INFO] Installing workspace dependencies...
call pnpm install --frozen-lockfile
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] pnpm install failed
    pause & exit /b 1
)
echo [OK] Dependencies installed
echo.

REM ── Build React frontend ──
echo [INFO] Building React frontend (oztech-pos)...
set PORT=5000
set BASE_PATH=/oztech-pos
set NODE_ENV=production
call pnpm --filter @workspace/oztech-pos run build
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Frontend build failed
    pause & exit /b 1
)
echo [OK] Frontend built
echo.

REM ── Build Windows installer ──
echo [INFO] Building Windows installers (NSIS + Portable + ZIP)...
echo [INFO] This may take 3-5 minutes...
cd artifacts\electron-desktop
call node_modules\.bin\electron-builder --win --x64 --config electron-builder.yml
if %ERRORLEVEL% NEQ 0 (
    cd %WORKSPACE%
    echo [ERROR] electron-builder failed. Check output above.
    pause & exit /b 1
)
cd %WORKSPACE%
echo.
echo [OK] Build complete!
echo.

REM ── Generate SHA256 checksums ──
echo [INFO] Generating SHA256 checksums...
cd release
powershell -Command ^
    "$out = @('# PILAR ERP Windows Desktop v1.0.0', '# PT. PILAR METALINDO BERKAT', '# $(Get-Date -Format yyyy-MM-dd)', '');" ^
    "Get-ChildItem -File | Where-Object { $_.Name -ne 'SHA256SUMS.txt' } | ForEach-Object {" ^
    "    $h = (Get-FileHash $_.FullName -Algorithm SHA256).Hash.ToLower();" ^
    "    $out += \"$h  $($_.Name)\"" ^
    "}; $out | Out-File SHA256SUMS.txt -Encoding UTF8"
cd %WORKSPACE%

REM ── Show results ──
echo.
echo  ╔════════════════════════════════════════════════════╗
echo  ║              BUILD SUCCESSFUL!                     ║
echo  ╚════════════════════════════════════════════════════╝
echo.
echo Output: %WORKSPACE%\release\
echo.
dir /b release\
echo.
echo SHA256 Checksums:
type release\SHA256SUMS.txt
echo.
echo ════════════════════════════════════════════════════════
echo  Ready for deployment!
echo  1. Test Pilar-ERP-Setup-x64.exe on a clean Windows VM
echo  2. Verify login: owner / admin123
echo  3. Upload to GitHub Releases
echo ════════════════════════════════════════════════════════
echo.
pause
