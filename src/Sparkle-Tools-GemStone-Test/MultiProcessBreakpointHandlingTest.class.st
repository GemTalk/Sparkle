Class {
	#name : 'MultiProcessBreakpointHandlingTest',
	#superclass : 'MultiProcessDebuggingTest',
	#category : 'Sparkle-Tools-GemStone-Test'
}

{ #category : 'tests' }
MultiProcessBreakpointHandlingTest >> testMethodSteppingIsLocalToOneProcess [
	"This test ensures that when you have a debugger on a process and #step, the step action applies
	to the specific process. The step shouldn't apply to other processes executing the same method."

	| haltingProcess independentProcess level haltingMethod haltingCounter independentCounter independentCounterCache |
	haltingCounter := GsCounter new.
	independentCounter := GsCounter new.
	haltingProcess := self
		newProcessForBlock: [ self runHotForSeconds: 6 shouldHalt: true counter: haltingCounter ]
		id: #'HaltingProcess'.
	independentProcess := self
		newProcessForBlock: [ self runHotForSeconds: 6 shouldHalt: false counter: independentCounter ]
		id: #'IndependentProcess'.
	independentProcess
		convertToPortableStack.
	self advanceToControlInterruptIn: haltingProcess.
	independentCounterCache := independentCounter current.
	level := self firstFrameBelowHalt.
	haltingMethod := (haltingProcess _frameContentsAt: level) first.
	self
		assert: haltingMethod selector
		equals: #'runHotForSeconds:shouldHalt:counter:'.
	self assertOneTraceEntry.
	self assertNextTraceKey: #'HaltingProcess' valueClass: Halt.

	independentProcess resume.
	(self waitMS: 100).
	independentProcess convertToPortableStack.

	haltingProcess stepOverFromLevel: level.
	(self waitMS: 100).

	self assertSuspended: haltingProcess.
	self denySuspended: independentProcess.
	self assertNoTraceEntries.
	self assert: independentCounter current > independentCounterCache.
	independentProcess terminate.
	self assert: independentProcess _isTerminated.

	self advanceToControlInterruptIn: haltingProcess.
	self assertOneTraceEntry.
	self assertNextTraceKey: #'HaltingProcess' valueClass: Breakpoint
]

{ #category : 'tests' }
MultiProcessBreakpointHandlingTest >> testMultiProcessBreakpointHandlingInSameMethodAfterHalting [
	"This test ensures that two processes debugging the same method don't interfere with each other's breakpoints."

	| firstResult firstProcess firstProcessMethod secondResult secondProcess secondProcessMethod level frameAtLevel |
	firstProcess := self
		newProcessForBlock: [ firstResult := self factorialOf: 10 stopAt: 6 ]
		id: #'FirstProcess'.
	secondProcess := self
		newProcessForBlock: [ secondResult := self factorialOf: 10 stopAt: 4 ]
		id: #'SecondProcess'.

	self log: 'Set up first process'.
	self advanceToControlInterruptIn: firstProcess.
	level := self firstFrameBelowHalt.
	self log: #firstProcess processEssentials: firstProcess frameLevel: level.
	frameAtLevel := firstProcess _frameContentsAt: level.
	firstProcessMethod := frameAtLevel first.
	self assert: firstProcessMethod selector equals: #'factorialOf:stopAt:'.
	self assertOneTraceEntry.
	self assertNextTraceKey: #'FirstProcess' valueClass: Halt.

	self log: 'Set up second process'.
	self advanceToControlInterruptIn: secondProcess.
	self log: #secondProcess processEssentials: secondProcess frameLevel: level.
	frameAtLevel := secondProcess _frameContentsAt: level.
	secondProcessMethod := frameAtLevel first.
	self assert: secondProcessMethod selector equals: #'factorialOf:stopAt:'.
	self assertOneTraceEntry.
	self assertNextTraceKey: #'SecondProcess' valueClass: Halt.

	"Set the breakpoint for the second process."
	self
		setMethodBreakAtStepPoint: 10
		inMethod: (DebuggingTest compiledMethodAt: #factorialOf:stopAt:)
		forProcess: secondProcess.

	"Finish the first process. It should not encounter the second process' breakpoint."
	self log: 'Finish first process'.
	self advanceToEndIn: firstProcess.
	self log: #firstProcess processEssentials: firstProcess frameLevel: level.

	"Run the second process to its breakpoint."
	self log: 'Advance second process to breakpoint'.
	self advanceToBreakpointIn: secondProcess.
	self log: #secondProcess processEssentials: secondProcess frameLevel: level.

	"Run the second process to its breakpoint again, to ensure it sticks around."
	self log: 'Advance second process to breakpoint'.
	self advanceToBreakpointIn: secondProcess.
	self log: #secondProcess processEssentials: secondProcess frameLevel: level.
]
