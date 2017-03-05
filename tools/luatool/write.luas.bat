@echo off
set python=C:\Python27
set baud=115200
set file_from=%1
set file_to=%2
if "%file_to%"=="" ( set file_to=%1 )
set device=COM5

set path=%python%;%python%\Scripts;%path%

::--dofile -> dofile
::--restart -> node.restart()
luatool.py --port %device% --src %file_from% --dest %file_to% --baud %baud% --verbose