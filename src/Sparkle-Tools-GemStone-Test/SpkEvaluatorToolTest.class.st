Class {
	#name : 'SpkEvaluatorToolTest',
	#superclass : 'SpkEvaluationTest',
	#category : 'Sparkle-Tools-GemStone-Test'
}

{ #category : 'other' }
SpkEvaluatorToolTest >> testEvaluationReferencingInstvar [
	| result |
	inspectorTool inspectedObject: #'foo' -> 'bar'.
	evaluatorTool newSourceCode: 'value , ''n'''.
	result := self evaluateCode.
	self assert: result class equals: SpkInspectorTool.
	self assert: result inspectedObject equals: 'barn'
]

{ #category : 'other' }
SpkEvaluatorToolTest >> testEvaluationUsingSelf [
	| result |
	inspectorTool inspectedObject: 7.
	evaluatorTool newSourceCode: 'self - 4'.
	result := self evaluateCode.
	self assert: result class equals: SpkInspectorTool.
	self assert: result inspectedObject equals: 3
]

{ #category : 'other' }
SpkEvaluatorToolTest >> testRuntimeError [
	| result |
	evaluatorTool newSourceCode: '3 zork'.
	result := self evaluateCode.
	self assert: result class equals: SpkDebuggerTool
]

{ #category : 'other' }
SpkEvaluatorToolTest >> testSimpleEvaluation [
	| result |
	evaluatorTool newSourceCode: '3 + 4'.
	result := self evaluateCode.
	self assert: result class equals: SpkInspectorTool.
	self assert: result inspectedObject equals: 7
]

{ #category : 'other' }
SpkEvaluatorToolTest >> testSyntaxError [
	| result |
	evaluatorTool newSourceCode: '(self class'.
	result := self evaluateCode.
	self assert: result class equals: SpkCompilationErrorTool.
	self assert: result errorLocation equals: 12.
	self assert: (result errorMessage findPattern: #('expected') startingAt: 1) > 0
]
