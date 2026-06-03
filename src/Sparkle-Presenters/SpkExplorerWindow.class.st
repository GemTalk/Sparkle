"
A Sparkle Workspace window combines functions of traditional workspaces, inspectors, and debuggers.
A new Workspace window is initialized with an inspector on nil with one evaluator subpane in the leftmost column.
This allows the user to start by evaluating or debugging an expression. They can then inspect the result, and work forward from there.
"
Class {
	#name : 'SpkExplorerWindow',
	#superclass : 'SpkWindowWithColumns',
	#instVars : [
		'undoActionName',
		'redoActionName'
	],
	#category : 'Sparkle-Presenters-Presenters',
	#package : 'Sparkle-Presenters',
	#tag : 'Presenters'
}

{ #category : 'transaction management' }
SpkExplorerWindow >> abortTransaction [

	^self application abortTransaction
]

{ #category : 'initialize-release' }
SpkExplorerWindow >> addInitialPane: aPane [

	"Assumes an empty window. Add first column and pane within the column."

	| column |
	column := self addColumn.
	aPane
		owner: column;
		coordinate: (SpkPaneCoordinate forVector: #( 0.5 )).
	column add: aPane
]

{ #category : 'transaction management' }
SpkExplorerWindow >> beginTransaction [

	^self application beginTransaction
]

{ #category : 'building menus' }
SpkExplorerWindow >> buildHamburgerMenu [

	| commandGroup |
	commandGroup := (CmCommandGroup named: 'Undo and Redo') asSpecGroup
		                description: 'Undo and Redo';
		                beDisplayedAsGroup;
		                yourself.
	commandGroup register: (SpkUndoCommand forSpecContext: self).
	commandGroup register: (SpkRedoCommand forSpecContext: self).
	^ commandGroup

	"| commandGroup |
	commandGroup := (CmCommandGroup named: 'Transaction Management') asSpecGroup
		description: 'Manage aspects of GemStone transactions.';
		beDisplayedAsGroup;
		yourself.
	commandGroup register: (SpkCommitTransactionCommand forSpecContext: self).
	commandGroup register: (SpkAbortTransactionCommand forSpecContext: self).
	commandGroup register: (SpkBeginTransactionCommand forSpecContext: self).
	commandGroup register: (SpkSetAutomaticTransactionModeCommand forSpecContext: self).
	commandGroup register: (SpkSetManualTransactionModeCommand forSpecContext: self).
	^commandGroup"
]

{ #category : 'enumerating' }
SpkExplorerWindow >> childrenDo: aBlock [

	columns do: [ :column | column panes do: aBlock ]
]

{ #category : 'initialize-release' }
SpkExplorerWindow >> close [

	self window ifNotNil: [ self window close ]
]

{ #category : 'accessing' }
SpkExplorerWindow >> columns [

	^ columns
]

{ #category : 'transaction management' }
SpkExplorerWindow >> commitTransaction [

	^self application commitTransaction
]

{ #category : 'constants' }
SpkExplorerWindow >> initialExtent [

	^ 900 @ 900
]

{ #category : 'initialization' }
SpkExplorerWindow >> initializeTreeOnServer [

	model initializeTreeOnServerInTaskspace: application taskspaceService
]

{ #category : 'testing' }
SpkExplorerWindow >> isExplorer [

	^ true
]

{ #category : 'as yet unclassified' }
SpkExplorerWindow >> modelClass [

	^ SpkExplorerServiceClient
]

{ #category : 'initialization' }
SpkExplorerWindow >> receiveUpdateAnnouncement [ 
	
	self defer: [ self refreshFromService ]
]

{ #category : 'actions' }
SpkExplorerWindow >> redo [

	^ model redo
]

{ #category : 'accessing' }
SpkExplorerWindow >> redoActionName: anObject [

	redoActionName := anObject
]

{ #category : 'accessing' }
SpkExplorerWindow >> redoMenuItemName [

	^ redoActionName
		  ifNil: [ 'Can''t redo' ]
		  ifNotNil: [ 'Redo ' , redoActionName ]
]

{ #category : 'initialization' }
SpkExplorerWindow >> refreshFromService [
	"model ifNil: [ ^ self ]."

	"When first building the pane, spec sends this before model is initialized"

	"Refresh undo/redo menu"

	undoActionName := model undoActionName.
	redoActionName := model redoActionName.
	"self header menu: self menuCommandGroup asMenuPresenter"
]

{ #category : 'transaction management' }
SpkExplorerWindow >> setAutomaticTransactionMode [

	^self application setAutomaticTransactionMode
]

{ #category : 'transaction management' }
SpkExplorerWindow >> setManualTransactionMode [

	^self application setManualTransactionMode
]

{ #category : 'as yet unclassified' }
SpkExplorerWindow >> subscribeToModel [

	model
		when: SpkUpdateAnnouncement
		send: #receiveUpdateAnnouncement
		to: self
]

{ #category : 'actions' }
SpkExplorerWindow >> undo [

	^ model undo
]

{ #category : 'accessing' }
SpkExplorerWindow >> undoActionName: anObject [

	undoActionName := anObject
]

{ #category : 'accessing' }
SpkExplorerWindow >> undoMenuItemName [

	^ undoActionName
		  ifNil: [ 'Can''t undo' ]
		  ifNotNil: [ 'Undo ' , undoActionName ]
]
