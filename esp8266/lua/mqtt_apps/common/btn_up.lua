local moduleName = ...
local M = {}
_G[moduleName] = M


local function debounce(func)
    local last = 0
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
    gpio.trig(buttonPin, "up", debounce(function()
        if gpio.read(buttonPin) == 1 then
            onChange()
            tmr.delay(500000)
        end
    end))
end

return M
