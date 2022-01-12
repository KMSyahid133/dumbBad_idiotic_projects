--[[I'll come back later
Commands:
    > : Move pointer to the right
    < : Move pointer to the left
    + : Increment cell by 1 at the pointer
    - : Decrement cell by 1 at the pointer
    [ :  nil
    ] :  nil
    . : Output the character signified by the cell at the pointer
    , : Input a character and store it in the cell at the pointer (N/A)
--]]
local array = require("array")
local mainModule = require("mainmodule")
local project = {}
local commands = {">", "<", "+", "-", "[", "]", ".", ","}

local function cleanup(code)
    local clean = ""

    for i = 1, #code do
        local char = string.sub(code, i, i)
        if array.find(commands, char) then
            clean = clean..char
        end
    end
    return clean
end

local function buildBraceMap(code)
    local tempBrace = {}
    local bracemap = {}
    for position = 1,  #code do
        local command = string.sub(code, position, position)
        if command == "[" then
            array.append(tempBrace, position)
        end
        if command == "]" then
            local start = table.remove(tempBrace)
            bracemap[start] = position
            bracemap[position] = start
        end
    end

    return bracemap
end

function project.execute(fileName)
    local code = cleanup(mainModule.readFile(fileName))
    local bracemap = buildBraceMap(code)
    local pointer = 1
    local cells = {0}
    local codePointer = 1
    while codePointer <= #code do
        local cCommand = string.sub(code, codePointer, codePointer)

        if cCommand == ">" then
            pointer = pointer + 1
            if pointer > #cells then
                array.append(cells, 0)
            end
        end

        if cCommand == "<" then
            pointer = pointer - 1
            if pointer < #cells then
                pointer = 1
            end

        end

        if cCommand == "+" then
            cells[pointer] = cells[pointer] + 1
            if cells[pointer] > 255 then
                cells[pointer] = 0
            end
        end

        if cCommand == "-" then
            cells[pointer] = cells[pointer] - 1
            if cells[pointer] < 0 then
                cells[pointer] = 255
            end
        end

        if cCommand == "[" and cells[pointer] == 0 then
            codePointer = bracemap[codePointer]
        end

        if cCommand == "]" and cells[pointer] ~= 0 then
            codePointer = bracemap[codePointer]
        end

        if cCommand == "." then
            local asciiChar = string.char(cells[pointer])
            io.write(asciiChar)
        end

        codePointer = codePointer + 1
    end
end

return project
