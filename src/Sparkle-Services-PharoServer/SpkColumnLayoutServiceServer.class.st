Class {
	#name : 'SpkColumnLayoutServiceServer',
	#superclass : 'SpkColumnLayoutService',
	#traits : 'SpkTDebugLocalServer',
	#classTraits : 'SpkTDebugLocalServer classTrait',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Services-PharoServer'
}

{ #category : 'instance creation' }
SpkColumnLayoutServiceServer class >> forTool: aColumnLayoutTool [

	^ self new
		  initializeFromTool: aColumnLayoutTool;
		  yourself
]

{ #category : 'initialization' }
SpkColumnLayoutServiceServer >> initializeFromTool: aColumnLayoutTool [

	tool := aColumnLayoutTool.
	self refreshFromTool
]

{ #category : 'initialization' }
SpkColumnLayoutServiceServer >> refreshFromTool [

	relativeWidth := tool relativeWidth.
	paneLayouts := tool paneLayouts collect: [ :each | 
		               SpkPaneLayoutServiceServer new
			               initializeFromTool: each;
			               yourself ]
]
