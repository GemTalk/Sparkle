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
SpkDebuggerFrameServiceClient >> stepInto [

	| promise |
	promise := remoteSelf stepInto.
	promise
		when: [ :ignored | self updateServices ]
		catch: self defaultCatchBlock
]

{ #category : 'as yet unclassified' }
SpkDebuggerFrameServiceClient >> stepOver [

	| promise |
	promise := remoteSelf stepOver.
	promise
		when: [ :ignored | self updateServices ]
		catch: self defaultCatchBlock
]

{ #category : 'as yet unclassified' }
SpkDebuggerFrameServiceClient >> stepThrough [

	| promise |
	promise := remoteSelf stepThrough.
	promise
		when: [ :ignored | self updateServices ]
		catch: self defaultCatchBlock
]
