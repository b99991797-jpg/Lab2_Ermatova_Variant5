@echo off
chcp 65001 >nul
title Модуль 3

echo.
echo МОДУЛЬ 3: Сравнительный анализ (WSM)
echo.
echo Введите веса критериев (сумма = 100):
set /p w1="Вес 1 (Scrum): "
set /p w2="Вес 2 (Git): "
set /p w3="Вес 3 (Цена): "
set /a total=w1+w2+w3
if %total% neq 100 (
    echo Ошибка! Сумма не 100.
    pause
    exit /b
)

echo.
echo Оцените системы от 1 до 5:
set /p y1="YouTrack (Scrum): "
set /p y2="YouTrack (Git): "
set /p y3="YouTrack (Цена): "

set /p r1="Redmine (Scrum): "
set /p r2="Redmine (Git): "
set /p r3="Redmine (Цена): "

set /p t1="Taiga (Scrum): "
set /p t2="Taiga (Git): "
set /p t3="Taiga (Цена): "

set /a sy=y1*w1+y2*w2+y3*w3
set /a sr=r1*w1+r2*w2+r3*w3
set /a st=t1*w1+t2*w2+t3*w3

echo.
echo МАТРИЦА РЕШЕНИЙ:
echo Критерий - Вес - YouTrack - Redmine - Taiga
echo Scrum - %w1% - %y1% - %r1% - %t1%
echo Git - %w2% - %y2% - %r2% - %t2%
echo Цена - %w3% - %y3% - %r3% - %t3%
echo ИТОГО - - %sy% - %sr% - %st%
echo.

if %sy% gtr %sr% if %sy% gtr %st% echo ПОБЕДИТЕЛЬ: YouTrack
if %sr% gtr %sy% if %sr% gtr %st% echo ПОБЕДИТЕЛЬ: Redmine
if %st% gtr %sy% if %st% gtr %sr% echo ПОБЕДИТЕЛЬ: Taiga
pause