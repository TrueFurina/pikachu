@echo off
set PATH=C:\Windows\System32;%PATH%
rem chcp 65001 >nul
title Pikachu 靶场一键启动
color 0A

echo ============================================
echo      Pikachu 靶场 - 一键启动脚本
echo ============================================
echo.

:: ===== 路径配置 =====
set PHPSTUDY_ROOT=D:\phpstudy_pro
set MYSQL_BIN=%PHPSTUDY_ROOT%\Extensions\MySQL5.7.26\bin\mysqld.exe
set MYSQL_CFG=%PHPSTUDY_ROOT%\Extensions\MySQL5.7.26\my.ini
set APACHE_BIN=%PHPSTUDY_ROOT%\Extensions\Apache2.4.39\bin\httpd.exe
set APACHE_ROOT=%PHPSTUDY_ROOT%\Extensions\Apache2.4.39
set PIKACHU_URL=http://127.0.0.1:8885/

:: ===== 检查 PHPStudy 路径是否存在 =====
if not exist "%PHPSTUDY_ROOT%" (
    echo   ? 错误：未找到 PHPStudy 安装目录！
    echo   路径：%PHPSTUDY_ROOT%
    echo.
    echo   ?? 本脚本仅适用于 PHPStudy 环境，请确认：
    echo   1. PHPStudy 安装在 D:\phpstudy_pro
    echo   2. 或手动修改本脚本中的 PHPSTUDY_ROOT 路径
    echo.
    echo   ?? 你也可以使用 Docker 方式启动：
    echo      docker compose up -d
    echo.
    pause
    exit /b 1
)

:: ===== 1. 启动 MySQL =====
echo [1/3] 检查 MySQL 状态...
tasklist /FI "IMAGENAME eq mysqld.exe" 2>nul | find /I "mysqld.exe" >nul
if %errorlevel%==0 (
    echo   ? MySQL 已在运行中
) else (
    if not exist "%MYSQL_BIN%" (
        echo   ? 错误：找不到 MySQL 可执行文件
        echo   路径：%MYSQL_BIN%
        pause
        exit /b 1
    )
    echo   ? 正在启动 MySQL...
    start "" "%MYSQL_BIN%" --defaults-file="%MYSQL_CFG%"
    echo   ? MySQL 启动命令已执行
)

:: ===== 2. 启动 Apache =====
echo [2/3] 检查 Apache 状态...
tasklist /FI "IMAGENAME eq httpd.exe" 2>nul | find /I "httpd.exe" >nul
if %errorlevel%==0 (
    echo   ? Apache 已在运行中
) else (
    if not exist "%APACHE_BIN%" (
        echo   ? 错误：找不到 Apache 可执行文件
        echo   路径：%APACHE_BIN%
        pause
        exit /b 1
    )
    echo   ? 正在启动 Apache...
    start "" "%APACHE_BIN%" -d "%APACHE_ROOT%"
    echo   ? Apache 启动命令已执行
)

:: ===== 3. 等待服务就绪 =====
echo.
echo [3/3] 等待服务启动（约 5 秒）...
ping 127.0.0.1 -n 6 >nul

:: ===== 验证服务 =====
echo.
echo ============== 服务状态 ==============
set MYSQL_OK=0
set APACHE_OK=0
tasklist /FI "IMAGENAME eq mysqld.exe" 2>nul | find /I "mysqld.exe" >nul && (
    echo   ?? MySQL   : 运行中
    set MYSQL_OK=1
) || (
    echo   ?? MySQL   : 未启动
)

tasklist /FI "IMAGENAME eq httpd.exe" 2>nul | find /I "httpd.exe" >nul && (
    echo   ?? Apache  : 运行中
    set APACHE_OK=1
) || (
    echo   ?? Apache  : 未启动
)
echo ======================================
echo.

:: ===== 检查 pikachu 页面是否可访问 ======
if %MYSQL_OK%==1 if %APACHE_OK%==1 (
    echo ?? 正在打开 Pikachu 靶场...
    start "" "%PIKACHU_URL%"
    echo.
    echo ? 启动完成！
    echo    %PIKACHU_URL%
    echo.
    echo ?? 靶场路径：%PHPSTUDY_ROOT%\WWW\pikachu
    echo ?? MySQL配置：root / root，端口 3306，数据库 pikachu
    echo.
    echo ?? 首次使用请访问 http://127.0.0.1:8885/install.php 初始化数据库
) else (
    echo ? 部分服务启动失败，请检查上方状态。
    echo   可尝试以管理员身份运行本脚本。
)

echo.
echo ? 按任意键退出本窗口（服务将继续在后台运行）
pause >nul
