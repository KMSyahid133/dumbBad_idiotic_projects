local function swap(list, index1, index2)
    local val1 = list[index1]
    local val2 = list[index2]

    list[index2] = val1
    list[index1] = val2
end

local function isSorted(list)
    for i = 1, #list - 1, 1 do
        if list[i] > list[i + 1] then
           return false 
        end
    end
    return true
end

--[[
  Performance:
  Worst case: (O)n^2
  Average case: (O)n^2
  Best case: (O)n
--]]
function project.bubbleSort(list)
    local newList = array.clone(list)

    repeat
        for count, value in ipairs(newList) do
            
            if count ~= #newList then
                if value > newList[count + 1] then
                    swap(newList, count, count + 1)
                end 
            end
            --lastArray = array.clone(newList)
            
        end
        
    until isSorted(newList)

    return newList
end

--[[
  Performance:
  Worst case: (O)n^2
  Average case: (O)n^2
  Best case: (O)n
--]]
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

--[[
  Performance:
  Worst case: (O)(n x n!)
  Average case: (O)(n x n!)
  Best case: (O)n
--]]
function project.bogoSort(list)
    math.randomseed(os.time())
    local newList = array.clone(list)
    --local original = array.clone(newList)
    local loops = 0
    --array.printout(newList)
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

--[[
  Performance:
  Worst case: (O)n^2
  Average case: (O)n^2
  Best case: (O)n^2
--]]
function project.selectionSort(list)
    local newArray = array.clone(list)

    for i, v in ipairs(newArray) do
        local currentMinIndex = i

        for k = (i + 1), #newArray, 1 do
            if newArray[k] < newArray[currentMinIndex] then
                currentMinIndex = k
            end


        end

        if currentMinIndex ~= i then
            swap(newArray, i, currentMinIndex)
        end

    end

    return newArray
end

function project.mergeSort(list)
    local cloneList = array.clone(list)


    return cloneList
end
