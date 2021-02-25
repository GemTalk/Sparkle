Class {
	#name : 'SpkEvaluationTest',
	#superclass : 'SpkToolTest',
	#instVars : [
		'inspectorTool',
		'evaluatorTool',
		'taskspaceTool'
	],
	#category : 'Sparkle-Tools-GemStone-Test'
}

{ #category : 'other' }
SpkEvaluationTest >> newInspectorToolOn: anObject [

	| explorerTool |
	taskspaceTool := SpkTaskspaceTool new.
	explorerTool := SpkExplorerTool new.
	^ tool := SpkInspectorTool new
		        inspectedObject: anObject;
		        taskspaceTool: taskspaceTool;
		        initializeViews;
		        explorerTool: explorerTool;
		        yourself
]

{ #category : 'other' }
SpkEvaluationTest >> setUp [
	super setUp.
	inspectorTool := self newInspectorToolOn: nil.
	evaluatorTool := SpkEvaluatorTool new
		taskspaceTool: taskspaceTool;
		inspectorTool: inspectorTool;
		yourself
]
