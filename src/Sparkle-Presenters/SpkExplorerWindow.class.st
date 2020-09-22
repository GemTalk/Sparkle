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

{ #category : 'constants' }
SpkExplorerWindow >> initialExtent [

	^ 900 @ 800
]
