Class {
	#name : 'SpkTaskspaceLayoutServiceServer',
	#superclass : 'SpkTaskspaceLayoutService',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'initialization' }
SpkTaskspaceLayoutServiceServer >> initializeExplorerServices [

	"Create the ExplorerLayoutServices and ExplorerServices."

	explorerLayoutServices := Set new.
	tool explorerLayouts do: [ :xlTool | 
		| xlServ xServ |
		xlServ := SpkServiceFactory serviceForTool: xlTool.
		xServ := SpkServiceFactory serviceForTool: xlTool explorerTool.
		xlServ explorerService: xServ.

		explorerLayoutServices add: xlServ.
		taskspaceService addExplorer: xServ.

		xlServ initializeColumns ]
]

{ #category : 'initialization' }
SpkTaskspaceLayoutServiceServer >> initializeFromTool: aTaskspaceLayoutTool [
	"We're creating new server services (by definition transient) for tools (which might be persistent)."

	tool := aTaskspaceLayoutTool.
	taskspaceService := SpkServiceFactory serviceForTool: tool taskspaceTool.
	self initializeExplorerServices
]
