local array = require("array")
local mainModule = require("mainmodule")
local phonicModule = {}

--Military alphabets
local phonicCharacter = {["A"] = "Alpha", ["B"] = "Beta", ["C"] = "Charlie",
        ["D"] = "Delta", ["E"] = "Echo", ["F"] = "Foxtrot",
        ["G"] = "Golf", ["H"] = "Hotel", ["I"] = "India",
        ["J"] = "Juliett", ["K"] = "Kilo", ["L"] = "Lima",
        ["M"] = "Mike", ["N"] = "November", ["O"] = "Oscar",
        ["P"] = "Papa", ["Q"] = "Quebec", ["R"] = "Romeo",
        ["S"] = "Sierra", ["T"] = "Tango", ["U"] = "Uniform",
        ["V"] = "Victor", ["W"] = "Whiskey", ["X"] = "X-ray",
        ["Y"] = "Yankee", ["Z"] = "Zulu", [" "] = "(space)"}


local phonicReversed = array.reverseDictionary(phonicCharacter)
local phonicLower = array.lower(phonicCharacter)
local phonicLowerReversed = array.lower(phonicReversed)

--Input: "Hello, World!"
--Output: "Hotel echo lima lima oscar , (space) Whiskey oscar romeo lima delta !"

function phonicModule.encode(stringToEncode)
    local encoded = ""

    for i = 1, #stringToEncode do
        local character = stringToEncode:sub(i, i)
        --character = string.upper(character)
        local phonic = phonicCharacter[character] or phonicLower[character] --array.findWithIndex(phonicCharacter, character)

        --print(character, phonic)

        if phonic then
            encoded = encoded..phonic.." "
        else
            encoded = encoded..character.." "
        end
    end

    return encoded
end

--Input: "Hotel echo lima lima oscar , (space) Whiskey oscar romeo lima delta !"
--Output: "hello, world!"
function phonicModule.decode(stringToDecode)
    local decoded = ""
    local splitted = mainModule.stringSplit(stringToDecode, " ")

    for i, v in pairs(splitted) do
        print(v)
        local character = phonicReversed[v] or phonicLowerReversed[v]--array.findWithIndex(phonicReversed, v)
        if character then
            decoded = decoded..character
        else
            decoded = decoded..v
        end
    end

    return decoded:lower()
end

return phonicModule
