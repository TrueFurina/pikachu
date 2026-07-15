@echo off
chcp 65001 >nul
title Pikachu 靶场 - 停止服务
color 0C

echo ============================================
echo      Pikachu 靶场 - 停止服务脚本
echo ============================================
echo.
echo ⚠️  本脚本会强制结束 httpd.exe 和 mysqld.exe 进程
echo    如果机器上运行着其他 Apache/MySQL 服务也会被停止！
echo.
choice /C YN /M "确认要停止吗"
if errorlevel 2 exit /b 0

echo.
echo [1/2] 停止 Apache...
tasklist /FI "IMAGENAME eq httpd.exe" 2>nul | find /I "httpd.exe" >nul
if %errorlevel%==0 (
    taskkill /F /IM httpd.exe >nul 2>&1
    echo   ✅ Apache 已停止
) else (
    echo   ⚠️ Apache 未运行
)

echo [2/2] 停止 MySQL...
tasklist /FI "IMAGENAME eq mysqld.exe" 2>nul | find /I "mysqld.exe" >nul
if %errorlevel%==0 (
    taskkill /F /IM mysqld.exe >nul 2>&1
    echo   ✅ MySQL 已停止
) else (
    echo   ⚠️ MySQL 未运行
)

echo.
echo ============== 当前状态 ==============
tasklist /FI "IMAGENAME eq mysqld.exe" 2>nul | find /I "mysqld.exe" >nul && (
    echo   🔴 MySQL   : 仍在运行
) || (
    echo   ⚪ MySQL   : 已停止
)
tasklist /FI "IMAGENAME eq httpd.exe" 2>nul | find /I "httpd.exe" >nul && (
    echo   🔴 Apache  : 仍在运行
) || (
    echo   ⚪ Apache  : 已停止
)
echo ======================================
echo.
echo ✅ 所有服务已停止
echo.
echo ⏺ 按任意键退出
pause >nul