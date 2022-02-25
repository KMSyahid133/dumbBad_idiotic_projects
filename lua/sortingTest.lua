local array = require("array")
local luaNum = require("numbers")

local test = {}

local newList = function(length)
    local t = {}
    for count = 1,  length, 1 do
        t[count] = count
    end

    return t
end

local function first()
    for count = 1, 35 do
        printf("Array length: %i\n", count)
        local newArray = array.shuffle(newList(count))
    
        print("Before:")
        array.printout(newArray)
    
        local coRoutine = coroutine.create(function()
            
        end)
    
        local startTime = os.clock()
        local sorted = project.bogoSort(newArray)
        local endTime = (os.clock() - startTime)
    
        local formattedTime = luaNum.clock.secondToClock(endTime)
    
        print("After:")
    
        array.printout(sorted) 
    
        if formattedTime == "0:00:00:00" then
            formattedTime = string.format("%f", endTime)
        end
    
        printf("Time Taken:\n%s\n", formattedTime)
        print()
    end
    
end

local function second(sortingFunction, start, endCount, delta, wait)
    local waitTime = 2

    if wait then
        waitTime = wait
    end

    for count = start, endCount, delta do
        local newArray = array.shuffle(newList(count))

        printf("Array length: %i\n", #newArray)
        print("Before")
        array.printout(newArray)

        local startTime = os.clock()
        local sorted = sortingFunction(newArray)
        local endTime = (os.clock() - startTime)

        local formattedTime = luaNum.clock.secondToClock(endTime)

        print("After")
        array.printout(sorted)
        printf("Time Taken: %s\n\n\n", formattedTime)
        sleep(waitTime)
    end

    print("Test End")
    os.execute("cls")

end

function test.start(testNum, ...)
    if testNum == 1 then
        first(...)
    elseif testNum == 2 then
        second(...)
    end

end

return test
