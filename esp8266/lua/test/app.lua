--开启tcp服务控制继电器

--pwm pin
pwm_pin = 3


function setPinPwmMode()
    --region 设置pwd pin
    pwm.setup(pwm_pin, 1000, 0)
    pwm.start(pwm_pin)
    --endregion
end

function setPinDigtalMode()
    --region 设置digital pin
    pwm.close(pwm_pin)
    gpio.mode(pwm_pin, gpio.OUTPUT)
    --endregion
end

--region 启动服务器
--检查关闭
if srv ~= nil then
    srv:close()
end

srv = net.createServer(net.TCP)
srv:listen(80, function(conn)
    conn:on("receive", function(conn, payload)
        print(payload)
        p_num = tonumber(payload)
        if (p_num ~= nil) then
            if (p_num >= 1013) then
                setPinDigtalMode()
                gpio.write(pwm_pin, gpio.HIGH)
            elseif (p_num <= 0) then
                setPinDigtalMode()
                gpio.write(pwm_pin, gpio.LOW)
            else
                setPinPwmMode()
                pwm.setduty(pwm_pin, p_num)
            end
        end
        conn:send("ok")
        --必须关闭 不然send不出去
        conn:close()
    end)
end)
--endregion
