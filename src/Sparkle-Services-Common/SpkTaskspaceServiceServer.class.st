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

{ #category : 'opening explorers' }
SpkTaskspaceServiceServer >> addDefaultExplorer [ 
	| xTool xService |
	xTool := tool addDefaultExplorer.
	xService := SpkServiceFactory serviceForTool: xTool.
	self addExplorer: xService.
	^ xService
]

{ #category : 'opening explorers' }
SpkTaskspaceServiceServer >> addProcessListExplorer [
	| xTool xService |
	xTool := tool newProcessListExplorer.
	xService := SpkServiceFactory serviceForTool: xTool.
	self addExplorer: xService.
	^ xService
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
		when: SpkExecutionAnnouncement
		send: #'receiveExecutionAnnouncement:'
		to: self.
	self refreshFromTool
]

{ #category : 'processing announcements' }
SpkTaskspaceServiceServer >> receiveExecutionAnnouncement: announcement [

	self refreshFromTool ifTrue: [ 
		announcement updatedServices add: self ]
]

{ #category : 'initialization' }
SpkTaskspaceServiceServer >> refreshFromTool [
	"Make there be one explorer service for each explorer tool in my tool,
	but keep any still-valid existing explorer services"

	| newExplorers changed |
	newExplorers := Set new.
	tool explorerTools
		do: [ :xTool | 
			| xService |
			xService := explorers
				detect: [ :xS | xS tool == xTool ]
				ifNone: [ SpkServiceFactory serviceForTool: xTool ].
			newExplorers add: xService ].
	changed := newExplorers ~= explorers.
	explorers := newExplorers.
	^ changed
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
