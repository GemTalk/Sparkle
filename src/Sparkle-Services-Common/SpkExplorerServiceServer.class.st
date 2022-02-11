Class {
	#name : 'SpkExplorerServiceServer',
	#superclass : 'SpkExplorerService',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'accessing' }
SpkExplorerServiceServer >> initializeFromTool: aTool [
	tool := aTool.
	self refreshFromTool
]

{ #category : 'accessing' }
SpkExplorerServiceServer >> refreshFromTool [
	"Make there be one pane service for each pane tool in my tool,
	but keep any still-valid existing pane services"

	| newPaneServices changed |
	newPaneServices := Set new.
	tool panes
		do: [ :pTool | 
			| pService |
			pService := paneServices
				detect: [ :pS | pS tool == pTool ]
				ifNone: [ SpkServiceFactory serviceForTool: pTool ].
			newPaneServices add: pService ].
	changed := newPaneServices ~= paneServices.
	paneServices := newPaneServices.
	^ changed
]

{ #category : 'accessing' }
SpkExplorerServiceServer >> tool [

	^ tool
]
