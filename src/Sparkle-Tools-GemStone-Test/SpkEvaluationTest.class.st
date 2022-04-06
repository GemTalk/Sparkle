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

{ #category : 'testing' }
SpkEvaluationTest class >> isAbstract [
	^ self sunitName = #'SpkEvaluationTest'
]

{ #category : 'private' }
SpkEvaluationTest >> evaluateCode [ 

	^ evaluatorTool evaluateCodeAnnouncing: SpkExecutionAnnouncement new
]

{ #category : 'initialization' }
SpkEvaluationTest >> newInspectorToolOn: anObject [
	taskspaceTool := SpkTaskspaceTool new.
	explorerTool := taskspaceTool newExplorerTool.
	^ tool := explorerTool newInspectorToolOn: anObject
]

{ #category : 'initialization' }
SpkEvaluationTest >> setUp [
	super setUp.
	inspectorTool := self newInspectorToolOn: nil.
	evaluatorTool := inspectorTool addEvaluator
]
