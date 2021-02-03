Class {
	#name : 'SpkDebuggerFrameDescriptionServiceClient',
	#superclass : 'SpkDebuggerFrameDescriptionService',
	#traits : 'SpkTPromise + SpkTModel',
	#classTraits : 'SpkTPromise classTrait + SpkTModel classTrait',
	#category : 'Sparkle-Services-PharoClient-Services'
}

{ #category : 'as yet unclassified' }
SpkDebuggerFrameDescriptionServiceClient >> createFrameService [

	"Ask the server for an inspector for the object referred to by this field. 
	Answer a promise for the result."

	^ remoteSelf createFrameService
]

{ #category : 'as yet unclassified' }
SpkDebuggerFrameDescriptionServiceClient >> frameServiceForRequest: aRequestId [

	| promise |
	"I might already have the necessary service cached."
	linkedService ifNotNil: [ :service | ^ service ].
	"Create and announce a new inspectorService for the object I reference."
	promise := self createFrameService.
	promise
		when: [ :frame | 
			linkedService := frame.
			parentService announceNewService: frame forRequest: aRequestId ]
		catch: [ :reason | self signalPromiseBrokenBecause: reason ].
	^ nil
]

{ #category : 'printing' }
SpkDebuggerFrameDescriptionServiceClient >> printOn: aStream [

	aStream << 'DebuggerFrameService '.
	description printOn: aStream
]
