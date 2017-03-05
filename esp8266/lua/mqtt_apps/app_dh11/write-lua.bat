@echo off
set path=../../../tools/luatool;%path%

call write.luas.bat init.lua
call write.luas.bat app.lua
call write.luas.bat auto_config.lua
call write.luas.bat btn.lua
call write.luas.bat my_mqtt.lua
call write.luas.bat store_util.lua
call write.luas.bat wifi_connecter.lua