Class {
	#name : 'SpkPaneLayoutServiceServer',
	#superclass : 'SpkPaneLayoutService',
	#traits : 'SpkTDebugLocalServer',
	#classTraits : 'SpkTDebugLocalServer classTrait',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Services-PharoServer-Services'
}

{ #category : 'instance creation' }
SpkPaneLayoutServiceServer class >> forTool: aPaneLayoutTool [

	^ self new
		  initializeFromTool: aPaneLayoutTool;
		  yourself
]

{ #category : 'initialization' }
SpkPaneLayoutServiceServer >> initializeFromTool: paneLayoutTool [

	tool := paneLayoutTool.
	self refreshFromTool
]

{ #category : 'initialization' }
SpkPaneLayoutServiceServer >> refreshFromTool [

	"PaneCoordinate is an Array except in the presentation layer. 
	Copy so transactions and persistence will not affect the coordinate in the service layer."

	paneCoordinate := tool paneCoordinate copy.
	relativeHeight := tool relativeHeight
]
