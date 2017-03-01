local moduleName = ...
print(moduleName)
local M = {}
_G[moduleName] = M



local function debounce(func)
    local last = 0
    --延时200ms
    local delay = 200000

    return function(...)
        local now = tmr.now()
        if now - last < delay then return end

        last = now
        return func(...)
    end
end

function M.onPress(buttonPin, onChange)
    gpio.mode(buttonPin, gpio.INT, gpio.PULLUP)
    gpio.trig(buttonPin, "down", debounce(function()
        if gpio.read(buttonPin) == 0 then
            onChange()
            tmr.delay(500000)
        end
    end))
end



return M
