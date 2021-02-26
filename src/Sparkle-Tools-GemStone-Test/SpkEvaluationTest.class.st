Class {
	#name : 'SpkEvaluationTest',
	#superclass : 'SpkToolTest',
	#instVars : [
		'inspectorTool',
		'evaluatorTool',
		'taskspaceTool',
		'explorerTool'
	],
	#category : 'Sparkle-Tools-GemStone-Test'
}

{ #category : 'other' }
SpkEvaluationTest >> newInspectorToolOn: anObject [
	taskspaceTool := SpkTaskspaceTool new.
	explorerTool := taskspaceTool newExplorerTool.
	^ tool := explorerTool newInspectorToolOn: anObject
]

{ #category : 'other' }
SpkEvaluationTest >> setUp [
	super setUp.
	inspectorTool := self newInspectorToolOn: nil.
	evaluatorTool := inspectorTool addEvaluator
]
