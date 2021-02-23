Class {
	#name : 'SpkScaffoldingMockObject',
	#superclass : 'Object',
	#classVars : [
		'ForkedProcessResult'
	],
	#category : 'Sparkle-Scaffolding-GemStone-Test'
}

{ #category : 'accessing' }
SpkScaffoldingMockObject class >> _optionArray [
	^ {#'symbol'.
	1.
	2.0}
]

{ #category : 'test support' }
SpkScaffoldingMockObject class >> almostOutOfMemory: threshold [
	"careful now"

	| array |
	array := Array new.

	AlmostOutOfMemoryError enableAtThreshold: threshold.

	[ true ]
		whileTrue: [ 
			array add: (String new: 2000).
			array size \\ 100 == 0
				ifTrue: [ System _generationScavenge_vmMarkSweep ] ]
]

{ #category : 'examples' }
SpkScaffoldingMockObject class >> example1 [
	"This method is expected to be used when breakpoints have been set in the receivers methods"

	^ SpkScaffoldingMockObject new method1
]

{ #category : 'examples' }
SpkScaffoldingMockObject class >> example2 [
	"use this example until the trappability of breakpoints is sorted out"

	self halt.	"I'm here on purpose - used in a test"
	^ SpkScaffoldingMockObject new method1
]

{ #category : 'examples' }
SpkScaffoldingMockObject class >> example3 [
	"should get a debugger in a forked process"
	ForkedProcessResult := nil.
	[ 
	| res |
	GsProcess _current name: 'example3'.
	res := self example2.
	ForkedProcessResult := res.
	SpkScaffoldingDebuggerServiceClient debuggerSemaphore signal ] fork.
	Processor yield.
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
	sem wait.
	self halt.
	^ ans
]

{ #category : 'examples' }
SpkScaffoldingMockObject class >> example5 [
	"This method is expected to be used for debugger compilation tests"

	^ SpkScaffoldingMockObject new method3
]

{ #category : 'accessing' }
SpkScaffoldingMockObject class >> forkedProcessResult [
	^ ForkedProcessResult
]

{ #category : 'test support' }
SpkScaffoldingMockObject class >> stackOverflow [
	"careful now"

	^ self stackOverflow
]

{ #category : 'accessing' }
SpkScaffoldingMockObject >> _optionArray [
	^ self class _optionArray
]

{ #category : 'accessing' }
SpkScaffoldingMockObject >> method1 [
	"entrypoint for debugger breakpoint/stepping exercises"

	^ self method1: self _optionArray
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

{ #category : 'accessing' }
SpkScaffoldingMockObject >> method3 [
	"entrypoint for debugger compile tests"

	self method3: [:value | ""^ value printString ]
]

{ #category : 'accessing' }
SpkScaffoldingMockObject >> method3: aBlock [

	aBlock value: self _optionArray
]
