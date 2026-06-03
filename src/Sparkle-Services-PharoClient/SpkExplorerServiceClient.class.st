"
The model for an explorer window presenter.
"
Class {
	#name : 'SpkExplorerServiceClient',
	#superclass : 'SpkExplorerService',
	#traits : 'SpkTModel + SpkTHierarchicalService + SpkTPromise',
	#classTraits : 'SpkTModel classTrait + SpkTHierarchicalService classTrait + SpkTPromise classTrait',
	#category : 'Sparkle-Services-PharoClient-Services',
	#package : 'Sparkle-Services-PharoClient',
	#tag : 'Services'
}

{ #category : 'initialization' }
SpkExplorerServiceClient >> initializeTreeOnServerInTaskspace: taskspaceService [

	| transport promise |
	transport := SpkTransportServiceClient forRoot: self.
	promise := remoteSelf
		           createToolTreeForTransport: transport
		           inTaskspace: taskspaceService.
	promise when: [  ] catch: self defaultCatchBlock
]

{ #category : 'actions' }
SpkExplorerServiceClient >> redo [

	| promise |
	promise := remoteSelf redo.
	promise
		when: [ :ignored | self announceActionComplete ]
		catch: self defaultCatchBlock
]

{ #category : 'actions' }
SpkExplorerServiceClient >> undo [

	| promise |
	promise := remoteSelf undo.
	promise
		when: [ :ignored | self announceActionComplete ]
		catch: self defaultCatchBlock
]

{ #category : 'as yet unclassified' }
SpkExplorerServiceClient >> updateFromServer [

	self announceUpdate
]
