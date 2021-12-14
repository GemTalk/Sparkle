"
Abstract superclass for tests of debugging operations like breakpoints and stepping.
These tests are actually independent of Sparkle, and test base debugging functionality.

The logging API and instance variable can be used to record diagnostic information that would be helpful debugging tests.

trace records the sequence of ControlInterrupts encountered during execution.
Each trace entry is an association of the process' ID with the exception encountered. These trace entries can be examined during the test.
"
Class {
	#name : 'DebuggingTest',
	#superclass : 'SpkTestCase',
	#instVars : [
		'trace',
		'log'
	],
	#category : 'Sparkle-Tools-GemStone-Test'
}

{ #category : 'Testing' }
DebuggingTest class >> isAbstract [
	^ self sunitName = #'DebuggingTest'
]

{ #category : 'support - specific process' }
DebuggingTest >> advanceToBreakpointIn: aProcess [
	self
		advanceToControlInterruptIn: aProcess;
		assertOneTraceEntry;
		assertNextTraceValueClass: Breakpoint
]

{ #category : 'support - specific process' }
DebuggingTest >> advanceToControlInterruptIn: aProcess [
	aProcess resume.
	self waitMS: 100.
	self assertSuspended: aProcess
]

{ #category : 'support - specific process' }
DebuggingTest >> advanceToEndIn: aProcess [
	aProcess resume.
	self waitMS: 100.
	self
		denySuspended: aProcess;
		assert: aProcess _isTerminated;
		assertNoTraceEntries
]

{ #category : 'support - specific process' }
DebuggingTest >> advanceToHaltIn: aProcess [
	self
		advanceToControlInterruptIn: aProcess;
		assertOneTraceEntry;
		assertNextTraceValueClass: Halt
]

{ #category : 'asserting' }
DebuggingTest >> assertNextTraceKey: anID valueClass: aBehavior [
	| traceEntry |
	traceEntry := trace next.
	self assert: traceEntry key equals: anID.
	self assert: traceEntry value class equals: aBehavior
]

{ #category : 'asserting' }
DebuggingTest >> assertNextTraceValueClass: aBehavior [
	| traceEntry |
	traceEntry := trace next.
	self assert: traceEntry value class equals: aBehavior
]

{ #category : 'asserting' }
DebuggingTest >> assertNoTraceEntries [
	self assert: trace size equals: 0
]

{ #category : 'asserting' }
DebuggingTest >> assertOneTraceEntry [
	self assert: trace size equals: 1
]

{ #category : 'asserting' }
DebuggingTest >> assertSuspended: aProcess [
	self
		assert: (self isSuspended: aProcess)
		ifFail: [ 
			'Process status is ' , aProcess _statusString , ' should have been suspended. '
				, aProcess printString ]
]

{ #category : 'asserting' }
DebuggingTest >> denySuspended: aProcess [
	self
		deny: (self isSuspended: aProcess)
		description: 'Process should not have been suspended'
]

{ #category : 'code to test' }
DebuggingTest >> factorialOf: factInt stopAt: stopInt [
	factInt = stopInt
		ifTrue: [ self halt ].
	factInt = 1
		ifTrue: [ ^ 1 ].
	^ factInt * (self factorialOf: factInt - 1 stopAt: stopInt)
]

{ #category : 'support' }
DebuggingTest >> firstFrameBelowHalt [
	"Answer the number of the frame below a #halt, considering all the overhead of signalling the exception."
	"This magic number is fragile. Perhaps could replace with a search?"

	^ 10
]

{ #category : 'support - specific process' }
DebuggingTest >> isSuspended: aProcess [
	^ ProcessorScheduler scheduler _isSuspended: aProcess
]

{ #category : 'support - specific process' }
DebuggingTest >> levelsSelect: aBlock inProcess: aProcess [
	"Answer an array of levels for which the block answers true.
	The argument to the block is the frame contents array."

	| result |
	result := {}.

	1 to: aProcess stackDepth do: [ :level | 
		(aBlock value: (aProcess _frameContentsAt: level))
			ifTrue: [ result add: level ] ].
	^ result
]

{ #category : 'support - specific process' }
DebuggingTest >> levelsWithSelector: selector inProcess: aProcess [
	^ self
		levelsSelect: [ :fc | fc first selector == selector ]
		inProcess: aProcess
]

{ #category : 'logging' }
DebuggingTest >> log: aString [
	log
		addAll: aString;
		lf.
	"GsFile gciLogServer: aString"
]

{ #category : 'logging' }
DebuggingTest >> log: aString processEssentials: aProcess frameLevel: levelInteger [
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

{ #category : 'logging' }
DebuggingTest >> log: aString with: anObject [
	self log: aString , ': ' , anObject printString
]

{ #category : 'logging' }
DebuggingTest >> logGroupSeparator [
	self
		log: '= = = = = = = = = =';
		log: ''
]

{ #category : 'support' }
DebuggingTest >> newProcessForBlock: aBlock id: anID [
	| newProcess |
	newProcess := [ 
	aBlock
		on: ControlInterrupt
		do: [ :ex | 
			self traceID: anID value: ex.
			newProcess suspend.
			ex resume ] ] newProcess.
	newProcess
		priority: self processPriority;
		breakpointLevel: 1.
	^ newProcess
]

{ #category : 'support' }
DebuggingTest >> processPriority [
	^ Processor activeProcess priority - 1
]

{ #category : 'support' }
DebuggingTest >> runHotForSeconds: anInteger shouldHalt: shouldHalt counter: aCounter [
	| endTime |
	endTime := DateAndTime now + (Duration seconds: anInteger).
	[ DateAndTime now < endTime ]
		whileTrue: [ 
			shouldHalt
				ifTrue: [ self halt ].
			aCounter increment ]
]

{ #category : 'support - breaking' }
DebuggingTest >> setAllStepBreaksIn: aMethod forProcess: aProcess [
	aProcess convertToPortableStack.
	^ aMethod
		_setBreakAtIp: -1
		operation: 1
		frame: nil
		process: aProcess
		breakpointLevel: 1
]

{ #category : 'support - breaking' }
DebuggingTest >> setMethodBreakAtStepPoint: aStepPoint inMethod: aMethod forProcess: aProcess [
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
DebuggingTest >> setStepBreakAtStepPoint: aStepPoint inMethod: aMethod forProcess: aProcess [
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
DebuggingTest >> setUp [
	super setUp.
	GsNMethod clearAllBreaks.
	trace := SharedQueue new.
	log := AppendableString new
]

{ #category : 'support - specific process' }
DebuggingTest >> stepOverInLevel: aLevel inProcess: aProcess [
	aProcess setStepOverBreaksAtLevel: aLevel.
	self advanceToBreakpointIn: aProcess
]

{ #category : 'support' }
DebuggingTest >> tearDown [
	GsNMethod clearAllBreaks.
	super tearDown
]

{ #category : 'support' }
DebuggingTest >> traceID: anID value: anObject [
	trace nextPut: anID -> anObject
]

{ #category : 'support' }
DebuggingTest >> waitMS: milliseconds [
	(Delay forMilliseconds: milliseconds) wait
]
