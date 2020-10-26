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
	#instVars : [
		'panes'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'adding' }
SpkColumn >> add: aPane [

	self layout add: aPane
]

{ #category : 'adding' }
SpkColumn >> add: aPane beforeIndex: index [
	self layout add: aPane beforeIndex: index
]

{ #category : 'adding' }
SpkColumn >> add: aPane withConstraints: constraints beforeIndex: index [

	self layout
		add: aPane
		withConstraints: constraints
		beforeIndex: index
]

{ #category : 'accessing' }
SpkColumn >> newLayout [

	^ SpkAccordianLayout newVertical
]
