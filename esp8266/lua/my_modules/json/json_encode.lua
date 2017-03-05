ok, json = pcall(cjson.encode, {key="value"})
if ok then
    print(json)
else
    print("failed to encode!")
end