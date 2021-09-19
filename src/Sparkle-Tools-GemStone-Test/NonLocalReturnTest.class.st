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
	random := Lag1MwcRandom
]

{ #category : 'logging' }
NonLocalReturnTest >> log: aString [
	self logCr: Time now asStringMs , ' ' , self asOop printString , '  ' , aString
]

{ #category : 'logging' }
NonLocalReturnTest >> logSeed: anInteger [
	self log: 'Setting random seed to ' , anInteger printString
]

{ #category : 'support' }
NonLocalReturnTest >> setUp [

	super setUp.
	trace := Array new.
]

{ #category : 'tests' }
NonLocalReturnTest >> testWellNestedNLRs [
	"Nest non-local returns to many different arbitrary levels,and make sure things happen in the correct order."

	| max |
	max := 500.
	1 to: 3 do: [ :i | self wellNestedToDepth: i ].
	50
		timesRepeat: [ self wellNestedToDepth: ('random' integerBetween: 4 and: max) ]
]

{ #category : 'support' }
NonLocalReturnTest >> wellNestedToDepth: depth [
	"Strictly nest NLRs to the given depth, and assert that things happen in the correct order."

	self assert: false.
]
