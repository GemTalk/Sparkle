Class {
	#name : 'SpkDebuggerServiceClient',
	#superclass : 'SpkDebuggerService',
	#traits : 'SpkTModel + SpkTPromise + SpkTPaneService',
	#classTraits : 'SpkTModel classTrait + SpkTPromise classTrait + SpkTPaneService classTrait',
	#category : 'Sparkle-Services-PharoClient-Services'
}

{ #category : 'testing' }
SpkDebuggerServiceClient >> isValid [

	"Does the debugger I represent still have a process to debug?
	If not, I will be replaced by another service."

	^ replacementService == self
]

{ #category : 'api' }
SpkDebuggerServiceClient >> listItems [

	^ frames reverse
]

{ #category : 'actions' }
SpkDebuggerServiceClient >> proceed [

	| promise |
	promise := remoteSelf proceed.
	promise
		when: [ :ignored | 
			self
				updateServices;
				announceActionComplete ]
		catch: self defaultCatchBlock
]

{ #category : 'private' }
SpkDebuggerServiceClient >> remoteSelf [

	"Hack to be able to send a remote message from a trait"

	^ remoteSelf
]

{ #category : 'actions' }
SpkDebuggerServiceClient >> terminate [

	| promise |
	promise := remoteSelf terminate.
	promise
		when: [ :ignored | 
			self
				updateServices;
				announceActionComplete ]
		catch: self defaultCatchBlock
]
