Class {
	#name : 'SpkExplorerServiceServer',
	#superclass : 'SpkExplorerService',
	#traits : 'SpkTHierarchicalService + SpkTPromise',
	#classTraits : 'SpkTHierarchicalService classTrait + SpkTPromise classTrait',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Services-Common',
	#package : 'Sparkle-Services-Common'
}

{ #category : 'initialization' }
SpkExplorerServiceServer >> createToolTreeForTransport: transportService inTaskspace: taskspaceService [

	transportService linkTransportedTree.
	"ExplorerTool does not keep track of child tools."
	self initializeFromTool: taskspaceService tool newExplorerTool.
	self children do: [ :childService | childService createToolTree ]
]

{ #category : 'initialization' }
SpkExplorerServiceServer >> initializeFromTool: aTool [

	tool := aTool.
	tool
		when: SpkUpdateAnnouncement
		send: #receiveUpdateAnnouncement:
		to: self.
	self refreshFromTool
]

{ #category : 'inspecting' }
SpkExplorerServiceServer >> newInspectorServiceOn: anObject [
	| iTool |
	iTool := tool newInspectorToolOn: anObject.
	^ SpkServiceFactory serviceForTool: iTool
]

{ #category : 'as yet unclassified' }
SpkExplorerServiceServer >> receiveUpdateAnnouncement: anUpdateAnnouncement [

	| promise |
	self refreshFromTool.
	promise := remoteSelf updateFromServer.
	promise when: [  ] catch: self defaultCatchBlock
]

{ #category : 'actions' }
SpkExplorerServiceServer >> redo [

	tool redo
]

{ #category : 'refreshing' }
SpkExplorerServiceServer >> refreshFromTool [

	undoActionName := tool undoActionName.
	redoActionName := tool redoActionName
]

{ #category : 'accessing' }
SpkExplorerServiceServer >> tool [

	^ tool
]

{ #category : 'actions' }
SpkExplorerServiceServer >> undo [

	tool undo
]
