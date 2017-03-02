my_mqtt = {}
btn = require("btn")
-- init mqtt client without logins, keepalive timer 120s
local mac = wifi.sta.getmac()
local client_id = "clientid_" .. mac
local m = mqtt.Client(client_id, 120)

-- init mqtt client with logins, keepalive timer 120sec
--local m = mqtt.Client("clientid", 120 , "user", "password")

-- setup Last Will and Testament (optional)
-- Broker will publish a message with qos = 0, retain = 0, data = "offline"
-- to topic "/lwt" if client don't send keepalive packet
m:lwt("/lwt", "offline", 0, 0)

m:on("connect", function(client)
    print("connected")
end)

m:on("offline", function(client)
    print("offline")
    tmr.stop(1)
end)


-- for TLS: m:connect("192.168.11.118", secure-port, 1)

--test server
--local host = "test.mosquitto.org"

local host = "192.168.31.247"

local port = 1883

local topic = "/switcher_" .. mac


local dh11_pin = 2 --gpio4


-- on publish message receive event
m:on("message", function(client, topic, data)
    print(topic .. ":")
end)

print("mqtt inited!")

function my_mqtt.start()

    m:connect(host, port, 0, 1,
        function(client)
            print("connected")

            -- subscribe topic with qos = 0
            m:subscribe(topic, 0, function(client)
                print("subscribe success")
            end)

            tmr.alarm(1, 1000 * 5, 1, function()
                local d1, d2, d3, d4 = dht.read11(dh11_pin)
                local msg = "" .. d1 .. "," .. d2 .. "," .. d3 .. "," .. d4
                m:publish(topic, msg, 0, 0, function(client)
                    --        print("sent")
                end)
            end)

            --m:close();
            -- you can call m:connect again
        end,
        function(client, reason)
            print("failed reason: " .. reason)
        end)
end

-- Calling subscribe/publish only makes sense once the connection
-- was successfully established. In a real-world application you want
-- move those into the 'connect' callback or make otherwise sure the
-- connection was established.

return my_mqtt

