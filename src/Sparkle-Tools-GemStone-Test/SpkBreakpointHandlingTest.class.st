Class {
	#name : 'SpkBreakpointHandlingTest',
	#superclass : 'TestCase',
	#category : 'Sparkle-Tools-GemStone-Test'
}

{ #category : 'asserting' }
SpkBreakpointHandlingTest >> assertSuspended: aProcess [

	self assert: (self isSuspended: aProcess)
]

{ #category : 'asserting' }
SpkBreakpointHandlingTest >> denySuspended: aProcess [

	self deny: (self isSuspended: aProcess)
]

{ #category : 'asserting' }
SpkBreakpointHandlingTest >> isSuspended: aProcess [

	^ProcessorScheduler scheduler _isSuspended: aProcess
]

{ #category : 'running' }
SpkBreakpointHandlingTest >> testMethodSteppingIsLocalToOneProcess [
	"This test ensures that when you have a debugger on a process and #step, the step action applies
	to the specific process. The step shouldn't apply to other processes executing the same method."

	| utility haltingProcess independentProcess trace priority level haltingMethod haltingCounter independentCounter independedCounterCache |
	utility := SpkTestClassForDebugging new.
	trace := SharedQueue new.
	priority := Processor activePriority - 1.
	haltingCounter := { 0 }.
	independentCounter := { 0 }.
	haltingProcess := [[utility runHotForSeconds: 6 shouldHalt: true counter: haltingCounter]
		on: Breakpoint, Halt
		do: [:ex |
			trace nextPut: #HaltingProcess.
			trace nextPut: ex.
			haltingProcess suspend.
			ex resume]] newProcess.
	independentProcess := [[utility runHotForSeconds: 6 shouldHalt: false counter: independentCounter]
		on: Breakpoint, Halt
		do: [:ex |
			trace nextPut: #RunningProcess.
			trace nextPut: ex.
			independentProcess suspend.
			ex resume]] newProcess.
	haltingProcess
		priority: priority;
		breakpointLevel: 1;
		resume.
	independentProcess
		priority: priority;
		breakpointLevel: 1;
		resume.
	[(Delay forMilliseconds: 100) wait.
	self assertSuspended: haltingProcess.
	self denySuspended: independentProcess.
	independedCounterCache := independentCounter first.
	level := 10.
	haltingMethod := (haltingProcess _frameContentsAt: level) first.
	self
		assert: haltingMethod selector
		equals: #runHotForSeconds:shouldHalt:counter:.
	haltingProcess stepOverFromLevel: level.
	(Delay forMilliseconds: 100) wait.
	self assertSuspended: haltingProcess.
	self denySuspended: independentProcess.
	self assert: independentCounter first > independedCounterCache.
	self
		assert: trace size
		equals: 2.
	self
		assert: trace next
		equals: #HaltingProcess.
	self
		assert: trace next class
		equals: Halt.
	independentProcess terminate.
	haltingProcess resume.
	(Delay forMilliseconds: 100) wait.
	self assert: independentProcess _isTerminated.
	self assertSuspended: haltingProcess.
	self
		assert: trace size
		equals: 2.
	self
		assert: trace next
		equals: #HaltingProcess.
	self
		assert: trace next class
		equals: Breakpoint]
		ensure:
			[haltingProcess terminate.
			independentProcess terminate]
]
