Class {
	#name : 'SpkDebuggerFrameServiceClient',
	#superclass : 'SpkDebuggerFrameService',
	#traits : 'SpkTModel + SpkTPromise',
	#classTraits : 'SpkTModel classTrait + SpkTPromise classTrait',
	#category : 'Sparkle-Services-PharoClient-Services'
}

{ #category : 'api' }
SpkDebuggerFrameServiceClient >> listItems [

	^ localVariables
]

{ #category : 'as yet unclassified' }
SpkDebuggerFrameServiceClient >> stepOverFor: requestId [

	| promise |
	promise := remoteSelf stepOver.
	promise
		when: [ :newService | "If the result is me, we hit another error/breakpoint, 
			so just update myself.
			Otherwise, the answer is an inspector service for the result
			of the computation."
			newService == self
				ifTrue: [ self announceUpdate ]
				ifFalse: [ 
				self announceNewService: newService forRequest: requestId ] ]
		catch: self defaultCatchBlock
]
