Class {
	#name : 'SpkDebuggerServiceTest',
	#superclass : 'SpkEvaluationTest',
	#category : 'Sparkle-Tools-GemStone-Test'
}

{ #category : 'other' }
SpkDebuggerServiceTest >> testExceptionDescription [
	"Can we make a tree of services out of a DebuggerTool?"

	| debuggerTool debuggerService |
	evaluatorTool newSourceCode: '3 zork'.
	debuggerTool := evaluatorTool evaluateCode.
	debuggerService := SpkDebuggerServiceServer forTool: debuggerTool.
	self assert: debuggerService exceptionDescription equals: 'MessageNotUnderstood -  a SmallInteger does not understand  #''zork'''
]
