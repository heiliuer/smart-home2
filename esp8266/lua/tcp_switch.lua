--pwm pin
pwm_pin = 3

gpio.mode(pwm_pin, gpio.OUTPUT)

--region 启动服务器
--检查关闭
if srv ~= nil then
    srv:close()
end

srv = net.createServer(net.TCP)
print("listening tcp")
srv:listen(80, function(conn)
    conn:on("receive", function(conn, payload)
        print(payload)
        p_num = tonumber(payload)
        if (p_num ~= nil) then
            if (p_num > 0) then
                gpio.write(pwm_pin, gpio.HIGH)
            else
                gpio.write(pwm_pin, gpio.LOW)
            end
        end
        conn:send("ok")
        --必须关闭 不然send不出去
        conn:close()
    end)
end)
--endregion
