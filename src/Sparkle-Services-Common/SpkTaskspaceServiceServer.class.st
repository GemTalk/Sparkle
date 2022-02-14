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
	"Abort the current transaction"

	| resultTool announcement |
	updatedServices := Set new.
	announcement := SpkExecutionAnnouncement new
		                updatedServices: updatedServices;
		                yourself.
	resultTool := tool abortTransactionAnnouncing: announcement.
	^SpkServiceFactory serviceForTool: resultTool
]

{ #category : 'transaction management' }
SpkTaskspaceServiceServer >> beginTransaction [
	"Begin a new transaction"

	| resultTool announcement |
	updatedServices := Set new.
	announcement := SpkExecutionAnnouncement new
		                updatedServices: updatedServices;
		                yourself.
	resultTool := tool beginTransactionAnnouncing: announcement.
	^SpkServiceFactory serviceForTool: resultTool
]

{ #category : 'transaction management' }
SpkTaskspaceServiceServer >> commitTransaction [
	"Commit the current transaction"

	| resultTool announcement |
	updatedServices := Set new.
	announcement := SpkExecutionAnnouncement new
		updatedServices: updatedServices;
		yourself.
	resultTool := tool commitTransactionAnnouncing: announcement.
	^SpkServiceFactory serviceForTool: resultTool
]

{ #category : 'initialization' }
SpkTaskspaceServiceServer >> initializeFromTool: aTool [
	self tool: aTool.
	tool
		when: SpkNewExplorerToolAnnouncement
		send: #'receiveNewExplorerToolAnnouncement:'
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
	^ SpkExplorerAndPaneService newForPane: pService inExplorer: xService
]

{ #category : 'opening explorers' }
SpkTaskspaceServiceServer >> newProcessListExplorer [
	"Sent from client."

	| xTool pTool xService pService |
	xTool := tool newExplorerTool.
	pTool := SpkProcessListTool newInExplorer: xTool.

	xService := SpkServiceFactory serviceForTool: xTool.
	pService := SpkServiceFactory serviceForTool: pTool.
	^ SpkExplorerAndPaneService newForPane: pService inExplorer: xService
]

{ #category : 'processing announcements' }
SpkTaskspaceServiceServer >> receiveNewExplorerToolAnnouncement: announcement [
	"Receiving this announcement should mean that I have a new explorer, 
	and need to send that to the client."

	| xTool existingService newService promise |
	xTool := announcement tool.
	existingService := nil
		detect: [ :xService | xService tool == xTool ]
		ifNone: [ nil ].
	existingService
		ifNotNil: [ self error: 'Expected a new explorer tool, not one I already have.' ].
	newService := SpkServiceFactory serviceForTool: xTool.
	"explorers add: newService."

	promise := remoteSelf newExplorerService: newService.
	promise
		when: [:ignored | "no action required" ]
		catch: [ :reason | 
			GsFile
				gciLogServer:
					'Send of #newExplorerService: failed because ' , reason printString ]
]

{ #category : 'transaction management' }
SpkTaskspaceServiceServer >> setAutomaticTransactionMode [
	"Abort the current transaction and begin using automatic transaction mode"

	| resultTool announcement |
	updatedServices := Set new.
	announcement := SpkExecutionAnnouncement new
		                updatedServices: updatedServices;
		                yourself.
	resultTool := tool setAutomaticTransactionModeAnnouncing: announcement.
	^SpkServiceFactory serviceForTool: resultTool
]

{ #category : 'transaction management' }
SpkTaskspaceServiceServer >> setManualTransactionMode [
	"Abort the current transaction and begin using manual transaction mode"

	| resultTool announcement |
	updatedServices := Set new.
	announcement := SpkExecutionAnnouncement new
		                updatedServices: updatedServices;
		                yourself.
	resultTool := tool setManualTransactionModeAnnouncing: announcement.
	^SpkServiceFactory serviceForTool: resultTool
]

{ #category : 'updating' }
SpkTaskspaceServiceServer >> synchronizeTaskspace [
	"Synchronize with the client which has requested the server update its state."

	| announcement |
	updatedServices := Set new.
	announcement := SpkExecutionAnnouncement new
		updatedServices: updatedServices;
		yourself.
	tool announce: announcement.
	^self
]

{ #category : 'initialization' }
SpkTaskspaceServiceServer >> tool: aTaskspaceTool [

	tool := aTaskspaceTool
]
