"
Abstract, tests for debugging operations on a single process.

process is the process being debugged.
"
Class {
	#name : 'SingleProcessDebuggingTest',
	#superclass : 'DebuggingTest',
	#instVars : [
		'process'
	],
	#category : 'Sparkle-Tools-GemStone-Test'
}

{ #category : 'Testing' }
SingleProcessDebuggingTest class >> isAbstract [
	^ self sunitName = #'SingleProcessDebuggingTest'
]

{ #category : 'support - process' }
SingleProcessDebuggingTest >> advanceToBreakpoint [
	self advanceToBreakpointIn: process
]

{ #category : 'support - process' }
SingleProcessDebuggingTest >> advanceToControlInterrupt [
	self advanceToControlInterruptIn: process
]

{ #category : 'support - process' }
SingleProcessDebuggingTest >> advanceToEnd [
	self advanceToEndIn: process
]

{ #category : 'support - process' }
SingleProcessDebuggingTest >> advanceToHalt [
	self advanceToHaltIn: process
]

{ #category : 'support - process' }
SingleProcessDebuggingTest >> assertSuspended [
	self assertSuspended: process
]

{ #category : 'support - process' }
SingleProcessDebuggingTest >> denySuspended [
	self denySuspended: process
]

{ #category : 'support - process' }
SingleProcessDebuggingTest >> levelsSelect: aBlock [
	"Answer an array of levels for which the block answers true.
	The argument to the block is the frame contents array."

	^ self levelsSelect: aBlock inProcess: process
]

{ #category : 'support - process' }
SingleProcessDebuggingTest >> levelsWithSelector: selector [
	^ self levelsWithSelector: selector inProcess: process
]

{ #category : 'support - process' }
SingleProcessDebuggingTest >> processBlock: aBlock [
	process := self newProcessForBlock: aBlock id: #'DefaultProcess'
]

{ #category : 'support - breaking' }
SingleProcessDebuggingTest >> setAllStepBreaksIn: aMethod [
	^ self setAllStepBreaksIn: aMethod forProcess: process
]

{ #category : 'support - breaking' }
SingleProcessDebuggingTest >> setMethodBreakAtStepPoint: aStepPoint inMethod: aMethod [
	^ self
		setMethodBreakAtStepPoint: aStepPoint
		inMethod: aMethod
		forProcess: process
]

{ #category : 'support - breaking' }
SingleProcessDebuggingTest >> setStepBreakAtStepPoint: aStepPoint inMethod: aMethod [
	^ self
		setStepBreakAtStepPoint: aStepPoint
		inMethod: aMethod
		forProcess: process
]

{ #category : 'support - process' }
SingleProcessDebuggingTest >> stepOverInLevel: aLevel [
	self stepOverInLevel: aLevel inProcess: process
]

{ #category : 'support' }
SingleProcessDebuggingTest >> tearDown [
	process ifNotNil: [ :p | p terminate ].
	process := nil.
	super tearDown
]
