@echo off
title 本地开发服务器 - 按 Ctrl+C 停止
color 0A

echo ======================================
echo    交互式网页实训 - 本地开发服务器
echo ======================================
echo.

:: 检查Python是否安装
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo 错误: 未找到Python。请先安装Python: https://www.python.org/downloads/
    goto :end
)

:: 获取Python版本
for /f "tokens=*" %%a in ('python --version 2^>^&1') do set python_version=%%a
echo 已检测到 %python_version%

:: 检查Python版本是否为3.x
echo %python_version% | findstr /C:"Python 3" >nul
if %errorlevel% equ 0 (
    echo 使用Python 3启动服务器...
    python -m http.server 8000
) else (
    echo 使用Python 2启动服务器...
    python -m SimpleHTTPServer 8000
)

:end
echo.
echo 服务器已停止。按任意键退出...
pause >nul