"
An action to discard the newSourceCode being edited and make it equal to the oldSourceCode.

Undo restores the newSourceCode that was discarded.
"
Class {
	#name : 'SpkEvaluatorCancelAction',
	#superclass : 'SpkEvaluatorAction',
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'public' }
SpkEvaluatorCancelAction >> performAction [

	"Canceling throws away the tool's newSourceCode, making it equal to the oldSourceCode."

	target newSourceCode: oldSourceCode.
	^ nil
]

{ #category : 'public' }
SpkEvaluatorCancelAction >> undoAction [

	"Undoing a canceling restores the newSourceCode"

	target newSourceCode: newSourceCode.
	^ nil
]
