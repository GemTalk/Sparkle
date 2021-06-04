"
These tests are actually independent of Sparkle, and test base debugging functionality.
They are (with minor exceptions) replicared in ernie0.
"
Class {
	#name : 'BreakpointHandlingTest',
	#superclass : 'TestCase',
	#instVars : [
		'utility',
		'process',
		'trace',
		'priority'
	],
	#category : 'Sparkle-Tools-GemStone-Test'
}

{ #category : 'support' }
BreakpointHandlingTest >> advanceToBreakpoint [
	self
		advanceToControlInterrupt;
		assert: trace size equals: 1;
		assert: trace next class equals: Breakpoint
]

{ #category : 'support' }
BreakpointHandlingTest >> advanceToControlInterrupt [
	process resume.
	(Delay forMilliseconds: 100) wait.
	self assertSuspended
]

{ #category : 'support' }
BreakpointHandlingTest >> advanceToEnd [
	process resume.
	(Delay forMilliseconds: 100) wait.
	self
		denySuspended;
		assert: process _isTerminated;
		assert: trace size equals: 0
]

{ #category : 'support' }
BreakpointHandlingTest >> advanceToHalt [
	self
		advanceToControlInterrupt;
		assert: trace size equals: 1;
		assert: trace next class equals: Halt
]

{ #category : 'asserting' }
BreakpointHandlingTest >> assertSuspended [
	self assertSuspended: process
]

{ #category : 'asserting' }
BreakpointHandlingTest >> assertSuspended: aProcess [

	self assert: (self isSuspended: aProcess)
]

{ #category : 'asserting' }
BreakpointHandlingTest >> denySuspended [
	self denySuspended: process
]

{ #category : 'asserting' }
BreakpointHandlingTest >> denySuspended: aProcess [

	self deny: (self isSuspended: aProcess)
]

{ #category : 'support' }
BreakpointHandlingTest >> isSuspended: aProcess [

	^ProcessorScheduler scheduler _isSuspended: aProcess
]

{ #category : 'support' }
BreakpointHandlingTest >> levelsSelect: aBlock inProcess: aProcess [
	"Answer an array of levels for which the block answers true.
	The argument to the block is the frame contents array."

	| result |
	result := {}.

	1 to: aProcess stackDepth do: [ :level | 
		(aBlock value: (aProcess _frameContentsAt: level))
			ifTrue: [ result add: level ] ].
	^ result
]

{ #category : 'support' }
BreakpointHandlingTest >> levelsWithSelector: selector [
	^ self levelsWithSelector: selector inProcess: process
]

{ #category : 'support' }
BreakpointHandlingTest >> levelsWithSelector: selector inProcess: aProcess [
	^ self
		levelsSelect: [ :fc | fc first selector == selector ]
		inProcess: aProcess
]

{ #category : 'support' }
BreakpointHandlingTest >> processBlock: aBlock [
	process := [ 
	aBlock
		on: ControlInterrupt
		do: [ :ex | 
			trace nextPut: ex.
			process suspend.
			ex resume ] ] newProcess.
	process
		priority: priority;
		breakpointLevel: 1.
]

{ #category : 'support' }
BreakpointHandlingTest >> setUp [

	super setUp.
	GsNMethod clearAllBreaks.
	utility := BreakpointHandling new.
	trace := SharedQueue new.
	priority := Processor activePriority - 1
]

{ #category : 'support' }
BreakpointHandlingTest >> stepOverInLevel: aLevel [

	process
		stepOverFromLevel: aLevel.
	self advanceToBreakpoint
]

{ #category : 'support' }
BreakpointHandlingTest >> tearDown [
	GsNMethod clearAllBreaks.
	process
		ifNotNil: [ 
			process terminate.
			process := nil ]
]

{ #category : 'tests' }
BreakpointHandlingTest >> testMethodSteppingIsLocalToOneProcess [
	"This test ensures that when you have a debugger on a process and #step, the step action applies
	to the specific process. The step shouldn't apply to other processes executing the same method."

	|  haltingProcess independentProcess   level haltingMethod haltingCounter independentCounter independentCounterCache |
	utility := BreakpointHandling new.
	trace := SharedQueue new.
	priority := Processor activePriority - 1.
	haltingCounter := {0}.
	independentCounter := {0}.
	haltingProcess := [ 
	[ utility runHotForSeconds: 6 shouldHalt: true counter: haltingCounter ]
		on: Breakpoint , Halt
		do: [ :ex | 
			trace nextPut: #'HaltingProcess'.
			trace nextPut: ex.
			haltingProcess suspend.
			ex resume ] ] newProcess.
	independentProcess := [ 
	[ utility runHotForSeconds: 6 shouldHalt: false counter: independentCounter ]
		on: Breakpoint , Halt
		do: [ :ex | 
			trace nextPut: #'RunningProcess'.
			trace nextPut: ex.
			independentProcess suspend.
			ex resume ] ] newProcess.
	haltingProcess
		priority: priority;
		breakpointLevel: 1.
	independentProcess
		priority: priority;
		breakpointLevel: 1;
		convertToPortableStack.
	[ 
	haltingProcess resume.
	(Delay forMilliseconds: 100) wait.
	self assertSuspended: haltingProcess.
	independentCounterCache := independentCounter first.
	level := 10.
	haltingMethod := (haltingProcess _frameContentsAt: level) first.
	self
		assert: haltingMethod selector
		equals: #'runHotForSeconds:shouldHalt:counter:'.
	self assert: trace size equals: 2.
	self assert: trace next equals: #'HaltingProcess'.
	self assert: trace next class equals: Halt.

	independentProcess resume.
	(Delay forMilliseconds: 100) wait.
	independentProcess convertToPortableStack.

	haltingProcess stepOverFromLevel: level.
	(Delay forMilliseconds: 100) wait.

	self assertSuspended: haltingProcess.
	self denySuspended: independentProcess.
	self assert: trace size equals: 0.
	self assert: independentCounter first > independentCounterCache.
	independentProcess terminate.
	self assert: independentProcess _isTerminated.

	haltingProcess resume.
	(Delay forMilliseconds: 100) wait.
	self assertSuspended: haltingProcess.
	self assert: trace size equals: 2.
	self assert: trace next equals: #'HaltingProcess'.
	self assert: trace next class equals: Breakpoint ]
		ensure: [ 
			haltingProcess terminate.
			independentProcess terminate ]
]

{ #category : 'tests' }
BreakpointHandlingTest >> testStepNonLocalReturn [
	"This test ensures that a step through a non-local return ends up in a reasonable place."

	| result levels numberOfLevels |
	self processBlock: [ result := utility nlr2 ].
	self advanceToHalt.
	levels := self levelsWithSelector: #'nlr2'.
	numberOfLevels := levels size.
	self assert: numberOfLevels equals: 1.
	self stepOverInLevel: levels first.	"Advance to block value"
	levels := self levelsWithSelector: #'nlr2'.
	numberOfLevels := levels size.
	self assert: numberOfLevels equals: 1.
	self stepOverInLevel: levels first.	"Advance into block, just before non-local return"
	levels := self levelsWithSelector: #'nlr2'.
	numberOfLevels := levels size.
	self assert: numberOfLevels equals: 1.
	levels := self
		levelsSelect: [ :fc | 
			| method |
			method := fc first.
			method isMethodForBlock and: [ method homeMethod selector == #'nlr2' ] ]
		inProcess: process.
	numberOfLevels := levels size.
	self assert: numberOfLevels equals: 1.
	self stepOverInLevel: levels first.	"Step over non-local return"
	levels := self levelsWithSelector: #'nlr2'.
	numberOfLevels := levels size.
	self assert: numberOfLevels equals: 0. "Should have returned from home method."	
	self advanceToEnd.
	self assert: result equals: 42
]

{ #category : 'tests' }
BreakpointHandlingTest >> testStepOverInRecursion [
	"This test ensures that when you step over in a method that is on the stack multiple times (recursion)
	the step stops in the level of the step, not the topmost occuurrence of the method."

	| result factorialLevels numberOfLevels |
	self processBlock: [ result := utility factorialOf: 10 stopAt: 5 ].
	self advanceToHalt.
	factorialLevels := self levelsWithSelector: #'factorialOf:stopAt:'.
	numberOfLevels := factorialLevels size.
	self assert: numberOfLevels equals: 6.
	self stepOverInLevel: (factorialLevels at: 5).
	factorialLevels := self levelsWithSelector: #'factorialOf:stopAt:'.
	numberOfLevels := factorialLevels size.
	self assert: numberOfLevels equals: 2.
	self advanceToEnd.
	self assert: result equals: 10 factorial
]
