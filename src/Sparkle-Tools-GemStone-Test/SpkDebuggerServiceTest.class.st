Class {
	#name : 'SpkDebuggerServiceTest',
	#superclass : 'SpkEvaluationTest',
	#instVars : [
		'debuggerService'
	],
	#category : 'Sparkle-Tools-GemStone-Test'
}

{ #category : 'tests' }
SpkDebuggerServiceTest >> testExceptionDescription [
	"Can we make a tree of services out of a DebuggerTool?"

	self zork3.
	self assert: debuggerService exceptionDescription equals: 'MessageNotUnderstood -  a SmallInteger does not understand  #''zork'''
]

{ #category : 'tests' }
SpkDebuggerServiceTest >> testProcessFrameQuantity [
	| frames |
	self zork3.
	frames := debuggerService frames.
	self
		assert: (frames isKindOf: SequenceableCollection);
		assert: (frames size between: 10 and: 20)
]

{ #category : 'tests' }
SpkDebuggerServiceTest >> testProcessIdentifier [
	| id |
	self zork3.
	id := debuggerService processIdentifier.
	self
		assert: id class equals: SmallInteger;
		assert: (id bitAnd: 16rFF) equals: 1
]

{ #category : 'tests' }
SpkDebuggerServiceTest >> testProcessName [
	"Can we make a tree of services out of a DebuggerTool?"

	self zork3.
	self assert: debuggerService processName equals: 'Evaluation'
]

{ #category : 'tests' }
SpkDebuggerServiceTest >> testProcessPriority [
	| prio |
	self zork3.
	prio := debuggerService processPriority.
	self
		assert: prio class equals: SmallInteger;
		assert: prio equals: 15
]

{ #category : 'support' }
SpkDebuggerServiceTest >> zork3 [
	| debuggerTool |
	evaluatorTool newSourceCode: '3 zork'.
	debuggerTool := evaluatorTool evaluateCode.
	debuggerService := SpkDebuggerServiceServer forTool: debuggerTool
]
