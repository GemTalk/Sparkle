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

{ #category : 'visiting' }
SpkEvaluatorServiceServer >> accept [

	"Evaluate my newSourceCode, answer a new service for the result."

	| resultTool |
	tool newSourceCode: newSourceCode.

	resultTool := tool accept.
	self halt
]

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
