local read_only = nil

local function read_only_next(table, index)
    if type(index) == "table" and table[index] == nil then
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

local metatable = {}

function metatable.__index(table, key)
    local value = table.____read_only[key]
    if value == nil and type(key) == "table" and key.____read_only then
        value = table.____read_only[key.____read_only]
    end
    if type(value) == "table" then
        value = read_only(value)
    end
    return value
end

function metatable.__newindex(table, key, value)
    error("inaccessible due to its readonly. key = " .. tostring(key) .. ", value = " .. tostring(value))
end

function metatable.__pairs(table)
    return read_only_next, table.____read_only, nil
end

function metatable.__len(table)
    return #table.____read_only
end

function metatable.__eq(left, right)
    if type(left) == "table" and left.____read_only then
        left = left.____read_only
    end
    if type(right) == "table" and right.____read_only then
        right = right.____read_only
    end
    return left == right
end

function metatable.__tostring(table)
    return string.format("readonly %s", table.____read_only)
end

function read_only(t)
    if type(t) ~= "table" or t.____read_only then
        return t
    end
    local tmp = {
        ____read_only = t
    }
    setmetatable(tmp, metatable)
    return tmp
end

return read_only
