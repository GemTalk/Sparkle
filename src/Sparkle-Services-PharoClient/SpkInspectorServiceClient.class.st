Class {
	#name : 'SpkInspectorServiceClient',
	#superclass : 'SpkInspectorService',
	#traits : 'SpkTModel',
	#classTraits : 'SpkTModel classTrait',
	#category : 'Sparkle-Services-PharoClient-Services'
}

{ #category : 'as yet unclassified' }
SpkInspectorServiceClient >> announceNewInspector: anInspectorService for: aFieldService [

	| announcement |
	announcement := SpkInspectorCreated new
		                service: anInspectorService;
		                requestId: aFieldService;
		                yourself.
	self announce: announcement
]

{ #category : 'actions' }
SpkInspectorServiceClient >> inspectField: aFieldService [

	| promise |
	(self fields identityIncludes: aFieldService) ifFalse: [ 
		self error: 'I do not contain the requested field.' ].

	aFieldService inspectorService ifNotNil: [ :service | ^ service ].

	promise := aFieldService createInspectorService.
	promise
		when: [ :inspector | 
			self announceNewInspector: inspector for: aFieldService ]
		catch: [ :reason | aFieldService signalPromiseBrokenBecause: reason ].
	^ nil
]