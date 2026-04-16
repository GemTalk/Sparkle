Class {
	#name : 'SpkTransportServiceServer',
	#superclass : 'SpkTransportService',
	#category : 'Sparkle-Services-PharoClient-Services',
	#package : 'Sparkle-Services-PharoClient',
	#tag : 'Services'
}

{ #category : 'public' }
SpkTransportServiceServer >> linkTransportedTree [
	"Make my cargos of the subtree of which I am the root match my tree structure."

	| parentService childServices |
	parentService := cargo.
	childServices := self children do: [ :childTransport |
		                 | childService |
		                 childService := childTransport cargo.
		                 childService parent: parentService.
		                 childTransport linkTransportedTree.
		                 parentService addChild: childService ]
]
