Class {
	#name : 'SpkTaskspaceServiceServer',
	#superclass : 'SpkTaskspaceService',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'transaction management' }
SpkTaskspaceServiceServer >> abortTransaction [
	"Sent from client"

	"Abort the current transaction"

	| resultTool |
	resultTool := tool
		abortTransactionAnnouncing:
			(SpkExecutionAnnouncement updatedServices: updatedServices).
	^ SpkServiceFactory serviceForTool: resultTool
]

{ #category : 'transaction management' }
SpkTaskspaceServiceServer >> beginTransaction [
	"Sent from client"

	"Begin a new transaction"

	| resultTool |
	resultTool := tool
		beginTransactionAnnouncing:
			(SpkExecutionAnnouncement updatedServices: updatedServices).
	^ SpkServiceFactory serviceForTool: resultTool
]

{ #category : 'transaction management' }
SpkTaskspaceServiceServer >> commitTransaction [
	"Sent from client"

	"Commit the current transaction"

	| resultTool |
	resultTool := tool
		commitTransactionAnnouncing:
			(SpkExecutionAnnouncement updatedServices: updatedServices).
	^ SpkServiceFactory serviceForTool: resultTool
]

{ #category : 'updating' }
SpkTaskspaceServiceServer >> gatherUpdatedServices [
	"Each service subscribed to my tool gets a chance to add itself to my updatedServices
	if it detects a significant change."

	tool announce: (SpkExecutionAnnouncement updatedServices: updatedServices)
]

{ #category : 'initialization' }
SpkTaskspaceServiceServer >> initializeFromTool: aTool [
	self tool: aTool.
	tool
		when: SpkNewExplorerAndPaneAnnouncement
		send: #'receiveNewExplorerAndPaneAnnouncement:'
		to: self
]

{ #category : 'opening explorers' }
SpkTaskspaceServiceServer >> newEvaluatorExplorer [
	| xTool pTool xService pService |
	xTool := tool newExplorerTool.
	pTool := SpkInspectorTool newInExplorer: xTool.
	pTool addEvaluator.

	xService := SpkServiceFactory serviceForTool: xTool.
	pService := SpkServiceFactory serviceForTool: pTool.
	self gatherUpdatedServices.
	^ SpkExplorerAndPaneServiceServer newForPane: pService inExplorer: xService
]

{ #category : 'opening explorers' }
SpkTaskspaceServiceServer >> newProcessListExplorer [
	"Sent from client."

	| xTool pTool xService pService |
	xTool := tool newExplorerTool.
	pTool := SpkProcessListTool newInExplorer: xTool.

	xService := SpkServiceFactory serviceForTool: xTool.
	pService := SpkServiceFactory serviceForTool: pTool.
	self gatherUpdatedServices.
	^ SpkExplorerAndPaneServiceServer newForPane: pService inExplorer: xService
]

{ #category : 'processing announcements' }
SpkTaskspaceServiceServer >> receiveNewExplorerAndPaneAnnouncement: announcement [
	"Receiving this announcement should mean that I have a new explorer,
	and a new pane, and need to send them to the client."

	| pService xService combinedService promise |
	pService := SpkServiceFactory serviceForTool: announcement pane.
	xService := SpkServiceFactory serviceForTool: announcement explorer.

	combinedService := SpkExplorerAndPaneServiceServer
		newForPane: pService
		inExplorer: xService.

	self gatherUpdatedServices.

	promise := remoteSelf announceNewExplorerAndPane: combinedService.
	promise
		when: [ :ignored | 
			"no action required"
			 ]
		catch: [ :reason | 
			SpkLogger
				logError:
					'Send of #newExplorerService: failed because ' , reason printString ]
]

{ #category : 'transaction management' }
SpkTaskspaceServiceServer >> setAutomaticTransactionMode [
	"Sent from client"

	"Abort the current transaction and begin using automatic transaction mode"

	| resultTool |
	resultTool := tool
		setAutomaticTransactionModeAnnouncing:
			(SpkExecutionAnnouncement updatedServices: updatedServices).
	^ SpkServiceFactory serviceForTool: resultTool
]

{ #category : 'transaction management' }
SpkTaskspaceServiceServer >> setManualTransactionMode [
	"Sent from client"

	"Abort the current transaction and begin using manual transaction mode"

	| resultTool |
	resultTool := tool
		setManualTransactionModeAnnouncing:
			(SpkExecutionAnnouncement updatedServices: updatedServices).
	^ SpkServiceFactory serviceForTool: resultTool
]

{ #category : 'initialization' }
SpkTaskspaceServiceServer >> tool: aTaskspaceTool [

	tool := aTaskspaceTool
]
