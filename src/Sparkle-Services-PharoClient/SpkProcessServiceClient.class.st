Class {
	#name : 'SpkProcessServiceClient',
	#superclass : 'SpkProcessService',
	#traits : 'SpkTModel + SpkTLinkedService + SpkTPromise',
	#classTraits : 'SpkTModel classTrait + SpkTLinkedService classTrait + SpkTPromise classTrait',
	#category : 'Sparkle-Services-PharoClient-Services'
}

{ #category : 'inspecting' }
SpkProcessServiceClient >> debugInNewExplorer [ 

	| promise |
	promise := remoteSelf debugInNewExplorer.
	promise
		when: [ :ignored | ]
		catch: self defaultCatchBlock.
	^ nil
]

{ #category : 'inspecting' }
SpkProcessServiceClient >> inspectFieldIn: xService forRequest: aRequestId [

	| promise |
	"I might already have the necessary service cached."
	self linkedService ifNotNil: [ :service | ^ service ].
	"Create and announce a new inspectorService for the object I reference."
	promise := remoteSelf createInspectorServiceIn: xService.
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
SpkProcessServiceClient >> nameOrOopHex [

	^name isEmpty
		ifTrue: [self oop hex]
		ifFalse: [name]
]
