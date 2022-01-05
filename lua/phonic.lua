local array = require("array")
local mainModule = require("project")
local phonicModule = {}

--Phonic alphabets
local phonicCharacter = {["A"] = "Alpha", ["B"] = "Beta", ["C"] = "Charlie",
        ["D"] = "Delta", ["E"] = "Echo", ["F"] = "Foxtrot",
        ["G"] = "Golf", ["H"] = "Hotel", ["I"] = "India",
        ["J"] = "Juliett", ["K"] = "Kilo", ["L"] = "Lima",
        ["M"] = "Mike", ["N"] = "November", ["O"] = "Oscar",
        ["P"] = "Papa", ["Q"] = "Quebec", ["R"] = "Romeo",
        ["S"] = "Sierra", ["T"] = "Tango", ["U"] = "Uniform",
        ["V"] = "Victor", ["W"] = "Whiskey", ["X"] = "X-ray",
        ["Y"] = "Yankee", ["Z"] = "Zulu", [" "] = "(space)"}

--Too lazy
local phonicReverse = array.reverseDictionary(phonicCharacter)

--Encode string; 
--  Input: "Hello, World!"
--  Output: "Hotel Echo Lima Lima Oscar , (space) Whiskey Oscar Romeo Lima Delta !"
function phonicModule.encode(stringToEncode)
    local encoded = ""

    for i = 1, #stringToEncode do
        local character = stringToEncode:sub(i, i)
        character = string.upper(character)
        local phonic = array.findWithIndex(phonicCharacter, character)

        print(character, phonic)

        if phonic then
            encoded = encoded..phonic.." "
        else
            encoded = encoded..character.." "
        end
    end

    return encoded
end

--Decode string
--  Input: Hotel Echo Lima Lima Oscar , (space) Whiskey Oscar Romeo Lima Delta !
--  Output: hello, world!
function phonicModule.decode(stringToDecode)
    local decoded = ""
    local splitted = mainModule.split(stringToDecode, " ")

    for i, v in pairs(splitted) do
        local character = array.findWithIndex(phonicReverse, v)
        if character then
            decoded = decoded..character
        else
            decoded = decoded..v
        end
    end

    return decoded:lower()
end


return phonicModule
