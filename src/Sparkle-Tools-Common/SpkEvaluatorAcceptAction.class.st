"
An action for evaluating my newSourceCode, at which point my oldSourceCode becomes equal to the newSourceCode.

To undo, we can't actually undo the evaluation, but we can (and do) restore the oldSourceCode.
"
Class {
	#name : 'SpkEvaluatorAcceptAction',
	#superclass : 'SpkEvaluatorAction',
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'public' }
SpkEvaluatorAcceptAction >> performAction [

	"Accepting makes the tool's oldSourceCode and newSourceCode the same."

	target oldSourceCode: newSourceCode.
	^ target evaluateCode
]

{ #category : 'public' }
SpkEvaluatorAcceptAction >> undoAction [
	"Cannot undo the actual execution, but can restore the code"

	target oldSourceCode: oldSourceCode.
	^ nil
]
