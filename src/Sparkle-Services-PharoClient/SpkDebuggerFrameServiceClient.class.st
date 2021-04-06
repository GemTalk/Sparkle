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
		when: [ :ignored | self updateServices ]
		catch: self defaultCatchBlock
]
