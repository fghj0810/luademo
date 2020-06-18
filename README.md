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
pairs	str	str
pairs	11	11
---------------------
exec testwrite1
./framework/readonly.lua:28: inaccessible due to its readonly. key = a, value = 2
stack traceback:
	test.lua:118: in function 'errorhandle'
	[C]: in function 'error'
	./framework/readonly.lua:28: in metamethod '__newindex'
	test.lua:54: in function 'testwrite1'
	[C]: in function 'xpcall'
	test.lua:137: in main chunk
	[C]: in ?
---------------------
exec testwrite2
./framework/readonly.lua:28: inaccessible due to its readonly. key = b, value = 2
stack traceback:
	test.lua:118: in function 'errorhandle'
	[C]: in function 'error'
	./framework/readonly.lua:28: in metamethod '__newindex'
	test.lua:66: in function 'testwrite2'
	[C]: in function 'xpcall'
	test.lua:142: in main chunk
	[C]: in ?
---------------------
exec testwrite3
a	readonly table: 0x563d33063e50
./framework/readonly.lua:28: inaccessible due to its readonly. key = b, value = 2
stack traceback:
	test.lua:118: in function 'errorhandle'
	[C]: in function 'error'
	./framework/readonly.lua:28: in metamethod '__newindex'
	test.lua:80: in function 'testwrite3'
	[C]: in function 'xpcall'
	test.lua:147: in main chunk
	[C]: in ?
---------------------
exec testwrite4
readonly table: 0x563d330650c0	readonly table: 0x563d330651e0
k1	k1
b	1
readonly table: 0x563d33065130	readonly table: 0x563d33065250
k2	k2
b	1
./framework/readonly.lua:28: inaccessible due to its readonly. key = a, value = 1
stack traceback:
	test.lua:118: in function 'errorhandle'
	[C]: in function 'error'
	./framework/readonly.lua:28: in metamethod '__newindex'
	test.lua:113: in function 'testwrite4'
	[C]: in function 'xpcall'
	test.lua:152: in main chunk
	[C]: in ?

```
