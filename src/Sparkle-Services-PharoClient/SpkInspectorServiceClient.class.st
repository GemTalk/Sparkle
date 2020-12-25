Class {
	#name : 'SpkInspectorServiceClient',
	#superclass : 'SpkInspectorService',
	#traits : 'SpkTModel',
	#classTraits : 'SpkTModel classTrait',
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

{ #category : 'actions' }
SpkInspectorServiceClient >> inspectField: aFieldService [

	| promise |
	self flag: 'Obsolete method?'.
	(self fields identityIncludes: aFieldService) ifFalse: [ 
		self error: 'I do not contain the requested field.' ].

	aFieldService linkedService ifNotNil: [ :service | ^ service ].

	promise := aFieldService createInspectorService.
	promise
		when: [ :inspector | 
			self announceNewService: inspector forRequest: aFieldService ]
		catch: [ :reason | aFieldService signalPromiseBrokenBecause: reason ].
	^ nil
]
