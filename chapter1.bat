@echo off
chcp 65001 >nul
title Модуль 1

:start
set score_youtrack=0
set score_redmine=0
set score_taiga=0

echo.
echo МОДУЛЬ 1: Выбор системы задач (Вариант 5)
echo.
echo Вопрос 1: Какой бюджет на лицензии?
echo 1. Нулевой
echo 2. Ограниченный
echo 3. Не ограничен
choice /c 123 /n /m "Ваш ответ: "

if "%errorlevel%"=="1" (
    set /a score_redmine+=20
    set /a score_taiga+=15
)
if "%errorlevel%"=="2" (
    set /a score_taiga+=15
    set /a score_youtrack+=10
)
if "%errorlevel%"=="3" (
    set /a score_youtrack+=20
)

echo.
echo Вопрос 2: Важна ли интеграция с Git?
echo 1. Критична
echo 2. Желательна
echo 3. Не важна
choice /c 123 /n /m "Ваш ответ: "

if "%errorlevel%"=="1" (
    set /a score_youtrack+=15
    set /a score_taiga+=10
)
if "%errorlevel%"=="2" (
    set /a score_youtrack+=10
    set /a score_redmine+=5
)
if "%errorlevel%"=="3" (
    set /a score_redmine+=5
)

echo.
echo РЕЗУЛЬТАТ:
echo YouTrack: %score_youtrack%
echo Redmine: %score_redmine%
echo Taiga: %score_taiga%
echo.

if %score_youtrack% gtr %score_redmine% if %score_youtrack% gtr %score_taiga% (
    echo РЕКОМЕНДАЦИЯ: YouTrack
) else if %score_redmine% gtr %score_taiga% (
    echo РЕКОМЕНДАЦИЯ: Redmine
) else (
    echo РЕКОМЕНДАЦИЯ: Taiga
)

echo.
choice /c YN /m "Повторить? (Y/N)"
if "%errorlevel%"=="1" goto start
pause