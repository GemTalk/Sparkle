Class {
	#name : 'SpkExplorerLayoutServiceServer',
	#superclass : 'SpkExplorerLayoutService',
	#traits : 'SpkTDebugLocalServer',
	#classTraits : 'SpkTDebugLocalServer classTrait',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Services-PharoServer'
}

{ #category : 'instance creation' }
SpkExplorerLayoutServiceServer class >> forTool: anExplorerLayoutTool [

	^ self new
		  initializeFromTool: anExplorerLayoutTool;
		  yourself
]

{ #category : 'initialization' }
SpkExplorerLayoutServiceServer >> initializeColumns [

	"Create column and pane services and their layout services, based on my layout tool."

	columnLayouts := OrderedCollection new.
	tool columnLayouts do: [ :clTool | 
		| clServ |
		clServ := SpkColumnLayoutServiceServer forTool: clTool.
		columnLayouts add: clServ.
		clServ initializePanesForExplorer: explorerService ]
]

{ #category : 'as yet unclassified' }
SpkExplorerLayoutServiceServer >> initializeFromTool: explorerLayoutTool [

	tool := explorerLayoutTool.
	height := tool height.
	width := tool width
]

{ #category : 'accessing' }
SpkExplorerLayoutServiceServer >> tool [

	^ tool
]
