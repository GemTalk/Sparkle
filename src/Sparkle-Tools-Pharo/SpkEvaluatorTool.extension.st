Extension { #name : 'SpkEvaluatorTool' }

{ #category : '*Sparkle-Tools-Pharo' }
SpkEvaluatorTool >> compilationExceptionClass [

	^ SyntaxErrorNotification
]

{ #category : '*Sparkle-Tools-Pharo' }
SpkEvaluatorTool >> compileNewSourceCodeInContext: anObject [

	"Answer a method compiled from my new source code in the context of the given object"

	| compiler class |
	class := SpkReflection classOf: anObject.
	compiler := class compiler.

	compiler
		source: newSourceCode;
		noPattern: true.
	^ compiler compileDoit
]

{ #category : '*Sparkle-Tools-Pharo' }
SpkEvaluatorTool >> evaluateMethod: method inContext: context [

	^ SpkReflection
		  carefullySend: #withArgs:executeMethod:
		  withArguments: { 
				  #(  ).
				  method }
		  to: context
		  ifNotUnderstood: [ 
		  'Evaluation message not understood by this object' ]
]
