Class {
	#name : 'SpkDebuggerToolTest',
	#superclass : 'SpkEvaluationTest',
	#category : 'Sparkle-Tools-GemStone-Test'
}

{ #category : 'other' }
SpkDebuggerToolTest >> testNumberOfFrames [
	"Can the debugger get frames from the process?"

	| debugger |
	evaluatorTool newSourceCode: '3 zork'.
	debugger := evaluatorTool evaluateCode.
	self assert: debugger class equals: SpkDebuggerTool.
	self assert: debugger frames size equals: 3
]
