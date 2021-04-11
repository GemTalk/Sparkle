Class {
	#name : 'SpkTaskspaceLayoutServiceServer',
	#superclass : 'SpkTaskspaceLayoutService',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'initialization' }
SpkTaskspaceLayoutServiceServer >> addDefaultExplorer [ 
	| xlTool xlServ |
	xlTool := SpkExplorerLayoutTool defaultInTaskspace: tool taskspaceTool.
	xlServ := SpkServiceFactory serviceForTool: xlTool.
	self addExplorerLayoutService: xlServ.
	^ xlServ
]

{ #category : 'initialization' }
SpkTaskspaceLayoutServiceServer >> addExplorerLayoutService: xlServ [
	explorerLayoutServices add: xlServ.
	taskspaceService addExplorer: xlServ explorerService
]

{ #category : 'initialization' }
SpkTaskspaceLayoutServiceServer >> initializeExplorerServices [
	"Create the ExplorerLayoutServices and ExplorerServices."

	explorerLayoutServices := Set new.
	tool explorerLayouts
		do: [ :xlTool | self addExplorerLayoutService: (SpkServiceFactory serviceForTool: xlTool) ]
]

{ #category : 'initialization' }
SpkTaskspaceLayoutServiceServer >> initializeFromTool: aTaskspaceLayoutTool [
	"We're creating new server services (by definition transient) for tools (which might be persistent)."

	tool := aTaskspaceLayoutTool.
	taskspaceService := SpkServiceFactory serviceForTool: tool taskspaceTool.
	self initializeExplorerServices
]
