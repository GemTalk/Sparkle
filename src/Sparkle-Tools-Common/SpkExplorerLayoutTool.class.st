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

{ #category : 'instance creation' }
SpkExplorerLayoutTool class >> defaultInTaskspace: aTaskspaceTool [
	^ (self newInTaskspace: aTaskspaceTool)
		initializeForDefault;
		yourself
]

{ #category : 'instance creation' }
SpkExplorerLayoutTool class >> newInTaskspace: aTaskspaceTool [
	^ self new
		taskspaceTool: aTaskspaceTool;
		yourself
]

{ #category : 'instance creation' }
SpkExplorerLayoutTool class >> newInTaskspace: aTaskspaceTool
viewing: aPaneTool [

	| columnLayoutTool paneLayoutTool explorerLayoutTool |
	columnLayoutTool := SpkColumnLayoutTool new.
	paneLayoutTool := SpkPaneLayoutTool new
		taskspaceTool: aTaskspaceTool;
		paneTool: aPaneTool;
		relativeHeight: 1;
		paneCoordinate: {0.5};
		yourself.
	columnLayoutTool addPaneLayout: paneLayoutTool.
	explorerLayoutTool := self newInTaskspace: aTaskspaceTool.
	explorerLayoutTool
		explorerTool: aPaneTool explorerTool;
		addColumnLayout: columnLayoutTool.
	^explorerLayoutTool
]

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
SpkExplorerLayoutTool >> explorerTool: anExplorerTool [

	explorerTool := anExplorerTool
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
SpkExplorerLayoutTool >> initializeForDefault [
	
	self initializeForTool: (SpkExplorerTool defaultInTaskspace: taskspaceTool)
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
