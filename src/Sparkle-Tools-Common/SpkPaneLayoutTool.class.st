Class {
	#name : 'SpkPaneLayoutTool',
	#superclass : 'SpkTool',
	#instVars : [
		'relativeHeight',
		'paneCoordinate',
		'paneTool'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'accessing' }
SpkPaneLayoutTool >> paneCoordinate [

	^ paneCoordinate
]

{ #category : 'accessing' }
SpkPaneLayoutTool >> paneCoordinate: anObject [

	paneCoordinate := anObject
]

{ #category : 'accessing' }
SpkPaneLayoutTool >> paneTool [

	^ paneTool
]

{ #category : 'accessing' }
SpkPaneLayoutTool >> paneTool: anObject [

	paneTool := anObject
]

{ #category : 'accessing' }
SpkPaneLayoutTool >> relativeHeight [

	^ relativeHeight
]

{ #category : 'accessing' }
SpkPaneLayoutTool >> relativeHeight: anObject [

	relativeHeight := anObject
]
