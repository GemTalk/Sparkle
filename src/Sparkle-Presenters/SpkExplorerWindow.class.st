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

{ #category : 'transaction management' }
SpkExplorerWindow >> abortTransaction [

	^self application abortTransaction
]

{ #category : 'transaction management' }
SpkExplorerWindow >> beginTransaction [

	^self application beginTransaction
]

{ #category : 'building menus' }
SpkExplorerWindow >> buildHamburgerMenu [

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

{ #category : 'transaction management' }
SpkExplorerWindow >> setAutomaticTransactionMode [

	^self application setAutomaticTransactionMode
]

{ #category : 'transaction management' }
SpkExplorerWindow >> setManualTransactionMode [

	^self application setManualTransactionMode
]
