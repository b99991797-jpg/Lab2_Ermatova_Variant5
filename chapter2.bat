@echo off
chcp 65001 >nul
title Модуль 2

set correct=0
set total=3

echo.
echo МОДУЛЬ 2: Инспекция кода
echo.
echo Фрагмент 1 (YouTrack API):
echo 10: def get_tasks(project):
echo 11:     data = api.get(project)
echo 12:     return data
echo 13:     print("Done")
echo.
echo Какой дефект?
echo 1. Мертвое присваивание
echo 2. Недостижимый код после return
echo 3. Утечка ресурса
choice /c 123 /n /m "Ваш ответ: "
if "%errorlevel%"=="2" (
    echo Верно!
    set /a correct+=1
) else (
    echo Неверно. Ответ: 2
)

echo.
echo Фрагмент 2 (Redmine API):
echo 20: def calc_velocity(points):
echo 21:     return points / 14
echo.
echo Какой дефект?
echo 1. Магическое число (14)
echo 2. Неинициализированная переменная
echo 3. Утечка ресурса
choice /c 123 /n /m "Ваш ответ: "
if "%errorlevel%"=="1" (
    echo Верно!
    set /a correct+=1
) else (
    echo Неверно. Ответ: 1
)

echo.
echo Фрагмент 3 (Taiga webhook):
echo 30: def process(data):
echo 31:     id = data['id']
echo 32:     return id
echo.
echo Какой дефект?
echo 1. Нет обработки ошибок
echo 2. Мертвое присваивание
echo 3. SQL-инъекция
choice /c 123 /n /m "Ваш ответ: "
if "%errorlevel%"=="1" (
    echo Верно!
    set /a correct+=1
) else (
    echo Неверно. Ответ: 1
)

echo.
echo ИТОГ:
echo Правильных: %correct% из %total%
set /a percentage=correct*100/total
echo Точность: %percentage%%%
if %percentage% geq 80 echo Уровень: Senior
if %percentage% geq 50 if %percentage% lss 80 echo Уровень: Middle
if %percentage% lss 50 echo Уровень: Junior
pause