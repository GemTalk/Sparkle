Extension { #name : 'SpkEvaluatorTool' }

{ #category : '*Sparkle-Tools-Pharo' }
SpkEvaluatorTool >> evaluateCode [

	"Evaluate the newSource and answer an appropriate tool for 
	whatever happens. This can be a syntax error, a runtime error, or an object.
	For an object, answer an InspectorTool on the object."

	| context method resultObject |
	context := inspectorTool inspectedObject.

	[ method := self compileNewSourceCodeInContext: context ]
		on: SyntaxErrorNotification
		do: [ :ex | ^ self toolForCompilationError: ex ].


	[ resultObject := self evaluateMethod: method inContext: context ]
		on: Error
		do: [ :ex | ^ self toolForRuntimeError: ex ].
	^ SpkInspectorTool on: resultObject
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
