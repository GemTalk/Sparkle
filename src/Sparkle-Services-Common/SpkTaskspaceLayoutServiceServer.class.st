Class {
	#name : 'SpkTaskspaceLayoutServiceServer',
	#superclass : 'SpkTaskspaceLayoutService',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'opening explorers' }
SpkTaskspaceLayoutServiceServer >> addDefaultExplorer [ 
	| xlTool xlService |
	xlTool := tool newEvaluatorExplorerLayout.
	xlService := SpkServiceFactory serviceForTool: xlTool.
	self addExplorerLayoutService: xlService.
	^ xlService
]

{ #category : 'opening explorers' }
SpkTaskspaceLayoutServiceServer >> addExplorerLayoutService: xlServ [
	explorerLayoutServices add: xlServ.
	taskspaceService addExplorer: xlServ explorerService
]

{ #category : 'opening explorers' }
SpkTaskspaceLayoutServiceServer >> addProcessListExplorer [
	| xlTool xlService |
	xlTool := tool newProcessListExplorerLayout.
	xlService := SpkServiceFactory serviceForTool: xlTool.
	self addExplorerLayoutService: xlService.
	^ xlService
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
	self registerForAnnouncements.
	taskspaceService := SpkServiceFactory serviceForTool: tool taskspaceTool.
	self initializeExplorerServices
]

{ #category : 'opening explorers' }
SpkTaskspaceLayoutServiceServer >> openNewExplorerLayout: anExplorerLayoutTool [

	| promise |
	promise := remoteSelf openNewExplorerLayout: (SpkServiceFactory serviceForTool: anExplorerLayoutTool).
	promise
		when: [:res | "NOP"]
		catch: [:reason | GsFile gciLogServer: 'SpkTaskspaceServiceServer>>#openNewExplorerLayout: ', Character lf asString, reason printString]
]

{ #category : 'opening explorers' }
SpkTaskspaceLayoutServiceServer >> receiveNewExplorerLayoutTool: anAnnouncement [

	self openNewExplorerLayout: anAnnouncement tool
]

{ #category : 'initialization' }
SpkTaskspaceLayoutServiceServer >> registerForAnnouncements [

	tool
		when: SpkNewExplorerLayoutToolAnnouncement
		send: #receiveNewExplorerLayoutTool:
		to: self
]
