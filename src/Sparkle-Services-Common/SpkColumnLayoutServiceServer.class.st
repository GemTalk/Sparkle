Class {
	#name : 'SpkColumnLayoutServiceServer',
	#superclass : 'SpkColumnLayoutService',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'initialization' }
SpkColumnLayoutServiceServer >> initializeFromTool: aColumnLayoutTool [

	tool := aColumnLayoutTool.
	relativeWidth := tool relativeWidth
]

{ #category : 'initialization' }
SpkColumnLayoutServiceServer >> initializePanesForExplorer: xServ [

	paneLayouts := OrderedCollection new.
	tool paneLayouts do: [ :plTool | 
		| plServ pServ |
		plServ := SpkServiceFactory serviceForTool: plTool.
		pServ := SpkServiceFactory serviceForTool: plTool paneTool.
		plServ paneService: pServ.

		paneLayouts add: plServ.
		xServ addPaneService: pServ ]
]
