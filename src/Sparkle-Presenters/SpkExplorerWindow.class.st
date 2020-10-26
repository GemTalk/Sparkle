"
A Sparkle Workspace window combines functions of traditional workspaces, inspectors, and debuggers.
A new Workspace window is initialized with an inspector on nil with one evaluator subpane in the leftmost column.
This allows the user to start by evaluating or debugging an expression. They can then inspect the result, and work forward from there.
"
Class {
	#name : 'SpkExplorerWindow',
	#superclass : 'SpkWindowWithColumns',
	#instVars : [
		'layoutService'
	],
	#classInstVars : [
		'presenterClassesForServiceTypes'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'initialization' }
SpkExplorerWindow class >> initializePresenterClassesForServiceTypes [

	"This is only for pane presenters and services."

	presenterClassesForServiceTypes := IdentityDictionary new.
	^ presenterClassesForServiceTypes
		  at: SpkInspectorServiceClient put: SpkInspectorPane;
		  yourself
]

{ #category : 'accessing' }
SpkExplorerWindow class >> presenterClassesForServiceTypes [

	^ presenterClassesForServiceTypes ifNil: [ 
		  self initializePresenterClassesForServiceTypes ]
]

{ #category : 'initialization' }
SpkExplorerWindow >> connectPresenters [

	"Initialize from layout service"

	| panePresenters columnNumber paneIndexInColumn |
	layoutService numberOfColumns timesRepeat: [ self addColumn ].
	"Create a presenter for each service, and add it to my layout."
	panePresenters := layoutService paneServices collect: [ :each | 
		                  self presenterForService: each ].
	columnNumber := 1.
	paneIndexInColumn := 1.
	panePresenters do: [ :presenter | 
		| column |
		paneIndexInColumn > (layoutService panesInColumn: columnNumber) 
			ifTrue: [ 
				columnNumber := columnNumber + 1.
				paneIndexInColumn := 1 ].
		column := self columnAt: columnNumber.
		presenter.
		column add: presenter.
		paneIndexInColumn := paneIndexInColumn + 1 ]
]

{ #category : 'constants' }
SpkExplorerWindow >> initialExtent [

	^ layoutService width @ layoutService height
]

{ #category : 'private' }
SpkExplorerWindow >> presenterForService: aPaneService [

	"Create and answer the appropriate type of presenter for this pane service"

	| matches presenterClass |
	matches := self class presenterClassesForServiceTypes 
		           associationsSelect: [ :a | aPaneService isKindOf: a key ].
	matches size = 1 ifFalse: [ 
		self error: 'Pane service is of unknown or multiple type' ].
	presenterClass := matches values first.
	^ presenterClass owner: self on: aPaneService
]

{ #category : 'accessing' }
SpkExplorerWindow >> setModelBeforeInitialization: anExplorerService [

	super setModelBeforeInitialization: anExplorerService.
	layoutService := anExplorerService layoutService
]
