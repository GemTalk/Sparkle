"
Abstract superclass for tools that are top-level within an explorer
"
Class {
	#name : 'SpkPaneTool',
	#superclass : 'SpkTool',
	#instVars : [
		'explorerTool'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'instance creation' }
SpkPaneTool class >> newInExplorer: anExplorerTool [
	^ (self newInTaskspace: anExplorerTool taskspaceTool)
		initializeInExplorer: anExplorerTool;
		yourself
]

{ #category : 'accessing' }
SpkPaneTool >> explorerTool [
	^explorerTool
]

{ #category : 'accessing' }
SpkPaneTool >> explorerTool: object [
	explorerTool := object
]

{ #category : 'initialization' }
SpkPaneTool >> initializeInExplorer: xTool [
	explorerTool := xTool
]
