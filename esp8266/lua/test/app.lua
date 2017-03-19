pwm_pin = 1
pwm.setup(pwm_pin, 500, 512)
pwm.start(pwm_pin)

local duty = 200
tmr.alarm(1, 100, 1, function()
    if duty > 1013 then
        duty = 0
    end
    pwm.setduty(pwm_pin, duty)
    duty = duty + 10
end)
