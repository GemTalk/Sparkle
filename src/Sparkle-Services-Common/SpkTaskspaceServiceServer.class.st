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

{ #category : 'adding' }
SpkTaskspaceServiceServer >> addDefaultExplorer [

	"Answer a new explorer service"

	| newExplorerTool |
	newExplorerTool := tool addDefaultExplorer.
	^ SpkServiceFactory serviceForTool: newExplorerTool
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
]

{ #category : 'opening explorers' }
SpkTaskspaceServiceServer >> openNewExplorer: anExplorerLayoutTool [

	| promise |
	promise := remoteSelf openNewExplorer: (SpkServiceFactory serviceForTool: anExplorerLayoutTool).
	promise
		when: [:res | "NOP"]
		catch: [:reason | GsFile gciLogServer: 'SpkTaskspaceServiceServer>>#openNewExplorer: ', Character lf asString, reason printString]
]

{ #category : 'handling announcements' }
SpkTaskspaceServiceServer >> receiveOpenNewExplorer: anAnnouncement [

	self openNewExplorer: anAnnouncement tool
]

{ #category : 'initialization' }
SpkTaskspaceServiceServer >> registerForAnnouncements [

	tool
		when: SpkNewExplorerLayoutToolAnnouncement
		send: #receiveOpenNewExplorer:
		to: self
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

{ #category : 'initialization' }
SpkTaskspaceServiceServer >> tool: aTaskspaceTool [

	tool := aTaskspaceTool.
	self registerForAnnouncements
]
