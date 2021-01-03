Class {
	#name : 'SpkInspectorFieldServiceServer',
	#superclass : 'SpkInspectorFieldService',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'inspecting' }
SpkInspectorFieldServiceServer >> createInspectorService [

	| objectToInspect newTool |
	objectToInspect := tool value.
	newTool := (SpkInspectorTool on: objectToInspect)
		           explorerTool: tool explorerTool;
		           yourself.
	^ SpkInspectorServiceServer forTool: newTool
]

{ #category : 'initialization' }
SpkInspectorFieldServiceServer >> initializeFromTool: aFieldTool [

	tool := aFieldTool.
	self refreshFromTool
]

{ #category : 'initialization' }
SpkInspectorFieldServiceServer >> refreshFromTool [

	name := tool name.
	description := tool selfDescription
]
