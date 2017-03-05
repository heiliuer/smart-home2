mqtt_handler = {}


--switch
local switch_pin = 1


gpio.mode(switch_pin, gpio.OUTPUT, gpio.PULLUP)
gpio.write(switch_pin, gpio.HIGH)
--local btn_pin = 0
--gpio.mode(btn_pin, gpio.INPUT, gpio.PULLUP)
--gpio.trig(btn_pin, "low", function()
--end)

function mqtt_handler.init(mqtt_client,topic)
end

function mqtt_handler.on_mqtt_connect(mqtt_client, topic)
    local switch_status = gpio.read(switch_pin)

    -- publish a message with data = hello, QoS = 0, retain = 0
    mqtt_client:publish(topic, "" .. switch_status, 0, 0, function(client)
        --                print("sent")
    end)
end

function mqtt_handler.on_mqtt_offline(mqtt_client)
end

function mqtt_handler.on_mqtt_message(mqtt_client, topic, data)
    if data ~= nil then
        print(data)
        local num = tonumber(data)
        if (num > 0) then
            gpio.write(switch_pin, gpio.HIGH)
        else
            gpio.write(switch_pin, gpio.LOW)
        end
    end
end

return mqtt_handler



