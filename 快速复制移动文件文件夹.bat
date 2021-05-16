@echo off
:main
echo 1、快速复制文件
echo 2、快速复制文件夹
echo 3、快速移动文件
echo 4、快速移动文件夹
set /p i=输入分类对应的数字：
if %i%==1 goto main1
if %i%==2 goto main2
if %i%==3 goto main3
if %i%==4 goto main4
:main1
set /p a="输入源目录（驱动器带:，如d:）："
set /p b="输入目标目录（驱动器带:，如d:）："
set /p c="输入要复制的文件名："
robocopy "%a%" "%b%"\ "%c%" /NS /NC /A-:SH /MT:128
goto continue
:main2
set /p a="输入源目录（驱动器带:，如d:）："
set /p b="输入目标目录（驱动器带:，如d:）："
robocopy "%a%" "%b%"\ /NS /NC /A-:SH /E /MT:128
goto continue
:main3
set /p a="输入源目录（驱动器带:，如d:）："
set /p b="输入目标目录（驱动器带:，如d:）："
set /p c="输入要移动的文件名："
robocopy "%a%" "%b%"\ "%c%" /NS /NC /A-:SH /MOV /MT:128
goto continue
:main4
set /p a="输入源目录（驱动器带:，如d:）："
set /p b="输入目标目录（驱动器带:，如d:）："
robocopy "%a%" "%b%"\ /NS /NC /A-:SH /MOVE /E /MT:128
:continue
set /p i=是否继续（y:继续，其它：退出）：
if %i%==y (
cls
goto main) else exit