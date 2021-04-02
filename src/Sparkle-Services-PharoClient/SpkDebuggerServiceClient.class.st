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
		when: [ :newService | 
			"If the result is me, we hit another error/breakpoint, 
			so just update myself.
			Otherwise, the answer is an inspector service for the result
			of the computation."
			newService == self
				ifTrue: [ self announceUpdate ]
				ifFalse: [ 
				self announceNewService: newService forRequest: requestId ] ]
		catch: self defaultCatchBlock
]

{ #category : 'stepping' }
SpkDebuggerServiceClient >> stepOverIn: aFrameService
for: requestId [

	| promise |
	promise := remoteSelf stepOverIn: aFrameService.
	promise
		when:
			[:service |
			service == self
				ifTrue: [self announceUpdate]
				ifFalse: [self announceNewService: service forRequest: requestId]]
		catch: self defaultCatchBlock
]

{ #category : 'as yet unclassified' }
SpkDebuggerServiceClient >> terminate [

	| promise |
	promise := remoteSelf terminate.
	promise
		when: [ :unused | self announceTermination ]
		catch: self defaultCatchBlock
]

{ #category : 'accessing' }
SpkDebuggerServiceClient >> updateServices [

	"Can be sent in any thread."

	updatedServices do: [ :each | each announceUpdate ].
	updatedServices := Set new
]
