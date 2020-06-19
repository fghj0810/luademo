# luademo
lua version 5.3

## lua test.lua
```
exec testread
read data2[3]	3
read data2[4]	4
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
./framework/readonly.lua:28: inaccessible due to its readonly. key = a, value = 2
stack traceback:
	test.lua:144: in function 'errorhandle'
	[C]: in function 'error'
	./framework/readonly.lua:28: in metamethod '__newindex'
	test.lua:54: in function 'testwrite1'
	[C]: in function 'xpcall'
	test.lua:163: in main chunk
	[C]: in ?
---------------------
exec testwrite2
./framework/readonly.lua:28: inaccessible due to its readonly. key = b, value = 2
stack traceback:
	test.lua:144: in function 'errorhandle'
	[C]: in function 'error'
	./framework/readonly.lua:28: in metamethod '__newindex'
	test.lua:66: in function 'testwrite2'
	[C]: in function 'xpcall'
	test.lua:168: in main chunk
	[C]: in ?
---------------------
exec testwrite3
a	readonly table: 0x5585648cdb40
./framework/readonly.lua:28: inaccessible due to its readonly. key = b, value = 2
stack traceback:
	test.lua:144: in function 'errorhandle'
	[C]: in function 'error'
	./framework/readonly.lua:28: in metamethod '__newindex'
	test.lua:80: in function 'testwrite3'
	[C]: in function 'xpcall'
	test.lua:173: in main chunk
	[C]: in ?
---------------------
exec testwrite4
readonly table: 0x5585648cedb0	readonly table: 0x5585648ceed0
k1	k1
b	1
readonly table: 0x5585648cee20	readonly table: 0x5585648cef40
k2	k2
b	1
./framework/readonly.lua:28: inaccessible due to its readonly. key = a, value = 1
stack traceback:
	test.lua:144: in function 'errorhandle'
	[C]: in function 'error'
	./framework/readonly.lua:28: in metamethod '__newindex'
	test.lua:113: in function 'testwrite4'
	[C]: in function 'xpcall'
	test.lua:178: in main chunk
	[C]: in ?
---------------------
exec testinsert
./framework/readonly.lua:28: inaccessible due to its readonly. key = 5, value = 5
stack traceback:
	test.lua:144: in function 'errorhandle'
	[C]: in function 'error'
	./framework/readonly.lua:28: in function <./framework/readonly.lua:27>
	[C]: in function 'table.insert'
	test.lua:127: in function 'testinsert'
	[C]: in function 'xpcall'
	test.lua:183: in main chunk
	[C]: in ?
---------------------
exec testremove
./framework/readonly.lua:28: inaccessible due to its readonly. key = 1, value = 2
stack traceback:
	test.lua:144: in function 'errorhandle'
	[C]: in function 'error'
	./framework/readonly.lua:28: in function <./framework/readonly.lua:27>
	[C]: in function 'table.remove'
	test.lua:140: in function 'testremove'
	[C]: in function 'xpcall'
	test.lua:188: in main chunk
	[C]: in ?
```
