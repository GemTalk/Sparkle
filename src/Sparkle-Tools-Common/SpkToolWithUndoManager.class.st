Class {
	#name : 'SpkToolWithUndoManager',
	#superclass : 'SpkTool',
	#instVars : [
		'undoManager'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'initialization' }
SpkToolWithUndoManager >> initialize [

	super initialize.
	undoManager := SpkUndoManager new
]

{ #category : 'accessing' }
SpkToolWithUndoManager >> performAction: anAction [

	^ undoManager performAction: anAction
]
