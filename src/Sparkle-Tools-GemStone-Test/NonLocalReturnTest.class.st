"
Tests behavior of nested non-local returns.
"
Class {
	#name : 'NonLocalReturnTest',
	#superclass : 'GsTestCase',
	#instVars : [
		'random',
		'closures',
		'trace',
		'level'
	],
	#category : 'Sparkle-Tools-GemStone-Test'
}

{ #category : 'instance creation' }
NonLocalReturnTest class >> new [
	^ super new initialize
]

{ #category : 'expected trace' }
NonLocalReturnTest >> augmentExpectedTrace: expectedTrace depth: depth [
	| depthString |
	depthString := depth printString.
	expectedTrace
		add: 'enter preHome ' , depthString;
		add: 'enter home ' , depthString.
	depth > 1
		ifFalse: [ expectedTrace add: 'starting NLR ' , depthString]
		ifTrue: [ expectedTrace 
						add:  'enter protected ' , depthString;
						add: 'starting NLR ' , depthString;
						add: 'enter unwind ' , depthString.
					self augmentExpectedTrace: expectedTrace depth: depth - 1.
					expectedTrace add: 'exit unwind ' , depthString].
	expectedTrace
		add: 'preHome got returnVal nlrReturnValue ' , depthString;
		add: 'exit preHome ' , depthString
]

{ #category : 'expected trace' }
NonLocalReturnTest >> expectedTraceForWellNestedToDepth: depth [
	| expectedTrace |
	expectedTrace := Array new.
	self augmentExpectedTrace: expectedTrace depth: depth.
	^ expectedTrace
]

{ #category : 'winding and unwinding' }
NonLocalReturnTest >> home [
	"The home of the closure, thus the terminus of the NLR"

	| levelString closure |
	levelString := level printString.
	trace add: 'enter home ' , levelString.
	closure := [ trace add: 'starting NLR ' , levelString.
				^ 'nlrReturnValue ' , levelString ].
	self innerWithClosure: closure.

	"Should not get to here."
	trace add: 'exit home ' , levelString.
	^ 'normal return of home ' , levelString
]

{ #category : 'initialization' }
NonLocalReturnTest >> initialize [
	self initializeRandom
]

{ #category : 'initialization' }
NonLocalReturnTest >> initializeRandom [
	"Make and log a seed that spans the full SmallInteger range,
	which is 61 bits including sign.Create the random number generator using this seed.
	An intermediate large integer is created half the time, which is OK since this 
	method is used only once per new instance of this test."

	| hostRandom lower32 upper29 seed |
	hostRandom := HostRandom new.
	lower32 := hostRandom integer.
	upper29 := hostRandom integer bitAnd: 16r1FFFFFFF.
	seed := (upper29 bitShift: 32) + lower32 + SmallInteger minimumValue.
	self logSeed: seed.
	random := Lag1MwcRandom seed: seed
]

{ #category : 'winding and unwinding' }
NonLocalReturnTest >> innerWithClosure: closure [
	level > 1
		ifTrue: [ self nestWithClosure: closure ]
		ifFalse: closure
]

{ #category : 'logging' }
NonLocalReturnTest >> log: aString [
	self logCr: Time now asStringMs , ' ' , self asOop printString , '  ' , aString
]

{ #category : 'logging' }
NonLocalReturnTest >> logSeed: anInteger [
	self log: 'Setting random seed to ' , anInteger printString
]

{ #category : 'winding and unwinding' }
NonLocalReturnTest >> nestWithClosure: closure [
	| levelString |
	levelString := level printString.
	level := level - 1.
	[trace add: 'enter protected ' , levelString.
	closure value.
	trace add: 'exit protected ' , levelString ]
		ifCurtailed: [ 
			trace add: 'enter unwind ' , levelString.
			self preHome.
			trace add: 'exit unwind ' , levelString ]
]

{ #category : 'winding and unwinding' }
NonLocalReturnTest >> preHome [
	"The sender of the home activation, thus where NLRs return to."

	| levelString returnVal |
	levelString := level printString.
	trace add: 'enter preHome ' , levelString.
	returnVal := self home.
	trace add: 'preHome got returnVal ' , returnVal.
	trace add: 'exit preHome ' , levelString
]

{ #category : 'future tests' }
NonLocalReturnTest >> testMessilyNestedNLRs [

	"Tests NLRs, some of which have a terminus that is below one or more unwind blocks."

	self assert: true equals: false
]

{ #category : 'tests' }
NonLocalReturnTest >> testWellNestedNLRs [
	"Nest non-local returns to many different arbitrary levels,and make sure things happen in the correct order.
	Always test the more common small depths, then a bunch of random larger depths.
	These are all 'well-nested' NLRs -- those that only abnormally terminate *part* of an unwind block, never
	the *entire* unwind block."

	| max |
	max := 100.
	1 to: 3 do: [ :i | self wellNestedToDepth: i ].
	50 timesRepeat: [ self wellNestedToDepth: (random integerBetween: 4 and: max) ]
]

{ #category : 'future tests' }
NonLocalReturnTest >> testWellNestedNLRsWithExtraUnwindBlocks [

	"Tests well-nested NLRs with randomly-placed unwind blocks that complete without adding an NLR nesting level."

	self assert: true equals: false
]

{ #category : 'support' }
NonLocalReturnTest >> wellNestedToDepth: depth [
	"Strictly nest NLRs to the given depth, and assert that things happen in the correct order."

	| expectedTrace |
	trace := Array new.
	level := depth.
	self preHome.
	expectedTrace := self expectedTraceForWellNestedToDepth: depth.
	self assert: trace equals: expectedTrace
]
