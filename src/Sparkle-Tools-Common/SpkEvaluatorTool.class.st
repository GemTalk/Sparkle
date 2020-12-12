Class {
	#name : 'SpkEvaluatorTool',
	#superclass : 'SpkTool',
	#instVars : [
		'explorerTool',
		'inspectorTool',
		'oldSourceCode',
		'newSourceCode'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'evaluating' }
SpkEvaluatorTool >> evaluateString: codeString [

	"Evaluate the given code string and answer whatever answer comes back."

	| context class compiler method |
	self flag:
		'Does not yet handle error cases, and it must. Both syntax and runtime errors.'.
	self flag: 'This needs to be done through accept and cancel actions.'.
	context := inspectorTool inspectedObject.
	class := SpkReflection classOf: context.
	compiler := class compiler.

	compiler source: codeString.
	method := compiler compileDoit.

	^ SpkReflection
		  carefullySend: #withArgs:executeMethod:
		  withArguments: { 
				  #(  ).
				  method }
		  to: context
		  ifNotUnderstood: [ 
		  'Evaluation message not understood by this object' ]
]

{ #category : 'accessing' }
SpkEvaluatorTool >> explorerTool: anObject [

	explorerTool := anObject
]

{ #category : 'initialization' }
SpkEvaluatorTool >> initialize [

	super initialize.
	oldSourceCode := newSourceCode := ''
]

{ #category : 'accessing' }
SpkEvaluatorTool >> inspectorTool: anObject [

	inspectorTool := anObject
]

{ #category : 'accessing' }
SpkEvaluatorTool >> newSourceCode [

	^ newSourceCode
]

{ #category : 'accessing' }
SpkEvaluatorTool >> newSourceCode: anObject [

	newSourceCode := anObject
]

{ #category : 'accessing' }
SpkEvaluatorTool >> oldSourceCode [

	^ oldSourceCode
]

{ #category : 'accessing' }
SpkEvaluatorTool >> oldSourceCode: anObject [

	oldSourceCode := anObject
]
