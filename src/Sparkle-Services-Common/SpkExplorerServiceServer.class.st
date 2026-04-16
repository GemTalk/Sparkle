Class {
	#name : 'SpkExplorerServiceServer',
	#superclass : 'SpkExplorerService',
	#traits : 'SpkTHierarchicalService',
	#classTraits : 'SpkTHierarchicalService classTrait',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Services-Common-Services',
	#package : 'Sparkle-Services-Common',
	#tag : 'Services'
}

{ #category : 'as yet unclassified' }
SpkExplorerServiceServer >> createToolTreeForTransport: transportService inTaskspace: taskspaceService [

	transportService linkTransportedTree.
	"ExplorerTool does not keep track of child tools."
	tool := taskspaceService tool newExplorerTool.
	self children do: [ :childService | childService createToolTree ]
]

{ #category : 'initialization' }
SpkExplorerServiceServer >> initializeFromTool: aTool [
	tool := aTool
]

{ #category : 'inspecting' }
SpkExplorerServiceServer >> newInspectorServiceOn: anObject [
	| iTool |
	iTool := tool newInspectorToolOn: anObject.
	^ SpkServiceFactory serviceForTool: iTool
]

{ #category : 'accessing' }
SpkExplorerServiceServer >> tool [

	^ tool
]
