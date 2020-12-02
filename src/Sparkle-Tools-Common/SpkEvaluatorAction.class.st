"
Abstract.
An action performed for and upon an evaluator in an inspector tool.
 
Internal Representation and Key Implementation Points.

    Instance Variables
-	newSourceCode:		<String> The code that, at the time of my creation, was in the progress of being accepted.
-	oldSourceCode:		<String> The code that, at the time of my creation, was the most recent code previously accepted.

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
