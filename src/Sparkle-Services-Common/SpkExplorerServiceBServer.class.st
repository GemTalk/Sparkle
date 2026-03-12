Class {
	#name : 'SpkExplorerServiceBServer',
	#superclass : 'SpkExplorerServiceB',
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
SpkExplorerServiceBServer >> createToolTreeForTransport: transportService inTaskspace: taskspaceService [

	transportService linkTransportedTree.
	"ExplorerTool does not keep track of child tools."
	tool := taskspaceService tool newExplorerTool.
	self children do: [ :childService | childService createToolTree ].

	self halt
]

{ #category : 'initialization' }
SpkExplorerServiceBServer >> initializeFromTool: aTool [
	tool := aTool
]

{ #category : 'inspecting' }
SpkExplorerServiceBServer >> newInspectorServiceOn: anObject [
	| iTool |
	iTool := tool newInspectorToolOn: anObject.
	^ SpkServiceFactory serviceForTool: iTool
]

{ #category : 'accessing' }
SpkExplorerServiceBServer >> tool [

	^ tool
]
