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

REM Tao lenh ngan `erp` trong thu muc cai (goi: erp update tu thu muc do)
> "%DEST%\erp.bat" echo @"%%~dp0evs-erp-mcp.exe" %%*

echo.
echo Cap nhat sau nay:  "%BIN%" update
echo Xong. Nhan phim bat ky de dong.
pause >nul
