"
These tests are actually independent of Sparkle, and test base debugging functionality.
They are (with minor exceptions) replicared in ernie0.

Most tests require only a single process. These tests can use the 'default process' API which is simpler and more readable. 
Use #processBlock: to establish a default process for the test.

When tests require multiple processes, each process needs to be identified. These tests use the 'specific process' API.
Use #processBlock:forID: to establish each such processes.

The 'IDed process' API is expected to go away as unnecessary.

The processes created using #processBlock: and #processBlock:forID: record a trace of ControlInterrupts encountered during execution.
Each trace entry is an association of the process' ID with the exception encountered. These trace entries can be examined during the test.

The logging API and instance variable can be used to record diagnostic information that would be helpful debugging tests.
"
Class {
	#name : 'BreakpointHandlingTest',
	#superclass : 'TestCase',
	#instVars : [
		'utility',
		'defaultProcess',
		'processes',
		'trace',
		'priority',
		'log'
	],
	#category : 'Sparkle-Tools-GemStone-Test'
}

{ #category : 'support - default process' }
BreakpointHandlingTest >> advanceToBreakpoint [
	self advanceToBreakpointIn: defaultProcess
]

{ #category : 'support - specific process' }
BreakpointHandlingTest >> advanceToBreakpointIn: aProcess [
	self
		advanceToControlInterruptIn: aProcess;
		assertOneTraceEntry;
		assertNextTraceValueClass: Breakpoint
]

{ #category : 'support - IDed process' }
BreakpointHandlingTest >> advanceToBreakpointInProcessID: anID [
	self advanceToBreakpointIn: (self processWithID: anID)
]

{ #category : 'support - default process' }
BreakpointHandlingTest >> advanceToControlInterrupt [
	self advanceToControlInterruptIn: defaultProcess
]

{ #category : 'support - specific process' }
BreakpointHandlingTest >> advanceToControlInterruptIn: aProcess [
	aProcess resume.
	(self waitMS: 100).
	self assertSuspended: aProcess
]

{ #category : 'support - IDed process' }
BreakpointHandlingTest >> advanceToControlInterruptInProcessNamed: aName [
	self advanceToControlInterruptIn: (self processNamed: aName)
]

{ #category : 'support - default process' }
BreakpointHandlingTest >> advanceToEnd [
	self advanceToEndIn: defaultProcess
]

{ #category : 'support - specific process' }
BreakpointHandlingTest >> advanceToEndIn: aProcess [
	aProcess resume.
	(self waitMS: 100).
	self
		denySuspended: aProcess;
		assert: aProcess _isTerminated;
		assertNoTraceEntries
]

{ #category : 'support - IDed process' }
BreakpointHandlingTest >> advanceToEndInProcessID: anID [
	self advanceToEndIn: (self processWithID: anID)
]

{ #category : 'support - default process' }
BreakpointHandlingTest >> advanceToHalt [
	self advanceToHaltIn: defaultProcess
]

{ #category : 'support - specific process' }
BreakpointHandlingTest >> advanceToHaltIn: aProcess [
	self
		advanceToControlInterruptIn: aProcess;
		assertOneTraceEntry;
		assertNextTraceValueClass: Halt
]

{ #category : 'support - IDed process' }
BreakpointHandlingTest >> advanceToHaltInProcessID: anID [
	self advanceToHaltIn: (self processWithID: anID)
]

{ #category : 'asserting' }
BreakpointHandlingTest >> assertNextTraceKey: anID valueClass: aBehavior [
	| nextTrace |
	nextTrace := trace next.
	self assert: nextTrace key equals: anID.
	self assert: nextTrace value class equals: aBehavior
]

{ #category : 'asserting' }
BreakpointHandlingTest >> assertNextTraceValueClass: aBehavior [
	| nextTrace |
	nextTrace := trace next.
	self assert: nextTrace value class equals: aBehavior
]

{ #category : 'asserting' }
BreakpointHandlingTest >> assertNoTraceEntries [
	self assert: trace size equals: 0
]

{ #category : 'asserting' }
BreakpointHandlingTest >> assertOneTraceEntry [
	self assert: trace size equals: 1
]

{ #category : 'support - default process' }
BreakpointHandlingTest >> assertSuspended [
	self assertSuspended: defaultProcess
]

{ #category : 'asserting' }
BreakpointHandlingTest >> assertSuspended: aProcess [
	self
		assert: (self isSuspended: aProcess)
		description: 'Process should have been suspended'
]

{ #category : 'support' }
BreakpointHandlingTest >> defaultProcessID [
	^#DefaultProcess
]

{ #category : 'support - default process' }
BreakpointHandlingTest >> denySuspended [
	self denySuspended: defaultProcess
]

{ #category : 'asserting' }
BreakpointHandlingTest >> denySuspended: aProcess [
	self
		deny: (self isSuspended: aProcess)
		description: 'Process should not have been suspended'
]

{ #category : 'support' }
BreakpointHandlingTest >> firstFrameBelowHalt [
	"Answer the number of the frame below a #halt, considering all the overhead of signalling the exception."

	^ 10
]

{ #category : 'support - specific process' }
BreakpointHandlingTest >> isSuspended: aProcess [

	^ProcessorScheduler scheduler _isSuspended: aProcess
]

{ #category : 'support - default process' }
BreakpointHandlingTest >> levelsSelect: aBlock [
	"Answer an array of levels for which the block answers true.
	The argument to the block is the frame contents array."

	^ self levelsSelect: aBlock inProcess: defaultProcess
]

{ #category : 'support - specific process' }
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

{ #category : 'support - default process' }
BreakpointHandlingTest >> levelsWithSelector: selector [
	^ self levelsWithSelector: selector inProcess: defaultProcess
]

{ #category : 'support - specific process' }
BreakpointHandlingTest >> levelsWithSelector: selector inProcess: aProcess [
	^ self
		levelsSelect: [ :fc | fc first selector == selector ]
		inProcess: aProcess
]

{ #category : 'support - logging' }
BreakpointHandlingTest >> log: aString [
	log
		addAll: aString;
		lf
]

{ #category : 'support - logging' }
BreakpointHandlingTest >> log: aString processEssentials: aProcess frameLevel: levelInteger [
	| frameAtLevel frameAtNextHigherLevel methodAtLevel ipOffsetAtLevel stepPointAtLevel |
	aProcess _isTerminated
		ifTrue: [ self log: aString with: aProcess ]
		ifFalse: [ 
			frameAtLevel := aProcess _frameContentsAt: levelInteger.
			frameAtNextHigherLevel := aProcess _frameContentsAt: levelInteger - 1.
			methodAtLevel := frameAtLevel first.
			ipOffsetAtLevel := frameAtLevel second.
			stepPointAtLevel := aProcess _stepPointAt: levelInteger.

			self log: aString with: aProcess.
			self log: #'level' with: levelInteger.
			self log: #'frameAtLevel' with: frameAtLevel.
			self log: #'frameAtNextHigherLevel' with: frameAtNextHigherLevel.
			self log: #'stepPointAtLevel' with: stepPointAtLevel ].
	self logGroupSeparator
]

{ #category : 'support - logging' }
BreakpointHandlingTest >> log: aString with: anObject [

	self log: aString, ': ', anObject printString.
]

{ #category : 'support - logging' }
BreakpointHandlingTest >> logGroupSeparator [
	self
		log: '= = = = = = = = = =';
		log: ''.
]

{ #category : 'support - default process' }
BreakpointHandlingTest >> processBlock: aBlock [
	defaultProcess := self processBlock: aBlock forID: self defaultProcessID
]

{ #category : 'support - IDed process' }
BreakpointHandlingTest >> processBlock: aBlock forID: anID [
	| thisProcess |
	(processes includesKey: anID)
		ifTrue: [ self error: 'Process with ID ' , anID printString , ' already exists' ].
	thisProcess := [ 
	aBlock
		on: ControlInterrupt
		do: [ :ex | 
			self traceID: anID value: ex.
			thisProcess suspend.
			ex resume ] ] newProcess.
	thisProcess
		priority: priority;
		breakpointLevel: 1.
	processes at: anID put: thisProcess.
	^ thisProcess
]

{ #category : 'support - IDed process' }
BreakpointHandlingTest >> processWithID: anID [
	processes
		at: anID
		ifAbsent: [ self error: 'No process found for id ' , anID printString ]
]

{ #category : 'support - breaking' }
BreakpointHandlingTest >> setAllStepBreaksIn: aMethod [
	^ self setAllStepBreaksIn: aMethod forProcess: defaultProcess
]

{ #category : 'support - breaking' }
BreakpointHandlingTest >> setAllStepBreaksIn: aMethod forProcess: aProcess [
	aProcess convertToPortableStack.
	^ aMethod
		_setBreakAtIp: -1
		operation: 1
		frame: nil
		process: aProcess
		breakpointLevel: 1
]

{ #category : 'support - breaking' }
BreakpointHandlingTest >> setMethodBreakAtStepPoint: aStepPoint inMethod: aMethod [
	^ self
		setMethodBreakAtStepPoint: aStepPoint
		inMethod: aMethod
		forProcess: defaultProcess
]

{ #category : 'support - breaking' }
BreakpointHandlingTest >> setMethodBreakAtStepPoint: aStepPoint inMethod: aMethod forProcess: aProcess [
	| info |
	aProcess convertToPortableStack.
	info := aMethod _meth_ip_ForStepPoint: aStepPoint abs.
	self assert: info notNil description: 'Could not find ip for step point'.

	(info at: 1)
		_setBreakAtIp: (info at: 2)
		operation: 0
		frame: nil
		process: aProcess
		breakpointLevel: 1
]

{ #category : 'support - breaking' }
BreakpointHandlingTest >> setStepBreakAtStepPoint: aStepPoint inMethod: aMethod [
	^ self
		setStepBreakAtStepPoint: aStepPoint
		inMethod: aMethod
		forProcess: defaultProcess
]

{ #category : 'support - breaking' }
BreakpointHandlingTest >> setStepBreakAtStepPoint: aStepPoint inMethod: aMethod forProcess: aProcess [
	| result |
	aProcess convertToPortableStack.
	result := aMethod
		_breakOperation: 1
		forStepPoint: aStepPoint
		breakpointLevel: 1.
	self
		assert: result notNil
		description: 'Failed to set step point at step ' , aStepPoint printString.
	^ result
]

{ #category : 'support' }
BreakpointHandlingTest >> setUp [

	super setUp.
	GsNMethod clearAllBreaks.
	utility := BreakpointHandling new.
	trace := SharedQueue new.
	priority := Processor activePriority - 1.
	processes := Dictionary new.
	log := AppendableString new.
]

{ #category : 'support - default process' }
BreakpointHandlingTest >> stepOverInLevel: aLevel [
	self stepOverInLevel: aLevel inProcess: defaultProcess
]

{ #category : 'support - specific process' }
BreakpointHandlingTest >> stepOverInLevel: aLevel inProcess: aProcess [
	aProcess stepOverFromLevel: aLevel.
	self advanceToBreakpointIn: aProcess
]

{ #category : 'support - IDed process' }
BreakpointHandlingTest >> stepOverInLevel: aLevel inProcessID: anID [
	self stepOverInLevel: aLevel inProcess: (self processWithID: anID)
]

{ #category : 'support' }
BreakpointHandlingTest >> tearDown [
	GsNMethod clearAllBreaks.
	defaultProcess := nil.
	processes copy
		keysAndValuesDo: [ :eachName :eachProcess | 
			eachProcess terminate.
			processes removeKey: eachName ]
]

{ #category : 'tests' }
BreakpointHandlingTest >> testMethodSteppingIsLocalToOneProcess [
	"This test ensures that when you have a debugger on a process and #step, the step action applies
	to the specific process. The step shouldn't apply to other processes executing the same method."

	| haltingProcess independentProcess level haltingMethod haltingCounter independentCounter independentCounterCache |
	haltingCounter := GsCounter new.
	independentCounter := GsCounter new.
	haltingProcess := self
		processBlock: [ utility runHotForSeconds: 6 shouldHalt: true counter: haltingCounter ]
		forID: #'HaltingProcess'.
	independentProcess := self
		processBlock: [ utility runHotForSeconds: 6 shouldHalt: false counter: independentCounter ]
		forID: #'RunningProcess'.
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

{ #category : 'tests expected to fail for now' }
BreakpointHandlingTest >> testMultiProcessBreakpointHandlingInSameMethod [
	"This test ensures that two processes debugging the same method don't interfere with each other's breakpoints."

	| firstResult firstProcess firstProcessMethod secondResult secondProcess secondProcessMethod level frameAtLevel |
	firstProcess := self
		processBlock: [ firstResult := utility factorialOf: 10 stopAt: 6 ]
		forID: #'FirstProcess'.
	secondProcess := self
		processBlock: [ secondResult := utility factorialOf: 10 stopAt: 4 ]
		forID: #'SecondProcess'.

	"Set the breakpoint for the second process."
	self
		setMethodBreakAtStepPoint: 10
		inMethod: (BreakpointHandling compiledMethodAt: #factorialOf:stopAt:)
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

{ #category : 'tests expected to fail for now' }
BreakpointHandlingTest >> testMultiProcessBreakpointHandlingInSameMethodAfterHalting [
	"This test ensures that two processes debugging the same method don't interfere with each other's breakpoints."

	| firstResult firstProcess firstProcessMethod secondResult secondProcess secondProcessMethod level frameAtLevel |
	firstProcess := self
		processBlock: [ firstResult := utility factorialOf: 10 stopAt: 6 ]
		forID: #'FirstProcess'.
	secondProcess := self
		processBlock: [ secondResult := utility factorialOf: 10 stopAt: 4 ]
		forID: #'SecondProcess'.

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
		inMethod: (BreakpointHandling compiledMethodAt: #factorialOf:stopAt:)
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
BreakpointHandlingTest >> testMultiProcessBreakpointHandlingInSameMethodBeforeHalting [
	"This test ensures that two processes debugging the same method don't interfere with each other's breakpoints."

	| firstResult firstProcess firstProcessMethod secondResult secondProcess secondProcessMethod level frameAtLevel |
	firstProcess := self
		processBlock: [ firstResult := utility factorialOf: 10 stopAt: 6 ]
		forID: #'FirstProcess'.
	secondProcess := self
		processBlock: [ secondResult := utility factorialOf: 10 stopAt: 4 ]
		forID: #'SecondProcess'.

	"Set the breakpoint for the second process."
	self
		setMethodBreakAtStepPoint: 10
		inMethod: (BreakpointHandling compiledMethodAt: #factorialOf:stopAt:)
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

{ #category : 'tests expected to fail for now' }
BreakpointHandlingTest >> testMultiProcessSteppingInDifferentMethods [
	"This test ensures that debugging multiple processes will faithfully honor step points in both processes."

	| factorial factorialProcess factorialMethod fibonacci fibonacciProcess fibonacciMethod level |
	factorialProcess := self
		processBlock: [ factorial := utility factorialOf: 10 stopAt: 5 ]
		forID: #'FactorialProcess'.
	fibonacciProcess := self
		processBlock: [ fibonacci := utility fibonacciGenerations: 10 stopAt: 4 ]
		forID: #'FibonacciProcess'.

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
BreakpointHandlingTest >> testMultiProcessSteppingInSameMethod [
	"This test ensures that debugging multiple processes will faithfully honor step points in both processes."

	| firstResult firstProcess firstProcessMethod secondResult secondProcess secondProcessMethod level frameAtLevel |
	firstProcess := self
		processBlock: [ firstResult := utility factorialOf: 10 afterWaitingMS: 3000 ]
		forID: #'FirstProcess'.
	secondProcess := self
		processBlock: [ secondResult := utility factorialOf: 10 afterWaitingMS: 10 ]
		forID: #'SecondProcess'.

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
		stepOverFromLevel: level;
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

{ #category : 'tests expected to fail for now' }
BreakpointHandlingTest >> testRecursionStepOutOfFrame [
	"This test ensures that debugging a recursive processes will allow stepping out of a frame to the next lower one."

	| result processMethod level frameAtLevel |
	self processBlock: [ result := utility factorialOf: 10 stopAt: 4 ].

	self advanceToControlInterrupt.
	level := self firstFrameBelowHalt.
	self log: #defaultProcess processEssentials: defaultProcess frameLevel: level.
	frameAtLevel := defaultProcess _frameContentsAt: level.
	processMethod := frameAtLevel first.
	self assert: processMethod selector equals: #'factorialOf:stopAt:'.
	self assertOneTraceEntry.
	self assertNextTraceKey: #'DefaultProcess' valueClass: Halt.


"Server bug: stepping off the end of a recursive method does not stop in the next lower frame. Process will run to completion."
7 timesRepeat: [
	self stepOverInLevel: level.
	level := self firstFrameBelowHalt + 1.
	self log: #defaultProcess processEssentials: defaultProcess frameLevel: level.
].
self halt.
]

{ #category : 'tests expected to fail for now' }
BreakpointHandlingTest >> testRecursionStepPointOddity [
"An earlier version of testMultiProcessSteppingInSameMethod used the GsProcess for 'stepOver...' which
 doesn't actually step, just sets the step breakpoint. But it also messed up how the stack frame reported
 itself - reverted @9 line 6 to @1 line 1.
Need to recreate that specific scenario."
	"This test ensures that debugging multiple processes will faithfully honor step points in both processes."

	| result processMethod level frameAtLevel |
	self processBlock: [ result := utility factorialOf: 10 stopAt: 4 ].

	self advanceToControlInterrupt.
	level := self firstFrameBelowHalt.
	self log: #defaultProcess processEssentials: defaultProcess frameLevel: level.
	frameAtLevel := defaultProcess _frameContentsAt: level.
	processMethod := frameAtLevel first.
	self assert: processMethod selector equals: #'factorialOf:stopAt:'.
	self assertOneTraceEntry.
	self assertNextTraceKey: #'DefaultProcess' valueClass: Halt.


	"The ipOffset of deeper recursive frames should be the same."
	self assert: (defaultProcess _frameContentsAt: level+1) second equals: (defaultProcess _frameContentsAt: level+2) second.

	defaultProcess stepOverFromLevel: level.
	(self waitMS: 100).
	self assertSuspended.

	"The ipOffset shouldn't change just from setting a step point."
	self assert: (defaultProcess _frameContentsAt: level+1) second equals: (defaultProcess _frameContentsAt: level+2) second.
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

{ #category : 'support' }
BreakpointHandlingTest >> traceID: anID value: anObject [
	trace nextPut: anID -> anObject
]

{ #category : 'support' }
BreakpointHandlingTest >> waitMS: milliseconds [
	(Delay forMilliseconds: milliseconds) wait
]
