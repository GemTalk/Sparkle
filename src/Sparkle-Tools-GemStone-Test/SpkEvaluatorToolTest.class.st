Class {
	#name : 'SpkEvaluatorToolTest',
	#superclass : 'TestCase',
	#instVars : [
		'inspectorTool',
		'evaluatorTool'
	],
	#category : 'Sparkle-Tools-GemStone-Test'
}

{ #category : 'other' }
SpkEvaluatorToolTest >> setUp [
	super setUp.
	inspectorTool := SpkInspectorTool on: nil.
	evaluatorTool := SpkEvaluatorTool new
		inspectorTool: inspectorTool;
		yourself
]

{ #category : 'other' }
SpkEvaluatorToolTest >> testEvaluationReferencingInstvar [
	| result |
	inspectorTool inspectedObject: #'foo' -> 'bar'.
	evaluatorTool newSourceCode: 'value , ''n'''.
	result := evaluatorTool evaluateCode.
	self assert: result class equals: SpkInspectorTool.
	self assert: result inspectedObject equals: 'barn'
]

{ #category : 'other' }
SpkEvaluatorToolTest >> testEvaluationUsingSelf [
	| result |
	inspectorTool inspectedObject: 7.
	evaluatorTool newSourceCode: 'self - 4'.
	result := evaluatorTool evaluateCode.
	self assert: result class equals: SpkInspectorTool.
	self assert: result inspectedObject equals: 3
]

{ #category : 'other' }
SpkEvaluatorToolTest >> testRuntimeError [
	| result |
	evaluatorTool newSourceCode: '3 zork'.
	result := evaluatorTool evaluateCode.
	self assert: result class equals: SpkDebuggerTool
]

{ #category : 'other' }
SpkEvaluatorToolTest >> testSimpleEvaluation [
	| result |
	evaluatorTool newSourceCode: '3 + 4'.
	result := evaluatorTool evaluateCode.
	self assert: result class equals: SpkInspectorTool.
	self assert: result inspectedObject equals: 7
]

{ #category : 'other' }
SpkEvaluatorToolTest >> testSyntaxError [
	| result |
	evaluatorTool newSourceCode: '(self class'.
	result := evaluatorTool evaluateCode.
	self assert: result class equals: SpkCompilationErrorTool.
	self assert: result errorLocation equals: 12.
	self assert: (result errorMessage findPattern: #('expected') startingAt: 1) > 0
]
