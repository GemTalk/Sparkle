"
Abstract. A presenter for Sparkle's main windows. 
Each of these windows presents a number of columns.
Each column can present, vertically, a number of panes. 
This is not a grid; there can be a different number of panes in each column, and each pane is of variable height.

My primary subclasses differ primarily in initialization. 
A workspace window is used primarily for object exploration and debugging, and is initialized with an inspector on nil.
A code browsing window is initialized with a hierarchy of classes and of projects and packages.
This distinction is not rigit -- you will likely eventually be able to browse code in a workspace, and inspect instances in a code browser.
 
Internal Representation and Key Implementation Points.

Instance Variables
*	columnLayout:		<SpkAccordianLayout> The layout for my columns. Lazily initialized.
*	columns:		<OrderedCollection of SpkStackOfPanesPresenter> The columns that I present in my window.

Since they represent the entire contents of a Pharo window, instances of my subclasses have nil for containingPresenter.
"
Class {
	#name : 'SpkWindowWithColumns',
	#superclass : 'SpkPresenterWithModel',
	#traits : 'SpkTLayoutService',
	#classTraits : 'SpkTLayoutService classTrait',
	#instVars : [
		'columns'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'actions' }
SpkWindowWithColumns >> addColumn [

	| newColumn |
	newColumn := self newColumn.
	columns add: newColumn.
	self layout add: newColumn.
	self layoutService addColumnLayout: newColumn layoutService.
	^ newColumn
]

{ #category : 'accessing' }
SpkWindowWithColumns >> columnAt: anIndex [
	"Answer the SpkAccodianLayout for the given column. anIndex must be between 1 and my current number of columns."

	^ columns at: anIndex
]

{ #category : 'accessing' }
SpkWindowWithColumns >> columnToRightOf: aColumn [

	"If aColumn is the rightmost, create a new empty column for it."

	| newIndex |
	newIndex := (columns
		             indexOf: aColumn
		             ifAbsent: [ self error: 'Column not found' ]) + 1.
	^ columns at: newIndex ifAbsent: [ self addColumn ]
]

{ #category : 'constants' }
SpkWindowWithColumns >> initialExtent [

	self subclassResponsibility
]

{ #category : 'initialization' }
SpkWindowWithColumns >> initialize [
	"Must initialize columns first, since the super initialize depends on them being there."

	columns := OrderedCollection new.
	super initialize
]

{ #category : 'initialization' }
SpkWindowWithColumns >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Sparkle Object Explorer';
		aboutText:
			'The Sparkle object explorer is part of the Pharo IDE for GemStone, 
a set of tools for developing GemStone code via a remote connection from Pharo.';
		initialExtent: self initialExtent
]

{ #category : 'instance creation' }
SpkWindowWithColumns >> newColumn [

	"Create and answer a new column."

	| column |
	column := self instantiate: SpkColumn.
	self flag:
		'Setting layoutService here seems wrong, should only be during initialize.'.
	"column layoutService: SpkColumnLayoutServiceClient new."
	^ column
]

{ #category : 'accessing' }
SpkWindowWithColumns >> newLayout [

	^ SpkAccordianLayout newHorizontal
]

{ #category : 'removing' }
SpkWindowWithColumns >> removeColumn: aColumn [

	columns remove: aColumn.
	self layout remove: aColumn.
	self layoutService removeColumnLayout: aColumn layoutService
]
