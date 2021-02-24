Class {
	#name : 'SpkEvaluatorToolTest',
	#superclass : 'SpkTestCase',
	#instVars : [
		'taskspaceTool',
		'evaluatorTool',
		'inspectorTool',
		'resultTool'
	],
	#category : 'Sparkle-Tools-Pharo-Test'
}

{ #category : 'running' }
SpkEvaluatorToolTest >> setUp [

	| explorerTool |
	super setUp.
	taskspaceTool := SpkTaskspaceTool new.
	explorerTool := SpkExplorerTool new.
	inspectorTool := SpkInspectorTool new
		                 taskspaceTool: taskspaceTool;
		                 initializeViews;
		                 explorerTool: explorerTool;
		                 yourself.

	explorerTool addPane: inspectorTool.
	evaluatorTool := inspectorTool addEvaluator
]

{ #category : 'tests' }
SpkEvaluatorToolTest >> testCompilationError [

	inspectorTool inspectedObject: 7.
	evaluatorTool newSourceCode: 'class: name'.
	resultTool := evaluatorTool accept.
	self assert: resultTool class equals: SpkCompilationErrorTool
]

{ #category : 'tests' }
SpkEvaluatorToolTest >> testExpressionReferencingSelf [

	inspectorTool inspectedObject: 7.
	evaluatorTool newSourceCode: 'self class name'.
	resultTool := evaluatorTool accept.
	self
		assert: resultTool class equals: SpkInspectorTool;
		assert: resultTool inspectedObject equals: #SmallInteger.

	evaluatorTool newSourceCode: 'self - 3'.
	resultTool := evaluatorTool accept.
	self
		assert: resultTool class equals: SpkInspectorTool;
		assert: resultTool inspectedObject equals: 4
]

{ #category : 'tests' }
SpkEvaluatorToolTest >> testIndependentExpression [

	self
		assert: evaluatorTool newSourceCode equals: '';
		assert: evaluatorTool oldSourceCode equals: ''.
	evaluatorTool newSourceCode: '3 + 4'.
	self
		assert: evaluatorTool newSourceCode equals: '3 + 4';
		assert: evaluatorTool oldSourceCode equals: ''.
	resultTool := evaluatorTool accept.
	self
		assert: evaluatorTool newSourceCode equals: '3 + 4';
		assert: evaluatorTool oldSourceCode equals: '3 + 4';
		assert: resultTool class equals: SpkInspectorTool;
		assert: resultTool inspectedObject equals: 7
]

{ #category : 'tests' }
SpkEvaluatorToolTest >> testProxyContext [

	inspectorTool inspectedObject: SpkTestSubclassOfNil basicNew.
	evaluatorTool newSourceCode: '4 + 3'.
	resultTool := evaluatorTool accept.
	self
		assert: resultTool class equals: SpkInspectorTool;
		assert: resultTool inspectedObject
		equals: 'Evaluation message not understood by this object'
]

{ #category : 'tests' }
SpkEvaluatorToolTest >> testRuntimeError [

	inspectorTool inspectedObject: 3.
	evaluatorTool newSourceCode: 'self zork'.
	resultTool := evaluatorTool accept.
	self assert: resultTool class equals: SpkRuntimeErrorTool
]
