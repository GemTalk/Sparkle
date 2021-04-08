Class {
	#name : 'SpkDebuggerServiceClient',
	#superclass : 'SpkDebuggerService',
	#traits : 'SpkTModel + SpkTPromise',
	#classTraits : 'SpkTModel classTrait + SpkTPromise classTrait',
	#category : 'Sparkle-Services-PharoClient-Services'
}

{ #category : 'as yet unclassified' }
SpkDebuggerServiceClient >> announceTermination [

	self announce: SpkTermination new
]

{ #category : 'api' }
SpkDebuggerServiceClient >> listItems [

	^ frames reverse
]

{ #category : 'as yet unclassified' }
SpkDebuggerServiceClient >> proceedFor: requestId [

	| promise |
	promise := remoteSelf proceed.
	promise
		when: [ :ignored | 
			"If the replacementService is me, we hit another error/breakpoint, 
			so just update myself.
			Otherwise, the service is something else --
			an inspector service for the result of the computation,
			or a process terminated service."
			replacementService == self
				ifTrue: [ self announceUpdate ]
				ifFalse: [ 
				self announceNewService: replacementService forRequest: requestId ] ]
		catch: self defaultCatchBlock
]

{ #category : 'as yet unclassified' }
SpkDebuggerServiceClient >> terminate [

	| promise |
	self flag: 'This method assumes that the only possible replacementServices 
	are self and something else indicating that termination has completed. 
	Should probably use the process terminated service explicitly.'.
	promise := remoteSelf terminate.
	promise
		when: [ :ignored | 
			replacementService == self
				ifTrue: [ self announceUpdate ]
				ifFalse: [ self announceTermination ] ]
		catch: self defaultCatchBlock
]
