--These code lock the table, so that the table cannot have new key and/or value (still can be bypassed by rawset lol)
local lockMt = {}

lockMt.__metatable = "locked"

function lockMt.__index(array, key)
    return rawget(array, key)
end

function lockMt.__newindex(array, key, value)
    return rawset(array, key, nil)
end

local array = {}

--------------------------------------------------------------------------------------
--lock (same as lock.lua at dumbBad_idiotic_projects/lua/lock.lua)
function array.lockTable(t)
    assert(type(t) == "table", "Table expected, got "..tostring(type(t)))
    return setmetatable(t, lockMt)
end

--------------------------------------------------------------------------------------
--reverses dictionary
function array.reverseDictionary(dict)
    local reversed = {}

    for i, v in pairs(dict) do
        reversed[v] = i
    end

    return reversed
end

--------------------------------------------------------------------------------------
--Find given value in a dictionary
function array.find(arr, value)
    for i, v in pairs(arr) do
        if v == value then
            return v
        end
    end
    return nil
end

--------------------------------------------------------------------------------------
--Find a value with index (why do i did this again?)
function array.findWithIndex(arr, value)
    for i, v in pairs(arr) do
        if i == value then
            return v
        end
    end
    return nil
end

--------------------------------------------------------------------------------------
--lower index and value string
function array.lower(dict)
    local lowered = {}
    
    for i, v in pairs(dict) do
        local index = string.lower(tostring(i))
        local value = string.lower(tostring(v))

        rawset(lowered, index, value)
    end

    return lowered
end

return array
