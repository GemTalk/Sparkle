Class {
	#name : 'SpkExplorerLayoutServiceServer',
	#superclass : 'SpkExplorerLayoutService',
	#traits : 'SpkTDebugLocalServer',
	#classTraits : 'SpkTDebugLocalServer classTrait',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Services-PharoServer'
}

{ #category : 'instance creation' }
SpkExplorerLayoutServiceServer class >> forTool: anExplorerLayoutTool [

	^ self new
		  initializeFromTool: anExplorerLayoutTool;
		  yourself
]

{ #category : 'as yet unclassified' }
SpkExplorerLayoutServiceServer >> initializeFromTool: explorerLayoutTool [

	tool := explorerLayoutTool.
	self refreshFromTool
]

{ #category : 'initialization' }
SpkExplorerLayoutServiceServer >> refreshFromTool [

	height := tool height.
	width := tool width.
	columnLayouts := tool columnLayouts collect: [ :each | 
		                 SpkColumnLayoutServiceServer forTool: each ]
]
