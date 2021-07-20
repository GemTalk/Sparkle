Class {
	#name : 'SpkDebuggerServiceTest',
	#superclass : 'SpkEvaluationTest',
	#instVars : [
		'debuggerService'
	],
	#category : 'Sparkle-Tools-GemStone-Test'
}

{ #category : 'support' }
SpkDebuggerServiceTest >> divideByZeroAfterProceed [
	| debuggerTool |
	evaluatorTool newSourceCode: '3 pause + 4 / 0'.
	debuggerTool := evaluatorTool evaluateCode.
	debuggerService := SpkServiceFactory serviceForTool: debuggerTool
]

{ #category : 'tests' }
SpkDebuggerServiceTest >> testExceptionDescription [
	"Can we make a tree of services out of a DebuggerTool?"

	self zork3.
	self assert: debuggerService exceptionDescription equals: 'MessageNotUnderstood -  a SmallInteger does not understand  #''zork'''
]

{ #category : 'tests' }
SpkDebuggerServiceTest >> testProcessFrameNumbering [
	"The bottom ten frames are glue, first 
	visible frame should have index 11."

	| frames |
	self zork3.
	frames := debuggerService frames.
	self assert: frames first index equals: 11
]

{ #category : 'tests' }
SpkDebuggerServiceTest >> testProcessFrameQuantity [
	| frames |
	self zork3.
	frames := debuggerService frames.
	self
		assert: (frames isKindOf: SequenceableCollection);
		assert: frames size equals: 3
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

{ #category : 'tests' }
SpkDebuggerServiceTest >> testUpdateAfterExecution [

	| frames matchingFrames executedCodeFrameDescription frameService newDebuggerService |
	self divideByZeroAfterProceed.
	"Should now be stopped on the pause."
	frames := debuggerService frames.
	matchingFrames := frames select: [:each | each description = 'Executed Code '].
	self assert: matchingFrames size equals: 1.
	executedCodeFrameDescription := matchingFrames first.
	self assert: executedCodeFrameDescription class equals: SpkDebuggerFrameDescriptionServiceServer.
	frameService := executedCodeFrameDescription createFrameService.
	self assert: frameService class equals: SpkDebuggerFrameServiceServer;
	assert: frameService currentStartPosition equals: 3;
	assert: frameService currentEndPosition equals: 7.
	newDebuggerService := debuggerService proceed.
	"Should no be stopped on the division by zero, and the frame service should have updated itself."
	self assert: newDebuggerService == debuggerService;
	assert: frameService currentStartPosition equals: 13;
	assert: frameService currentEndPosition equals: 13.
]

{ #category : 'support' }
SpkDebuggerServiceTest >> zork3 [
	| debuggerTool |
	evaluatorTool newSourceCode: '3 zork'.
	debuggerTool := evaluatorTool evaluateCode.
	debuggerService := SpkServiceFactory serviceForTool: debuggerTool
]
