# luademo
lua version 5.3

## lua test.lua
```
exec testread
read data2[3]	3
read data2[key]	value
read data2[key2]	value
---------------------
exec testipairsread
ipairs	1	1
ipairs	2	2
ipairs	3	3
ipairs	4	4
---------------------
exec testpairsread
pairs	8	8
pairs	1	1
pairs	3	3
pairs	4	4
pairs	11	11
pairs	str	str
---------------------
exec testwrite1
./framework/readonly.lua:31: inaccessible due to its readonly. key = a, value = 2
stack traceback:
	test.lua:149: in function 'errorhandle'
	[C]: in function 'error'
	./framework/readonly.lua:31: in metamethod '__newindex'
	test.lua:59: in function 'testwrite1'
	[C]: in function 'xpcall'
	test.lua:168: in main chunk
	[C]: in ?
---------------------
exec testwrite2
./framework/readonly.lua:31: inaccessible due to its readonly. key = b, value = 2
stack traceback:
	test.lua:149: in function 'errorhandle'
	[C]: in function 'error'
	./framework/readonly.lua:31: in metamethod '__newindex'
	test.lua:71: in function 'testwrite2'
	[C]: in function 'xpcall'
	test.lua:173: in main chunk
	[C]: in ?
---------------------
exec testwrite3
a	readonly table: 0x56411e0f1e30
./framework/readonly.lua:31: inaccessible due to its readonly. key = b, value = 2
stack traceback:
	test.lua:149: in function 'errorhandle'
	[C]: in function 'error'
	./framework/readonly.lua:31: in metamethod '__newindex'
	test.lua:85: in function 'testwrite3'
	[C]: in function 'xpcall'
	test.lua:178: in main chunk
	[C]: in ?
---------------------
exec testwrite4
readonly table: 0x56411e0f30a0	readonly table: 0x56411e0f31c0
k1	k1
b	1
readonly table: 0x56411e0f3110	readonly table: 0x56411e0f3230
k2	k2
b	1
./framework/readonly.lua:31: inaccessible due to its readonly. key = a, value = 1
stack traceback:
	test.lua:149: in function 'errorhandle'
	[C]: in function 'error'
	./framework/readonly.lua:31: in metamethod '__newindex'
	test.lua:118: in function 'testwrite4'
	[C]: in function 'xpcall'
	test.lua:183: in main chunk
	[C]: in ?
---------------------
exec testinsert
./framework/readonly.lua:31: inaccessible due to its readonly. key = 5, value = 5
stack traceback:
	test.lua:149: in function 'errorhandle'
	[C]: in function 'error'
	./framework/readonly.lua:31: in function <./framework/readonly.lua:30>
	[C]: in function 'table.insert'
	test.lua:132: in function 'testinsert'
	[C]: in function 'xpcall'
	test.lua:188: in main chunk
	[C]: in ?
---------------------
exec testremove
./framework/readonly.lua:31: inaccessible due to its readonly. key = 1, value = 2
stack traceback:
	test.lua:149: in function 'errorhandle'
	[C]: in function 'error'
	./framework/readonly.lua:31: in function <./framework/readonly.lua:30>
	[C]: in function 'table.remove'
	test.lua:145: in function 'testremove'
	[C]: in function 'xpcall'
	test.lua:193: in main chunk
	[C]: in ?
---------------------
exec testkeycompare
attempt to call a nil value
stack traceback:
	test.lua:149: in function 'errorhandle'
	[C]: in function 'xpcall'
	test.lua:198: in main chunk
	[C]: in ?
```
