local mainMod = require("mainmodule")
local array = require("array")

--The most you can have is 15 or else it will look ugly
local max = 10

--Make multiplication table
local multiples = {}
for x = 1, max, 1 do
    multiples[x] = {}
   for y = 1, max, 1 do 
        multiples[x][y] = x * y
    end
end

--Write out the multiplication table
print("Multiplication table")
 
for i, v in pairs(multiples) do
    print(table.unpack(v))
end

print()

--Make array of random numbers
local test = array.randomArray(100, 1, max)    
local multies = array.randomArray(100, 1, max)

--Test it
local falses = 0;
local trues = 0;
for i, v, current in tpairs(test, multies) do
    local out = true;
    printf("is %i multiples of %i\n", v, current)

    if v == current then
        print("Yes\n")

    elseif v % current == 0 then
        -- for i, x in ipairs(multiples[2]) do
        --     if x == v then
        --         out = true
        --         break
        --     end
            
        -- end
        
        if out then
           print("No\n")
           trues = trues + 1
        else
            print("Yes\n")
            falses = falses + 1
        end
    else
        print("No\n")
        falses = falses + 1
    end
    
end

printf("Yes: %i\n", trues)
printf("No: %i\n", falses)
