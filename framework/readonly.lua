local read_only = nil

local read_only_next = nil
local read_only___index = nil
local read_only___newindex = nil
local read_only___pairs = nil
local read_only___len = nil
local read_only___eq = nil
local read_only___tostring = nil

function read_only_next(table, index)
    if type(index) == "table" then
        index = index.____read_only
    end
    local nk, nv = next(table, index)
    if type(nk) == "table" then
        nk = read_only(nk)
    end
    if type(nv) == "table" then
        nv = read_only(nv)
    end
    return nk, nv
end

function read_only___index(table, key)
    local value = table.____read_only[key]
    if type(value) == "table" then
        value = read_only(value)
    end
    return value
end

function read_only___newindex(table, key, value)
    error("inaccessible due to its readonly. key = " .. tostring(key) .. ", value = " .. tostring(value))
end

function read_only___pairs(table)
    return read_only_next, table.____read_only, nil
end

function read_only___len(table)
    return #table.____read_only
end

function read_only___eq(left, right)
    if type(left) == "table" and left.____read_only then
        left = left.____read_only
    end
    if type(right) == "table" and right.____read_only then
        right = right.____read_only
    end
    return left == right
end

function read_only___tostring(table)
    return string.format("readonly %s", table.____read_only)
end

function read_only(t)
    if type(t) ~= "table" or t.____read_only then
        return t
    end
    local tmp = {
        ____read_only = t
    }
    local mt = {
        __index = read_only___index,
        __newindex = read_only___newindex,
        __pairs = read_only___pairs,
        __len = read_only___len,
        __eq = read_only___eq,
        __tostring = read_only___tostring
    }
    setmetatable(tmp, mt)
    return tmp
end

return read_only
