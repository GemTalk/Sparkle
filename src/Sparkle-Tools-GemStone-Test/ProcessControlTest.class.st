Class {
	#name : 'ProcessControlTest',
	#superclass : 'GsTestCase',
	#category : 'Sparkle-Tools-GemStone-Test'
}

{ #category : 'support' }
ProcessControlTest >> inTermination: terminatorPriority [
	| status target terminator |
	status := 'not started'.
	terminator := [ target terminate ] newProcess.
	target := [ 
	status := 'started'.
	[ 
	Delay waitForSeconds: 5.
	status := 'delay done' ]
		ifCurtailed: [ 
			status := 'curtailed'.
			Delay waitForSeconds: 1.
			status := 'done' ] ] newProcess.
	self
		assert: status equals: 'not started';
		assert: target _statusString equals: 'suspended'.
	target
		priority: Processor userSchedulingPriority;
		resume.
	Delay waitForMilliseconds: 100.
	self
		assert: status equals: 'started';
		assert: target _statusString equals: 'on delayQueue';
		deny: target _isTerminated;
		deny: target _terminationStarted.
	terminator
		priority: terminatorPriority;
		resume.
	Delay waitForMilliseconds: 100.
	self
		assert: status equals: 'curtailed';
		assert: target _statusString equals: 'terminationStarted';
		deny: target _isTerminated;
		assert: target _terminationStarted.
	Delay waitForSeconds: 2.
	self
		assert: status equals: 'done';
		assert: target _statusString equals: 'terminated';
		assert: target _isTerminated;
		assert: target _terminationStarted
]

{ #category : 'tests' }
ProcessControlTest >> testDelayExpirationPreemption [
	"Delay expiration of a higher-priority process should
	preempt a lower-priority running process."

	| delayedProc loopingProc eventLog testPriority semaphore loopCount |
	eventLog := Array new.
	testPriority := Processor activeProcess priority.
	loopCount := 0.
	semaphore := Semaphore new.
	delayedProc := [ 
	eventLog add: 1.
	(Delay forMilliseconds: 100) wait.
	eventLog add: 2.
	semaphore signal ] newProcess.
	loopingProc := [ 
	[ 
	eventLog add: 3.
	[ loopCount := loopCount + 1 ] repeat ]
		ensure: [ eventLog add: 4 ] ] newProcess.
	delayedProc priority: testPriority + 1.
	loopingProc priority: testPriority - 1.
	loopingProc resume.	"should not start running yet; priority is lower."
	self
		assert: eventLog equals: #();
		assert: loopCount equals: 0;
		assert: loopingProc _statusString equals: 'ready'.
	delayedProc resume.	"should run to the delay immediately."
	self
		assert: eventLog equals: #(1);
		assert: loopCount equals: 0;
		assert: loopingProc _statusString equals: 'ready';
		assert: delayedProc _statusString equals: 'waiting on a Delay'.
	self
		assert: (semaphore waitForMilliseconds: 200)
		description: 'Semaphore timed out, should have been signaled by delayedProc'.
	self
		assert: eventLog equals: #(1 3 2);
		assert: loopCount > 0;
		assert: loopingProc _statusString equals: 'ready';
		assert: delayedProc _statusString equals: 'terminated'.
	loopingProc terminate.
	self
		assert: eventLog equals: #(1 3 2 4);
		assert: loopCount > 0;
		assert: loopingProc _statusString equals: 'terminated';
		assert: delayedProc _statusString equals: 'terminated'
]

{ #category : 'tests' }
ProcessControlTest >> testInTermination [
	{(Processor lowestPriority).
	(Processor userSchedulingPriority).
	(Processor highestPriority)} do: [ :priority | self inTermination: priority ]
]

{ #category : 'tests' }
ProcessControlTest >> testResumedWaitsOnSemaphore [
	"If a process waiting on a semaphore is suspended,
	sending #resume to the process should not let the process proceed
	until the semaphore is signaled."

	| sem proc eventLog |
	sem := Semaphore new.
	eventLog := Array new.
	proc := [eventLog add: 1.
				sem wait.
				eventLog add: 2] newProcess.
	proc priority: Processor activeProcess priority + 1.
	self assert: eventLog equals: #().
	proc resume.
	self assert: eventLog equals: #(1);
		assert: sem excessSignals equals: 0;
		assert: sem size equals: 1;
		assert: (sem at: 1) identical: proc;
		assert: proc _statusString equals: 'waiting on a Semaphore'.
	proc suspend.
	self assert: eventLog equals: #(1);
		assert: sem excessSignals equals: 0;
		assert: sem size equals: 1;
		assert: (sem at: 1) identical: proc;
		assert: proc _statusString equals: 'suspended'.
	proc resume.
	self assert: eventLog equals: #(1);
		assert: sem excessSignals equals: 0;
		assert: sem size equals: 1;
		assert: (sem at: 1) identical: proc;
		assert: proc _statusString equals: 'waiting on a Semaphore'.
	(Delay forMilliseconds: 500) wait.
	self assert: eventLog equals: #(1);
		assert: sem excessSignals equals: 0;
		assert: sem size equals: 1;
		assert: (sem at: 1) identical: proc;
		assert: proc _statusString equals: 'waiting on a Semaphore'.
	sem signal.
	self assert: eventLog equals: #(1 2);
		assert: sem excessSignals equals: 0;
		assert: sem size equals: 0;
		assert: proc _statusString equals: 'terminated'.
]

{ #category : 'tests failing for now' }
ProcessControlTest >> testResumeInDelay [
	"Resume sent to a process waiting on a Delay should not cut the Delay short."

	| elapsedMilliseconds |
	elapsedMilliseconds := Time
		millisecondsElapsedTime: [ 
			| proc sema |
			sema := Semaphore new.
			proc := [ 
			(Delay forSeconds: 5) wait.
			sema signal ] newProcess.
			proc priority: Processor activeProcess priority - 1;
			resume.
			(Delay forMilliseconds: 500) wait.
			self assert: proc _statusString equals: 'waiting on a Delay'.
			proc suspend.
			self assert: proc _statusString equals: 'suspended'.
			proc resume.
			(Delay forMilliseconds: 500) wait.
			self assert: proc _statusString equals: 'waiting on a Delay'.
			proc resume.
			sema wait ].

	self assert: elapsedMilliseconds > 4500
]

{ #category : 'tests' }
ProcessControlTest >> testSuspendedWaitsOnSemaphore [
	"If a process waiting on a semaphore is suspended,
	signaling the semaphore should not let the process run until the process is sent #resume."

	| sem proc eventLog |
	sem := Semaphore new.
	eventLog := Array new.
	proc := [eventLog add: 1.
				sem wait.
				eventLog add: 2] newProcess.
	proc priority: Processor activeProcess priority + 1.
	self assert: eventLog equals: #().
	proc resume.
	self assert: eventLog equals: #(1);
		assert: sem excessSignals equals: 0;
		assert: sem size equals: 1;
		assert: (sem at: 1) identical: proc;
		assert: proc _statusString equals: 'waiting on a Semaphore'.
	proc suspend.
	self assert: eventLog equals: #(1);
		assert: sem excessSignals equals: 0;
		assert: sem size equals: 1;
		assert: (sem at: 1) identical: proc.
		"TBD what status string really ought to be in this state.
		assert: proc _statusString equals: 'suspended waiting on a Semaphore'."
	sem signal.
	self assert: eventLog equals: #(1);
		assert: sem excessSignals equals: 0;
		assert: sem size equals: 0.
		"TBD what status string really ought to be in this state.
		assert: proc _statusString equals: 'suspended suspended'."
	(Delay forMilliseconds: 500) wait.
	self assert: eventLog equals: #(1);
		assert: sem excessSignals equals: 0;
		assert: sem size equals: 0;
		assert: proc _statusString equals: 'suspended'.
	proc resume.
	self assert: eventLog equals: #(1 2);
		assert: sem excessSignals equals: 0;
		assert: sem size equals: 0;
		assert: proc _statusString equals: 'terminated'.
]

{ #category : 'tests' }
ProcessControlTest >> testThreeProcessesWaitOnAbsoluteDelay [
	"Multiple processes can concurrently wait on the same Delay instance, 
	as long as that Delay is for an absolute time, not an interval Delay.
	When that delay expires, all processes should be scheduled according to their priority.
	And the Delay should appear on the scheduler's readyQueue exactly once."

	| delay proc1 proc2 proc3 eventLog startMs testPriority dqOffset delayQueue |
	eventLog := Array new.
	dqOffset := ProcessorScheduler allInstVarNames indexOf: #'delayQueue'.
	delayQueue := Reflection fetchFrom: ProcessorScheduler scheduler at: dqOffset.
	self
		assert: delayQueue class equals: SortedCollection;
		assert: delayQueue size equals: 0.
	testPriority := Processor activeProcess priority.
	startMs := Delay millisecondClockValue.
	delay := Delay untilMilliseconds: startMs + 100.
	proc1 := [ 
	eventLog add: 1.
	delay wait.
	eventLog add: 2 ] newProcess.
	proc2 := [ 
	eventLog add: 3.
	delay wait.
	eventLog add: 4 ] newProcess.
	proc3 := [ 
	eventLog add: 5.
	delay wait.
	eventLog add: 6 ] newProcess.
	proc1 priority: testPriority + 1.
	proc2 priority: testPriority + 2.
	proc3 priority: testPriority + 3.
	proc1 resume.
	proc2 resume.
	proc3 resume.
	self
		assert: eventLog equals: #(1 3 5);
		assert: proc1 _statusString equals: 'waiting on a Delay';
		assert: proc2 _statusString equals: 'waiting on a Delay';
		assert: proc3 _statusString equals: 'waiting on a Delay';
		assert: delayQueue size equals: 1. "The Delay should be on the queue only once."
	eventLog add: 7.
	delay wait.
	eventLog add: 8.
	self
		assert: eventLog equals: #(1 3 5 7 6 4 2 8);
		assert: proc1 _statusString equals: 'terminated';
		assert: proc2 _statusString equals: 'terminated';
		assert: proc3 _statusString equals: 'terminated';
		assert: delayQueue size equals: 0
]
