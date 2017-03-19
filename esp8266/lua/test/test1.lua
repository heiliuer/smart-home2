pwm_pin = 3
pwm.setup(pwm_pin, 500, 512)
pwm.start(pwm_pin)
pwm.setduty(pwm_pin, 200)