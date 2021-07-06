Class {
	#name : 'SpkEvaluatorToolTest',
	#superclass : 'SpkTestCase',
	#instVars : [
		'taskspaceTool',
		'explorerTool',
		'evaluatorTool',
		'inspectorTool',
		'resultTool'
	],
	#category : 'Sparkle-Tools-Pharo-Test'
}

{ #category : 'accessing' }
SpkEvaluatorToolTest >> announcement [

	^SpkExecutionAnnouncement new
		updatedServices: Set new;
		yourself
]

{ #category : 'actions' }
SpkEvaluatorToolTest >> inspect: anObject [

	inspectorTool := explorerTool newInspectorToolOn: anObject.
	explorerTool addPane: inspectorTool.
	evaluatorTool := inspectorTool addEvaluator
]

{ #category : 'running' }
SpkEvaluatorToolTest >> setUp [

	super setUp.
	taskspaceTool := SpkTaskspaceTool new.
	explorerTool := taskspaceTool newExplorerTool
]

{ #category : 'tests' }
SpkEvaluatorToolTest >> testCompilationError [

	self inspect: 7.

	evaluatorTool newSourceCode: 'class: name'.
	resultTool := evaluatorTool acceptAnnouncing: self announcement.
	self assert: resultTool class equals: SpkCompilationErrorTool
]

{ #category : 'tests' }
SpkEvaluatorToolTest >> testExpressionReferencingSelf [

	self inspect: 7.

	evaluatorTool newSourceCode: 'self class name'.
	resultTool := evaluatorTool acceptAnnouncing: self announcement.
	self
		assert: resultTool class equals: SpkInspectorTool;
		assert: resultTool inspectedObject equals: #SmallInteger.

	evaluatorTool newSourceCode: 'self - 3'.
	resultTool := evaluatorTool acceptAnnouncing: self announcement.
	self
		assert: resultTool class equals: SpkInspectorTool;
		assert: resultTool inspectedObject equals: 4
]

{ #category : 'tests' }
SpkEvaluatorToolTest >> testIndependentExpression [

	self inspect: nil.

	self
		assert: evaluatorTool newSourceCode equals: '';
		assert: evaluatorTool oldSourceCode equals: ''.
	evaluatorTool newSourceCode: '3 + 4'.
	self
		assert: evaluatorTool newSourceCode equals: '3 + 4';
		assert: evaluatorTool oldSourceCode equals: ''.
	resultTool := evaluatorTool acceptAnnouncing: self announcement.
	self
		assert: evaluatorTool newSourceCode equals: '3 + 4';
		assert: evaluatorTool oldSourceCode equals: '3 + 4';
		assert: resultTool class equals: SpkInspectorTool;
		assert: resultTool inspectedObject equals: 7
]

{ #category : 'tests' }
SpkEvaluatorToolTest >> testProxyContext [

	self inspect: SpkTestSubclassOfNil basicNew.
	evaluatorTool newSourceCode: '4 + 3'.
	resultTool := evaluatorTool acceptAnnouncing: self announcement.
	self
		assert: resultTool class equals: SpkInspectorTool;
		assert: resultTool inspectedObject
		equals: 'Evaluation message not understood by this object'
]

{ #category : 'tests' }
SpkEvaluatorToolTest >> testRuntimeError [

	self inspect: 3.
	evaluatorTool newSourceCode: 'self zork'.
	resultTool := evaluatorTool acceptAnnouncing: self announcement.
	self assert: resultTool class equals: SpkRuntimeErrorTool
]
