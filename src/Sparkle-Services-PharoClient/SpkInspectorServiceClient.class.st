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
SpkInspectorServiceClient >> inspect: aFieldService [

	| promise |
	(self fields includesIdentity: aFieldService) ifFalse: [ 
		self error: 'I do not contain the requested field.' ].

	promise := aFieldService inspect.
	promise
		when: [ :inspector | 
			self announceNewInspector: inspector for: aFieldService ]
		catch: [ :reason | aFieldService signalPromiseBrokenBecause: reason ]
]
