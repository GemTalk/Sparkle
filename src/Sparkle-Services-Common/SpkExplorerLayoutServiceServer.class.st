Class {
	#name : 'SpkExplorerLayoutServiceServer',
	#superclass : 'SpkExplorerLayoutService',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'initialization' }
SpkExplorerLayoutServiceServer >> initializeColumns [
	"Create column and pane services and their layout services, based on my layout tool."

	columnLayouts := OrderedCollection new.
	tool columnLayouts
		do: [ :clTool | 
			| clServ |
			clServ := SpkServiceFactory serviceForTool: clTool.
			columnLayouts add: clServ.
			clServ initializePanesForExplorer: explorerService ]
]

{ #category : 'initialization' }
SpkExplorerLayoutServiceServer >> initializeFromTool: explorerLayoutTool [

	tool := explorerLayoutTool.
	height := tool height.
	width := tool width.
	explorerService := SpkServiceFactory serviceForTool: tool explorerTool.
	self initializeColumns
]

{ #category : 'accessing' }
SpkExplorerLayoutServiceServer >> tool [

	^ tool
]
