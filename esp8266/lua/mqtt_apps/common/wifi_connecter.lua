wifi_connecter = {}

function wifi_connecter.start(wifi_ssid, wifi_pwd, success, failed)
    print("set up wifi mode")
    wifi.setmode(wifi.STATION)
    --please config ssid and password according to settings of your wireless router.
    --    wifi.sta.config("xiaomi", "wcwh19757")
    wifi.sta.config(wifi_ssid, wifi_pwd)
    wifi.sta.connect()

    -- 重连多少次
    cnt = 0
    tmr.alarm(1, 1000, 1, function()
        if (wifi.sta.getip() == nil) and (cnt < 20) then
            print("IP unavaiable, Waiting...")
            cnt = cnt + 1
        else
            tmr.stop(1)
            if (cnt < 20) then print("Config done, IP is " .. wifi.sta.getip())
                success()
            else print("Wifi setup time more than 20s, Please verify wifi.sta.config() function. Then re-download the file.")
                failed()
            end
        end
    end)
end


return wifi_connecter
