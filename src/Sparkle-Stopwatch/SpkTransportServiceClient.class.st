Class {
	#name : 'SpkTransportServiceClient',
	#superclass : 'SpkTransportService',
	#category : 'Sparkle-Stopwatch-Code',
	#package : 'Sparkle-Stopwatch',
	#tag : 'Code'
}

{ #category : 'as yet unclassified' }
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
