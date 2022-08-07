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
	"Sent from client"

	"Evaluate my newSourceCode, answer a new service for the result."

	| resultTool resultService |
	self tool newSourceCode: newSourceCode.
	resultTool := self tool
		acceptAnnouncing: (SpkExecutionAnnouncement updatedServices: updatedServices).
	self refreshFromTool.
	resultService := SpkServiceFactory serviceForTool: resultTool.
	^ resultService
]

{ #category : 'actions' }
SpkEvaluatorServiceServer >> debug [
	"Sent from client"

	"Evaluate my newSourceCode but stop at the first stepPoint."

	| resultTool resultService |
	self tool newSourceCode: newSourceCode.
	resultTool := self tool
		debugAnnouncing: (SpkExecutionAnnouncement updatedServices: updatedServices).
	self refreshFromTool.
	resultService := SpkServiceFactory serviceForTool: resultTool.
	^ resultService
]

{ #category : 'initialization' }
SpkEvaluatorServiceServer >> initializeFromTool: evaluatorTool [

	"If we're restoring a taskspace I get initialized from my tool.
	If I'm being created from the client, I have to create a tool for myself to use."

	tool := evaluatorTool.
	self refreshFromTool
]

{ #category : 'initialization' }
SpkEvaluatorServiceServer >> initializeTool [

	"If we're restoring a taskspace I get initialized from my tool.
	If I'm being created from the client, I have to create a tool for myself to use."

	| inspectorTool |
	inspectorTool := parentService tool.
	tool := SpkEvaluatorTool new.
	^ tool
		  oldSourceCode: oldSourceCode;
		  newSourceCode: newSourceCode;
		  inspectorTool: inspectorTool;
		  explorerTool: inspectorTool explorerTool;
		  taskspaceTool: inspectorTool taskspaceTool;
		  yourself
]

{ #category : 'actions' }
SpkEvaluatorServiceServer >> moveToExplorer: xServ [
	tool explorerTool: xServ tool
]

{ #category : 'initialization' }
SpkEvaluatorServiceServer >> refreshFromTool [
	oldSourceCode := tool oldSourceCode.
	newSourceCode := tool newSourceCode
]

{ #category : 'initialization' }
SpkEvaluatorServiceServer >> tool [
	"If we're restoring a taskspace I get initialized from my tool.
	If I'm being created from the client, I have to create a tool for myself to use."

	^ tool ifNil: [ self initializeTool ]
]
