Class {
	#name : 'StackTrimmingTest',
	#superclass : 'GsTestCase',
	#category : 'Sparkle-Tools-GemStone-Test'
}

{ #category : 'tests' }
StackTrimmingTest >> testInTermination [
	| process status |
	status := 'not started'.
	process := [ 
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
		assert: process _statusString equals: 'suspended'.
	process
		priority: GsProcess current priority + 1;
		resume.
	self
		assert: status equals: 'started';
		assert: process _statusString equals: 'on delayQueue';
		deny: process _isTerminated;
		deny: process _terminationStarted.
	[ process terminate ] forkAt: GsProcess current priority + 2.
	self
		assert: status equals: 'curtailed';
		assert: process _statusString equals: 'terminationStarted';
		deny: process _isTerminated;
		assert: process _terminationStarted.
	Delay waitForSeconds: 2.
		self
		assert: status equals: 'done';
		assert: process _statusString equals: 'terminated';
		assert: process _isTerminated;
		assert: process _terminationStarted.
]
