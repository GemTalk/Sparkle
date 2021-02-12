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

	name := tool name.
	description := tool selfDescription
]
