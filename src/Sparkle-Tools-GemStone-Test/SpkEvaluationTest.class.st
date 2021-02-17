Class {
	#name : 'SpkEvaluationTest',
	#superclass : 'SpkTestCase',
	#instVars : [
		'inspectorTool',
		'evaluatorTool'
	],
	#category : 'Sparkle-Tools-GemStone-Test'
}

{ #category : 'other' }
SpkEvaluationTest >> setUp [
	super setUp.
	inspectorTool := SpkInspectorTool on: nil.
	evaluatorTool := SpkEvaluatorTool new
		inspectorTool: inspectorTool;
		yourself
]
