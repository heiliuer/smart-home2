my_mqtt = {}

-- init mqtt client without logins, keepalive timer 120s
m = mqtt.Client("clientid", 120)

-- init mqtt client with logins, keepalive timer 120sec
m = mqtt.Client("clientid", 120 --[[, "user", "password"]])

-- setup Last Will and Testament (optional)
-- Broker will publish a message with qos = 0, retain = 0, data = "offline"
-- to topic "/lwt" if client don't send keepalive packet
m:lwt("/lwt", "offline", 0, 0)

m:on("connect", function(client)
    print("connected")
end)

m:on("offline", function(client)
    print("offline")
end)


-- for TLS: m:connect("192.168.11.118", secure-port, 1)

--test server
--local host = "test.mosquitto.org"

local host = "192.168.31.247"

local port = 1883

topic = "/switcher"

--switch
switch_pin = 3
gpio.mode(switch_pin, gpio.OUTPUT)

-- on publish message receive event
m:on("message", function(client, topic, data)
    print(topic .. ":")
    if data ~= nil then
        print(data)
        local num = tonumber(data)
        if (num > 0) then
            gpio.write(switch_pin, gpio.HIGH)
        else
            gpio.write(switch_pin, gpio.LOW)
        end
    end
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

            local switch_status = gpio.read(switch_pin)

            -- publish a message with data = hello, QoS = 0, retain = 0
            m:publish(topic, "" .. switch_status, 0, 0, function(client)
                print("sent")
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

