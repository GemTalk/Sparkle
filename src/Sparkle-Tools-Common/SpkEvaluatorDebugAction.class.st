Class {
	#name : 'SpkEvaluatorDebugAction',
	#superclass : 'SpkEvaluatorAction',
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'public' }
SpkEvaluatorDebugAction >> performAction [
	"Debug makes the tool's oldSourceCode and newSourceCode the same."

	target oldSourceCode: newSourceCode.
	^ target evaluateCodeAnnouncing: announcement breakOnEntry: true
]

{ #category : 'public' }
SpkEvaluatorDebugAction >> undoAction [
	"Cannot undo the actual execution, but can restore the code"

	target oldSourceCode: oldSourceCode.
	^ nil
]
