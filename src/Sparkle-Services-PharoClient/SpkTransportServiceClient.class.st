Class {
	#name : 'SpkTransportServiceClient',
	#superclass : 'SpkTransportService',
	#category : 'Sparkle-Services-PharoClient-Services',
	#package : 'Sparkle-Services-PharoClient',
	#tag : 'Services'
}

{ #category : 'instance creation' }
SpkTransportServiceClient class >> forRoot: rootService [
	"Create instances for the subtree of services, and link them together."

	| parentTransport |
	parentTransport := self new cargo: rootService.
	rootService children do: [ :childService |
		| childTransport |
		childTransport := self forRoot: childService.
		childTransport parent: parentTransport.
		parentTransport addChild: childTransport ].
	^ parentTransport
]
