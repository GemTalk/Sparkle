"
Tests of breakpoint handling in GemStone, using a single process.
"
Class {
	#name : 'BreakpointHandlingTest',
	#superclass : 'SingleProcessDebuggingTest',
	#category : 'Sparkle-Tools-GemStone-Test'
}

{ #category : 'code to test' }
BreakpointHandlingTest >> nlr2 [
	| block |
	block := [ ^ 42 ].
	self halt.
	block value.
	^ 42 printString
]

{ #category : 'tests' }
BreakpointHandlingTest >> testRecursionStepOutOfFrame [
	"This test ensures that debugging a recursive processes will allow stepping out of a frame to the next lower one.
	Bug 49574"

	| result processMethod level frameAtLevel initialNumberOfRecursiveFrames finalNumberOfRecursiveFrames |
	self processBlock: [ result := self factorialOf: 10 stopAt: 4 ].

	self advanceToControlInterrupt.
	initialNumberOfRecursiveFrames := (self
		levelsWithSelector: #'factorialOf:stopAt:') size.
	level := self firstFrameBelowHalt.
	self log: #'defaultProcess' processEssentials: process frameLevel: level.
	frameAtLevel := process _frameContentsAt: level.
	processMethod := frameAtLevel first.
	self assert: processMethod selector equals: #'factorialOf:stopAt:'.
	self assertOneTraceEntry.
	self assertNextTraceKey: #'DefaultProcess' valueClass: Halt.	"Server bug: stepping off the end of a recursive method does not stop in the next lower frame. Process will run to completion."
	7
		timesRepeat: [ 
			self stepOverInLevel: level.
			level := self firstFrameBelowHalt + 1.
			self log: #'defaultProcess' processEssentials: process frameLevel: level ].

	self assertSuspended.
	finalNumberOfRecursiveFrames := (self
		levelsWithSelector: #'factorialOf:stopAt:') size.
	self
		assert: finalNumberOfRecursiveFrames
		equals: initialNumberOfRecursiveFrames - 1
]

{ #category : 'tests expected to fail for now' }
BreakpointHandlingTest >> testRecursionStepPointOddity [
	"An earlier version of testMultiProcessSteppingInSameMethod used the GsProcess for 'stepOver...' which
 doesn't actually step, just sets the step breakpoint. But it also messed up how the stack frame reported
 itself - reverted @9 line 6 to @1 line 1.
Need to recreate that specific scenario."

	"This test ensures that debugging multiple processes will faithfully honor step points in both processes."

	| result processMethod level frameAtLevel |
	self processBlock: [ result := self factorialOf: 10 stopAt: 4 ].

	self advanceToControlInterrupt.
	level := self firstFrameBelowHalt.
	self log: #'defaultProcess' processEssentials: process frameLevel: level.
	frameAtLevel := process _frameContentsAt: level.
	processMethod := frameAtLevel first.
	self assert: processMethod selector equals: #'factorialOf:stopAt:'.
	self assertOneTraceEntry.
	self assertNextTraceKey: #'DefaultProcess' valueClass: Halt.	

	"The ipOffset of deeper recursive frames should be the same."
	self
		assert: (process _frameContentsAt: level + 1) second
		equals: (process _frameContentsAt: level + 2) second.

	process setStepOverBreaksAtLevel: level.
	self waitMS: 100.
	self assertSuspended.	

	"The ipOffset shouldn't change just from setting step breakpoints."
	self
		assert: (process _frameContentsAt: level + 1) second
		equals: (process _frameContentsAt: level + 2) second
]

{ #category : 'tests' }
BreakpointHandlingTest >> testStepNonLocalReturn [
	"This test ensures that a step through a non-local return ends up in a reasonable place."

	| result levels numberOfLevels |
	self processBlock: [ result := self nlr2 ].
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
			method isMethodForBlock and: [ method homeMethod selector == #'nlr2' ] ].
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
	self processBlock: [ result := self factorialOf: 10 stopAt: 5 ].
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
