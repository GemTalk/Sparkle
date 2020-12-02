Class {
	#name : 'SpkEvaluatorAcceptAction',
	#superclass : 'SpkEvaluatorAction',
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'public' }
SpkEvaluatorAcceptAction >> performAction [

	"Accepting makes the tool's oldSourceCode and newSourceCode the same."

	tool oldSourceCode: newSourceCode.
	^ tool evaluateCode
]

{ #category : 'public' }
SpkEvaluatorAcceptAction >> undoAction [
	"Cannot undo the actual execution, but can restore the code"

	tool oldSourceCode: oldSourceCode.
	^ nil
]
