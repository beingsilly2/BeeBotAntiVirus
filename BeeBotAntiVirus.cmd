@echo off
title BeeBot
color 1e
break > found
break > hashD
cd > dir
SETLOCAL ENABLEDELAYEDEXPANSION
for /f "tokens=1* delims=: " %%a in (dir) do (
   SET "root=%%b"
   echo(%%b
   echo(!TEMP!
)
cd %SystemDrive%\
:protect
cls
Powershell.exe -ExecutionPolicy Bypass -File "%SystemDrive%\%root%\Show-LoadingBox.ps1"