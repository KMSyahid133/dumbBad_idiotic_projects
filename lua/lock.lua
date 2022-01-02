local mt = {}

mt.__metatable = "locked"

function writeTable(array)
    for i, v in pairs(array) do
       print(i, v) 
    end
end

function mt.__index(array, key)
    return rawget(array, key)
end

function mt.__newindex(array, key, value)
    return rawset(array, key, nil)
end

local lock = {}

function lock.lockTable(t)
    assert(type(t) == "table", "Table expected, got "..tostring(type(t)))
    return setmetatable(t, mt)
end

return lock
