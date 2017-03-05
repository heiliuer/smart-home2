auto_config = {}

function auto_config.start(success)
    wifi.setmode(wifi.STATION)
    wifi.startsmart(0,
        function(ssid, pwd)
            print(string.format("Success. SSID:%s ; PASSWORD:%s", ssid, pwd))
            success(ssid, pwd)
        end)

    -- 10s超时处理
    --    tmr.alarm(0, 10000, tmr.ALARM_SINGLE, function()
    --        wifi.stopsmart()
    --    end)
end

return auto_config

