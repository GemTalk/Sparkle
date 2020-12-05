Class {
	#name : 'SpkExplorerServiceServer',
	#superclass : 'SpkExplorerService',
	#traits : 'SpkTDebugLocalServer',
	#classTraits : 'SpkTDebugLocalServer classTrait',
	#category : 'Sparkle-Services-PharoServer'
}

{ #category : 'instance creation' }
SpkExplorerServiceServer class >> forTool: anExplorerTool [

	^ self new
		  initializeFromTool: anExplorerTool;
		  yourself
]

{ #category : 'initialization' }
SpkExplorerServiceServer >> initializeFromTool: anExplorerTool [

	self flag: 'needs layout integration'.

	anExplorerTool panes do: [ :paneTool | 
		self addPaneService: (self paneServiceForTool: paneTool) ]
]
