Class {
	#name : 'SpkEvaluatorServiceServer',
	#superclass : 'SpkEvaluatorService',
	#traits : 'SpkTDebugLocalServer',
	#classTraits : 'SpkTDebugLocalServer classTrait',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Services-PharoServer-Services'
}

{ #category : 'initialization' }
SpkEvaluatorServiceServer >> initializeFromTool: evaluatorTool [

	tool := evaluatorTool.
	self refreshFromTool
]

{ #category : 'initialization' }
SpkEvaluatorServiceServer >> refreshFromTool [

	oldSourceCode := tool oldSourceCode.
	newSourceCode := tool newSourceCode
]
