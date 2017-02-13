require("store_util")
require("auto_config")
require("wifi_connecter")
require("my_mqtt")

local wifi_saved, saved_wifi_ssid, saved_wifi_pwd = store_util.get_wifi()

--开启 smarconfig
function start_smart_config()
    print("start_smart_config")
    auto_config.start(function(wifi_ssid, wifi_pwd)
        store_util.save_wifi(wifi_ssid, wifi_pwd)
        saved_wifi_ssid = wifi_ssid
        saved_wifi_pwd = wifi_pwd
        print("smart_config success!")
        start_connecter()
    end)
end

--连接wifi
function start_connecter()
    print("start connecter")
    wifi_connecter.start(saved_wifi_ssid, saved_wifi_pwd,
        function()
            print("connected saved wifi")
            start_mqtt()
        end,
        function()
            print("connect wifi failed! "
                    .. "ssid:" .. saved_wifi_ssid
                    .. ",pwd:" .. saved_wifi_pwd
                    .. " start_smart_config")
            start_smart_config()
        end)
end

function start_mqtt()
    print("start_mqtt")
    my_mqtt.start()
end


if wifi_saved then
    print("has saved wifi")
    start_connecter()
else
    print("no saved wifi")
    start_smart_config()
end
