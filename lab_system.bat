@echo off
chcp 65001 >nul
title Главное меню

:menu
cls
echo.
echo СИСТЕМА МОДЕЛИРОВАНИЯ (Вариант 5)
echo.
echo 1. Модуль выбора технологий
echo 2. Модуль инспекции кода
echo 3. Модуль сравнительного анализа
echo 4. Запустить все подряд
echo 5. Выход
echo.
set /p choice="Ваш выбор: "

if "%choice%"=="1" call chapter1.bat
if "%choice%"=="2" call chapter2.bat
if "%choice%"=="3" call chapter3.bat

if "%choice%"=="4" (
    call chapter1.bat
    call chapter2.bat
    call chapter3.bat
    echo.
    echo ВСЕ МОДУЛИ ПРОЙДЕНЫ.
    echo Отчет сохранен в report.txt
    pause
)

if "%choice%"=="5" exit /b
goto menu