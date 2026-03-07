"
The model for an explorer window presenter.
"
Class {
	#name : 'SpkExplorerServiceBClient',
	#superclass : 'SpkExplorerServiceB',
	#traits : 'SpkTModel + SpkTHierarchicalService + SpkTPromise',
	#classTraits : 'SpkTModel classTrait + SpkTHierarchicalService classTrait + SpkTPromise classTrait',
	#category : 'Sparkle-Services-PharoClient-Services',
	#package : 'Sparkle-Services-PharoClient',
	#tag : 'Services'
}

{ #category : 'initialization' }
SpkExplorerServiceBClient >> initializeTreeOnServer [

	| xport promise |
	xport := SpkTransportServiceClient forRoot: self.
	promise := remoteSelf createToolTreeForTransport: xport.
	promise when: [  ] catch: self defaultCatchBlock
]
