"
I manage one column within an SpkWindowWithColumns.
I contain a stack of panes. The number of panes is not fixed, and each pane can be a different height.

    Instance Variables
*	panes:		<OrderedCollection of SpkPane> My panes. Pane 1 is displayed topmost.
*	stackLayout:		<SpkAccordianLayout> The layout that manages display of the panes.

A column's containing presenter is a kind of SpkWindowWithColumns.
"
Class {
	#name : 'SpkColumn',
	#superclass : 'SpkPresenter',
	#traits : 'SpkTLayoutService',
	#classTraits : 'SpkTLayoutService classTrait',
	#instVars : [
		'panes'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'adding' }
SpkColumn >> add: aPanePresenter [

	"Add a pane at a position determined by its coordinate relative to the coordinates of my other panes."

	| position |
	panes add: aPanePresenter.
	position := panes indexOf: aPanePresenter.
	"Layout's size is now one smaller than panes. 
	Position in layout is the one following the newly inserted pane,
	so we insert *before* that index."
	self layout add: aPanePresenter beforeIndex: position
]

{ #category : 'private' }
SpkColumn >> add: aPane beforeIndex: index [
	self layout add: aPane beforeIndex: index
]

{ #category : 'initialization' }
SpkColumn >> initialize [

	super initialize.
	panes := SortedCollection sortUsing: #coordinate ascending
]

{ #category : 'initialization' }
SpkColumn >> initializeFromLayoutService: aColumnLayoutService [

	| panePresenters |
	self layoutService: aColumnLayoutService.
	panePresenters := aColumnLayoutService paneLayouts collect: [ 
		                  :paneLayoutService | 
		                  | pane |
		                  pane := self presenterForService:
			                          paneLayoutService paneService.
		                  pane
			                  layoutService: paneLayoutService;
			                  setCoordinateFromLayoutService.
		                  pane ].
	panePresenters do: [ :panePresenter | self add: panePresenter ]
]

{ #category : 'adding' }
SpkColumn >> isEmpty [

	^ panes isEmpty
]

{ #category : 'accessing' }
SpkColumn >> newLayout [

	^ SpkAccordianLayout newVertical
]

{ #category : 'accessing' }
SpkColumn >> nextRightColumn [

	"Answer the column to the right of me in my explorer window.
	If I'm the rightmost column, add a column to my right."

	^ owner columnToRightOf: self
]

{ #category : 'accessing' }
SpkColumn >> panes [

	^ panes
]

{ #category : 'adding' }
SpkColumn >> remove: aPanePresenter [

	| position |
	position := panes indexOf: aPanePresenter.
	panes remove: aPanePresenter.
	self layout remove: aPanePresenter.
	self isEmpty ifTrue: [ owner removeColumn: self ]
]
