Class {
	#name : 'SpkDebuggerFrameServiceClient',
	#superclass : 'SpkDebuggerFrameService',
	#traits : 'SpkTModel + SpkTPromise',
	#classTraits : 'SpkTModel classTrait + SpkTPromise classTrait',
	#category : 'Sparkle-Services-PharoClient-Services',
	#package : 'Sparkle-Services-PharoClient',
	#tag : 'Services'
}

{ #category : 'api' }
SpkDebuggerFrameServiceClient >> listItems [

	^ localVariables
]

{ #category : 'actions' }
SpkDebuggerFrameServiceClient >> restart [

	| promise |
	promise := remoteSelf restart.
	promise
		when: [ :ignored | 
			self
				updateServices;
				announceActionComplete ]
		catch: self defaultCatchBlock
]

{ #category : 'actions' }
SpkDebuggerFrameServiceClient >> stepInto [

	| promise |
	promise := remoteSelf stepInto.
	promise
		when: [ :ignored | 
			self
				updateServices;
				announceActionComplete ]
		catch: self defaultCatchBlock
]

{ #category : 'actions' }
SpkDebuggerFrameServiceClient >> stepOver [

	| promise |
	promise := remoteSelf stepOver.
	promise
		when: [ :ignored | 
			self
				updateServices;
				announceActionComplete ]
		catch: self defaultCatchBlock
]

{ #category : 'actions' }
SpkDebuggerFrameServiceClient >> stepThrough [

	| promise |
	promise := remoteSelf stepThrough.
	promise
		when: [ :ignored | 
			self
				updateServices;
				announceActionComplete ]
		catch: self defaultCatchBlock
]
