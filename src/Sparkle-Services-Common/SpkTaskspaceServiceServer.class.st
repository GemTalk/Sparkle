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

	| resultTool resultService announcement |
	updatedServices := Set new.
	announcement := SpkExecutionAnnouncement new
		                updatedServices: updatedServices;
		                yourself.
	resultTool := self tool abortTransactionAnnouncing: announcement.

	self refreshFromTool.
	resultService := SpkServiceFactory serviceForTool: resultTool.
	^ resultService
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

	| resultTool resultService announcement |
	updatedServices := Set new.
	announcement := SpkExecutionAnnouncement new
		                updatedServices: updatedServices;
		                yourself.
	resultTool := self tool beginTransactionAnnouncing: announcement.

	self refreshFromTool.
	resultService := SpkServiceFactory serviceForTool: resultTool.
	^ resultService
]

{ #category : 'transaction management' }
SpkTaskspaceServiceServer >> commitTransaction [
	"Commit the current transaction"

	| resultTool resultService announcement |
	updatedServices := Set new.
	announcement := SpkExecutionAnnouncement new
		                updatedServices: updatedServices;
		                yourself.
	resultTool := self tool commitTransactionAnnouncing: announcement.

	self refreshFromTool.
	resultService := SpkServiceFactory serviceForTool: resultTool.
	^ resultService
]

{ #category : 'initialization' }
SpkTaskspaceServiceServer >> initializeFromTool: aTool [
	tool := aTool
]

{ #category : 'transaction management' }
SpkTaskspaceServiceServer >> setAutomaticTransactionMode [
	"Abort the current transaction and begin using automatic transaction mode"

	| resultTool resultService announcement |
	updatedServices := Set new.
	announcement := SpkExecutionAnnouncement new
		                updatedServices: updatedServices;
		                yourself.
	resultTool := self tool setAutomaticTransactionModeAnnouncing: announcement.

	self refreshFromTool.
	resultService := SpkServiceFactory serviceForTool: resultTool.
	^ resultService
]

{ #category : 'transaction management' }
SpkTaskspaceServiceServer >> setManualTransactionMode [
	"Abort the current transaction and begin using manual transaction mode"

	| resultTool resultService announcement |
	updatedServices := Set new.
	announcement := SpkExecutionAnnouncement new
		                updatedServices: updatedServices;
		                yourself.
	resultTool := self tool setManualTransactionModeAnnouncing: announcement.

	self refreshFromTool.
	resultService := SpkServiceFactory serviceForTool: resultTool.
	^ resultService
]

{ #category : 'initialization' }
SpkTaskspaceServiceServer >> tool: aTaskspaceTool [

	tool := aTaskspaceTool
]
