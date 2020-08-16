# luademo
lua version 5.3

## lua test.lua
```
exec testread
read data2[3]	3
read data2[key]	value
read data2[key2]	value
read data4[key]	key value
read data4[key2]	key2 value
---------------------
exec testipairsread
ipairs	1	1
ipairs	2	2
ipairs	3	3
ipairs	4	4
---------------------
exec testpairsread
pairs	readonly table: 0x7fffc0366a00	read_only(key)
pairs	readonly table: 0x7fffc0366a00	key
pairs	str	str
pairs	4	4
---------------------
exec testwrite1
./framework/readonly.lua:15: inaccessible due to its readonly. key = a, value = 2
stack traceback:
	test.lua:185: in function 'errorhandle'
	[C]: in function 'error'
	./framework/readonly.lua:15: in metamethod '__newindex'
	test.lua:69: in function 'testwrite1'
	[C]: in function 'xpcall'
	test.lua:204: in main chunk
	[C]: in ?
---------------------
exec testwrite2
./framework/readonly.lua:15: inaccessible due to its readonly. key = b, value = 2
stack traceback:
	test.lua:185: in function 'errorhandle'
	[C]: in function 'error'
	./framework/readonly.lua:15: in metamethod '__newindex'
	test.lua:81: in function 'testwrite2'
	[C]: in function 'xpcall'
	test.lua:209: in main chunk
	[C]: in ?
---------------------
exec testwrite3
a	readonly table: 0x7fffc03691b0
./framework/readonly.lua:15: inaccessible due to its readonly. key = b, value = 2
stack traceback:
	test.lua:185: in function 'errorhandle'
	[C]: in function 'error'
	./framework/readonly.lua:15: in metamethod '__newindex'
	test.lua:95: in function 'testwrite3'
	[C]: in function 'xpcall'
	test.lua:214: in main chunk
	[C]: in ?
---------------------
exec testwrite4
readonly table: 0x7fffc036a470	readonly table: 0x7fffc036a590
k1	k1
b	1
readonly table: 0x7fffc036a4e0	readonly table: 0x7fffc036a600
k2	k2
b	1
./framework/readonly.lua:15: inaccessible due to its readonly. key = a, value = 1
stack traceback:
	test.lua:185: in function 'errorhandle'
	[C]: in function 'error'
	./framework/readonly.lua:15: in metamethod '__newindex'
	test.lua:128: in function 'testwrite4'
	[C]: in function 'xpcall'
	test.lua:219: in main chunk
	[C]: in ?
---------------------
exec testinsert
./framework/readonly.lua:15: inaccessible due to its readonly. key = 5, value = 5
stack traceback:
	test.lua:185: in function 'errorhandle'
	[C]: in function 'error'
	./framework/readonly.lua:15: in function <./framework/readonly.lua:14>
	[C]: in function 'table.insert'
	test.lua:142: in function 'testinsert'
	[C]: in function 'xpcall'
	test.lua:224: in main chunk
	[C]: in ?
---------------------
exec testremove
./framework/readonly.lua:15: inaccessible due to its readonly. key = 1, value = 2
stack traceback:
	test.lua:185: in function 'errorhandle'
	[C]: in function 'error'
	./framework/readonly.lua:15: in function <./framework/readonly.lua:14>
	[C]: in function 'table.remove'
	test.lua:155: in function 'testremove'
	[C]: in function 'xpcall'
	test.lua:229: in main chunk
	[C]: in ?
---------------------
exec testcompare
data == data2	true
data2 == data	true
data == data3	false
data3 == data	false
data2 == data3	false
data3 == data2	false
data2 == data4	false
data4 == data2	false
```
