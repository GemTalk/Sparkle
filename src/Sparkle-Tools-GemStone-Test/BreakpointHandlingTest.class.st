Class {
	#name : 'BreakpointHandlingTest',
	#superclass : 'TestCase',
	#category : 'Sparkle-Tools-GemStone-Test'
}

{ #category : 'asserting' }
BreakpointHandlingTest >> assertSuspended: aProcess [

	self assert: (self isSuspended: aProcess)
]

{ #category : 'asserting' }
BreakpointHandlingTest >> denySuspended: aProcess [

	self deny: (self isSuspended: aProcess)
]

{ #category : 'asserting' }
BreakpointHandlingTest >> isSuspended: aProcess [

	^ProcessorScheduler scheduler _isSuspended: aProcess
]

{ #category : 'running' }
BreakpointHandlingTest >> levelsWithSelector: selector inProcess: process [
	| result |
	result := {}.

	1 to: process stackDepth do: [ :level | 
		(process _frameContentsAt: level) first selector == selector
			ifTrue: [ result add: level ] ].
	^ result
]

{ #category : 'running' }
BreakpointHandlingTest >> testMethodSteppingIsLocalToOneProcess [
	"This test ensures that when you have a debugger on a process and #step, the step action applies
	to the specific process. The step shouldn't apply to other processes executing the same method."

	| utility haltingProcess independentProcess trace priority level haltingMethod haltingCounter independentCounter independentCounterCache |
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

{ #category : 'running' }
BreakpointHandlingTest >> testStepOverInRecursion [
	"This test ensures that when you step over in a method that is on the stack multiple times (recursion)
	the step stops in the level of the step, not the topmost occuurrence of the method."

	| utility process trace priority result factorialLevels numberOfLevels |
	GsNMethod clearAllBreaks.
	utility := BreakpointHandling new.
	trace := SharedQueue new.
	priority := Processor activePriority - 1.
	process := [ 
	[ result := utility factorialOf: 10 stopAt: 5 ]
		on: ControlInterrupt
		do: [ :ex | 
			trace nextPut: ex.
			process suspend.
			ex resume ] ] newProcess.
	process
		priority: priority;
		breakpointLevel: 1;
		resume.	"advance to halt in the middle of recursion"
	[ 
	(Delay forMilliseconds: 100) wait.
	self assertSuspended: process.
	self
		assert: trace size equals: 1;
		assert: trace next class equals: Halt.
	factorialLevels := self
		levelsWithSelector: #'factorialOf:stopAt:'
		inProcess: process.
	numberOfLevels := factorialLevels size.
	self assert: numberOfLevels equals: 6.
	process
		stepOverFromLevel: (factorialLevels at: 5);
		resume.	"advance to step break"
	(Delay forMilliseconds: 100) wait.
	self assertSuspended: process.
	self assert: trace size equals: 1.
	self assert: trace next class equals: Breakpoint.
	factorialLevels := self
		levelsWithSelector: #'factorialOf:stopAt:'
		inProcess: process.
	numberOfLevels := factorialLevels size.
	self assert: numberOfLevels equals: 2.
	process resume.	"run rest of process"
	(Delay forMilliseconds: 100) wait.
	self denySuspended: process.
	self
		assert: process _isTerminated;
		assert: trace size equals: 0;
		assert: result equals: 10 factorial ]
		ensure: [ 
			GsNMethod clearAllBreaks.
			process terminate ]
]
