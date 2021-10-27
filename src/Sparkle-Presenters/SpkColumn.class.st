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
	"panes is sorted"
	panes add: aPanePresenter.
	position := panes indexOf: aPanePresenter.
	self addToLayout: aPanePresenter atPaneIndex: position
]

{ #category : 'private' }
SpkColumn >> addToLayout: aPane atPaneIndex: paneIndex [

	"The given pane must have already been added to the sorted collection of panes.
	This method adds it to the layout, along with a splitter if appropriate."

	panes size > 1
		ifFalse: [ self layout add: aPane beforeIndex: 1 ]
		ifTrue: [ "Must add a splitter"
			paneIndex = 1
				ifTrue: [ "Splitter goes after pane."
					self layout
						add: aPane beforeIndex: 1;
						add: self newSplitter
						after: aPane
						withConstraints: self splitterConstraints ]
				ifFalse: [ "Splitter goes before pane"
					| layoutIndex |
					layoutIndex := paneIndex - 1 * 2.
					self layout
						add: aPane beforeIndex: layoutIndex;
						add: self newSplitter
						beforeIndex: layoutIndex
						withConstraints: self splitterConstraints ] ]
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
	self removeFromLayout: aPanePresenter atIndex: position.
	panes remove: aPanePresenter.
	self isEmpty ifTrue: [ owner removeColumn: self ]
]

{ #category : 'removing' }
SpkColumn >> removeFromLayout: aPane atIndex: paneIndex [

	"Remove the pane and any associated splitter"

	"aPane is still in the collection of panes"

	panes size > 1 ifTrue: [ "Must remove splitter and pane"
		paneIndex = 1
			ifTrue: [ "Remove splitter after pane" 
			self layout removePresenterAtIndex: 2 ]
			ifFalse: [ "Remove splitter before pane" 
				self layout removePresenterAtIndex: paneIndex - 1 * 2 ] ].
	self layout remove: aPane
]
