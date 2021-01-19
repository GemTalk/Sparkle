"
A Sparkle Workspace window combines functions of traditional workspaces, inspectors, and debuggers.
A new Workspace window is initialized with an inspector on nil with one evaluator subpane in the leftmost column.
This allows the user to start by evaluating or debugging an expression. They can then inspect the result, and work forward from there.
"
Class {
	#name : 'SpkExplorerWindow',
	#superclass : 'SpkWindowWithColumns',
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'initialize-release' }
SpkExplorerWindow >> close [

	self window ifNotNil: [ self window close ]
]

{ #category : 'accessing' }
SpkExplorerWindow >> columns [

	^ columns
]

{ #category : 'constants' }
SpkExplorerWindow >> initialExtent [

	^ self layoutService width @ self layoutService height
]

{ #category : 'initialization' }
SpkExplorerWindow >> initializeFromLayoutService: anExplorerLayoutService [

	| columnPresenters |
	self layoutService: anExplorerLayoutService.
	columnPresenters := anExplorerLayoutService columnLayouts collect: [ 
		                    :columnLayoutService | 
		                    | column |
		                    column := self instantiate: SpkColumn.
		                    column initializeFromLayoutService:
			                    columnLayoutService.
		                    column ].
	columnPresenters do: [ :each | 
		columns add: each.
		self layout add: each ]
]

{ #category : 'initialization' }
SpkExplorerWindow >> initializePresenters [

	self initializeFromLayoutService: model layoutService
]
