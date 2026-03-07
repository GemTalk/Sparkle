Class {
	#name : 'SpkExplorerServiceBServer',
	#superclass : 'SpkExplorerServiceB',
	#traits : 'SpkTHierarchicalService',
	#classTraits : 'SpkTHierarchicalService classTrait',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Services-Common',
	#package : 'Sparkle-Services-Common'
}

{ #category : 'as yet unclassified' }
SpkExplorerServiceBServer >> createToolTreeForTransport: xport [
	self halt.
	xport linkTransportedTree.
	self halt.
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
