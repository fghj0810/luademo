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
pairs	readonly table: 0x55fd69757db0	key
pairs	readonly table: 0x55fd69757db0	read_only(key)
pairs	11	11
pairs	4	4
pairs	8	8
pairs	str	str
---------------------
exec testwrite1
./framework/readonly.lua:31: inaccessible due to its readonly. key = a, value = 2
stack traceback:
	test.lua:161: in function 'errorhandle'
	[C]: in function 'error'
	./framework/readonly.lua:31: in metamethod '__newindex'
	test.lua:71: in function 'testwrite1'
	[C]: in function 'xpcall'
	test.lua:180: in main chunk
	[C]: in ?
---------------------
exec testwrite2
./framework/readonly.lua:31: inaccessible due to its readonly. key = b, value = 2
stack traceback:
	test.lua:161: in function 'errorhandle'
	[C]: in function 'error'
	./framework/readonly.lua:31: in metamethod '__newindex'
	test.lua:83: in function 'testwrite2'
	[C]: in function 'xpcall'
	test.lua:185: in main chunk
	[C]: in ?
---------------------
exec testwrite3
a	readonly table: 0x55fd6975a4b0
./framework/readonly.lua:31: inaccessible due to its readonly. key = b, value = 2
stack traceback:
	test.lua:161: in function 'errorhandle'
	[C]: in function 'error'
	./framework/readonly.lua:31: in metamethod '__newindex'
	test.lua:97: in function 'testwrite3'
	[C]: in function 'xpcall'
	test.lua:190: in main chunk
	[C]: in ?
---------------------
exec testwrite4
readonly table: 0x55fd6975b720	readonly table: 0x55fd6975b840
k1	k1
b	1
readonly table: 0x55fd6975b790	readonly table: 0x55fd6975b8b0
k2	k2
b	1
./framework/readonly.lua:31: inaccessible due to its readonly. key = a, value = 1
stack traceback:
	test.lua:161: in function 'errorhandle'
	[C]: in function 'error'
	./framework/readonly.lua:31: in metamethod '__newindex'
	test.lua:130: in function 'testwrite4'
	[C]: in function 'xpcall'
	test.lua:195: in main chunk
	[C]: in ?
---------------------
exec testinsert
./framework/readonly.lua:31: inaccessible due to its readonly. key = 5, value = 5
stack traceback:
	test.lua:161: in function 'errorhandle'
	[C]: in function 'error'
	./framework/readonly.lua:31: in function <./framework/readonly.lua:30>
	[C]: in function 'table.insert'
	test.lua:144: in function 'testinsert'
	[C]: in function 'xpcall'
	test.lua:200: in main chunk
	[C]: in ?
---------------------
exec testremove
./framework/readonly.lua:31: inaccessible due to its readonly. key = 1, value = 2
stack traceback:
	test.lua:161: in function 'errorhandle'
	[C]: in function 'error'
	./framework/readonly.lua:31: in function <./framework/readonly.lua:30>
	[C]: in function 'table.remove'
	test.lua:157: in function 'testremove'
	[C]: in function 'xpcall'
	test.lua:205: in main chunk
	[C]: in ?
---------------------
exec testkeycompare
attempt to call a nil value
stack traceback:
	test.lua:161: in function 'errorhandle'
	[C]: in function 'xpcall'
	test.lua:210: in main chunk
	[C]: in ?
```
