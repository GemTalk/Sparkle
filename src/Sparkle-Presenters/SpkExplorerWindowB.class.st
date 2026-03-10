"
A Sparkle Workspace window combines functions of traditional workspaces, inspectors, and debuggers.
A new Workspace window is initialized with an inspector on nil with one evaluator subpane in the leftmost column.
This allows the user to start by evaluating or debugging an expression. They can then inspect the result, and work forward from there.
"
Class {
	#name : 'SpkExplorerWindowB',
	#superclass : 'SpkWindowWithColumns',
	#category : 'Sparkle-Presenters-Presenters',
	#package : 'Sparkle-Presenters',
	#tag : 'Presenters'
}

{ #category : 'transaction management' }
SpkExplorerWindowB >> abortTransaction [

	^self application abortTransaction
]

{ #category : 'initialize-release' }
SpkExplorerWindowB >> addInitialPane: aPane [

	"Assumes an empty window. Add first column and pane within the column."

	| column |
	column := self addColumn.
	aPane
		owner: column;
		coordinate: (SpkPaneCoordinate forVector: #( 0.5 )).
	column add: aPane
]

{ #category : 'transaction management' }
SpkExplorerWindowB >> beginTransaction [

	^self application beginTransaction
]

{ #category : 'building menus' }
SpkExplorerWindowB >> buildHamburgerMenu [

	| commandGroup |
	commandGroup := (CmCommandGroup named: 'Transaction Management') asSpecGroup
		description: 'Manage aspects of GemStone transactions.';
		beDisplayedAsGroup;
		yourself.
	commandGroup register: (SpkCommitTransactionCommand forSpecContext: self).
	commandGroup register: (SpkAbortTransactionCommand forSpecContext: self).
	commandGroup register: (SpkBeginTransactionCommand forSpecContext: self).
	commandGroup register: (SpkSetAutomaticTransactionModeCommand forSpecContext: self).
	commandGroup register: (SpkSetManualTransactionModeCommand forSpecContext: self).
	^commandGroup
]

{ #category : 'enumerating' }
SpkExplorerWindowB >> childrenDo: aBlock [

	columns do: [ :column | column panes do: aBlock ]
]

{ #category : 'initialize-release' }
SpkExplorerWindowB >> close [

	self window ifNotNil: [ self window close ]
]

{ #category : 'accessing' }
SpkExplorerWindowB >> columns [

	^ columns
]

{ #category : 'transaction management' }
SpkExplorerWindowB >> commitTransaction [

	^self application commitTransaction
]

{ #category : 'constants' }
SpkExplorerWindowB >> initialExtent [

	^ 900 @ 900
]

{ #category : 'initialization' }
SpkExplorerWindowB >> initializeTreeOnServer [

	model initializeTreeOnServerInTaskspace: application taskspaceService
]

{ #category : 'testing' }
SpkExplorerWindowB >> isExplorer [

	^ true
]

{ #category : 'as yet unclassified' }
SpkExplorerWindowB >> modelClass [

	^ SpkExplorerServiceBClient
]

{ #category : 'transaction management' }
SpkExplorerWindowB >> setAutomaticTransactionMode [

	^self application setAutomaticTransactionMode
]

{ #category : 'transaction management' }
SpkExplorerWindowB >> setManualTransactionMode [

	^self application setManualTransactionMode
]
