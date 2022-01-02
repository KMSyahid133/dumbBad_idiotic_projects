--These code lock the table, so that the table cannot have new key and/or value
local mt = {}

mt.__metatable = "locked"

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
