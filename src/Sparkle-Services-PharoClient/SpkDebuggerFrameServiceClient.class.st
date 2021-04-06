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
SpkDebuggerFrameServiceClient >> stepIntoFor: requestId [

	| promise |
	promise := remoteSelf stepInto.
	promise
		when: [ :ignored | self updateServices ]
		catch: self defaultCatchBlock
]

{ #category : 'as yet unclassified' }
SpkDebuggerFrameServiceClient >> stepOverFor: requestId [

	| promise |
	promise := remoteSelf stepOver.
	promise
		when: [ :ignored | self updateServices ]
		catch: self defaultCatchBlock
]

{ #category : 'as yet unclassified' }
SpkDebuggerFrameServiceClient >> stepThroughFor: requestId [

	| promise |
	promise := remoteSelf stepThrough.
	promise
		when: [ :ignored | self updateServices ]
		catch: self defaultCatchBlock
]
