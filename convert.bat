@echo off
setlocal
chcp 65001>nul
echo Compressing PNG into multi-sized .ico file
echo https://github.com/N3M1X10/multi-sized-ico/
echo.

cd /d "%~dp0"
:check-directories
if not exist "input" (mkdir input & set first-launch=true)
if not exist "output" (mkdir output & set first-launch=true)
if "%first-launch%"=="true" goto firstlaunch
goto begin

:firstlaunch
cls
echo ! working directories created, please close me and let's move your PNG in "input" &pause>nul&exit /b


:begin
set magick=%~dp0bin
set input-dir=%~dp0input
set input-file=%input-dir%\input.png
set output=%~dp0output\multisized.ico
if not exist "input\*.png" (Echo ^!^!^! input directory are empty !!! &echo.)

:asking
:: display options
echo 1. 16,32,48,64
echo 2. 16,24,32,48,64,72,128
echo 3. 16,24,32,48,64,72,128,256
echo f. Flush output and input directory
echo.
set /p ask=Choose sizes option: 
echo.
:: options block, reader
if "%ask%"=="1" set com-opt="16,32,48,64"                   &goto compress
if "%ask%"=="2" set com-opt="16,24,32,48,64,72,128"         &goto compress
if "%ask%"=="3" set com-opt="16,24,32,48,64,72,128,256"     &goto compress
if "%ask%"=="f" goto flush
echo error & goto end

:compress
ren "%input-dir%\*.png" "input.png"
cd /d %magick%
magick.exe ^
"%input-file%" -define icon:auto-resize=%com-opt% -compress zip "%output%"
IF %ERRORLEVEL% NEQ 0 ( echo ! Some error on the way &pause>nul&exit /b )
echo ! Converting was complete
goto end

:flush
set /p ask=Are you sure? [y]: 
if "%ask%" neq "y" (echo ! Batch will stopped &goto end)
echo ! Deleting target file folders from input and output
del /s /q input\*.ico & del /s /q input\*.png
del /s /q output\*.ico & del /s /q output\*.png
goto end

:end
echo.&echo Press any key to close . . . &pause>nul&exit /b
rem echo.&echo Press any key to close . . . &>nul timeout /t 5 &exit /b
