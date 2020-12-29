Class {
	#name : 'SpkScaffoldingMockObject',
	#superclass : 'Object',
	#category : 'Sparkle-Scaffolding-GemStone'
}

{ #category : 'examples' }
SpkScaffoldingMockObject class >> example1 [
	"This method sets breakpoints and at the moment, I am waiting until I can have a trappable breakpoint for Sparkle and a untrappable breakpoing set by topaz"

	| method ans allBreakPoints |
	[ 
	method := SpkScaffoldingMockObject compiledMethodAt: #'method1'.
	ans := method setBreakAtStepPoint: 2.
	allBreakPoints := method _allBreakpoints.
	^ SpkScaffoldingMockObject new method1 ]
		ensure: [ method clearBreakAtStepPoint: 2 ]
]

{ #category : 'examples' }
SpkScaffoldingMockObject class >> example2 [
	"use this example until the trappability of breakpoints is sorted out"

	self halt.
	^ SpkScaffoldingMockObject new method1
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
