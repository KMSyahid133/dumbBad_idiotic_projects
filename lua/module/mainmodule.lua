local array = require("array")
local mainmodule = {}

function _G.tick()
    return os.time(os.date("!*t"))
end

function _G.printf(stringf, ...)
    return io.write(string.format(stringf, ...))
end

function _G.sleep(time)
    if time > 0 then 
        os.execute("ping -n " .. tonumber(time+1) .. " localhost > NUL") 
    end
end

--Idk why i do this
-- function mainmodule.write(...)
--     local arguements = {...}
--     local output = ""
--     for i, v in ipairs(arguements) do

--         if type(v) == "table" then
--             for x, y in pairs(v) do
--                 output = output.." "..tostring(y)
--             end
--         else
--             output = output..tostring(v)
--         end
--         output = output.." "
--     end

--     print(output)
-- end

--Too fucking lazy
function mainmodule.input(prompt, mode)
    local userIn = ""

    if mode == nil then
        mode = "*line"
    end

    if prompt == nil then
        prompt = ""
    end

    while userIn == "" or userIn == " " do
        io.write(prompt)
        userIn = io.read(mode)
        --print(userIn)
    end
    return userIn
end

--Finally something useful
function mainmodule.stringSplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
            table.insert(t, str)
    end
    return t
end

function mainmodule.stringCharCount(str)
    local hash = {}

    for count = 1, #str do
        local char = string.sub(str, count, count)
        char = tostring(char)
        print(char)
        if not array.findIndex(hash, char) then
            hash[char] = 1
        else
            hash[char] = hash[char] + 1
        end
    end

    return hash
end

-- function mainmodule.writeTables(table1, table2)
--     print("      Table 1, Table 2\n")

--     for i, v in pairs(table1) do
--         print(i, v)
--         printf("[%s]:     %i, %i  \n", i, v, hash2[v])
--     end

-- end

function mainmodule.secondToMinute(second)
    return second / 60
end

return mainmodule
