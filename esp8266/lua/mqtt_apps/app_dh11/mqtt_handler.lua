mqtt_handler = {}

local dh11_pin = 2 --gpio4
local rain_pin = 1 --gpio5
local a0_pin = 0

function mqtt_handler.init(mqtt_client, topic)
end

function mqtt_handler.on_mqtt_connect(mqtt_client, topic)
    tmr.alarm(1, 1000 * 2, 1, function()
        --获取温湿度和光强
        local d1, d2, d3, d4 = dht.read11(dh11_pin)
        --光线强度
        local d5 = adc.read(a0_pin)
        --雨水
        local d6 = gpio.read(rain_pin)
        local msg = "" .. d1 .. "," .. d2 .. "," .. d3 .. "," .. d4 .. "," .. d5 .. "," .. d6
        mqtt_client:publish(topic, msg, 0, 0, function(client)
            --        print("sent")
        end)
    end)
end

function mqtt_handler.on_mqtt_offline(mqtt_client)
    tmr.stop(1)
end

function mqtt_handler.on_mqtt_message(mqtt_client, topic, data)
end

return mqtt_handler



