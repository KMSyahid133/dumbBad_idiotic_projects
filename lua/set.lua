--Current Project: Set
--[[
 make a table using .new(...), it will take multiple arguements as it's value
insert a value using :insert(v), it will automatically be sorted
remove a value using :remove(v), it will use binary search if table length is more than 25
find a value using :find(v), it will use binary search is table length is more than 25
--]]

local project = {}

local function comparator(a, b)
    if b > a then
        return 1

    elseif b < a then
        return -1
    else
        return 0
    end
end

local function binSearch(self, val)
    local minIndex = 1
    local maxIndex = #self

    while minIndex <= maxIndex do
        --Mid is a index
        local mid = math.floor((maxIndex + minIndex) / 2)

        local compareVal = comparator(self[mid], val)

        if compareVal == 0 then
			return mid
		elseif compareVal > 0 then
			minIndex = mid + 1
		else
			maxIndex = mid - 1
		end
    end

    return nil
end

local listMt = {}
listMt.__index = listMt

function listMt:insert(v)
    rawset(self, #self + 1, v)
    

    for index, value in ipairs(self) do
        local j = index - 1
        while j > 0 and self[j] > value do
            self[j + 1] = self[j]
            j = j - 1
        end
        self[j + 1] = value
    end

end

function listMt:remove(v)
    if #self >= 25 then
        local result = binSearch(self, v)

        if result then
            rawset(self, result, nil)
        end
    else
        for ind, val in ipairs(self) do
            if val == v then
                rawset(self, ind, nil)
                break
            end
        end

    end
end

function listMt:find(v)
    if #self > 25 then
        local result = binSearch(self, v)

        if result then
            return rawget(self, result)
        end
    else
        for ind, val in ipairs(self) do
            if val == v then
                return rawget(self, ind)
            end
        end
    end
end

function project.new(...)
    local newArray = setmetatable({}, listMt)
    local args = {...}

    if #args > 0 then
        for count = #newArray, #args, 1 do
            newArray[count] = args[count]
        end
    end

    return newArray
end


return project
