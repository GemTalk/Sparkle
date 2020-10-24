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
		'panes',
		'stackLayout'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'specs' }
SpkColumn class >> defaultSpec [
	"This method only here to quiet browser linting. Should never be sent to this class.
	See instance-side #layout."

	self error: '#defaultSpec sent when not expected'
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

{ #category : 'adding' }
SpkColumn >> addLast: aPane [

	self layout addLast: aPane
]

{ #category : 'accessing' }
SpkColumn >> layout [

	"Cannot use the instvar 'layout' since it is defined in a superclass as an observable slot."

	^ stackLayout ifNil: [ stackLayout := SpkAccordianLayout newVertical ]
]
