Class {
	#name : 'SpkInspectorFieldServiceServer',
	#superclass : 'SpkInspectorFieldService',
	#instVars : [
		'tool',
		'referencedObject'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'inspecting' }
SpkInspectorFieldServiceServer >> createInspectorServiceIn: xService [
	"Sent from client."

	^ xService newInspectorServiceOn: tool referencedObject
]

{ #category : 'initialization' }
SpkInspectorFieldServiceServer >> initializeFromTool: aFieldTool [

	tool := aFieldTool.
	self refreshFromTool
]

{ #category : 'actions' }
SpkInspectorFieldServiceServer >> moveToExplorer: xServ [
	tool explorerTool: xServ tool
]

{ #category : 'initialization' }
SpkInspectorFieldServiceServer >> refreshFromTool [

	| changed |
	changed := false.

	columns size = tool numberOfColumns ifFalse: [ 
		changed := true.
		columns := Array new: tool numberOfColumns ].
	tool referencedObject == referencedObject ifFalse: [ 
		changed := true.
		referencedObject := tool referencedObject ].

	1 to: columns size do: [ :i | 
		| toolColumn |
		toolColumn := tool columnAt: i.
		toolColumn = (columns at: i) ifFalse: [ 
			changed := true.
			columns at: i put: toolColumn ] ].
	^ changed
]

{ #category : 'accessing' }
SpkInspectorFieldServiceServer >> tool [

	^tool
]

{ #category : 'accessing' }
SpkInspectorFieldServiceServer >> tool: anObject [

	tool := anObject
]
