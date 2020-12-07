Class {
	#name : 'SpkColumnLayoutServiceServer',
	#superclass : 'SpkColumnLayoutService',
	#traits : 'SpkTDebugLocalServer',
	#classTraits : 'SpkTDebugLocalServer classTrait',
	#instVars : [
		'tool',
		'explorerLayoutService'
	],
	#category : 'Sparkle-Services-PharoServer'
}

{ #category : 'instance creation' }
SpkColumnLayoutServiceServer class >> forTool: aColumnLayoutTool [

	^ self new
		  initializeFromTool: aColumnLayoutTool;
		  yourself
]

{ #category : 'accessing' }
SpkColumnLayoutServiceServer >> explorerLayoutService [

	^ explorerLayoutService
]

{ #category : 'accessing' }
SpkColumnLayoutServiceServer >> explorerLayoutService: anObject [

	explorerLayoutService := anObject
]

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
		plServ := SpkPaneLayoutServiceServer forTool: plTool.
		pServ := xServ paneServiceForTool: plTool paneTool.
		plServ paneService: pServ.

		paneLayouts add: plServ.
		xServ addPaneService: pServ ]
]
