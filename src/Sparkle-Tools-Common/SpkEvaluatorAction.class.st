"
Abstract.
An action performed for and upon an evaluator in an inspector tool.
 
Internal Representation and Key Implementation Points.

    Instance Variables
-	newSourceCode:		<String> The code that, at the time of my creation, matches the code that the user sees in the GUI.
-	oldSourceCode:		<String> The code that, at the time of my creation, is the code most recently accepted. If no code has yet been accepted in this evaluator, this is the empty string.

"
Class {
	#name : 'SpkEvaluatorAction',
	#superclass : 'SpkAction',
	#instVars : [
		'newSourceCode',
		'oldSourceCode'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'accessing' }
SpkEvaluatorAction >> newSourceCode: anObject [

	newSourceCode := anObject
]

{ #category : 'accessing' }
SpkEvaluatorAction >> oldSourceCode: anObject [

	oldSourceCode := anObject
]
