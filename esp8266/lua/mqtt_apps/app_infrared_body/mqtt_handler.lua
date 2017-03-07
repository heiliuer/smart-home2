mqtt_handler = {}
btn_up = require("btn_up")
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

    local prev = 0

    local function timer_to_reset()
        tmr.stop(2)
        tmr.alarm(2, 1000 * 6, tmr.ALARM_SINGLE, function()
            if prev == 1 then
                print("push_body_leave")
                push_body_leave(mqtt_client, topic)
            end
            prev = 0
        end)
    end

    btn_up.onPress(pin_input, function()
        timer_to_reset()
        if prev == 0 then
            print("push_find_body")
            push_find_body(mqtt_client, topic)
            prev = 1
        end

    end)
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



