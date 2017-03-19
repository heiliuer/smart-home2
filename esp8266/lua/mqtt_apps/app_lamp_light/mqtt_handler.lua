mqtt_handler = {}
btn = require("btn")

local pwm_pin = 1 --gpio5

local btn_pin = 2 --gpio4

local function init_pwm()
    pwm.setup(pwm_pin, 500, 1023)
    pwm.start(pwm_pin)
end

local function set_pwm_duty(duty)
    pwm.setduty(pwm_pin, 1023 - duty)
end

local function get_pwm_duty()
    return 1023 - pwm.getduty(pwm_pin)
end


function mqtt_handler.init(mqtt_client, topic)
    init_pwm()
    last_duty = get_pwm_duty()
    print("init btn")
    btn.onPress(btn_pin, function()
        print(btn_pin .. " press")
        local duty = get_pwm_duty()
        if duty >= 1023 then
            duty = 0
        else
            duty = 1023
        end
        set_pwm_duty(duty)
        mqtt_client:publish(topic, "" .. duty, 0, 0, function(client)
            --        print("sent")
        end)
    end)
end

function mqtt_handler.on_mqtt_connect(mqtt_client, topic)
    local duty = get_pwm_duty()

    -- publish a message with data = hello, QoS = 0, retain = 0
    mqtt_client:publish(topic, "" .. duty, 0, 0, function(client)
        --                print("sent")
    end)
end

function mqtt_handler.on_mqtt_offline(mqtt_client)
end

function mqtt_handler.on_mqtt_message(mqtt_client, topic, data)
    print(topic .. ":")
    if data ~= nil then
        print(data)
        local num = tonumber(data)
        if (num >= 0 and num < 1024) then
            set_pwm_duty(num)
        end
    end
    return mqtt_handler
end

