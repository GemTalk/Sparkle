Class {
	#name : 'SpkTaskspaceLayoutServiceServer',
	#superclass : 'SpkTaskspaceLayoutService',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Services-PharoServer'
}

{ #category : 'instance creation' }
SpkTaskspaceLayoutServiceServer class >> forTool: aTaskspaceLayoutTool [

	^ self new
		  initializeFromTool: aTaskspaceLayoutTool;
		  yourself
]

{ #category : 'initialization' }
SpkTaskspaceLayoutServiceServer >> initializeFromTool: aTaskspaceLayoutTool [

	"We're creating new server services (by definition transient) for tools (which might be persistent)."

	tool := aTaskspaceLayoutTool.
	taskspaceService := SpkTaskspaceServiceServer forTool:
		                    tool taskspaceTool.
	explorerLayoutServices := tool explorerLayouts collect: [ :each | 
		                          SpkExplorerLayoutServiceServer forTool: each ].
	self halt
]
