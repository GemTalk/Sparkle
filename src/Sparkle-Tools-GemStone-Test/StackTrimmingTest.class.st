Class {
	#name : 'StackTrimmingTest',
	#superclass : 'GsTestCase',
	#category : 'Sparkle-Tools-GemStone-Test'
}

{ #category : 'support' }
StackTrimmingTest >> inTermination: terminatorPriority [
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
StackTrimmingTest >> testInTermination [
	{(Processor lowestPriority).
	(Processor userSchedulingPriority).
	(Processor highestPriority)} do: [ :priority | self inTermination: priority ]
]
