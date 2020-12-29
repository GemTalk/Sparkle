Class {
	#name : 'SpkEvaluatorServiceServer',
	#superclass : 'SpkEvaluatorService',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'actions' }
SpkEvaluatorServiceServer >> accept [

	"Evaluate my newSourceCode, answer a new service for the result."

	| resultTool resultService |
	tool newSourceCode: newSourceCode.
	resultTool := tool accept.

	self refreshFromTool.
	resultService := self serviceForTool: resultTool.
	^ resultService
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

{ #category : 'accessing' }
SpkEvaluatorServiceServer >> serviceForTool: aTool [

	| serviceClass |
	serviceClass := SpkExplorerServiceServer serviceClassForToolClass:
		                aTool class.
	^ serviceClass forTool: aTool
]
