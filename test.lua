local read_only = require("framework.readonly")

function testread()
    local data = {
        [3] = 3,
        [4] = 4
    }

    local data2 = read_only(data)

    print("read data2[3]", data2[3])
    print("read data2[4]", data2[4])
end

function testipairsread()
    local data = {
        [1] = 1,
        [2] = 2,
        [3] = 3,
        [4] = 4
    }

    local data2 = read_only(data)

    for i,v in ipairs(data2) do
        print("ipairs", i, v)
    end
end

function testpairsread()
    local data = {
        [1] = 1,
        [3] = 3,
        [4] = 4,
        [8] = 8,
        [11] = 11,
        ["str"] = "str"
    }

    local data2 = read_only(data)

    for i,v in pairs(data2) do
        print("pairs", i, v)
    end
end

function testwrite1()
    local data = {
        ["a"] = 1
    }

    local data2 = read_only(data)

    data2.a = 2
end

function testwrite2()
    local data = {
        ["a"] = {
            ["b"] = 1
        }
    }

    local data2 = read_only(data)

    data2.a.b = 2
end

function testwrite3()
    local data = {
        ["a"] = {
            ["b"] = 1
        }
    }

    local data2 = read_only(data)

    for k,v in pairs(data2) do
        print(k, v)
        v.b = 2
    end
end

function testwrite4()
    local key1 = {
        ["k1"] = "k1"
    }
    local key2 = {
        ["k2"] = "k2"
    }
    local data = {
        [key1] = {
            ["b"] = 1
        },
        [key2] = {
            ["b"] = 1
        }
    }

    local data2 = read_only(data)

    for k,v in pairs(data2) do
        print(k, v)
        for k1,v1 in pairs(k) do
            print(k1, v1)
        end
        for k2,v2 in pairs(v) do
            print(k2, v2)
        end
    end

    for k,v in pairs(data2) do
        k.a = 1
    end
end

function testinsert()
    local data = {
        [1] = 1,
        [2] = 2,
        [3] = 3,
        [4] = 4
    }

    local data2 = read_only(data)

    table.insert(data2, 5)
end

function testremove()
    local data = {
        [1] = 1,
        [2] = 2,
        [3] = 3,
        [4] = 4
    }

    local data2 = read_only(data)

    table.remove(data2, 1)
end

function  errorhandle(errobject)
    print(debug.traceback(errobject))
end

print("exec testread")
xpcall(testread, errorhandle)

print("---------------------")

print("exec testipairsread")
xpcall(testipairsread, errorhandle)

print("---------------------")

print("exec testpairsread")
xpcall(testpairsread, errorhandle)

print("---------------------")

print("exec testwrite1")
xpcall(testwrite1, errorhandle)

print("---------------------")

print("exec testwrite2")
xpcall(testwrite2, errorhandle)

print("---------------------")

print("exec testwrite3")
xpcall(testwrite3, errorhandle)

print("---------------------")

print("exec testwrite4")
xpcall(testwrite4, errorhandle)

print("---------------------")

print("exec testinsert")
xpcall(testinsert, errorhandle)

print("---------------------")

print("exec testremove")
xpcall(testremove, errorhandle)