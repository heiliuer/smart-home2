store_util = {}
function store_util.save_setting(name, value)
    file.open(name, 'w') -- you don't need to do file.remove if you use the 'w' method of writing
    file.writeline(value)
    file.close()
end

function store_util.read_setting(name)
    if (file.open(name) ~= nil) then
        result = string.sub(file.readline(), 1, -2) -- to remove newline character
        file.close()
        return true, result
    else
        return false, nil
    end
end

function store_util.save_wifi(ssid, pwd)
    store_util.save_setting("wifi_ssid", ssid)
    store_util.save_setting("wifi_pwd", pwd)
end

function store_util.get_wifi()
    local ssid_success, ssid = store_util.read_setting("wifi_ssid")
    local pwd_success, pwd = store_util.read_setting("wifi_pwd")
    if ssid_success and pwd_success then
        return true, ssid, pwd
    else
        return false, nil, nil
    end
end

return store_util
