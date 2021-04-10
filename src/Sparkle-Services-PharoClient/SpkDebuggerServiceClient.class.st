Class {
	#name : 'SpkDebuggerServiceClient',
	#superclass : 'SpkDebuggerService',
	#traits : 'SpkTModel + SpkTPromise',
	#classTraits : 'SpkTModel classTrait + SpkTPromise classTrait',
	#category : 'Sparkle-Services-PharoClient-Services'
}

{ #category : 'as yet unclassified' }
SpkDebuggerServiceClient >> isValid [

	"Does the debugger I represent still have a process to debug?
	If not, I will be replaced by another service."

	^ replacementService == self
]

{ #category : 'api' }
SpkDebuggerServiceClient >> listItems [

	^ frames reverse
]

{ #category : 'as yet unclassified' }
SpkDebuggerServiceClient >> proceed [

	| promise |
	promise := remoteSelf proceed.
	promise
		when: [ :ignored | self updateServices ]
		catch: self defaultCatchBlock
]

{ #category : 'as yet unclassified' }
SpkDebuggerServiceClient >> terminate [

	| promise |
	promise := remoteSelf terminate.
	promise
		when: [ :ignored | self updateServices ]
		catch: self defaultCatchBlock
]
