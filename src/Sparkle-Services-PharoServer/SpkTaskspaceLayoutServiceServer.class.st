Class {
	#name : 'SpkTaskspaceLayoutServiceServer',
	#superclass : 'SpkTaskspaceLayoutService',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Services-PharoServer-Services'
}

{ #category : 'instance creation' }
SpkTaskspaceLayoutServiceServer class >> forTool: aTaskspaceLayoutTool [

	^ self new
		  initializeFromTool: aTaskspaceLayoutTool;
		  yourself
]

{ #category : 'initialization' }
SpkTaskspaceLayoutServiceServer >> initializeExplorerServices [

	"Create the ExplorereLayoutServices and ExplorerServices."

	explorerLayoutServices := Set new.
	tool explorerLayouts do: [ :xlTool | 
		| xlServ xServ |
		xlServ := SpkExplorerLayoutServiceServer forTool: xlTool.
		xServ := SpkExplorerServiceServer forTool: xlTool explorerTool.
		xlServ explorerService: xServ.

		explorerLayoutServices add: xlServ.
		taskspaceService addExplorer: xServ.

		xlServ initializeColumns ]
]

{ #category : 'initialization' }
SpkTaskspaceLayoutServiceServer >> initializeFromTool: aTaskspaceLayoutTool [

	"We're creating new server services (by definition transient) for tools (which might be persistent)."

	tool := aTaskspaceLayoutTool.
	taskspaceService := SpkTaskspaceServiceServer forTool:
		                    tool taskspaceTool.
	self initializeExplorerServices
]
