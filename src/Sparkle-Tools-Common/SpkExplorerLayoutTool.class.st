Class {
	#name : 'SpkExplorerLayoutTool',
	#superclass : 'SpkTool',
	#instVars : [
		'width',
		'height',
		'columnLayouts',
		'explorerTool'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'adding' }
SpkExplorerLayoutTool >> addColumnLayout: aColumnLayoutTool [

	columnLayouts add: aColumnLayoutTool
]

{ #category : 'accessing' }
SpkExplorerLayoutTool >> columnLayouts [

	^ columnLayouts
]

{ #category : 'accessing' }
SpkExplorerLayoutTool >> columnLayouts: anObject [

	columnLayouts := anObject
]

{ #category : 'accessing' }
SpkExplorerLayoutTool >> explorerTool [

	^ explorerTool
]

{ #category : 'accessing' }
SpkExplorerLayoutTool >> height [

	^ height
]

{ #category : 'accessing' }
SpkExplorerLayoutTool >> height: anObject [

	height := anObject
]

{ #category : 'initialization' }
SpkExplorerLayoutTool >> initialize [

	super initialize.
	columnLayouts := OrderedCollection new.
	height := width := 900
]

{ #category : 'initialization' }
SpkExplorerLayoutTool >> initializeForTool: anExplorerTool [

	explorerTool := anExplorerTool.
	"Assume a small number of panes (like one for the default) so put them all in one column."
	columnLayouts add: (SpkColumnLayoutTool new
			 initializeFromTool: anExplorerTool;
			 yourself)
]

{ #category : 'removing' }
SpkExplorerLayoutTool >> removeColumnLayout: aColumnLayoutTool [

	columnLayouts remove: aColumnLayoutTool
]

{ #category : 'accessing' }
SpkExplorerLayoutTool >> width [

	^ width
]

{ #category : 'accessing' }
SpkExplorerLayoutTool >> width: anObject [

	width := anObject
]
