"
A tree of SpkTransportServices can be used to transport in a single call a tree of RSR services whose hierarchical tree relationship is not replicated. 
The transported services should have TSpkHierarchicalService applied to their server and client classes, so that a non-replicated tree relationship exists between them.
Each TransportService has a ""cargo"" of a single RSR service, and its parent and children (if any) are other TransportServices.
"
Class {
	#name : 'SpkTransportService',
	#superclass : 'RsrService',
	#traits : 'SpkTHierarchicalService',
	#classTraits : 'SpkTHierarchicalService classTrait',
	#instVars : [
		'cargo'
	],
	#category : 'Sparkle-Stopwatch-Code',
	#package : 'Sparkle-Stopwatch',
	#tag : 'Code'
}

{ #category : 'accessing' }
SpkTransportService class >> clientClassName [

	^ self templateClassName
]

{ #category : 'as yet unclassified' }
SpkTransportService class >> forTransportOfSubtree: rootService [
	"Create instances for the subtree of services, and link them together."

	| parentTransport children |
	parentTransport := self new cargo: rootService.
	children := rootService children collect: [ :childService |
		            | childTransport |
		            childTransport := self forTransportOfSubtree: childService.
		            childTransport parent: parentTransport ].
	parentTransport children: children.
	^ parentTransport
]

{ #category : 'accessing' }
SpkTransportService class >> serverClassName [

	^ self templateClassName
]

{ #category : 'accessing' }
SpkTransportService class >> templateClassName [

	^ #SpkTransportService
]

{ #category : 'accessing' }
SpkTransportService >> cargo [

	^ cargo
]

{ #category : 'accessing' }
SpkTransportService >> cargo: anObject [

	cargo := anObject
]

{ #category : 'as yet unclassified' }
SpkTransportService >> linkTransportedTree [
	"Make my cargos of the subtree of which I am the root match my tree structure."

	| parentService childServices |
	parentService := cargo.
	childServices := children collect: [ :childTransport |
		                 | childService |
		                 childService := childTransport cargo.
		                 childService parent: parentService.
		                 childTransport linkTransportedTree.
		                 childService ].
	parentService children: childServices
]
