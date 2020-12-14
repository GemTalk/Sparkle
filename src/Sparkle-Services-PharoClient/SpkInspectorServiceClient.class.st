Class {
	#name : 'SpkInspectorServiceClient',
	#superclass : 'SpkInspectorService',
	#traits : 'SpkTModel',
	#classTraits : 'SpkTModel classTrait',
	#category : 'Sparkle-Services-PharoClient-Services'
}

{ #category : 'announcing' }
SpkInspectorServiceClient >> announceNewService: newService forRequest: requestId [

	| announcement |
	announcement := SpkNewPaneService new
		                service: newService;
		                requestId: requestId;
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
			self announceNewService: inspector forRequest: aFieldService ]
		catch: [ :reason | aFieldService signalPromiseBrokenBecause: reason ].
	^ nil
]
