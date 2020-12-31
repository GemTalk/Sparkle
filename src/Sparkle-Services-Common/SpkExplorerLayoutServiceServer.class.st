Class {
	#name : 'SpkExplorerLayoutServiceServer',
	#superclass : 'SpkExplorerLayoutService',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Services-Common'
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

{ #category : 'initialization' }
SpkExplorerLayoutServiceServer >> initializeFromTool: explorerLayoutTool [

	tool := explorerLayoutTool.
	height := tool height.
	width := tool width
]

{ #category : 'accessing' }
SpkExplorerLayoutServiceServer >> tool [

	^ tool
]
