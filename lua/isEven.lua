--Dependecies
local array = require("array")
--also 'sleep' is optional, but if you want to, take it from mainmodule
local even = false
local numbers = {}
--Start making list of even numbers
local function init()
    for i = 1, 100, 1 do
        numbers[i] = even
        even = not even
    end

    --array.shuffle(numbers)
end
--Check if the number is even
local function isEven(n)
    --Iterate through the list and if the number is found, return the bool value
    for number, bool in ipairs(numbers) do
        --printf("Checking %i. Is even: %s. Is the number wanted: %s\n", number, tostring(bool), tostring(n == number))
        if number == n then
            return bool
        end
        
    end

    --If the number is not found, then create it
    
    if (#numbers + 1) ~= n then
        --Create new lists of numbers and add it into the list
        for i = (#numbers + 1), n, 1 do
            --printf("Creating %i. Is even: %s\n", i, tostring(even))
            numbers[i] = even
            even = not even
        end
    else
        --If the number is just 1 above the list then just append it
        numbers[#numbers + 1] = even
        even = not even
    end

    --array.shuffle(numbers)
    sleep(0.1)
    return isEven(n)
end
--------------------------------------------------------------------------------------


--Benchmark code
local function benchMark(n)
    local strt = os.clock()
    printf("%i: %s\n", n, tostring(isEven(n)))
    local dt = (os.clock() - strt)
    print(dt)
end

init()

local checkedNumbers = {}
--This can cause a deep recursion, but i use ostrich algorithm, so i don't care
local function foo()
    local newNum = math.random(1, 9999)

    if not array.find(checkedNumbers, newNum) then
        return newNum
    else
        return foo()
    end
end

print("START")

for count = 1, 100, 1 do
    local val = foo()
    benchMark(val)
    sleep(0.003)
end

print("END")
