Class {
	#name : 'SpkEvaluatorCancelAction',
	#superclass : 'SpkEvaluatorAction',
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'public' }
SpkEvaluatorCancelAction >> performAction [

	"Canceling throws away the tool's newSourceCode, making it equal to the oldSourceCode."

	tool newSourceCode: oldSourceCode.
	^ nil
]

{ #category : 'public' }
SpkEvaluatorCancelAction >> undoAction [

	"Undoing a canceling restores the newSourceCode"

	tool newSourceCode: newSourceCode.
	^ nil
]
