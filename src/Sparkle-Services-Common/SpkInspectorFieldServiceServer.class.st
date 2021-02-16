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

	| newTool |
	newTool := (SpkInspectorTool on: tool inspectedObject)
		           explorerTool: tool explorerTool;
		           taskspaceTool: tool taskspaceTool;
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

	| changed |
	changed := false.
	name = tool name ifFalse: [ changed := true ].
	description = tool selfDescription ifFalse: [ changed := true ].
	oop = tool oop ifFalse: [ changed := true ].
	name := tool name.
	description := tool selfDescription.
	oop := tool oop.
	^ changed
]

{ #category : 'accessing' }
SpkInspectorFieldServiceServer >> tool: anObject [

	tool := anObject
]
