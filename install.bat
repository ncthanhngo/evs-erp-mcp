@echo off
REM install.bat - Windows: tai binary EVS ERP MCP + login + cau hinh Claude Desktop.
REM Double-click file nay de chay.
setlocal

set REPO=ncthanhngo/evs-erp-mcp
set DEST=%USERPROFILE%\.evs-erp-mcp
set BIN=%DEST%\evs-erp-mcp.exe
set URL=https://github.com/%REPO%/releases/latest/download/evs-erp-mcp-win-x64.exe

if not exist "%DEST%" mkdir "%DEST%"

echo Dang tai binary ...
curl -fsSL "%URL%" -o "%BIN%"
if errorlevel 1 (
  powershell -NoProfile -Command "Invoke-WebRequest -Uri '%URL%' -OutFile '%BIN%'"
)

echo.
"%BIN%" setup

echo.
echo Xong. Nhan phim bat ky de dong.
pause >nul
