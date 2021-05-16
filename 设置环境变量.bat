@echo off
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B
:gotAdmin
if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
pushd "%CD%"
CD /D "%~dp0"
:main
echo 1、设置用户变量
echo 2、设置系统变量
set /p i=输入分类对应的数字：
if %i%==1 goto main1
if %i%==2 goto main2
:main1
set /p n=输入用户变量名：
set /p p=输入用户变量值：
setx "%n%" "%p%"
goto continue
:main2
set /p n=输入系统变量名：
set /p p=输入系统变量值：
setx /m "%n%" "%p%"
:continue
set /p i=是否继续（y:继续，其它：退出）：
if %i%==y (
cls
goto main) else exit