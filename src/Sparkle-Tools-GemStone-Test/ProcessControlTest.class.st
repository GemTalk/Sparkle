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
