mqtt_handler = {}

local pin_input = 1 --gpio5

local mqtt_enable = false

local function push_msg(mqtt_client, topic, msg)
    mqtt_client:publish(topic, "" .. msg, 0, 0, function(client)
        --                print("sent")
    end)
end

local function push_find_body(mqtt_client, topic)
    if mqtt_enable then
        push_msg(mqtt_client, topic, 1)
    end
end

local function push_body_leave(mqtt_client, topic)
    push_msg(mqtt_client, topic, 0)
end

function mqtt_handler.init(mqtt_client, topic)
    print("init pulse")
    do
        -- use pin 1 as the input pulse width counter
        local pin, pulse1, du, now, trig = pin_input, 0, 0, tmr.now, gpio.trig
        gpio.mode(pin, gpio.INT)
        local function pin1cb(level, pulse2)
            print(level, pulse2 - pulse1)
            if level == 1 then
                push_find_body(mqtt_client, topic)
                tmr.stop(2)
                tmr.alarm(2, 1000 * 20, tmr.ALARM_SINGLE, function()
                    push_body_leave(mqtt_client, topic)
                end)
            end
            pulse1 = pulse2
            trig(pin, level == gpio.HIGH and "down" or "up")
        end

        trig(pin, "down", pin1cb)
    end
end


function mqtt_handler.on_mqtt_connect(mqtt_client, topic)
    mqtt_enable = true
end

function mqtt_handler.on_mqtt_offline(mqtt_client)
    mqtt_enable = false
end

function mqtt_handler.on_mqtt_message(mqtt_client, topic, data)
end

return mqtt_handler



