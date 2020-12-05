Class {
	#name : 'SpkTaskspaceServiceServer',
	#superclass : 'SpkTaskspaceService',
	#traits : 'SpkTDebugLocalServer',
	#classTraits : 'SpkTDebugLocalServer classTrait',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Services-PharoServer'
}

{ #category : 'as yet unclassified' }
SpkTaskspaceServiceServer class >> forTool: aTaskspaceTool [

	^ self new
		  initializeFromTool: aTaskspaceTool;
		  yourself
]

{ #category : 'initialization' }
SpkTaskspaceServiceServer >> initializeFromTool: aTaskspaceTool [

	self flag: 'needs layout integration'.

	tool := aTaskspaceTool.
	tool explorerTools do: [ :exTool | 
		self addExplorer: (SpkExplorerServiceServer forTool: exTool) ]
]
