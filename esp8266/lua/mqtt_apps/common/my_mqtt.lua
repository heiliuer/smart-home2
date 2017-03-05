my_mqtt = {}
require("mqtt_handler")
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
    mqtt_handler.on_mqtt_offline(client)
end)


-- for TLS: m:connect("192.168.11.118", secure-port, 1)

--test server
--local host = "test.mosquitto.org"

local host = "192.168.31.247"

local port = 1883

local topic = "/switcher_" .. mac


-- on publish message receive event
m:on("message", function(client, topic, data)
    print(topic .. ":")
    mqtt_handler.on_mqtt_message(mqtt_client, topic, data)
end)

print("mqtt inited!")

function my_mqtt.start()

    mqtt_handler.init(m, topic)

    m:connect(host, port, 0, 1,
        function(client)
            print("connected")

            -- subscribe topic with qos = 0
            m:subscribe(topic, 0, function(client)
                print("subscribe success")
            end)

            mqtt_handler.on_mqtt_connect(client, topic)

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

