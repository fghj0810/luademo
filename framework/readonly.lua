local read_only_next = nil

local metatable = {}

function metatable.__index(table, key)
    local value = table.____raw_data[key]
    if value == nil and type(key) == "table" and key.____raw_data then
        value = table.____raw_data[key.____raw_data]
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
    return read_only_next, table.____raw_data, nil
end

function metatable.__len(table)
    return #table.____raw_data
end

function metatable.__eq(left, right)
    if type(left) == "table" and left.____raw_data then
        left = left.____raw_data
    end
    if type(right) == "table" and right.____raw_data then
        right = right.____raw_data
    end
    return left == right
end

function metatable.__tostring(table)
    return string.format("readonly %s", table.____raw_data)
end

function read_only_next(table, index)
    if type(index) == "table" and index.____pairs_key then
        local rawindex = index
        index = index.____pairs_key
        rawset(rawindex, "____pairs_key", nil)
    end
    local nk, nv = next(table, index)
    if type(nk) == "table" then
        local rawkey = nk
        nk = read_only(nk)
        rawset(nk, "____pairs_key", rawkey)
    end
    if type(nv) == "table" then
        nv = read_only(nv)
    end
    return nk, nv
end

function read_only(data)
    if type(data) ~= "table" or data.____raw_data then
        return data
    end
    local retValue = {
        ____raw_data = data
    }
    setmetatable(retValue, metatable)
    return retValue
end

function read_only_cast(data)
    if type(data) ~= "table" or not data.____raw_data then
        return data
    end
    return data.____raw_data
end
