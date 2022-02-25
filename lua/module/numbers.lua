local lib = {}

local floor = math.floor
local mod = math.fmod
local format = string.format
local gsub = string.gsub

function lib.minutetoseconds(seconds)
    return seconds / 60
end

function lib.hourtominute(seconds)
    return seconds / 60
end

lib["clock"] = {}

local clock = lib.clock

local function foo(number)
    return num(gsub(format(str("%.5f"), number)))
end

--Time format
--HH:MM:SS
function clock.secondToClock(time)
    local days = floor(time/86400)
    local hours = floor(mod(time, 86400)/3600)
    local minutes = floor(mod(time,3600)/60)
    local seconds = floor(mod(time,60))
    return format("%d:%02d:%02d:%02d",days,hours,minutes,seconds)
end

return lib
