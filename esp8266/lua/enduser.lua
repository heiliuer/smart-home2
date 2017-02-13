wifi.setmode(wifi.STATIONAP)
wifi.ap.config({ ssid = "switcher0", auth = wifi.OPEN })
enduser_setup.manual(true)
enduser_setup.start(function()
    print("Connected to wifi as:" .. wifi.sta.getip())
end,
    function(err, str)
        print("enduser_setup: Err #" .. err .. ": " .. str)
    end);
