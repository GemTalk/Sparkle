Class {
	#name : 'SpkInspectorFieldServiceClient',
	#superclass : 'SpkInspectorFieldService',
	#traits : 'SpkTPromise + SpkTModel + SpkTLinkedService',
	#classTraits : 'SpkTPromise classTrait + SpkTModel classTrait + SpkTLinkedService classTrait',
	#category : 'Sparkle-Services-PharoClient-Services'
}

{ #category : 'accessing' }
SpkInspectorFieldServiceClient >> description [

	^ self columnAt: 2
]

{ #category : 'inspecting' }
SpkInspectorFieldServiceClient >> inspectFieldForRequest: aRequestId [

	| promise |
	"I might already have the necessary service cached."
	self linkedService ifNotNil: [ :service | ^ service ].
	"Create and announce a new inspectorService for the object I reference."
	promise := remoteSelf createInspectorService.
	promise
		when: [ :inspector | 
			self linkedService: inspector.
			parentService
				announceService: inspector forRequest: aRequestId;
				announceActionComplete ]
		catch: self defaultCatchBlock.
	^ nil
]

{ #category : 'accessing' }
SpkInspectorFieldServiceClient >> name [

	^ self columnAt: 1
]
