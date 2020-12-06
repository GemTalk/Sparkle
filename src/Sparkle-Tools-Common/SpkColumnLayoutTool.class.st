Class {
	#name : 'SpkColumnLayoutTool',
	#superclass : 'SpkTool',
	#instVars : [
		'relativeWidth',
		'paneLayouts'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'adding' }
SpkColumnLayoutTool >> addPaneLayout: aPaneLayoutTool [

	paneLayouts add: aPaneLayoutTool
]

{ #category : 'initialization' }
SpkColumnLayoutTool >> initialize [

	super initialize.
	paneLayouts := OrderedCollection new.
	relativeWidth := 1
]

{ #category : 'initialization' }
SpkColumnLayoutTool >> initializeFromTool: anExplorerTool [

	"Put all of the tool's panes into my column, evenly distributed"

	| panes coordinateInterval thisCoord |
	panes := anExplorerTool panes.
	coordinateInterval := 1.0 / (panes size + 1). "Distance between coordinates"
	thisCoord := 0.0.
	panes do: [ :pane | 
		| paneLayout |
		thisCoord := thisCoord + coordinateInterval.
		paneLayout := SpkPaneLayoutTool new
			              paneTool: pane;
			              relativeHeight: 1;
			              paneCoordinate: { thisCoord };
			              yourself.
		self addPaneLayout: paneLayout ]
]

{ #category : 'accessing' }
SpkColumnLayoutTool >> paneLayouts [

	^ paneLayouts
]

{ #category : 'accessing' }
SpkColumnLayoutTool >> paneLayouts: anObject [

	paneLayouts := anObject
]

{ #category : 'accessing' }
SpkColumnLayoutTool >> relativeWidth [

	^ relativeWidth
]

{ #category : 'accessing' }
SpkColumnLayoutTool >> relativeWidth: anObject [

	relativeWidth := anObject
]
