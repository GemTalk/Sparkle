Class {
	#name : 'SpkInspectorFieldServiceClient',
	#superclass : 'SpkInspectorFieldService',
	#traits : 'SpkTPromise + SpkTModel',
	#classTraits : 'SpkTPromise classTrait + SpkTModel classTrait',
	#category : 'Sparkle-Services-PharoClient-Services'
}

{ #category : 'inspecting' }
SpkInspectorFieldServiceClient >> createInspectorService [

	"Ask the server for an inspector for the object referred to by this field. 
	Answer a promise for the result."

	^ remoteSelf createInspectorService
]

{ #category : 'as yet unclassified' }
SpkInspectorFieldServiceClient >> inspectFieldForRequest: aRequestId [

	| promise |
	"I might already have the necessary service cached."
	inspectorService ifNotNil: [ :service | ^ service ].
	"Create and announce a new inspectorService for the object I reference."
	promise := self createInspectorService.
	promise
		when: [ :inspector | 
			self announceNewService: inspector forRequest: aRequestId ]
		catch: [ :reason | self signalPromiseBrokenBecause: reason ].
	^ nil
]
