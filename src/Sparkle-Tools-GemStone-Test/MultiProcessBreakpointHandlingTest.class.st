Class {
	#name : 'MultiProcessBreakpointHandlingTest',
	#superclass : 'MultiProcessDebuggingTest',
	#category : 'Sparkle-Tools-GemStone-Test'
}

{ #category : 'code to test' }
MultiProcessBreakpointHandlingTest >> factorialOf: anInteger afterWaitingMS: milliseconds [
	"First factorial is so that we get a halt before the wait."

	self factorialOf: 1 stopAt: 1.
	self waitMS: milliseconds.
	^ self factorialOf: anInteger stopAt: 0
]

{ #category : 'code to test' }
MultiProcessBreakpointHandlingTest >> fibonacciGenerations: genInt stopAt: stopInt [
	| fNumbers howMany |
	fNumbers := OrderedCollection with: 0 with: 1.
	[ (howMany := fNumbers size) < genInt ]
		whileTrue: [ 
			howMany = stopInt
				ifTrue: [ self halt ].
			fNumbers add: (fNumbers at: howMany) + (fNumbers at: howMany - 1) ].
	^ fNumbers at: genInt	"Can''t use #last in case genInt = 1"
]

{ #category : 'tests expected to fail for now' }
MultiProcessBreakpointHandlingTest >> testBreakpointHandlingInSameMethod [
	"This test ensures that two processes debugging the same method don't interfere with each other's breakpoints."

	| firstResult firstProcess firstProcessMethod secondResult secondProcess secondProcessMethod level frameAtLevel |
	firstProcess := self
		newProcessForBlock: [ firstResult := self factorialOf: 10 stopAt: 6 ]
		id: #'FirstProcess'.
	secondProcess := self
		newProcessForBlock: [ secondResult := self factorialOf: 10 stopAt: 4 ]
		id: #'SecondProcess'.

	"Set the breakpoint for the second process."
	self
		setMethodBreakAtStepPoint: 10
		inMethod: (DebuggingTest compiledMethodAt: #factorialOf:stopAt:)
		forProcess: secondProcess.

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
"	self setMethodBreakAtStepPoint: 10 inMethod: secondProcessMethod forProcess: secondProcess."

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

{ #category : 'tests' }
MultiProcessBreakpointHandlingTest >> testBreakpointHandlingInSameMethodAfterHalting [
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

{ #category : 'tests expected to fail for now' }
MultiProcessBreakpointHandlingTest >> testBreakpointHandlingInSameMethodBeforeHalting [
	"This test ensures that two processes debugging the same method don't interfere with each other's breakpoints."

	| firstResult firstProcess firstProcessMethod secondResult secondProcess secondProcessMethod level frameAtLevel |
	firstProcess := self
		newProcessForBlock: [ firstResult := self factorialOf: 10 stopAt: 6 ]
		id: #'FirstProcess'.
	secondProcess := self
		newProcessForBlock: [ secondResult := self factorialOf: 10 stopAt: 4 ]
		id: #'SecondProcess'.

	"Set the breakpoint for the second process."
	self
		setMethodBreakAtStepPoint: 10
		inMethod: (DebuggingTest compiledMethodAt: #factorialOf:stopAt:)
		forProcess: secondProcess.

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

	haltingProcess setStepOverBreaksAtLevel: level.
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

{ #category : 'tests expected to fail for now' }
MultiProcessBreakpointHandlingTest >> testSteppingInDifferentMethods [
	"This test ensures that debugging multiple processes will faithfully honor step points in both processes."

	| factorial factorialProcess factorialMethod fibonacci fibonacciProcess fibonacciMethod level |
	factorialProcess := self
		newProcessForBlock: [ factorial := self factorialOf: 10 stopAt: 5 ]
		id: #'FactorialProcess'.
	fibonacciProcess := self
		newProcessForBlock: [ fibonacci := self fibonacciGenerations: 10 stopAt: 4 ]
		id: #'FibonacciProcess'.

	self advanceToControlInterruptIn: factorialProcess.
	level := self firstFrameBelowHalt.
	factorialMethod := (factorialProcess _frameContentsAt: level) first.
	self assert: factorialMethod selector equals: #'factorialOf:stopAt:'.
	self assertOneTraceEntry.
	self assertNextTraceKey: #'FactorialProcess' valueClass: Halt.

	self advanceToControlInterruptIn: fibonacciProcess.
	fibonacciMethod := (fibonacciProcess _frameContentsAt: level) first.
	self assert: fibonacciMethod selector equals: #'fibonacciGenerations:stopAt:'.
	self assertOneTraceEntry.
	self assertNextTraceKey: #'FibonacciProcess' valueClass: Halt.

"	self setAllStepBreaksIn: factorialMethod forProcess: factorialProcess.
	self setAllStepBreaksIn: fibonacciMethod forProcess: fibonacciProcess."
	self setStepBreakAtStepPoint: 11 inMethod: factorialMethod forProcess: factorialProcess.		"Last step point in method"
	self setStepBreakAtStepPoint: 17 inMethod: fibonacciMethod forProcess: fibonacciProcess.	"Last step point in method"

	self advanceToControlInterruptIn: factorialProcess.
	self assertOneTraceEntry.
	self assertNextTraceKey: #'FactorialProcess' valueClass: Breakpoint.

	"This next test is currently expected to fail, as the previous process cleared all step points in the gem.
	 It would work if the step points were reset here. But we want it to fail until the server is changed."
"	self setAllStepBreaksIn: fibonacciMethod forProcess: fibonacciProcess."
"	self setStepBreakAtStepPoint: 17 inMethod: fibonacciMethod forProcess: fibonacciProcess."	"Last step point in method"
	self advanceToControlInterruptIn: fibonacciProcess.
	self assertOneTraceEntry.
	self assertNextTraceKey: #'FibonacciProcess' valueClass: Breakpoint.

	self assertSuspended: factorialProcess.
	self assertSuspended: fibonacciProcess
]

{ #category : 'tests expected to fail for now' }
MultiProcessBreakpointHandlingTest >> testSteppingInSameMethod [
	"This test ensures that debugging multiple processes will faithfully honor step points in both processes."

	| firstResult firstProcess firstProcessMethod secondResult secondProcess secondProcessMethod level frameAtLevel |
	firstProcess := self
		newProcessForBlock: [ firstResult := self factorialOf: 10 afterWaitingMS: 3000 ]
		id: #'FirstProcess'.
	secondProcess := self
		newProcessForBlock: [ secondResult := self factorialOf: 10 afterWaitingMS: 10 ]
		id: #'SecondProcess'.

	self log: 'Set up first process'.
	self advanceToControlInterruptIn: firstProcess.
	level := self firstFrameBelowHalt + 1.
	self log: #firstProcess processEssentials: firstProcess frameLevel: level.
	frameAtLevel := firstProcess _frameContentsAt: level.
	firstProcessMethod := frameAtLevel first.
	self assert: firstProcessMethod selector equals: #'factorialOf:afterWaitingMS:'.
	self assertOneTraceEntry.
	self assertNextTraceKey: #'FirstProcess' valueClass: Halt.

	"Advance to the #waitMS: send."
	self stepOverInLevel: level inProcess: firstProcess.
	self log: #firstProcess processEssentials: firstProcess frameLevel: level.


	self log: 'Set up second process'.
	self advanceToControlInterruptIn: secondProcess.
	self log: #secondProcess processEssentials: secondProcess frameLevel: level.
	frameAtLevel := secondProcess _frameContentsAt: level.
	secondProcessMethod := frameAtLevel first.
	self assert: secondProcessMethod selector equals: #'factorialOf:afterWaitingMS:'.
	self assertOneTraceEntry.
	self assertNextTraceKey: #'SecondProcess' valueClass: Halt.

	"Advance to the #waitMS: send."
	self stepOverInLevel: level inProcess: secondProcess.
	self log: #secondProcess processEssentials: secondProcess frameLevel: level.

	"Start the first process stepping over the #waitMS: send (long)."
	self log: 'Step first process over #waitMS: send'.
	firstProcess
		setStepOverBreaksAtLevel: level;
		resume.
	self log: #firstProcess processEssentials: firstProcess frameLevel: level.

	"Step the second process over the #waitMS: send and the second #factorialOf:stopAt: send."
	self log: 'Step second process over #waitMS: send'.
	self stepOverInLevel: level inProcess: secondProcess.
	self log: #secondProcess processEssentials: secondProcess frameLevel: level.
	self log: 'Step second process over second #factorialOf:stopAt: send'.
	self stepOverInLevel: level inProcess: secondProcess.
	self log: #secondProcess processEssentials: secondProcess frameLevel: level.

	self assert: firstResult isNil description: 'First process yielded result too soon'.
	self assert: secondResult isNil description: 'Second process yielded result too soon'.
	"Finish the second process"
	self advanceToEndIn: secondProcess.

	"Wait for the first process to finish the step (expected to fail currently)"
	self log: 'Wait for first process to finish #waitMS: send'.
	(self waitMS: 200).	"Second process used up 2x100ms waits stepping."
	self assertSuspended: firstProcess.
	self log: #firstProcess processEssentials: firstProcess frameLevel: level.

	self assert: firstResult isNil description: 'First process should not have finished to produce a result'.
	self deny: secondResult isNil description: 'Second process failed to yield a result'.
]
