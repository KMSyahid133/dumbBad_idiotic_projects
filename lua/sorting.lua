--Current Project: Sorting
local array = require("array")
local mainModule = require("mainmodule")
local fileMain = require("filemain")

local project = {}

local function swap(list, index1, index2)
    local val1 = list[index1]
    local val2 = list[index2]

    list[index2] = val1
    list[index1] = val2
end

local function isSorted(list)

    for i = 1, #list, 1 do
        local firstIndex = i
        local secondIndex = i + 1

        local firstValue = list[firstIndex]
        local secondValue = list[secondIndex]
        if secondIndex > #list then
            secondValue = firstValue + 1
        end
        if firstValue > secondValue then
            return false
        end
    end
    return true
end

function project.bubbleSort(list)
    local newList = array.clone(list)
    --print(array.compare(list, newList))
    local loop = 0
    local comparison = 0
    --local lastArray = {}
    local objectsToRemove = {}

    repeat
        for count, value in ipairs(newList) do
            local firstIndex = count
            local secondIndex = count + 1
            local firstValue = value
            local secondValue = newList[secondIndex]
            
            if type(secondValue) == "nil" then
                secondValue = firstValue
                table.insert(objectsToRemove, secondIndex)
            end

            if firstValue > secondValue then
                swap(newList, firstIndex, secondIndex)
            end
            --lastArray = array.clone(newList)
            comparison = comparison + 1
        end
        loop = loop + 1
    until isSorted(newList)

    for i, v in ipairs(objectsToRemove) do
        newList[v] = nil
    end

    return newList, comparison, loop
end

function project.insertionSort(list)
    local newList = array.clone(list)
    local loop = 0
    local comparison = 0
    --repeat
        for index, value in ipairs(newList) do
            local j = index - 1
            while j > 0 and newList[j] > value do
                newList[j + 1] = newList[j]
                j = j - 1
                comparison = comparison + 1
            end
            newList[j + 1] = value
        end
        loop = loop + 1
    --until isSorted(newList)

    return newList, comparison, loop
end

function project.bogoSort(list)
    local newList = array.clone(list)
    local original = array.clone(newList)
    local loops = 0
    array.printout(newList)
    while not isSorted(newList) do
        for i, v in ipairs(newList) do
            local newIndex = math.random(1, #newList - 1)
            swap(newList, newIndex, i)
        end
        loops = loops + 1
        --array.printout(newList) (This is optional but you can use it)
    end

    collectgarbage()

    return newList, loops
end

return project
