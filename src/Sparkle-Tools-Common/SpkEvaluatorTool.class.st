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

{ #category : 'public' }
SpkEvaluatorTool >> accept [

	"Evaluate newSourceCode through an undoable action. Answer a new Tool for the result."

	| action resultTool |
	action := SpkEvaluatorAcceptAction new
		          target: self;
		          oldSourceCode: oldSourceCode;
		          newSourceCode: newSourceCode;
		          yourself.
	resultTool := explorerTool performAction: action.
	^ resultTool
]

{ #category : 'evaluating' }
SpkEvaluatorTool >> evaluateCode [

	"Evaluate the newSource and answer an appropriate tool for 
	whatever happens. This can be a syntax error, a runtime error, or an object.
	For an object, answer an InspectorTool on the object."

	| normalResult resultTool |
	[ normalResult := self evaluateNewSourceCode ]
		on: Error
		do: [ :ex | "Making an error tool goes here"
			self flag:
				'not the right thing to do, but for now we let things break'.
			ex pass ].
	resultTool := SpkInspectorTool on: normalResult.
	^ resultTool
]

{ #category : 'evaluating' }
SpkEvaluatorTool >> evaluateNewSourceCode [

	"Evaluate the newSource and, if successful, answer the result object."

	| context class compiler method |
	context := inspectorTool inspectedObject.
	class := SpkReflection classOf: context.
	compiler := class compiler.

	compiler
		source: newSourceCode;
		noPattern: true.
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
