Class {
	#name : 'SpkInspectorServiceClient',
	#superclass : 'SpkInspectorService',
	#traits : 'SpkTModel + SpkTPromise + SpkTPaneService',
	#classTraits : 'SpkTModel classTrait + SpkTPromise classTrait + SpkTPaneService classTrait',
	#category : 'Sparkle-Services-PharoClient-Services'
}

{ #category : 'adding' }
SpkInspectorServiceClient >> addEvaluator [

	| newEvaluator |
	newEvaluator := SpkEvaluatorServiceClient new
		                registerWith: self connection;
		                parentService: self;
		                evaluationContext: self;
		                yourself.

	evaluators add: newEvaluator.
	^ newEvaluator
]

{ #category : 'private' }
SpkInspectorServiceClient >> remoteSelf [

	"Hack to be able to send a remote message from a trait"

	^ remoteSelf
]

{ #category : 'removing' }
SpkInspectorServiceClient >> removeEvaluator: anEvaluator [

	evaluators remove: anEvaluator
]
