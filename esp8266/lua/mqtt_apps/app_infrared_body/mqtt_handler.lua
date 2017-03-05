mqtt_handler = {}

local dh11_pin = 2 --gpio4

function mqtt_handler.init(mqtt_client,topic)
end


function mqtt_handler.on_mqtt_connect(mqtt_client, topic)
    tmr.alarm(1, 1000 * 2, 1, function()
        --获取温湿度和光强
        local d1, d2, d3, d4 = dht.read11(dh11_pin)
        local d5 = adc.read(0)
        local msg = "" .. d1 .. "," .. d2 .. "," .. d3 .. "," .. d4 .. "," .. d5
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



