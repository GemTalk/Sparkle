Class {
	#name : 'SpkExplorerServiceServer',
	#superclass : 'SpkExplorerService',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Services-Common'
}

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
