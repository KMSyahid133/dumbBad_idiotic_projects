local array = require("array")
local mainmodule = {}

--Idk why i do this
function mainmodule.write(...)
    local arguements = {...}
    local output = ""
    for i, v in pairs(arguements) do

        if type(v) == "table" then
            for x, y in pairs(v) do
                output = output.." "..tostring(y)
            end
        else
            output = output..tostring(v)
        end
        output = output.." "
    end

    print(output)
end

--Too fucking lazy
function mainmodule.input(prompt, mode)
    if mode == nil then
        mode = "*line"
    end
    io.write(prompt)
    local userin = io.read(mode)
    return userin
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

return mainmodule
