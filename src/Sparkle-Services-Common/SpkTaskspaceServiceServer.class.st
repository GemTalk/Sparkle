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
