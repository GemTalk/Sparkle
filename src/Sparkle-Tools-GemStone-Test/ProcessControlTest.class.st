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
		assert: proc _statusString equals: 'suspended suspended'.
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

{ #category : 'tests' }
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
			self assert: proc _statusString equals: 'suspended suspended'.
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
		assert: proc _statusString equals: 'suspended suspended'.
	proc resume.
	self assert: eventLog equals: #(1 2);
		assert: sem excessSignals equals: 0;
		assert: sem size equals: 0;
		assert: proc _statusString equals: 'terminated'.
]
