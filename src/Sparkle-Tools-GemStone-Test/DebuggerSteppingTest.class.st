Class {
	#name : 'DebuggerSteppingTest',
	#superclass : 'GsTestCase',
	#instVars : [
		'process',
		'trace'
	],
	#category : 'Sparkle-Tools-GemStone-Test'
}

{ #category : 'support' }
DebuggerSteppingTest >> setUp [

	trace := Array new.
]

{ #category : 'tests' }
DebuggerSteppingTest >> testStepThroughInLevel1 [
	"Test whether GsProcess>>_setBreaksForStepOverFromLevel: misbehaves when stepping through in level 1."

	"Stop in a block that does not do an NLR, at the end of the block."

	| result |
	process := [ result := self throughInLevel1 ] newProcess.
	process
		name: 'processToStep';
		priority: Processor activeProcess priority + 1;
		resume.
	self halt	

"Trim the stack so that block is the top frame. Current stack trimming method will also rewind."	

"Step in level 1 until block returns, verify stopped at correct point."
]

{ #category : 'code to step' }
DebuggerSteppingTest >> throughInLevel1 [

	trace add: 1.
	trace add: [trace add: 2. self halt. trace add: 3] value.
	trace add: 4.
	self halt.
]
