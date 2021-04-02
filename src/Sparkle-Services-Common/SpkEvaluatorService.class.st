"
I'm an RSR service template for code evaluation.

unsavedSource  <String> Source code being edited that will, if accepted, be evaluated.

savedSource <String> The empty string, or the source code that was most recently attempted to be evaluated. Note that the attempt might have resulted in a syntax or runtime error, nonetheless the source becomes ""saved.""

evaluationContext <nil or InspectorService> Specifies what object is bound to ""self"" during evaluation. Instance variables of this object will also be available by name to the source code.
"
Class {
	#name : 'SpkEvaluatorService',
	#superclass : 'SpkCodeEditorService',
	#instVars : [
		'evaluationContext',
		'updatedServices'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'accessing' }
SpkEvaluatorService class >> templateClassName [

	^ #SpkEvaluatorService
]

{ #category : 'accessing' }
SpkEvaluatorService >> evaluationContext [
	^ evaluationContext
]

{ #category : 'accessing' }
SpkEvaluatorService >> evaluationContext: anObject [
	evaluationContext := anObject
]

{ #category : 'initialization' }
SpkEvaluatorService >> initialize [

	super initialize.
	evaluationContext := nil.
	updatedServices := Set new
]

{ #category : 'accessing' }
SpkEvaluatorService >> updatedServices [

	^ updatedServices
]
