@echo off
REM export shim for cmd.exe; supports: export VAR=VALUE ...; command args...
setlocal EnableExtensions
:loop
if "%~1"=="" exit /b 0
set "arg=%~1"
if "%arg%"==";" (shift & goto run)
if "%arg:~-1%"==";" (
  set "assign=%arg:~0,-1%"
  call :setvar "%assign%"
  shift
  goto run
)
call :setvar "%arg%"
shift
goto loop
:setvar
for /f "tokens=1* delims==" %%A in ("%~1") do set "%%A=%%B"
exit /b 0
:run
if "%~1"=="" exit /b 0
call %*
exit /b
