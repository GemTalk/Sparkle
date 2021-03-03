Class {
	#name : 'SpkDebuggerServiceClient',
	#superclass : 'SpkDebuggerService',
	#traits : 'SpkTModel + SpkTPromise',
	#classTraits : 'SpkTModel classTrait + SpkTPromise classTrait',
	#category : 'Sparkle-Services-PharoClient-Services'
}

{ #category : 'api' }
SpkDebuggerServiceClient >> listItems [

	^ frames reverse
]

{ #category : 'as yet unclassified' }
SpkDebuggerServiceClient >> proceedFor: requestId [

	| promise |
	promise := remoteSelf proceed.
	promise
		when: [ :newService | 
			self announceNewService: newService forRequest: requestId.
			self flag: 'handle identical debugger return' ]
		catch: self defaultCatchBlock
]
