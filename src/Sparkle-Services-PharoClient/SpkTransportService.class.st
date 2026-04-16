"
A tree of SpkTransportServices can be used to transport in a single call a tree of RSR services whose hierarchical tree relationship is not replicated. 
The transported services should have TSpkHierarchicalService applied to their server and client classes, so that a non-replicated tree relationship exists between them.
Each TransportService has a ""cargo"" of a single RSR service, and its parent and children (if any) are other TransportServices.

Create the tree of TransportServiceClients, and send the root #initializeTreeOnServer. The tree will be sent, and each member of the tree will be sent #initializeTree, bottom up.

"
Class {
	#name : 'SpkTransportService',
	#superclass : 'RsrService',
	#traits : 'SpkTHierarchicalService',
	#classTraits : 'SpkTHierarchicalService classTrait',
	#instVars : [
		'cargo'
	],
	#category : 'Sparkle-Services-PharoClient-Services',
	#package : 'Sparkle-Services-PharoClient',
	#tag : 'Services'
}

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
