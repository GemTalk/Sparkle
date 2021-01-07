Class {
	#name : 'SpkScaffoldingMockObject',
	#superclass : 'Object',
	#category : 'Sparkle-Scaffolding-GemStone'
}

{ #category : 'examples' }
SpkScaffoldingMockObject class >> example1 [
	"This method is expected to be used when breakpoints have been set in the receivers methods"

	^ SpkScaffoldingMockObject new method1
]

{ #category : 'examples' }
SpkScaffoldingMockObject class >> example2 [
	"use this example until the trappability of breakpoints is sorted out"

	self halt.
	^ SpkScaffoldingMockObject new method1
]

{ #category : 'examples' }
SpkScaffoldingMockObject class >> example3 [
	"should get a debugger in a forked process"

	[ 
	GsProcess _current name: 'example3'.
	GsFile gciLogServer: 'thread example3'.
	GsFile gciLogServer: 'RESULT: ' , self example2 printString ] fork.
	Processor yield.
	GsFile gciLogServer: 'forked'.
	^ 'forked'
]

{ #category : 'examples' }
SpkScaffoldingMockObject class >> example4 [
	"should get a debugger in a forked process and then halt in current process when semaphore signalled"

	| sem ans |
	sem := Semaphore new.
	[ 
	GsProcess _current name: 'example4'.
	GsFile gciLogServer: 'thread example4'.
	ans := self example2.
	GsFile gciLogServer: 'signal semaphore'.
	sem signal ] fork.
	Processor yield.
	GsFile gciLogServer: 'wait'.
	sem wait.
	GsFile gciLogServer: 'halt'.
	self halt.
	GsFile gciLogServer: 'resume'.
	^ ans
]

{ #category : 'accessing' }
SpkScaffoldingMockObject >> method1 [
	"entrypoint for debugger breakpoint/stepping exercises"

	| optionArray |
	optionArray := {#'symbol'.
	1.
	2.0}.	"assignment is steppoint 2"
	^ self method1: optionArray	"steppoint 3"
]

{ #category : 'accessing' }
SpkScaffoldingMockObject >> method1: optionArray [
	"return a copy of the optionArray where all entries in option array have been converted to strings"

	| newArray |
	newArray := {}.	"steppoint 2"
	optionArray
		do: [ :option | 
			| res |
			"do: is steppoint 3"
			res := self method2: option.	"steppoint 7"
			newArray add: res	"steppoint 9" ].
	^ newArray	"steppoint 4"
]

{ #category : 'accessing' }
SpkScaffoldingMockObject >> method2: option [
	"entrypoint for debugger breakpoint/stepping exercises"

	^ option asString
]
