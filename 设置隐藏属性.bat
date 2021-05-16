@echo off
:main
echo 1、隐藏文件或文件夹
echo 2、显示文件或文件夹
set /p i=选择数字后回车：
set /p fp=输入文件或文件夹路径：
if %i%==1 goto main1
if %i%==2 goto main2
:main1
attrib +S +H "%fp%"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSuperHidden /t reg_dword /d 0 /f
goto continue
:main2
attrib -S -H "%fp%"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t reg_dword /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSuperHidden /t reg_dword /d 1 /f
:continue
set /p i=是否继续（y:继续，其它：退出）：
if %i%==y (
cls
goto main) else exit